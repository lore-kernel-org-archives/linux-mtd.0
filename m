Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65586E8FDC6
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWMINoRdFn62EdAWK2JO3qWKVS6smLrOmsl7trW6nbc=; b=ORthfdqrM4pNQY
	pu31mkSfHIiP1itMoFZjIah4MHrs0NyL8yHvHSWeHfi4gfEqh4zA9pzzUvYoM0RFy3UR5xr3EN4dK
	vGy4bZsGEcNqqyGpAhH1L2Z9ktbXdCqFd+18HJTkwRhhCw+rYv9iiwaX2LoX/RJu5t+tcj9x1qCnC
	r3PawXZY8i5qOR6Rl7ue8z3MxPQz1CWiGJDEHId2EypsOpPnUUhEP+Hv0ke6nutWxtjTm1gm72r2l
	aWuOPOP94ba8lROUCeRvk/VnuNxQkQM7bAPPK6RBxs5uP0zMkjE1d3C3C9a4TdG52N1xP7bwXqoxT
	VIiWjnrp84Bp5Ve2Qa5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLBL-001qVD-0L;
	Thu, 05 Oct 2023 10:02:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLBH-001qTb-2a;
	Thu, 05 Oct 2023 10:02:09 +0000
Received: from i53875a3c.versanet.de ([83.135.90.60] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qoLAi-0004BA-Lx; Thu, 05 Oct 2023 12:01:32 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christian Marangi <ansuelsmth@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>, Komal Bajaj <quic_kbajaj@quicinc.com>,
 Kumar Thella <sthella@codeaurora.org>,
 Keiji Hayashibara <hayashibara.keiji@socionext.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding to its own
 file
Date: Thu, 05 Oct 2023 12:01:30 +0200
Message-ID: <2829805.88bMQJbFj6@diego>
In-Reply-To: <20231003064018.7502-1-zajec5@gmail.com>
References: <20231003064018.7502-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_030207_846478_6114A84D 
X-CRM114-Status: GOOD (  15.45  )
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

QW0gRGllbnN0YWcsIDMuIE9rdG9iZXIgMjAyMywgMDg6NDA6MTggQ0VTVCBzY2hyaWViIFJhZmHF
giBNacWCZWNraToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4g
Cj4gU3VwcG9ydCBmb3Igb2xkIE5WTUVNIGZpeGVkIGNlbGxzIHdhcyBkZXByZWNhdGVkIGluIGZh
dm91ciBvZgo+ICJmaXhlZC1sYXlvdXQiLiBJdCdzIHN0aWxsIHBhcnQgb2YgdGhlIG52bWVtLnlh
bWwgdGhvdWdoIGFuZCBtYXkgYmUKPiB1bmtub3dpbmdseSB1c2VkIGJ5IG5ldyBiaW5kaW5ncyBh
ZGRlZCB3aXRob3V0IG11Y2ggb2YgYW5hbHl6ZS4KPiAKPiBUbyBtYWtlIGl0IG1vcmUgZGlmZmlj
dWx0IHRvIGFjY2lkZW50YWxseSBzdXBwb3J0IG9sZCBzeW50YXggbW92ZSBpdHMKPiBiaW5kaW5n
IHRvIHNlcGFyYXRlZCBmaWxlIHdpdGggImRlcHJlY2F0ZWQiIGluIGl0cyBuYW1lLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiBW
MjogRml4IHBhdGggdG8gbnZtZW0tZGVwcmVjYXRlZC1jZWxscy55YW1sIGluIGFtbG9naWMsbWVz
b242LXJ0Yy55YW1sCj4gCgo+ICAuLi4vYmluZGluZ3MvbnZtZW0vcm9ja2NoaXAsb3RwLnlhbWwg
ICAgICAgICAgfCAgMSArCj4gIC4uLi9iaW5kaW5ncy9udm1lbS9yb2NrY2hpcC1lZnVzZS55YW1s
ICAgICAgICB8ICAxICsKCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9udm1lbS9yb2NrY2hpcCxvdHAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS9yb2NrY2hpcCxvdHAueWFtbAo+IGluZGV4IDljNmVmZjc4ODkyOC4u
YTQ0ZDQ0YjMyODA5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9udm1lbS9yb2NrY2hpcCxvdHAueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9udm1lbS9yb2NrY2hpcCxvdHAueWFtbAo+IEBAIC00OSw2ICs0OSw3IEBA
IHJlcXVpcmVkOgo+ICAKPiAgYWxsT2Y6Cj4gICAgLSAkcmVmOiBudm1lbS55YW1sIwo+ICsgIC0g
JHJlZjogbnZtZW0tZGVwcmVjYXRlZC1jZWxscy55YW1sIwo+ICAKPiAgICAtIGlmOgo+ICAgICAg
ICBwcm9wZXJ0aWVzOgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbnZtZW0vcm9ja2NoaXAtZWZ1c2UueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS9yb2NrY2hpcC1lZnVzZS55YW1sCj4gaW5kZXggYzU0MDNlMTQ5MDgw
Li5iODBmZDhkMWFlNWIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL3JvY2tjaGlwLWVmdXNlLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbnZtZW0vcm9ja2NoaXAtZWZ1c2UueWFtbAo+IEBAIC0xMSw2ICsx
MSw3IEBAIG1haW50YWluZXJzOgo+ICAKPiAgYWxsT2Y6Cj4gICAgLSAkcmVmOiBudm1lbS55YW1s
Iwo+ICsgIC0gJHJlZjogbnZtZW0tZGVwcmVjYXRlZC1jZWxscy55YW1sIwo+ICAKPiAgcHJvcGVy
dGllczoKPiAgICBjb21wYXRpYmxlOgoKRm9yIFJvY2tjaGlwIE9UUCBhbmQgRWZ1c2UgYmluZG5n
czoKQWNrZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
