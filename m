Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52ECCA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 16:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erzz6t1yBIBT2rqLIUqd/1Y6NJBvUNePp2q137VwreM=; b=TWn7TT+P2rCusw
	/BYRazo6pW3eKg7E2hFNEXXYLFeI19PiK/9P5q1VbSu4wIy/GQkwN5VFem4OqP5fgnm175xcU7n3H
	lpWcgHjAErvSKyASLxQi3gPfNFx+d/FuXCm3kah+u+4sYjmsdacBzxzSFEuscW35IW8RBvIcJwz+A
	ZYtLUa6l0RcjW3aqU85RXwxbW0FV9SyuG7Mv2ttAT1LRDERAruynsWIAmkFu5QFJNXt9eNqpxITgu
	rvO+xzfvkgy89huedgEpeuHW5aZ8EDxBdemoLxvCe2DyR9146H13OQJCaFzZCwjg7iyzZv/av1oRB
	uFYUCSEYWp5EsA0zt66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNFm-0000000FJZm-2T4d;
	Wed, 10 Sep 2025 16:01:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNFk-0000000FJXC-0OBJ
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 16:01:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B8EF24E40B9A;
	Wed, 10 Sep 2025 16:00:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FAD8606D4;
	Wed, 10 Sep 2025 16:00:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53C08102F28AA;
	Wed, 10 Sep 2025 18:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757520056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9CYKnHlPAiryvfPRKzcN727LGsaG/CZvjRmc/KCqAJE=;
	b=tT2gSlxcAvaj9MY69BvmDTv4Il4UK6e3TCrVWCvFI83pNEaqDdqE9aCzgzJhjj7OeG8YzK
	kPqhliPkm5XkCTmJ6Rptid6PiueP60UqfZYnZpy5No0d4+9ifdyay+wYN6xfyBZSROrRIe
	ie4XU0w1kDul8Fg/FJZEz48bRt8MdXsKk71EI+Qy+M/hTQlno+ZKkhmnB0MJLp9YOGXjbs
	Un5EbK7O9S+z5HWfsjvBW8Toxq7XkAARBkY6vjuHv9A02orzaOfXpiaqqjgALAghbrZd3X
	Pd9QG/uJSbJCedhkRtQGA+BEiAj57Or5dA35oJ1M3GAAvFZ/Tnd9xm6R1UmQJw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <markus.stockhausen@gmx.de>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: AW: [PATCH v2 2/2] mtd: nand: realtek-ecc: Add Realtek external
 ECC engine support
In-Reply-To: <017601dc226a$55da4d40$018ee7c0$@gmx.de> (markus stockhausen's
	message of "Wed, 10 Sep 2025 17:48:20 +0200")
References: <20250828143408.2511086-1-markus.stockhausen@gmx.de>
	<20250828143408.2511086-3-markus.stockhausen@gmx.de>
	<87ms72elzw.fsf@bootlin.com> <017601dc226a$55da4d40$018ee7c0$@gmx.de>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 18:00:40 +0200
Message-ID: <87segub8lz.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_090100_267903_03118DC8 
X-CRM114-Status: GOOD (  11.71  )
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

T24gMTAvMDkvMjAyNSBhdCAxNzo0ODoyMCArMDIsIDxtYXJrdXMuc3RvY2toYXVzZW5AZ214LmRl
PiB3cm90ZToKCj4+IFZvbjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4gCj4+IEdlc2VuZGV0OiBNaXR0d29jaCwgMTAuIFNlcHRlbWJlciAyMDI1IDEwOjQzCj4+Cj4+
ID4gKwlyZXQgPSBGSUVMRF9HRVQoUlRMX0VDQ19SRVNVTFQsIHN0YXR1cyk7Cj4+ID4gKwlhbGxf
b25lID0gRklFTERfR0VUKFJUTF9FQ0NfQUxMX09ORSwgc3RhdHVzKTsKPj4KPj4gTWF5YmUgeW91
IHNob3VsZCBjaGVjayB3aGV0aGVyIGFsbF9vbmUgcmVtYWlucyB0cnVlIGlmIHRoZXJlIGFyZQo+
PiBjb3JyZWN0YWJsZSBiaXRmbGlwcyBpbiB5b3VyIGJ1ZmZlciAoeW91IG1heSB1c2UgbmFuZGZs
aXBiaXRzIGZvciB0aGF0Cj4+IHB1cnBvc2UpLiBJZiBub3QsIHlvdSBzaGFsbCBwcm9iYWJseSBz
cGVuZCBleHRyYSB0aW1lIHdoZW4gY2hlY2tpbmcgZm9yCj4+IHJldCBjaGVja2luZyBpZiB0aGVy
ZSBhcmUgbGVzcyBiaXRmbGlwcyB0aGFuIHRoZSBFQ0MgY29udHJvbGxlciBjYW4KPj4gY29ycmVj
dCBjb21wYXJlZCB0byBvbmVzIGluIHRoZSAqZW50aXJlKiBidWZmZXIsIHdoaWNoIHdvdWxkIGlu
ZGljYXRlCj4+IHRoYXQgeW91IGFyZSByZWFsbHkgaW4gdGhlIHByZXNlbmNlIG9mIGFuIGVyYXNl
ZCBwYWdlLCBzZWU6Cj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE2LjUv
c291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jI0wyODQxCj4+Cj4+IFRoaXMg
aGVscGVyIG1heSBiZSBtb3ZlZCBpZiB5b3UgbmVlZCBpdC4KPgo+IEVDQyBlbmdpbmUgY2Fubm90
IGhhbmRsZSBiaXRmbGlwcyBpbiBlcmFzZWQgYmxvY2tzLgo+IFNlZW1zIGFzIHRoaXMgaGVscGVy
IHJlYWxseSBjYW4gaW5jcmVhc2Ugcm9idXN0bmVzcwo+IGluIHRoaXMgY2FzZS4gSSB3aWxsIG1h
a2UgdXNlIG9mIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCj4KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5
ICJjYW4gYmUgbW92ZWQiPwoKSXQgaXMgcGFydCBvZiB0aGUgcmF3IE5BTkQgc3Vic3lzdGVtIGFu
ZCBpcyBub3QgYSBOQU5EIHdpZGUgaGVscGVyLAppZS4gaXQgaXMgbm90IGF2YWlsYWJsZSBmb3Ig
U1BJIE5BTkRzIG5vciBOQU5EIEVDQyBlbmdpbmVzLiBUaGUgaGVybHBlcgppcyBhbHJlYWR5IGRl
dmljZSBhZ25vc3RpYywgc28geW91IG1pZ2h0IGp1c3QgbmVlZCB0byBtb2V2ZSBpdCBvdXQgb2YK
bXRkL25hbmQvcmF3L25hbmRfYmFzZS5jLiBQZXJoYXBzIHlvdSBjYW4gcHV0IGl0IGludG8gbXRk
L25hbmQvY29yZS5jIG9yCndoYXRldmVyIG90aGVyIHBsYWNlIHlvdSBzZWUgZml0LgoKQ2hlZXJz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
