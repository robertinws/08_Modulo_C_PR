package com.example.pr_module_c_project;

import android.content.SharedPreferences;
import android.widget.Toast;

import androidx.annotation.NonNull;

import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    String caminhoCanal = "com.example.pr_module_c_project";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor(), caminhoCanal + "/main").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {

                List<Object> args = call.arguments();

                switch (call.method) {

                    case "primeiraVez":

                        SharedPreferences sharedPreferences = getSharedPreferences("main", MODE_PRIVATE);
                        boolean primeiraVez = sharedPreferences.getBoolean("primeiraVez", true);

                        if (primeiraVez) {
                            SharedPreferences.Editor editor = getSharedPreferences("main", MODE_PRIVATE).edit();
                            editor.putBoolean("primeiraVez", false);
                            editor.apply();
                        }

                        result.success(primeiraVez);

                        break;

                    case "toast":

                        if (args != null) {

                            String mensagem = args.get(0).toString();
                            Toast.makeText(MainActivity.this,mensagem, Toast.LENGTH_SHORT).show();
                            result.success("sucess");
                        }

                        break;

                }

            }
        });

    }
}