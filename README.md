circuit-sdk-ios-deeplink-demo
===================

iOS向けCircuit SDK用サンプルアプリのリポジトリです。

ECサイトの振舞いを模したアプリであり、  
Circuit SDKの導入前/導入後の状態をブランチ分けして用意しています。  
それらのコードをご覧いただき、Circuit SDK導入の参考にご利用ください。  

#### ブランチ
* master         :Circuit SDKを未導入状態 
* use-cds        :Circuit SDKを導入済みでCircuitディープリンクサポーターに対応 
* use-cdr-fp     :Circuit SDKを導入済みでCircuitDirectのFingerprinting方式に対応 
* use-cdr-cookie :Circuit SDKを導入済みでCircuitDirectのCookie方式に対応 

####　build手順
```
XCodeを起動してcircuit-sdk-ios-deeplink-demoプロジェクトを開き、エミュレータあるいはiOS端末実機にビルドしてください。
$ git clone git@github.com:FukurouLabo/circuit-sdk-ios-deeplink-demo.git
$ cd circuit-sdk-ios-deeplink-demo
```

### Circuitディープリンクサポーター
```
ブランチを切り替えてください。
$ git checkout -b use-cds origin/use-cds
```

##### テスト方法
下記のディープリンクが設定されてますので開いて詳細ページに遷移するかご確認ください。
* 商品詳細ページ:circuitdemo://deepLinkItemId/{商品番号(1 ~ 3)}
* 設定ページ    :circuitdemo://deepLinkClass

### CircuitDirect
#### Fingerprinting方式
```
ブランチを切り替えてください。
$ git checkout -b use-cdr-fp origin/use-cdr-fp
```

##### テスト方法
1. 本サンプルアプリがインストールされている場合は、アンインストールしてください。
2. https://dr.cir.io/ur/KOxzEw?CDSitemId={商品番号(1 ~ 3)}を開いてください。([Yahooアプリのitunesストア](https://itunes.apple.com/jp/app/yahoo!-japan-nyusuya-jian/id299147843?mt=8)に遷移します)
3. その後アプリをbuildしてください。
4. 特定の商品ページに遷移することを確認してください。

#### Cookie方式
```
ブランチを切り替えてください。
$ git checkout -b use-cdr-cookie origin/use-cdr-cookie
```

##### テスト方法
1. 本サンプルアプリがインストールされている場合は、アンインストールしてください。
2. https://dr.cir.io/ur/otgMZg?CDSitemId={商品番号(1 ~ 3)}を開いてください。([Yahooアプリのitunesストア](https://itunes.apple.com/jp/app/yahoo!-japan-nyusuya-jian/id299147843?mt=8)に遷移します)
3. その後アプリをbuildしてください。
4. 特定の商品ページに遷移することを確認してください。

### Circuitサイト
* トップページ                                  :http://www.cir.io/
* ドキュメント(Circuitディープリンクサポーター) :https://developer.cir.io/doc/cds
* FAQ(Circuitディープリンクサポーター)          :https://developer.cir.io/faq/cds
* ドキュメント(CircuitDirect)                   :https://developer.cir.io/doc/circuit-direct
* FAQ(CircuitDirect)                            :https://developer.cir.io/faq/circuit-direct

### Licence
The source code is released under Apache 2.0.


