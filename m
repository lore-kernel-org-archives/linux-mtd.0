Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E876C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 09:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/w/066C1mMEK4my9bbQXteAmIjVqgYYxUZJTT6jOBXY=; b=0TT+b6vAXnHTIN
	FUlx82UuIB83nwnHM3QnD04nyepNyxUPCS7Frx1x5cnITHX+vpwRj+rWKYsiAaTkEt1O/KLkH2TzF
	arGVuioaSP9M6Vpeo8RzIf0FXLDlHkQBxrmOMyiJKs+49ENUml/Tilgmm9pNc1KYDyMalchMO8VPy
	WGsPlSp3lUVOyCrwpzfNAUyGWxIDELNXYvGUQ4CaTva+9TcL6x4TWO0bpYPiXDwtflgMGrgo9mHKB
	UQH5IRGIhjELdD3iO7Ycgu8iHhz5mocfbEP+HKxFPypfk6a7wkvkTF+nLbxCraXLqeVRSb96lNggv
	Un6r4ZChQDSGCqP4Nk9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxmsR-004NI3-H8; Thu, 16 Dec 2021 09:16:39 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxme9-004G3E-75
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 09:01:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3E50E6000C;
 Thu, 16 Dec 2021 09:01:48 +0000 (UTC)
Date: Thu, 16 Dec 2021 10:01:47 +0100
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
Message-ID: <20211216100147.46c307ff@xps13>
In-Reply-To: <Ybo/r8neydqTxN6N@sirena.org.uk>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
 <20211215184426.67fd3912@xps13>
 <20211215200548.75630b61@collabora.com>
 <Ybo/r8neydqTxN6N@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_010153_452530_93DB9B8C 
X-CRM114-Status: GOOD (  16.77  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDE1IERlYyAyMDIxIDE5
OjE5OjExICswMDAwOgoKPiBPbiBXZWQsIERlYyAxNSwgMjAyMSBhdCAwODowNTo0OFBNICswMTAw
LCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gCj4gPiBUaGVyZSdzIGFsc28gYSBzZWNvbmQgb3B0
aW9uIHRoYXQgZG9lc24ndCBpbnZvbHZlIHBhdGNoaW5nIGV4aXN0aW5nCj4gPiB1c2VyczogYWRk
IGEgc3BpX21lbV9jb250cm9sbGVyX2NhcHMgdG8gdGhlIHNwaV9jb250cm9sbGVyIHN0cnVjdCwg
YW5kCj4gPiBjaGVjayB0aGlzIGluc3RhbmNlIGluIHlvdXIgc3BpX21lbV9kZWZhdWx0X3N1cHBv
cnRzX29wKCkKPiA+IGltcGxlbWVudGF0aW9uLiBOb3RlIHRoYXQgdGhlIGJ1c3dpZHRoIGNoZWNr
IGRvbmUgaW4gdGhlIGdlbmVyaWMKPiA+IGhlbHBlciBpcyBhbHJlYWR5IGJhc2VkIG9uIGNhcHMg
ZXhwb3NlZCBieSB0aGUgY29udHJvbGxlcgo+ID4gdGhyb3VnaCBzcGlfY29udHJvbGxlci5tb2Rl
X2JpdHMgKHtSWC9UWH1fe0RVQUwsUVVBRCxPQ1RBTH0gYml0cykuICAKPiAKPiBUaGlzIGFwcHJv
YWNoIGlzIHF1aXRlIG5pY2UgZm9yIHRoaW5ncyBsaWtlIHRoaXMgLSBoYXZpbmcgdGhpbmdzIGFz
IGRhdGEKPiByYXRoZXIgdGhhbiBjb2RlLiAgVGhlIG9ubHkgaXNzdWUgaXMgaWYgYW55IG9mIHRo
ZSBjYXBzIGVuZCB1cCB2YXJ5aW5nCj4gYnkgb3BlcmF0aW9uIGFuZCB3ZSBuZWVkIGRpZmZlcmVu
dCBjYXBhYmlsaXRpZXMgYnV0IHRoYXQgZG9lc24ndCBsb29rCj4gdG9vIGxpa2VseSBoZXJlIEkg
dGhpbms/CgpJbmRlZWQgdGhhdCB3YXMgdGhlIG1haW4gcG9pbnQgb2YgdGhlIG9yaWdpbmFsIHJl
dmlldyBmcm9tIEJvcmlzLCB0aGUKY2FwYWJpbGl0aWVzIHNob3VsZCBiZSBmaXhlZCBvbiB0aGUg
Y29udHJvbGxlcidzIGxpZmV0aW1lLiBTbyBJIGJlbGlldmUKd2UgYXJlIHNhZmUuCgpJIHRoaW5r
IEkgYW0gZ29pbmcgdG8gcHJvcG9zZSB0aGUgZm9sbG93aW5nOgoJY29uc3Qgc3RydWN0IHNwaV9j
b250cm9sbGVyX21lbV9vcHMgKm1lbV9vcHM7CisJc3RydWN0IHNwaV9jb250cm9sbGVyX21lbV9j
YXBzIG1lbV9jYXBzOwoKQXMgdGhlIHN0cnVjdHVyZSBpcyBub3Qgc3VwcG9zZWQgdG8gZW5sYXJn
ZSBkcmFtYXRpY2FsbHkgaW4gdGhlIG5lYXIKZnV0dXJlLCBJIGd1ZXNzIGl0J3MgZmluZSB0byBo
YXZlIGl0IGRlZmluZWQgc3RhdGljYWxseS4gUGxlYXNlIHRlbGwgbWUKaWYgeW91IHByZWZlciBh
ICptZW1fY2FwcyBwb2ludGVyLgoKSSdsbCBzZW5kIGEgcHJvcG9zYWwgc29vbi4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
