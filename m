Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755CCC35274
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFcSwgbq4y/19tpSWmdtkTmrrSAz52T/3or5Ekwoh4A=; b=Ziiw/zuWee13HC
	HpYXcOVCgo7L/Mwd2QCKqdtqDZjbrzo/GQs3G5igPFZ5gKLoUveUMuDh+wGCVR6S8WVLr91Wu8nhl
	SaWcQxhEmFUuL34qiYv4iO199+ajwkkHDXYD7J8gfevB/WomKbIG/K6EngjdczHgfPuP9f+/2dekd
	jzny7LrW96h/UWq44zyi7XXkn+2HbUo992c+IDZmDtivX13IeCm/caIBt/F0vR2gSzC21RaxHTHVi
	yunXrVjBN6dGSo/m4pPai5PoyMZW8PLZeHUo8Z5uSVHW+YF38xGt0Su4KamqmfMkAbm7M1LJ8rwwr
	v2TQLfr3bqeriyS5MSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG6H-002PA0-32;
	Thu, 21 Dec 2023 10:16:21 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG6E-002P8K-0J;
	Thu, 21 Dec 2023 10:16:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00459E000D;
	Thu, 21 Dec 2023 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703153772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oV7RU7sxJyQudrpIogN+qOiclZR5xvUS2xA9S30Qmmc=;
	b=lPXKAhSCpcE2HfRc4KNqd2KLKbAWSA5oQMcBtsg7JducPmYhCcOZRv2j6l4m3d9NQQArEb
	Bug1/sB4DdItVEkTqvSqapJ2TYgIwNWGx2EBrVgFTI59lzV1cSmOmxFY5WVD3mU09ugqUW
	byKdirWstZF3uBJy3iO4hSuBrRByC+rlAfqJFrJZCCvGBbcN4OqdCodjY1fgKlObMHlQXr
	lbcU6B8x7V5NdBKt0Pt2NVrVa1LUT+kWovPNvkdIzMVTrFKscKR8ZekGmJ8tMTtbzfpncR
	J0hqMMoByTrk2syUW71GhxXgg7hvarY6CdMsjuLiVQ1XBHLp822k5cG1X0niUw==
Date: Thu, 21 Dec 2023 11:16:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski
 <sebastien.szymanski@armadeus.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Han Xu <han.xu@nxp.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-imx@nxp.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFT 2/2] ARM: dts: mxs: imx28: Fix NAND hierarchy
 description
Message-ID: <20231221111603.25c28a05@xps-13>
In-Reply-To: <bf76aa11-7005-4bf8-836b-fce616afcdf4@armadeus.com>
References: <20231218130656.9020-1-wahrenst@gmx.net>
	<20231218130656.9020-2-wahrenst@gmx.net>
	<bf76aa11-7005-4bf8-836b-fce616afcdf4@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_021618_421556_A97F3F7C 
X-CRM114-Status: GOOD (  13.16  )
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

SGVsbG8sCgpzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbSB3cm90ZSBvbiBUaHUsIDIx
IERlYyAyMDIzIDEwOjU2OjA5CiswMTAwOgoKPiBIZWxsbyBTdGVmYW4sCj4gCj4gT24gMTIvMTgv
MjMgMTQ6MDYsIFN0ZWZhbiBXYWhyZW4gd3JvdGU6Cj4gPiBUaGUgc2l6ZS1jZWxscyBmb3IgR1BN
SSBhcmUgd3JvbmcgaW4gaW14MjguZHRzaSwgd2hpY2ggY2F1c2VzIHRoZQo+ID4gZm9sbG93aW5n
IHdhcm5pbmc6Cj4gPiAKPiA+ICAgICAgbmFuZC1jb250cm9sbGVyQDgwMDBjMDAwOiAjc2l6ZS1j
ZWxsczowOjA6IDAgd2FzIGV4cGVjdGVkCj4gPiAKPiA+IFRoZSByZWFzb24gZm9yIHRoaXMgaXMg
dGhlIGRlZmluaXRpb24gb2YgdGhlIHBhcnRpdGlvbnMgZGlyZWN0bHkKPiA+IGJlbG93IHRoZSBu
YW5kIGNvbnRyb2xsZXIgbm9kZS4gQWNjb3JkaW5nIHRvIG5hbmQtY29udHJvbGxlci55YW1sCj4g
PiB0aGUgTkFORCBjaGlwIG11c3QgYmUgZGVmaW5lZCBhcyBhIGNoaWxkIG9mIHRoZSBjb250cm9s
bGVyLiBFdmVuCj4gPiB0aGUgZml4ZWQgcGFydGl0aW9ucyBtdXN0IGJlIGtlcHQgaW4gYSBwYXJ0
aXRpb25zIGNvbnRhaW5lci4KCkJpbmRpbmdzIGV2b2x2ZSBvdmVyIHRpbWUsIHdlIHNvbWV0aW1l
cyBkZXByZWNhdGUgdGhlbSB3aGVuIHRoZXkgYXJlCnByb2JsZW1hdGljIGJ1dDoKLSB0aGUgb2xk
IHJlcHJlc2VudGF0aW9ucyBhcmUgc3RpbGwgYWNjZXB0ZWQgKGJ1dCBtYXJrZWQgbGVnYWN5KQot
IGlmIHlvdSB3YW50IHRvIHN1cHBvcnQgdGhlIG5ldyByZXByZXNlbnRhdGlvbiB5b3UgcHJvYmFi
bHkgbmVlZCB0bwogIHVwZGF0ZSB0aGUgY29udHJvbGxlciBkcml2ZXIgYXMgd2VsbCAodG8gc3Vw
cG9ydCBib3RoKS4KCkluIHRoaXMgY2FzZSBJIHdvdWxkIGV4cGVjdCBhIGRlcHJlY2F0aW9uIG5v
dGljZSByYXRoZXIgdGhhbiBhIHB1cmUKZXJyb3IuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
