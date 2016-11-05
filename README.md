# eccube3vm
Running EC-CUBE 3.x on VirtualBox virtual machine

EC-CUBE2.13系をローカル仮想環境にインストールするためのプロダクト一式です。


## 環境構築方法

  Linux(CentOS 6.5), Apache, PostgreSQL, PHPの環境をVagrantで構築できます。

### BIOSの仮想化機構有効化【Windowsのみ】

  VirtualBoxで仮想OSを構築する場合、BIOSの仮想化機構を有効化しておく必要があります。

  （仮想OSが32bitの場合は不要？）

  PCに搭載されたCPUに従い、BIOS画面上で

  - Intel Virtualization Technology(VT-x)
  - AMD Virtualization(AMD-v)

  のいずれかを有効にします。

  BIOSの設定方法はメーカー・PCごとに異なります。メーカーのサイトを参照してください。

### msysGit(Git for Windows)のインストール【Windowsのみ】

  1. https://msysgit.github.io/ よりGit for Windowsをダウンロード

  1. exeファイルを実行し指示に従いインストールする。

  1. インストール中「Use Git from Git Bash Only」「Use Git from the Windows Command Prompt」を選択する

    画面では、「Use Git from Git Bash Only」を選択する。（説明の都合上）

  1. インストール中「Checkout Windows-style, commit Unix-style line endings」「Checkout as-is, commit Unix-style line endings」「Checkout as-is, commit as-is」を選択する画面では、

    **「Checkout as-is, commit as-is」を選択する。** （絶対！）

    ※Macの場合はBashターミナル、Gitがデフォルトでインストールされているので新たにインストールする必要はありません。

    ※ Bash for Windowsでの稼働は未確認です。

### VirtualBoxのインストール【Mac&Windows共通】

  1. http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html より対象OSのパッケージをダウンロード

  1. パッケージよりインストールする。（画面の指示通りで問題ありません）

### Vagrant のインストール【Mac&Windows共通】

  1. http://www.vagrantup.com/downloads より対象OSのパッケージをダウンロード

  1. パッケージよりインストールする。

### ターミナルの起動方法

  【Mac】

  アプリケーション－「ユーティリティ」－「ターミナル」を起動

  【Windows】

  スタートメニュー－「Git」－「Git Bash」を起動

#### Vagrantのインストールを確認

  ターミナル上で

    ```
    $ vagrant -v
    Vagrant 1.7.2
    ```

### その他の準備

  1. 文字コードの制御【Windowsのみ】

    ```
    $ git config --global core.autocrlf false
    ```

    ※LF→CRLFへの自動変換を無効化する

  1. Omnibusプラグインのインストール【Mac&Windows共通】

    ```
    $ vagrant plugin install vagrant-omnibus
    ```

### プロダクトのダウンロード

  ```
  $ pwd
  （現在のディレクトリ）
  $ cd <適当なディレクトリ>
  $ git clone https://github.com/logicheart/eccube2vm.git
  $ ls
     :
    eccube2vm
     :
  ```

### 仮想サーバ構築・起動

  ```
  $ cd eccube2vm
  $ vagrant up
  ```

  *Congratulations!!! Install Success. Please access http://localhost:10080* と表示されたら正常終了です。

  ※初回は仮想マシンのイメージをダウンロードするため時間がかかります。

### 仮想サーバにアクセス

  1. ブラウザよりhttp://localhost:10080 にアクセス

  1. EC-CUBEのインストーラが表示されるので、指示に従い初期構築を行う。

### 仮想サーバ停止

  ```
  $ vagrant halt
  ```

  ※PCをシャットダウンする前に必ず仮想サーバを停止するようにしてください。
