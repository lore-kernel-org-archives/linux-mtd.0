Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF7E81E17
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TV8jZvwpb8J8fi1I6+IaMrAoVwIDh6feHl0ZAYVU/I=; b=Cr6llp2R9/Arh4
	nw8AG236l/9A48OuMDwQz0uGObjNPaNeOhDOHH4QmUR5He+XtRmaayNYMOltCDUeBzQRA1dXwYQ0V
	OeW0gbLOQZ23ZuG3F/oTEMy9sKlEyu/fv4CcvZzD7pgAB+bhFt4b2TfyG8RNAj8xNvnm6cr/3Qqfl
	hIzrVREqi0jYBeDOXuel90w7rUkxRisZ2IUhVsrK6L/npN/dJfIpBMh+LyOVxErrzVbxbGJqF06L2
	thQjpehN2AGKueLGgqph+nhSj15tOBrYK4N9n92vyOfQI015ihV50ZAP617KgtcXqPQGTSCyaYiBL
	DKMJq58Fv+MTzCf03vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qonVF-006A5M-1c;
	Fri, 06 Oct 2023 16:16:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qonVA-006A3C-0w;
	Fri, 06 Oct 2023 16:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8FF49B829EF;
	Fri,  6 Oct 2023 16:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89291C433C7;
	Fri,  6 Oct 2023 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696608982;
	bh=nn2PakBIGbgtsjEPpxAO4jVlLqjVjHADYSnUr1qUXew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFkTvMoc5xPxQnjGQFbbukgR7nGvQnaMUmIi8cIFrTDFwzZVKr9iEZ8kf9UwtmkqS
	 JjVmj8vB0ZE3TTOhwWGNB1o+JGF1B090dzJEdIgroxf4E0ngIgy808gaNyUPH5DIJl
	 J26870g4clx/9i8PyhovxrsBJET6ud3yGuLTEpzfK6WP1sXVcDOKmAYFwmPgx7Hx42
	 TgUnvqo/j6K5BNN2TivJ1Z+rTg5nraUATk/swrNf592B9syT+5kdlaHuidRWPb9A8x
	 eVXAhvs+zO1q6xgZPse0VgS1i3yG6J3XpznXuO3teSMIwX7oX5V6lQddll6CHRjwHj
	 1rUD3xOytS4kg==
Received: (nullmailer pid 4022504 invoked by uid 1000);
	Fri, 06 Oct 2023 16:16:16 -0000
Date: Fri, 6 Oct 2023 11:16:16 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Komal Bajaj <quic_kbajaj@quicinc.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Gross <agross@kernel.org>, Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org, linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org, Vincent Shih <vincent.sunplus@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, Kumar Thella <sthella@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Anson Huang <Anson.Huang@nxp.com>, linux-kernel@vger.kernel.org, A
 ndrew-CT Chen <andrew-ct.chen@mediatek.com>, linux-arm-msm@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, Keiji Hayashibara <hayashibara.keiji@socionext.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Lala Lin <lala.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Richard Weinberger <richard@nod.at>, Sven Peter <sven@svenpeter.dev>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding to
 its own file
Message-ID: <169660897594.4022464.17777045780008018792.robh@kernel.org>
References: <20231003064018.7502-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003064018.7502-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_091632_591849_B0929BB0 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIFR1ZSwgMDMgT2N0IDIwMjMgMDg6NDA6MTggKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gU3VwcG9y
dCBmb3Igb2xkIE5WTUVNIGZpeGVkIGNlbGxzIHdhcyBkZXByZWNhdGVkIGluIGZhdm91ciBvZgo+
ICJmaXhlZC1sYXlvdXQiLiBJdCdzIHN0aWxsIHBhcnQgb2YgdGhlIG52bWVtLnlhbWwgdGhvdWdo
IGFuZCBtYXkgYmUKPiB1bmtub3dpbmdseSB1c2VkIGJ5IG5ldyBiaW5kaW5ncyBhZGRlZCB3aXRo
b3V0IG11Y2ggb2YgYW5hbHl6ZS4KPiAKPiBUbyBtYWtlIGl0IG1vcmUgZGlmZmljdWx0IHRvIGFj
Y2lkZW50YWxseSBzdXBwb3J0IG9sZCBzeW50YXggbW92ZSBpdHMKPiBiaW5kaW5nIHRvIHNlcGFy
YXRlZCBmaWxlIHdpdGggImRlcHJlY2F0ZWQiIGluIGl0cyBuYW1lLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiBWMjogRml4IHBh
dGggdG8gbnZtZW0tZGVwcmVjYXRlZC1jZWxscy55YW1sIGluIGFtbG9naWMsbWVzb242LXJ0Yy55
YW1sCj4gCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGQueWFtbCAgICAgICAgICB8
ICA3ICsrKystCj4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9udm1lbS1jZWxscy55YW1s
ICB8ICAxICsKPiAgLi4uL252bWVtL2FtbG9naWMsbWVzb24tZ3hiYi1lZnVzZS55YW1sICAgICAg
IHwgIDEgKwo+ICAuLi4vYmluZGluZ3MvbnZtZW0vYW1sb2dpYyxtZXNvbjYtZWZ1c2UueWFtbCAg
fCAgMSArCj4gIC4uLi9iaW5kaW5ncy9udm1lbS9hcHBsZSxlZnVzZXMueWFtbCAgICAgICAgICB8
ICAxICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vaW14LW9jb3RwLnlhbWwgIHwg
IDEgKwo+ICAuLi4vYmluZGluZ3MvbnZtZW0vbWVkaWF0ZWssZWZ1c2UueWFtbCAgICAgICAgfCAg
MSArCj4gIC4uLi9udm1lbS9taWNyb2NoaXAsc2FtYTdnNS1vdHBjLnlhbWwgICAgICAgICB8ICAx
ICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbXhzLW9jb3RwLnlhbWwgIHwgIDEg
Kwo+ICAuLi4vbnZtZW0vbnZtZW0tZGVwcmVjYXRlZC1jZWxscy55YW1sICAgICAgICAgfCAyOCAr
KysrKysrKysrKysrKysrKysrCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVt
LnlhbWwgICAgICB8ICA5IC0tLS0tLQo+ICAuLi4vYmluZGluZ3MvbnZtZW0vcWNvbSxxZnByb20u
eWFtbCAgICAgICAgICAgfCAgMSArCj4gIC4uLi9iaW5kaW5ncy9udm1lbS9xY29tLHNlYy1xZnBy
b20ueWFtbCAgICAgICB8ICAxICsKPiAgLi4uL2JpbmRpbmdzL252bWVtL3Fjb20sc3BtaS1zZGFt
LnlhbWwgICAgICAgIHwgIDEgKwo+ICAuLi4vYmluZGluZ3MvbnZtZW0vcm9ja2NoaXAsb3RwLnlh
bWwgICAgICAgICAgfCAgMSArCj4gIC4uLi9iaW5kaW5ncy9udm1lbS9yb2NrY2hpcC1lZnVzZS55
YW1sICAgICAgICB8ICAxICsKPiAgLi4uL252bWVtL3NvY2lvbmV4dCx1bmlwaGllci1lZnVzZS55
YW1sICAgICAgIHwgIDEgKwo+ICAuLi4vYmluZGluZ3MvbnZtZW0vc3VucGx1cyxzcDcwMjEtb2Nv
dHAueWFtbCAgfCAgMSArCj4gIC4uLi9iaW5kaW5ncy9ydGMvYW1sb2dpYyxtZXNvbjYtcnRjLnlh
bWwgICAgICB8ICAxICsKPiAgMTkgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0tZGVwcmVjYXRlZC1jZWxscy55YW1sCj4gCgpSZXZpZXdl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
