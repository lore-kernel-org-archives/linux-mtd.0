Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FCEFD8769
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mMYQvzznPEA0KbeamFQDiryrBXVmXEDdGfMfAarEqI=; b=r+0w7DcSyZvq6h
	IxGkYrWjGyi53C7Y9b186aqv3LUchO4iwj1ZQ/eVaElFFuVCnnkOq9T7DG0xjT2h0tdopzVMk39S4
	Dklig9NTJWM76kRL61+3nZOmz+vqB5eQ2XrXpgvYD24Fgc4rf4l9nyis17dt48BebjuTIVKdi0utC
	CtjXlTaKGrTYnipFwFwExiwfexjhAFsd4iR1ss5cejnTS2XKeEaiWwVpDo204icfbt6y39E5hUXz3
	301AZDjbDUezgMe1hr6EFtOb4yFI7UFdum2lC5ZA6RqQ5JiB9m+XwKANzrVwDudUGsBidbW2yN1RO
	blDVrzyqlMoS7YHNKtbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UJe-00000006PCf-1XfP;
	Tue, 17 Mar 2026 13:18:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UJa-00000006PBq-0Ut6
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 13:18:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0E79C1A2C24;
	Tue, 17 Mar 2026 13:18:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D89395FC9A;
	Tue, 17 Mar 2026 13:18:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4991104504B0;
	Tue, 17 Mar 2026 14:18:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773753506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=86vQtJH7uiSGWhoiWxaW7N5axJv4OHapc3z86BP3emQ=;
	b=NsHMOXkdXdxxo4Z9FpuabMWjVBmwk60YKQrD+b9yJ+cUYnwNS0c+ZFfkSFk96P1rL2zqmD
	BtnWIqLsmINdC0mm34ifRg0FPwwVBXY9LLPCjJBmdYKQyJikf1X8aBEAc7NJ6mMZQSM8CD
	JkZjup47Gmwgv5YMA+gYgLzYD+G0cBHnPn2TRRGmww/EqPq2X0u+eGsmz4EcbHkT2OPIm1
	C76GS4cRrds7ztQDoEUychwpHhee9GI4BYZ1XJyxEfzz2Kus0abujddaP9b0PLJ/Uy746J
	tk7U+IneFX8cBYc+xunOrgTNDFa/FsCXqaCS7Qw/DFdYbSxHXCC8mi4o1Qus7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Jakub Czapiga
 <czapiga@google.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Rename spi_nor_spimem_check_op()
In-Reply-To: <e70612d3-61fb-4c30-a52b-b4ef21c34768@linaro.org> (Tudor
	Ambarus's message of "Tue, 17 Mar 2026 13:39:36 +0200")
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
	<20260108121430.1096844-2-miquel.raynal@bootlin.com>
	<230c1e00-25c2-44f7-afa5-a8ccbcf145db@linaro.org>
	<87ms06er60.fsf@bootlin.com>
	<e70612d3-61fb-4c30-a52b-b4ef21c34768@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 14:18:21 +0100
Message-ID: <87h5qeegrm.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_061830_582314_A739F7DF 
X-CRM114-Status: GOOD (  11.08  )
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

T24gMTcvMDMvMjAyNiBhdCAxMzozOTozNiArMDIsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDMvMTcvMjYgMTE6MzMgQU0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4+IAo+Pj4+IC1zdGF0aWMgaW50IHNwaV9ub3Jfc3BpbWVtX2NoZWNrX29wKHN0
cnVjdCBzcGlfbm9yICpub3IsCj4+Pj4gLQkJCQkgICBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCj4+
Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zcGltZW1fY2hlY2tfcGFnZV9vcChzdHJ1Y3Qgc3BpX25v
ciAqbm9yLAo+Pj4+ICsJCQkJCXN0cnVjdCBzcGlfbWVtX29wICpvcCkKPj4+Cj4+PiBwYWdlIGlz
IGEgYml0IG1pc2xlYWRpbmcgYXMgaXQgY2FuIGluZGljYXRlIGl0J3MgdXNlZCBqdXN0IGZvciBw
YWdlCj4+PiBwcm9ncmFtcy4gV2UgbmVlZCB0byBmb2N1cyBvbiBvcGVyYXRpb25zIHRoYXQgbmVl
ZCBhZGRyZXNzIGJ5dGVzLAo+Pj4gcmVhZHMsIHBwLCBwYWdlIHNjcnViLCBlcmFzZSwgd3JpdGUv
cmVhZCBhbnkgcmVnaXN0ZXIsIGV0Yy4KPj4gCj4+IFRoaXMgaGVscGVyIGlzIG9ubHkgdXNlZCBm
b3IgcmVhZHMgYW5kIHBhZ2UgcHJvZ3JhbXMuIFRoZSBwb2ludCBpcwo+PiB0byBub3QgdXNlIGl0
IHdoZW4gcmVhZGluZy93cml0aW5nIHJlZ2lzdGVycy4KPj4gCj4KPiB5b3UncmUgcmlnaHQsIGl0
IGNvbWVzIGZyb20gaHdjYXBzLCB3aGVyZSB3ZSB2ZXJpZnkgdGhlIHJlYWRzIGFuZCBwcC4KPgo+
PiBXaGF0IGFib3V0IHNwaV9ub3Jfc3BpbWVtX2NoZWNrX2lvX29wKCkgPyBvciBfaW9yd19vcCgp
ID8KPgo+IHNwaV9ub3Jfc3BpbWVtX2NoZWNrX2h3Y2Fwc19vcD8KPgo+IElPIGlzIGludm9sdmVk
IHdpdGggcmVhZC93cml0ZSBhbnkgcmVnLgo+IHJ3IG1heSB3b3JrLCBidXQgaXQgY2FuIGJlIGFw
cGxpZWQgdG8gcmVnaXN0ZXJzIHRvby4KPgo+IG9yIG1heWJlIHNwaV9ub3Jfc3BpbWVtX2NoZWNr
X3JlYWRfcHBfb3A/CgpBaCwgdGhpcyBvbmUgSSBhbG1vc3QgcHJvcG9zZWQgaXQsIHNvIGxldCdz
IGdvIGZvciBpdCEKClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIQoKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
