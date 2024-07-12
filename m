Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E5C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMyJq20UkInjGiKvHx6Rl5mxIktmEC3PN9fClfPg/b4=; b=Zv2rBnc3THeBMq
	epUF0swoGezStrfW7ipI6J5yvYpDxm822qKhupfLwVDHN/TWSAnebGiV5eB4xvWgmrXWh5pn2/X3n
	6XP8lIwOKBLbDUwVLioxZoUqHvaH1IfzDMEYMntFxM16iqEioO0y/n0ex8877U1ID2/ziI/iMCq8l
	tNxobenpLdyAIUtO9xgXV0JnFjFXCIXYCliRPECk/CqMfNCXwFGjjOgxDAIw0tFVUrFpcRtoaxnKq
	ZbyDQYtfjoafzWp/E0S2W7kdwN3tMMwsq/Tg/p7EzmdFK35jJLl1ziPQ11MmHz74EvSrGkQllKlVR
	o7AZl2eQH3njpZKOQmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSHMv-00000000L3v-20Os;
	Fri, 12 Jul 2024 14:35:29 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSHMc-00000000Kxu-0C5w;
	Fri, 12 Jul 2024 14:35:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0858B6000B;
	Fri, 12 Jul 2024 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720794905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CiVeB36WC3XhinXVvw3aBG/Q6TEMnuDcanTg5z9DXE=;
	b=RCA9lVVX1fd75spCVuVahSk1RoqL9eZbgexe3LnZmD+IsA7s0KLR4kU0QT6UQzVSQrcrPX
	hRiL3pPLMNwY4j16hbLtdlG5J+BEEA1PW7OW7sjOjXbSeY14TvMoAj1mIPMbsItiZvowOQ
	piShlvO2atXTdq/ISgShhl/xtRHkX+Z96RhtZHiU1TLZR7Gnw5w1RasNCG0SS+DHpspE3C
	dZUPWp3bNqaTriRX3hgPZNbOHazHGNgNQK8n++DqtMVk37DB13EUCRlel7A9e3Q4Zwg3Ay
	L9g8Ji7Nb82hIJNCnIwTjQT/ej4Az4/PbJYd7xyyek1Zmaaf4T3FbmlAXVsP/w==
Date: Fri, 12 Jul 2024 16:35:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>, Vinod Koul
 <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] dt-bindings: dma: fsl-mxs-dma: Add compatible
 string "fsl,imx8qxp-dma-apbh"
Message-ID: <20240712163503.69dad6b1@xps-13>
In-Reply-To: <20240527121836.178457-1-miquel.raynal@bootlin.com>
References: <20240520-gpmi_nand-v2-2-e3017e4c9da5@nxp.com>
	<20240527121836.178457-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_073510_241982_9645924F 
X-CRM114-Status: GOOD (  12.05  )
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

SGkgVmlub2QsCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIE1vbiwgMjcgTWF5
IDIwMjQgMTQ6MTg6MzYgKzAyMDA6Cgo+IE9uIE1vbiwgMjAyNC0wNS0yMCBhdCAxNjowOToxMyBV
VEMsIEZyYW5rIExpIHdyb3RlOgo+ID4gQWRkIGNvbXBhdGlibGUgc3RyaW5nICJmc2wsaW14OHF4
cC1kbWEtYXBiaCIuIEl0IHJlcXVpcmVzIHBvd2VyLWRvbWFpbnMKPiA+IGNvbXBhcmVkIHdpdGgg
ImZzbCxpbXgyOC1kbWEtYXBiaCIuCj4gPiAKPiA+IEFsbG93ICdwb3dlci1kb21haW5zJyBwcm9w
ZXJ0eSBiZWNhdXNlIGkuTVg4RFhMIGkuTVg4UU0gYW5kIGkuTVg4UVhQIG5lZWQKPiA+IGl0Lgo+
ID4gCj4gPiBLZWVwIHRoZSBzYW1lIHJlc3RyaWN0aW9uIGFib3V0ICdwb3dlci1kb21haW5zJyBm
b3Igb3RoZXIgY29tcGF0aWJsZQo+ID4gc3RyaW5ncy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
RnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcg
KEFybSkgPHJvYmhAa2VybmVsLm9yZz4gIAo+IAo+IEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQs
IHRoYW5rcy4KCkkganVzdCByZWFsaXplIG5vdyBJIHBpY2tlZCB0aGlzIHVwIHdoZXJlYXMgaXQg
d2FzIG5vdCBpbnRlbmRlZCB0byBiZQptZXJnZWQgdGhyb3VnaCBtdGQuIEknbSBmaW5lIGtlZXBp
bmcgdGhpcyBwYXRjaCBmb3IgdGhlIG5leHQgbWVyZ2UKd2luZG93IGlmIEkgZ2V0IHlvdXIgZXhw
bGljaXQgYWdyZWVtZW50IG90aGVyd2lzZSBJJ2xsIGRyb3AgaXQuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
