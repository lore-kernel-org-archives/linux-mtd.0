Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB45CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 07:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvnvC5uwsmB3gyBWO9UCLrnuW2GiNTKPAXOKNzHFMsM=; b=ZbR7zNJtHDhRo4
	5V+xGMmH6fhhFx9Cr0wza6wZmfUW2EUdLxYuVZ7CrpEKTwAj2XUsJcbLsGnB3+jD486bsCK8lCaxq
	I7844JpQ6YxNYhrgrIM2vOAampKnoNdv4VGrL0UT4cdnxLjz9eMv8QFrEMWSlLv5Sxwv7NDAT/iIW
	8/QgOB4H5iOQxSSlceEeRMHd8zx0djzwn+cRv1F2HrpRrfG5B3wsCEJRo2gttM4uy+42pBYFEq2Ws
	lJxX4pQp8USiFunst62OXhAiSlfn6O8Yv3IKDV2+mGl/2VNMsyLhYNCxKL9MHJ4aIHQEkOhr3Y7pN
	7QSiSYiniZ+SSyv/yrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndoJP-007989-AP; Mon, 11 Apr 2022 07:18:11 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoJD-00793c-9H; Mon, 11 Apr 2022 07:18:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA8DA1BF209;
 Mon, 11 Apr 2022 07:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649661475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9HxmNH+wJTJwEE9weq82YmxGUP8sTv4/gZsbkYd/po=;
 b=eUK4j613W9p5rbtFtbqoBW6fzrINyPazW0/xq15eOENxAZ4v3OJTIAr9VdbwjG2g1U8Vfw
 WkzEuOPFR/+96ne8arHo7UNOsm7ki1S0qPNSTbme1/8q2KfrPCCs3Q1nPs9AfY5kWZpcZE
 AAovSUS5TJR93Nem25GRQs3t8luz9hHNOvJDASk4ga/6z4QFMILWxUqQKzds30J7SH/PGx
 4q5wWE4MhaYCQGCJ6XtDZGaVxO5ataCd4Lcq94+80Gr5Rq9UsBGU/uAiZNDsPPwf4cqGd5
 ioUrOAZq6oQRqrmZQi2Qves+YU7YlrnA491bo7cU1sJd32fDlSkU7StW1wQbSw==
Date: Mon, 11 Apr 2022 09:17:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Cai Huoqing
 <cai.huoqing@linux.dev>, Florian Fainelli <f.fainelli@gmail.com>, Colin Ian
 King <colin.king@intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Paul Cercueil <paul@crapouillou.net>,
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:NAND FLASH SUBSYSTEM"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 1/5] mtd: nand: make mtk_ecc.c a separated module
Message-ID: <20220411091749.63e0aad9@xps13>
In-Reply-To: <CAJsYDV+SkL0yCroidGz4yzKbdj5Yx37a0DW9RLftKsceSFGnnw@mail.gmail.com>
References: <20220407150652.21885-1-gch981213@gmail.com>
 <20220407150652.21885-2-gch981213@gmail.com>
 <20220408083214.1473e88a@xps13> <YlAqSQ5w3y39aOy+@sirena.org.uk>
 <CAJsYDV+SkL0yCroidGz4yzKbdj5Yx37a0DW9RLftKsceSFGnnw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_001759_528300_E28EC8E2 
X-CRM114-Status: GOOD (  14.84  )
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

SGkgTWFyaywKCmdjaDk4MTIxM0BnbWFpbC5jb20gd3JvdGUgb24gU2F0LCA5IEFwciAyMDIyIDE5
OjA4OjU3ICswODAwOgoKPiBIaSBNYXJrIQo+IAo+IE9uIEZyaSwgQXByIDgsIDIwMjIgYXQgODoy
OCBQTSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZy
aSwgQXByIDA4LCAyMDIyIGF0IDA4OjMyOjE0QU0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cj4gPiAgCj4gPiA+IE90aGVyd2lzZSBvbiB0aGUgTVREIHNpZGUgdGhlIHNlcmllcyBsb29rcyBn
b29kIChiZXNpZGVzIHRoZSB0d28KPiA+ID4gY29tbWVudHMgeW91IGFscmVhZHkgcmVjZWl2ZWQp
LiAgCj4gPgo+ID4gV2hhdCdzIHRoZSBwbGFuIGZvciBtZXJnaW5nIHRoZW4/ICAKPiAKPiBJIGp1
c3QgdGVzdGVkIHRoaXMgZHJpdmVyIG9uIGEgZGlmZmVyZW50IGNoaXAgYW5kIGZvdW5kIG91dCBp
dCdzIGJ1Z2d5Cj4gdGhlcmUuIEknbSBzdGlsbCBkZWJ1Z2dpbmcuCj4gUGxlYXNlIHdhaXQgZm9y
IHY1IG9mIHRoaXMgc2VyaWVzLiBTb3JyeS4KCldlIG5lZWQgdG8gbWVyZ2UgdGhpcyBzZXJpZXMg
aW4gYW4gaW1tdXRhYmxlIGJyYW5jaC4gUGVyaGFwcyBhcyB0aGUgYmlnCiJwYXJ0IiBpcyB0aGUg
U1BJIGNvbnRyb2xsZXIgZHJpdmVyLCBpdCBzaG91bGQgcHJlZmVyYWJseSBnbyB0aHJvdWdoCnNw
aSwgYnV0IEknbSBmaW5lIGVpdGhlciB3YXlzLCBsZXQgbWUga25vdyB3aGF0IHlvdSBwcmVmZXIu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
