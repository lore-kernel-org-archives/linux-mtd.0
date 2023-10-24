Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEA2C25B48
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnGuiSlqxPYOYMj0MFj9kvVQ7gKlTlLoN6cP0ckRU9o=; b=JTO6eB66kOStftmYW0K7ZiLA6k
	gMZ7ZHeJ+m39RYVMY7aKMz5o7ICkbjsOhN8gyEzuzBlgRj38qVCS9uZec4wYYzqsySBJ/8Qc9OhPS
	om7YBYX2xkzOuNyLNEUKWWsChDDs5xljznEgf1lbQOfVbVe1bPyhB9fka9farSwO5EjzhyA/00fUg
	MhiVxU/ykk8CysW4R0ixGDwrQlIXimQIkKy0c4FmpL3RULOG9F8GA8dsFC7md9kzbXNecA62g98x+
	4NFSXLP+Q3as9eDlqQnAKJFe8vLnkivBEghv2YvUN5LOAthg4ak2krvadnsbfBZfSIOB7N8LupXz6
	OA6nvJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJXQ-00AMht-1d;
	Tue, 24 Oct 2023 15:41:48 +0000
Received: from 5.mo584.mail-out.ovh.net ([188.165.44.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJXK-00AMg0-2s
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 15:41:46 +0000
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.146.50])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 529FC27874
	for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 15:41:36 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-4l929 (unknown [10.111.172.174])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5F09D1FD5A;
	Tue, 24 Oct 2023 15:41:32 +0000 (UTC)
Received: from RCM-web6.webmail.mail.ovh.net ([151.80.29.20])
	by ghost-submission-6684bf9d7b-4l929 with ESMTPSA
	id YKYSFazlN2WWggAAw4wSxw
	(envelope-from <rafal@milecki.pl>); Tue, 24 Oct 2023 15:41:32 +0000
MIME-Version: 1.0
Date: Tue, 24 Oct 2023 17:41:31 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Hector Martin <marcan@marcan.st>, Sven
 Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko
 Stuebner <heiko@sntech.de>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Vincent Shih <vincent.sunplus@gmail.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Christian Marangi
 <ansuelsmth@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, Komal Bajaj
 <quic_kbajaj@quicinc.com>, Kumar Thella <sthella@codeaurora.org>, Keiji
 Hayashibara <hayashibara.keiji@socionext.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding to
 its own file
In-Reply-To: <20231024142457.GA3684864-robh@kernel.org>
References: <20231003064018.7502-1-zajec5@gmail.com>
 <20231024142457.GA3684864-robh@kernel.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <77363977d8f24fc0620a54f36326421b@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 16550447158977801020
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrkeekgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjedvlefguedthfefleehgeeftdeludeluedvgfeffeevhfevtdehteejteefheegnecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipdduhedurdektddrvdelrddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_084143_235341_D5A7C6C8 
X-CRM114-Status: GOOD (  14.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMy0xMC0yNCAxNjoyNCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVHVlLCBPY3QgMDMs
IDIwMjMgYXQgMDg6NDA6MThBTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+PiBGcm9t
OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+IAo+PiBTdXBwb3J0IGZvciBv
bGQgTlZNRU0gZml4ZWQgY2VsbHMgd2FzIGRlcHJlY2F0ZWQgaW4gZmF2b3VyIG9mCj4+ICJmaXhl
ZC1sYXlvdXQiLiBJdCdzIHN0aWxsIHBhcnQgb2YgdGhlIG52bWVtLnlhbWwgdGhvdWdoIGFuZCBt
YXkgYmUKPj4gdW5rbm93aW5nbHkgdXNlZCBieSBuZXcgYmluZGluZ3MgYWRkZWQgd2l0aG91dCBt
dWNoIG9mIGFuYWx5emUuCj4+IAo+PiBUbyBtYWtlIGl0IG1vcmUgZGlmZmljdWx0IHRvIGFjY2lk
ZW50YWxseSBzdXBwb3J0IG9sZCBzeW50YXggbW92ZSBpdHMKPj4gYmluZGluZyB0byBzZXBhcmF0
ZWQgZmlsZSB3aXRoICJkZXByZWNhdGVkIiBpbiBpdHMgbmFtZS4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gLS0tCj4+IFYyOiBGaXgg
cGF0aCB0byBudm1lbS1kZXByZWNhdGVkLWNlbGxzLnlhbWwgaW4gYW1sb2dpYyxtZXNvbjYtcnRj
LnlhbWwKPj4gCj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLnlhbWwgICAgICAg
ICAgfCAgNyArKysrLQo+PiAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL252bWVtLWNlbGxz
LnlhbWwgIHwgIDEgKwo+PiAgLi4uL252bWVtL2FtbG9naWMsbWVzb24tZ3hiYi1lZnVzZS55YW1s
ICAgICAgIHwgIDEgKwo+PiAgLi4uL2JpbmRpbmdzL252bWVtL2FtbG9naWMsbWVzb242LWVmdXNl
LnlhbWwgIHwgIDEgKwo+PiAgLi4uL2JpbmRpbmdzL252bWVtL2FwcGxlLGVmdXNlcy55YW1sICAg
ICAgICAgIHwgIDEgKwo+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vaW14LW9jb3Rw
LnlhbWwgIHwgIDEgKwo+PiAgLi4uL2JpbmRpbmdzL252bWVtL21lZGlhdGVrLGVmdXNlLnlhbWwg
ICAgICAgIHwgIDEgKwo+PiAgLi4uL252bWVtL21pY3JvY2hpcCxzYW1hN2c1LW90cGMueWFtbCAg
ICAgICAgIHwgIDEgKwo+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbXhzLW9jb3Rw
LnlhbWwgIHwgIDEgKwo+PiAgLi4uL252bWVtL252bWVtLWRlcHJlY2F0ZWQtY2VsbHMueWFtbCAg
ICAgICAgIHwgMjggCj4+ICsrKysrKysrKysrKysrKysrKysKPj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL252bWVtLnlhbWwgICAgICB8ICA5IC0tLS0tLQo+PiAgLi4uL2JpbmRpbmdz
L252bWVtL3Fjb20scWZwcm9tLnlhbWwgICAgICAgICAgIHwgIDEgKwo+PiAgLi4uL2JpbmRpbmdz
L252bWVtL3Fjb20sc2VjLXFmcHJvbS55YW1sICAgICAgIHwgIDEgKwo+PiAgLi4uL2JpbmRpbmdz
L252bWVtL3Fjb20sc3BtaS1zZGFtLnlhbWwgICAgICAgIHwgIDEgKwo+PiAgLi4uL2JpbmRpbmdz
L252bWVtL3JvY2tjaGlwLG90cC55YW1sICAgICAgICAgIHwgIDEgKwo+PiAgLi4uL2JpbmRpbmdz
L252bWVtL3JvY2tjaGlwLWVmdXNlLnlhbWwgICAgICAgIHwgIDEgKwo+PiAgLi4uL252bWVtL3Nv
Y2lvbmV4dCx1bmlwaGllci1lZnVzZS55YW1sICAgICAgIHwgIDEgKwo+PiAgLi4uL2JpbmRpbmdz
L252bWVtL3N1bnBsdXMsc3A3MDIxLW9jb3RwLnlhbWwgIHwgIDEgKwo+PiAgLi4uL2JpbmRpbmdz
L3J0Yy9hbWxvZ2ljLG1lc29uNi1ydGMueWFtbCAgICAgIHwgIDEgKwo+PiAgMTkgZmlsZXMgY2hh
bmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgCj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS1k
ZXByZWNhdGVkLWNlbGxzLnlhbWwKPiAKPiBZb3UgbWlzc2VkIGFsbHdpbm5lcixzdW40aS1hMTAt
c2lkLnlhbWwgYW5kIGF0MjQueWFtbAo+IChhcmNoL2FybS9ib290L2R0cy9icm9hZGNvbS9iY201
MzAxNi1tZXJha2ktbXIzMi5kdHMpLiBNYXliZSB3ZSB3YW50IHRvCj4gZml4IHRoZSBsYXR0ZXIg
Y2FzZSBiZWNhdXNlIGF0MjQgd2lsbCBjb250aW51YWxseSBoYXZlIG5ldyB1c2Vycy4KCkkgc2Vl
LiBJIGxvb2tlZCBhdCBleGFtcGxlcyBhbmQgRFRTIGZpbGVzIHdpdGggImFsbHdpbm5lcixzdW40
aS1hMTAtc2lkIgpiaW5kaW5nIGJ1dCBJIG1pc3NlZCBvdGhlcnMuIEZvciByZWZlcmVuY2UgZml4
ZWQgY2VsbHMgYXJlIHVzZWQgaW46CjEuIHN1bjUwaS1hNjQuZHRzaQoyLiBzdW41MGktaDYuZHRz
aQozLiBzdW41MGktYTEwMC5kdHNpCgpJJ2xsIGZpeCB0aGF0IHNvb24hCgotLSAKUmFmYcWCIE1p
xYJlY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
