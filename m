Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723BDC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SY7ZtfMQ+ZzcqhBChJRknWnt7gE9jCei2CjS5Ui2CMA=; b=e/9Tmtcp1hdPxM
	OWoVTeoY7wTF8U0EuiMi3/B5bmatXlvewI8AZ/hLbJ0D6KngP18sG9kBjvDVG4SoGJE9b65D3E+ho
	zkdchBXgquc9eA8AqLz8qQQMcX1sv9/9Zdcmr7iPr6zcP7pjPzTdO8Mg0ZvU23baHezv8/6uL0gj/
	KNPiEoQCq2j9drDihT5OJi/PADNtjwWdRNby6EQtMNnZ/BMinc6NPodm+YSIiqpBaZhn5UPFg24Bl
	Ui3kwyn8Cbtfta5LVvE5SNltGdRp4qrUf1gLqqUgMWQ5e3cvItY0RthjhIwxST+xH43Mo5VS2YczW
	wqETZXmOKix/MAvEGJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrjF-0069V1-H6; Thu, 16 Dec 2021 14:27:29 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxrjB-0069Sr-Ix
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 14:27:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6F35CFF804;
 Thu, 16 Dec 2021 14:27:19 +0000 (UTC)
Date: Thu, 16 Dec 2021 15:27:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael
 Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <20211216152717.30774928@xps13>
In-Reply-To: <YbtHYtcYsyrl5HaR@sirena.org.uk>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
 <20211215184426.67fd3912@xps13>
 <20211215200548.75630b61@collabora.com>
 <Ybo/r8neydqTxN6N@sirena.org.uk> <20211216100147.46c307ff@xps13>
 <20211216105739.395a174d@xps13> <YbtHYtcYsyrl5HaR@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_062725_802300_41C4193E 
X-CRM114-Status: GOOD (  10.09  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBUaHUsIDE2IERlYyAyMDIxIDE0
OjA0OjE4ICswMDAwOgoKPiBPbiBUaHUsIERlYyAxNiwgMjAyMSBhdCAxMDo1NzozOUFNICswMTAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IAo+ID4gQWN0dWFsbHkgYXMgdGhlIHNwaS1tZW0uaCBo
ZWFkZXIgaXMgbm90IGluY2x1ZGVkIGluIHNwaS5oLCBpdCBtYWtlcwo+ID4gZGVmaW5pbmcgYSBz
dGF0aWMgbWVtX2NhcHMgZW50cnkgaGFyZGVyLiBJJ2xsIGdvIGZvciBhbm90aGVyIGFwcHJvYWNo
Lgo+ID4gTWF5YmUgcHV0dGluZyB0aGUgY2FwYWJpbGl0aWVzIHdpdGhpbiB0aGUgc3BpX2NvbnRy
b2xsZXJfbWVtX29wcwo+ID4gc3RydWN0dXJlLCBhcyB0aGVzZSBhcmUgaGlnaGx5IHJlbGF0ZWQu
ICAKPiAKPiBZZWFoLCBvciBwdXR0aW5nIGEgcG9pbnRlciB0byBhIHN0YXRpYyBkZWNsYXJhdGlv
biBvZiB0aGUgY2FwcyBpbiB0aGVyZQo+IHJhdGhlciB0aGFuIHRoZSBjYXBzIGRpcmVjdGx5LgoK
WWVhaCwgdGhhdCdzIHdoYXQgSSBlbmRlZCB1cCBkb2luZy4gRWFjaCBjb250cm9sbGVyIGRyaXZl
ciBzdXBwb3J0aW5nCm1lbS1vcHMgbXVzdCBwcm92aWRlIGEgY2FwYWJpbGl0aWVzIHN0cnVjdHVy
ZS4gRHJpdmVycyB3aXRob3V0IHNwZWNpZmljCmNhcGFiaWxpdGllcyBjYW4ganVzdCByZWZlcmVu
Y2UgdGhlIHN0YXRpYyAmc3BpX21lbV9ub19jYXBzIHN0cnVjdAppbnN0ZWFkIG9mIGRlZmluaW5n
IHRoZWlyIGVtcHR5IG9uZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
