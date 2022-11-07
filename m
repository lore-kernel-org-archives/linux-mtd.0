Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEE6C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QVWl0UQI7qOU8Z2K+ovHolE6RQotlo6SV9cJEPyJWY=; b=W+mIerDviDfh/y
	Jkp0L/eWWCWkPrJi050b9eSMrfjv65H6kG72YwvYCCAadKzPDpWAAF3X9DGWqP/xp2kFK9WAZmLJc
	H/bEE8Z65ucv5SFNKOgDQrIsINaFeFWZvKywbOLTIpWJz59H7fuivnfkPudHOalJ/2+e+J61Z39ci
	5FNngIznTsKRbeNFEtvROG3Ko9iU6SGEH7P6nlDJNR+sxd6mkwdgScSE7vJUH1KPiXk6aXeoqzvzZ
	f9/X/ppHMvHN6KuhtXuygsHHJm4ODTw7zXnqXmOEF17qAK917rfkDp1U3iOJbObZOKMUVwvMF2MjN
	4qm+qOCx7ig6G4+uaChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os56F-00GEom-UY; Mon, 07 Nov 2022 16:35:52 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4tr-00G97x-WB
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:23:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 023B11BF216;
	Mon,  7 Nov 2022 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e41V9fJN/RH5QZBBj4tkXdPkkAqaySNaHc60tohnkE0=;
	b=RniDk8Ba8Qawefh3lHvZDMCQpnzM3TYo9DNWUSU9cfg/VbCnnGUGOaS6Ed3Bxsx9Geoemv
	AbMdXD1rnEIGkxqYYXeCtK1b0Ket/GPbt+iFgWfsIko8frUlDNFJ8lRW2fxmO7QfpEpRcA
	SDU5e5CmgqCpLUw6n0pNo7dkugVf2SVT6neJAMhirhaAYR2BWKwR1b40KaF262iSMfAABU
	WFC8hp6XoWpF3/V75D/vBa9iJdzCVojGPpTiettwacLZniQ05AYAXTKbgf2y4VETA1jl6U
	x8Lrj5N1Hvq0agNGkcHugmASQAXDqkASa5S86RYRah4BSxBy3Gc5ql+8wXkbhw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: brcm,brcmnand: update interrupts description
Date: Mon,  7 Nov 2022 17:22:53 +0100
Message-Id: <20221107162253.54110-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104085316.24499-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'150464c64669b2689fde42437586495d3a6ab8f6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082304_204945_FC870C96 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCAyMDIyLTExLTA0IGF0IDA4OjUzOjE2IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IDEuIERNQSBhbmQgRURVIGFyZSBtdXR1YWxseSBleGNsdXNpdmU6IGRvbid0IGFs
bG93IGJvdGggYXQgdGhlIHNhbWUgdGltZQo+IDIuIFJlcXVpcmUgaW50ZXJydXB0LW5hbWVzIGZv
ciAyKyBpbnRlcnJ1cHRzIHRvIGF2b2lkIC9ndWVzc2luZy8KPiAKPiBSZXBvcnRlZC1ieTogRmxv
cmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4
dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
