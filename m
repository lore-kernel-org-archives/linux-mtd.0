Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50801C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxzHGKEBF+8uBJGwqk7xlNo1LowK7hQfZoCQffX39ac=; b=vOsJcsw/RmrHx4
	isgAV5QS79v9BLtqMTW3ZSC5J5vVBhRL6vbSm6+lnkHhIEwKVioS+Tp4O8jBxfK4PsmosV+/485jf
	x29G5NXSYlFeERKsJKk2HOTdEnS0KVMBi/Ssh778qBxO1tmyFXlu7pf71AEeU1k1vy30bRyRr5uGh
	LJlJUt+TDwhLBIB/Fmx4uHIXLu5lmMIatoE4bxreorTCzpNrkPT82twN9WM0Cl30TRdO7Ruq3O0+b
	BvpC8mJUivemcE670BtlQIZ8DjNUG7UBGJQ2JPhXVBbOZpjscvvWyWnFo0N+Tw/dwgF1WSyrT3Hc9
	+7j+eFu4CaDimBEl0+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckx-0000000Bc2x-1PkL;
	Mon, 06 Jul 2026 06:24:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckq-0000000BbtT-2MiC
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0EEAF4E40CA6;
	Mon,  6 Jul 2026 06:24:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D80F5601A2;
	Mon,  6 Jul 2026 06:24:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2E0211BB98B6;
	Mon,  6 Jul 2026 08:24:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n4Tv2V/4yOSjq4bLJ4JsjVrgvra5EH3VtlC5Veydlwo=;
	b=JFnVDzXdssDy8kawCIfV4y0w2gDg34MLVLBENTkxpsqhVeLRaJ2NZ9TXZhrfgUt/O4ZIIC
	ZDdbySW7fbjWIIhrz7VD1pxiMWkf8a3Mh3rx97pm5XgQyTMM1ookRbrTvkM60rriVBFLiJ
	nQ0hNvKLHywTqENdOiI9oiTem4w/njWKtL6p1xQzImgn+mWYw7g4da20IZaXc4DJpcHUxY
	hut+YaNTgU8MJVTtQw/GQ6JtRuBwn6/8iSp9kgBF2dK2WptWNjvcE3FvNVbEXRao/M7jq3
	51tBaKFbGLF/qzSmJh6d8Tx2KLiCVk3PCJT6MykBHEecyAZ3Om37SNaOvz684A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kyungmin Park <kyungmin.park@samsung.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260703074350.65127-1-pengpeng@iscas.ac.cn>
References: <20260703074350.65127-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] mtd: onenand: samsung: report DMA completion
 timeouts
Message-Id: <178331906884.868671.5464358338960736984.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:28 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232432_769261_E590B5A1 
X-CRM114-Status: UNSURE (   5.53  )
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

T24gRnJpLCAwMyBKdWwgMjAyNiAxNTo0Mzo1MCArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IFRoZSBTNVBDMTEwIE9uZU5BTkQgRE1BIGhlbHBlcnMgaGF2ZSBib3VuZGVkIHdhaXRzIGZvciB0
cmFuc2Zlcgo+IGNvbXBsZXRpb24uIFRoZSBwb2xsaW5nIGhlbHBlciBmYWxscyBvdXQgb2YgaXRz
IHRpbWVvdXQgbG9vcCBhbmQgcmV0dXJucwo+IHN1Y2Nlc3MsIGFuZCB0aGUgSVJRIGhlbHBlciBp
Z25vcmVzIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpLgo+IAo+IFJldHVybiAtRVRJTUVE
T1VUIHdoZW4gdGhlIERNQSB0cmFuc2Zlci1kb25lIGJpdCBvciBjb21wbGV0aW9uIGRvZXMgbm90
Cj4gYXJyaXZlIGJlZm9yZSB0aGUgdGltZW91dCBzbyBjYWxsZXJzIGNhbiB0cmVhdCB0aGUgYnVm
ZmVyIHRyYW5zZmVyIGFzCj4gZmFpbGVkLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhl
cywgdGhhbmtzIQoKWzEvMV0gbXRkOiBvbmVuYW5kOiBzYW1zdW5nOiByZXBvcnQgRE1BIGNvbXBs
ZXRpb24gdGltZW91dHMKICAgICAgY29tbWl0OiBkMDNhMTliZDZjN2Y4NmI5OWNhOGZiNjFhNmVj
MjM0NWNlZTFkOWQ2CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXgu
Z2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9i
b3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
