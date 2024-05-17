Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A35C04FFE
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2024 18:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkazgNFI2Th0JuqNM8Jyd/29M75zrVBaafEAs4ldA4o=; b=0m3A/yFUczeMfW
	atsq1LA1Y73H83VokWGanaq8k05/8v4xzDZOmX3MY+km0yezJF2Uar7wKQYgb7D1zK3OBF9ZVVIiu
	2WJjbjcwf0XyifGEcxHGcIMT4D9Iz8Rq9+ICQJWIlfy53Pk5LvUVj1/WoYidrgtXs6HRPBDeJtuff
	oNlTTk1xqKHtLHjHu+jO0wvPrOE2ZBJT5R0sEr3/CFOSqbbuddyq1nh1NnWfUAuTNU/19a6bkqjSz
	m9YzVjc91GO8Xy/9I93TioSUu+7s1U3xX5GRdfsiq4vTysnXcALdBIKfXCt3NosuEvgyQUNxXwzPA
	NuY1m9vbVTJyficOAOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s82Rb-00000008ip0-1tTk;
	Fri, 17 May 2024 18:36:39 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s82RW-00000008int-0YMU;
	Fri, 17 May 2024 18:36:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7048740004;
	Fri, 17 May 2024 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715970986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aakjMiXrIK1SMo9a5spsETuysQuqYvFsuHtJGNipjLc=;
	b=XIVoHlL+HvLfXAVErilHWu7Ml5HtDRH+tBzVUn8AYOu5kOkUIIaaQUhc5cUzEu8wKW3ofY
	GS96wap5ixRrjAFlQpjwDAhKXSt1QkZIMT0BdQRZPYutWwaEFJ0HImnrkFJ6HcC9z+IwTP
	WDeWAfAGGzLlxppRzyFZc8qmlaMeghP7hY+wa06ozngQhfY5SBRh2mX/wbDWLFwiqfWzmq
	Bm9LlqkshhpMmVwVaIj22vqgFcqIGSmk+xloNklHiSfOEk0QNp0eXREBAKd9inQaOYVo9a
	jkG1DdO01MmGnbXh8jQX/Q3IuyprBJGju9Y0g/RaA02fXeCHxfc0fGmhvzNzRA==
Date: Fri, 17 May 2024 20:36:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Han Xu
 <han.xu@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: mtd: gpmi-nand: Add
 'fsl,imx8qxp-gpmi-nand' compatible string
Message-ID: <20240517203621.72b8b9c7@xps-13>
In-Reply-To: <20240517-gpmi_nand-v1-1-73bb8d2cd441@nxp.com>
References: <20240517-gpmi_nand-v1-0-73bb8d2cd441@nxp.com>
	<20240517-gpmi_nand-v1-1-73bb8d2cd441@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_113634_469965_143DE0CF 
X-CRM114-Status: GOOD (  10.98  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIEZyaSwgMTcgTWF5IDIwMjQgMTQ6
MDk6NDggLTA0MDA6Cgo+IEFkZCAnZnNsLGlteDhxeHAtZ3BtaS1uYW5kJyBjb21wYXRpYmxlIHN0
cmluZyBhbmQgY2xvY2stbmFtZXMgcmVzdHJpY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9ncG1pLW5hbmQueWFtbCAgICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2dwbWktbmFuZC55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9ncG1pLW5hbmQueWFtbAo+IGluZGV4IDAy
MWMwZGEwYjA3MmYuLmY5ZWIxODY4Y2ExZjQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9ncG1pLW5hbmQueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZ3BtaS1uYW5kLnlhbWwKPiBAQCAtMjQsNiArMjQs
NyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgLSBmc2wsaW14NnEtZ3BtaS1uYW5kCj4gICAg
ICAgICAgICAtIGZzbCxpbXg2c3gtZ3BtaS1uYW5kCj4gICAgICAgICAgICAtIGZzbCxpbXg3ZC1n
cG1pLW5hbmQKPiArICAgICAgICAgIC0gZnNsLGlteDhxeHAtZ3BtaS1uYW5kCj4gICAgICAgIC0g
aXRlbXM6Cj4gICAgICAgICAgICAtIGVudW06Cj4gICAgICAgICAgICAgICAgLSBmc2wsaW14OG1t
LWdwbWktbmFuZAo+IEBAIC0xNTEsNiArMTUyLDI3IEBAIGFsbE9mOgo+ICAgICAgICAgICAgICAt
IGNvbnN0OiBncG1pX2lvCj4gICAgICAgICAgICAgIC0gY29uc3Q6IGdwbWlfYmNoX2FwYgo+ICAK
PiArICAtIGlmOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4g
KyAgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgZW51bToKPiArICAgICAgICAgICAg
ICAtIGZzbCxpbXg4cXhwLWdwbWktbmFuZAo+ICsgICAgdGhlbjoKPiArICAgICAgcHJvcGVydGll
czoKPiArICAgICAgICBjbG9ja3M6Cj4gKyAgICAgICAgICBpdGVtczoKPiArICAgICAgICAgICAg
LSBkZXNjcmlwdGlvbjogU29DIGdwbWkgaW8gY2xvY2sKPiArICAgICAgICAgICAgLSBkZXNjcmlw
dGlvbjogU29DIGdwbWkgYXBiIGNsb2NrCgpJIGJlbGlldmUgdGhlc2UgdHdvIGNsb2NrcyBhcmUg
bWFuZGF0b3J5PwoKPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogU29DIGdwbWkgYmNoIGNs
b2NrCj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IFNvQyBncG1pIGJjaCBhcGIgY2xvY2sK
PiArICAgICAgICBjbG9jay1uYW1lczoKPiArICAgICAgICAgIGl0ZW1zOgo+ICsgICAgICAgICAg
ICAtIGNvbnN0OiBncG1pX2lvCj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGdwbWlfYXBiCj4gKyAg
ICAgICAgICAgIC0gY29uc3Q6IGdwbWlfYmNoCj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGdwbWlf
YmNoX2FwYgo+ICsKPiAgZXhhbXBsZXM6Cj4gICAgLSB8Cj4gICAgICBuYW5kLWNvbnRyb2xsZXJA
ODAwMGMwMDAgewo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
