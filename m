Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689C2C61DB6
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKGdX4zj/TDDmc6L2PLTPAR3zUR16Z9DQXb3MJRRUes=; b=iz5zlnvWC8mAGF
	38MPRI/LP92nNrXgYC8YCHzo9u044q2zAqlsGTs7BSh8jBusZyF1rojIaN+yIFVH+YH7B7ln6PEnn
	FPIFG48MqTAkYnSaPzf6My9d6+9QVJA2eAK8p0VMUwarym34T2AWZWg80szfzQmr3rVwDM4DatQ6u
	ziosM42gQY9DGSsJSyQ9VkHH0mLbrtP2LtaRpqMynoEfPRJmKQgWXwFhjCJWbmLZabZo+Wy5cWgfn
	XZwcRn7rCDVH4oMVO7iQlyh8+uiVtXzDMx85n+ea3sZHh97Cu71JUlpPCueJV/eHUwCQ0wqugygYr
	G5zLybxUJfPlLYEnOpiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynA7-00000000SEg-0hJf;
	Tue, 25 Aug 2026 09:09:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynA5-00000000SDq-13Rs
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 09:09:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 68F121A1766;
	Tue, 25 Aug 2026 09:09:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36455604C4;
	Tue, 25 Aug 2026 09:09:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DF7111C7A254;
	Tue, 25 Aug 2026 11:09:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787648974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F/8obPya0bR43OsFeLX51PFCgxTY5HzLfgC/ACn/ZxE=;
	b=aF9qr1P2K/3TzXhNGkE0JLLN8833gl72fn5gWCNiJ2bZ/bFGthzSWEekgiEQUAFP0JAIJ4
	BSt47QhWGJYN9NAiJY5G+MN8EsB0tq2Nqcj3cO2xgAdI7kax+3CnsRpcxFMtoTuVE6R1Mn
	8CFMwU9vYVR0jEmSLEtNS85o8iK3xi7HzwiPLzgRAZ3BbDtn7L4JGT4cmvT/kXDZrV6+AR
	tz1/T1HiZ8l/a4i9MB+7IebYxaxfB8zeAU9hKWkn94TDVk2P8a0eemncw+gVdIFtsJsD2J
	soonhBZpQxZ2xrzyWk6HlDJsoanj2Dlhqr8DYCFOLmJ5RZLo4vmYpZHqNk0MUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mtd: spinand: winbond: enable continuous read for
 W25N04LW
In-Reply-To: <20260814-w25n04lw-contread-v1-1-2968b07c962d@atmark-techno.com>
	(Dominique Martinet's message of "Fri, 14 Aug 2026 08:15:58 +0000")
References: <20260814-w25n04lw-contread-v1-1-2968b07c962d@atmark-techno.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 11:09:33 +0200
Message-ID: <871pbmk1ma.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_020941_434921_212A2BFD 
X-CRM114-Status: GOOD (  14.98  )
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

SGkgRG9taW5pcXVlLAoKT24gMTQvMDgvMjAyNiBhdCAwODoxNTo1OCBHTVQsIERvbWluaXF1ZSBN
YXJ0aW5ldCA8ZG9taW5pcXVlLm1hcnRpbmV0QGF0bWFyay10ZWNobm8uY29tPiB3cm90ZToKCj4g
VGhpcyBlbmFibGVzIGNvbnRpbnVvdXMgcmVhZCBmb3IgVzI1TjA0TFc6Cj4gLSBUaGUgb3BzIGFy
ZSBiYXNpY2FsbHkgdGhlIHNhbWUgYXMgY29udF9yZWFkX2NhY2hlX2R1YWxfcXVhZF9kdHJfdmFy
aWFudHMKPiB3aXRob3V0IHRoZSBzcGVlZCBsaW1pdCAodGhpcyBjaGlwIGhhcyBubyBIRlJFUSBm
bGFnIHRoYXQgd291bGQgY2hhbmdlCj4gdGhlIHJlcXVpcmVkIGRlbGF5cykgYW5kIHdpdGhvdXQg
RFRSIG9wcyAobm90IHN1cHBvcnRlZCkKPiAtIHcyNW4weGp3X3NldF9jb250X3JlYWQoKSBjYW4g
YmUgcmV1c2VkCj4KPiBVbmZvcnR1bmF0ZWx5IG9uIG15IHN5c3RlbSAoaS5NWCA4VUxQIExQU1BJ
KSB0aGUgZmlyc3QgdGltZSBjb250aW51b3VzCj4gcmVhZCBpcyB1c2VkIHNwaW5hbmRfcmVhZF9m
cm9tX2NhY2hlX29wKCkgZmFsbHMgaW50byB0aGlzIGlmIGFuZAo+IGRpc2FibGVzIGNvbnRpbnVv
dXMgcmVhZCwgc28gdGhpcyBkaWRuJ3QgZ28gYW55IGZ1cnRoZXI6CgpBaCwgdG9vIGJhZCA6LSkK
Cj4gICAgICAvKgo+ICAgICAgICogRGlybWFwIGFjY2Vzc2VzIGFyZSBhbGxvd2VkIHRvIHRvZ2ds
ZSB0aGUgQ1MuCj4gICAgICAgKiBUb2dnbGluZyB0aGUgQ1MgZHVyaW5nIGEgY29udGludW91cyBy
ZWFkIGlzIGZvcmJpZGRlbi4KPiAgICAgICAqLwo+ICAgICAgaWYgKG5ieXRlcyAmJiByZXEtPmNv
bnRpbnVvdXMpIHsKPiAgICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICogU3BpIGNvbnRy
b2xsZXIgd2l0aCBicm9rZW4gc3VwcG9ydCBvZiBjb250aW51b3VzCj4gICAgICAgICAgICAgICAq
IHJlYWRpbmcgd2FzIGRldGVjdGVkLiBEaXNhYmxlIGZ1dHVyZSB1c2Ugb2YKPiAgICAgICAgICAg
ICAgICogY29udGludW91cyByZWFkaW5nIGFuZCByZXR1cm4gLUVBR0FJTiB0byByZXRyeQo+ICAg
ICAgICAgICAgICAgKiByZWFkaW5nIHdpdGhpbiByZWd1bGFyIG1vZGUuCj4gICAgICAgICAgICAg
ICAqLwo+ICAgICAgICAgICAgICBzcGluYW5kLT5jb250X3JlYWRfcG9zc2libGUgPSBmYWxzZTsK
PiAgICAgICAgICAgICAgcmV0dXJuIC1FQUdBSU47Cj4gICAgICB9Cj4KPiBJJ20gbGVhdmluZyB0
aGlzIHBhdGNoIGZvciBhbnlvbmUgd2hvIGNvdWxkIGhhdmUgaGFyZHdhcmUgZm9yIHRoaXMgKG9y
Cj4gZXZlbnR1YWxseSBteXNlbGYgYWZ0ZXIgSSBoYXZlIHRpbWUgdG8gY2hlY2sgdGhlIFNQSSBk
cml2ZXIuLi4pCj4KPiBGdW4gZmFjdDoKPiBuYW5kZHVtcCAtQyBpcyBhYm91dCA5JSBmYXN0ZXIg
dGhhbiBuYW5kZHVtcCBvbiBsYXJnZSBkYXRhICh0cmllZCAxME1CKQo+IGV2ZW4gaWYgY29udGlu
dW91cyByZWFkIGlzIG5vdCBzdXBwb3J0ZWQuCgpUaGF0IGlzIHN0cmFuZ2UuIElzIHRoaXMgcmVh
bGx5IHJlcHJvZHVjaWJsZT8gQ2FuIHlvdSBkaXNhYmxlIENQVSBQTSBhbmQKdHJ5IGFnYWluPyBU
aGVyZSBzaG91bGQgYmUgbm8gaW1wYWN0IGlmIGNvbnRpbnVvdXMgcmVhZCBpcyBkaXNhYmxlZC4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
