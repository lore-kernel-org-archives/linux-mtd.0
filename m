Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DCAC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 21:06:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D21421655
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 21:06:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jpw7TRVL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D21421655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xybctpd5Cq9Jt8Ao0ZdbVApi5qbGXRdn3YnwKgln5tE=; b=jpw7TRVL3RBl0PRVI4X45qAds
	kcZDyKqRpo3PxQu1uwvXPOhh8c8mRl5KCshWQPvntwBgIzNU7X49T1xbb6gxZWw0fG/V3U3qHPbqk
	hg3LZaYWZml/qbMWaAJMS98D5hmtwO2MBiF6DDc7jC7hB7qrmftkdBI8M9Jvrc4mxXutfT+PYhg1P
	6QpfYmkC7XtLmK6ETY3fWh8FpCSIowMjkmFqcnd9IPF5NjSC/enxSLAPMw93ef0rl4oFp0bBqt+2H
	LJSIOBDq4OTjJbdG24xsLAmWyvHRN17fcgmYcQE0VI2kfKOwu/ALsWcOWa9XJgpMJaak/Kgfihf3s
	rMNJPR0Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTWvP-0005fz-8I; Fri, 16 Oct 2020 21:06:07 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTWvL-0005fS-GL
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 21:06:06 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 43E0B200006;
 Fri, 16 Oct 2020 21:05:57 +0000 (UTC)
Date: Fri, 16 Oct 2020 23:05:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization
 to the right place
Message-ID: <20201016230556.6693e69f@xps13>
In-Reply-To: <CAOMZO5B4kC5ooE2Pmp4XaHq2xD51JSH35nF7_Ge8-xzp4piqKg@mail.gmail.com>
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
 <20201016135351.GL13710@pengutronix.de>
 <20201016190149.55a3d62f@xps13>
 <CAOMZO5B4kC5ooE2Pmp4XaHq2xD51JSH35nF7_Ge8-xzp4piqKg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_170603_670993_5B92FD9F 
X-CRM114-Status: GOOD (  13.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Han Xu <xhnjupt@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIEZy
aSwgMTYgT2N0IDIwMjAgMTY6MTg6MTUKLTAzMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiBGcmks
IE9jdCAxNiwgMjAyMCBhdCAyOjAxIFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gU29mdHdhcmUgRUNDIGlzIHVzZWQsIGlzIGl0IGV4cGVj
dGVkPyAgCj4gCj4gSSBub3RpY2VkIHRoZSBpc3N1ZSB3aXRoIHlvdXIgcGF0Y2g6IGhvc3QtPnBk
YXRhLmh3X2VjYyBjYW5ub3QgYmUKPiBjYWxsZWQgd2l0aGluIGF0dGFjaCgpIGJlY2F1c2UgcGRh
dGEgaXMgbm90IGluaXRpYWxpemVkIGF0IHRoaXMgcG9pbnQudC0+CgpOaWNlIGNhdGNoISBCdXQg
SSBkb24ndCBnZXQgd2h5IGhvc3QtPnBkYXRhLmh3X2VjYyB3b3VsZCBub3QgYmUKYWNjZXNzaWJs
ZSBmcm9tIHRoZSBhdHRhY2ggaG9vay4gaG9zdC0+cGRhdGEgaXMgcG9wdWxhdGVkIGluIHRoZSBw
cm9iZQpmdW5jdGlvbiwgd2F5IGJlZm9yZSBuYW5kX3NjYW4oKSwgd2hlcmUgLT5hdHRhY2goKSBp
cyBjYWxsZWQuIFNvIGZvciBtZQpob3N0LT5wZGF0YS5od19lY2Mgc2hvdWxkIGJlIGFjY2Vzc2li
bGUgZnJvbSAtPmF0dGFjaCgpLgoKPiBJbnN0ZWFkIG9mIHVzaW5nIHBkYXRhLCB3ZSBjYW4gcmV0
cmlldmUgdGhlICJuYW5kLWVjYy1tb2RlIiBzdHJpbmcKPiBmcm9tIHRoZSBkZXZpY2UgdHJlZS4K
ClBsZWFzZSBkb24ndCBkbyB0aGF0ISBUaGUgRFQgcGFyc2luZyBzaG91bGQgYmUgY2VudHJhbGl6
ZWQgaW4gdGhlIGNvcmUuCgpIb3dldmVyLCBpZiB5b3UgZG9uJ3QgbmVlZCB0aGlzIHBkYXRhIGVu
dHJ5IHlvdSBjYW4gZ2V0IHJpZCBvZiBpdAplbnRpcmVseS4gSW4gdGhlb3J5LCBpZiB0aGUgdXNl
ciBzZXQgdGhlIG5hbmQtZWNjLW1vZGUgcHJvcGVydHksIHRoZW4KY2hpcC0+ZWNjLmVuZ2luZV90
eXBlIHNob3VsZCBhbHJlYWR5IGJlIHNldCB0byB0aGUgYXBwcm9wcmlhdGUgdmFsdWUKd2hlbiBl
bnRlcmluZyAtPmF0dGFjaCgpLiBDYW4geW91IHBsZWFzZSBjaGVjayBpdHMgdmFsdWU/IEl0IHNo
b3VsZApoYXZlIGJlZW4gdXBkYXRlZCBieSByYXduYW5kX2R0X2luaXQoKS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
