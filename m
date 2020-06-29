Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD3AC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 10:48:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F2823787
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 10:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3Mt/+mE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Juhe/Og5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F2823787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iES07DM1OZHNJ1Qrvh+WORsUqKX76z4wJ3ponSdChxk=; b=a3Mt/+mEOtn8GcvN7vAbdeKjC
	XAxbif1rooceCgpSIkaeVpjtor6vmaddlkqnOpmdYj5nwyYtAPFvW0GlsNsjyR2GvLKBZL9FXsucu
	B+cRWTsbUurS3miEh5BoOzOKk6Ktt04iTEaQ5fH+5mOJqyCxOzoGx3OSblZ84uaJyw0bsxx774GuS
	3dD67kFvk+EGJ01scfZq4DKjRiYuUNz/69p8AuG/b6uu32C7osPgw1TRbqptguKPrimoAWRMqcoyP
	tMrgIWzKIDqpVtx4YaULgjhcq7p1OFMxaHYu5+2epRnrIFgsd9HoaFhdlCoweyajNV903QbVX5VYI
	5U4if1z3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jprJa-000114-2p; Mon, 29 Jun 2020 10:47:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jprJX-00010N-GX
 for linux-mtd@merlin.infradead.org; Mon, 29 Jun 2020 10:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=sRuO477mOmYEquRlu3Mzw6P3QjDxQV8765WYyF09Irg=; b=Juhe/Og5EtyT+Umc1GcieYukVt
 JF7zaML8/+oqmlTac2qyMge9KSMBb3Vz+SkWOxd1XfesaE+tj6IwlAAkR1JDc2f+Fu/tSYJZJBp1h
 cg7CsX+Z4vSMWXTe+G3EZ70d8a5GP0t3HoDaj6zHOqsMk2H6lp3M/xSPSRR1oatOqgIVBhSDFsXrn
 Gv4qawOW4jhzxGagc/77raC/bN1suVV/en7DtanGD9RSJLLqW19M3FLCIWtXW40lCZ9J+rLSpnuwb
 P4mbcLbpu7VmHcjaTsYsK/5neiyVCa1KHvJ7nXuFtic8kEsAC9sXDvaCLfoicjr79lOEz51yPZ5yg
 ArlIDhHA==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jprJS-00060m-2g
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 10:47:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 846A7608F451;
 Mon, 29 Jun 2020 12:46:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HL9wt0Kx2GiV; Mon, 29 Jun 2020 12:46:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1FE0E628A671;
 Mon, 29 Jun 2020 12:46:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DXcrQwWzordZ; Mon, 29 Jun 2020 12:46:53 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id EF518628A660;
 Mon, 29 Jun 2020 12:46:52 +0200 (CEST)
Date: Mon, 29 Jun 2020 12:46:52 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Torben Hohn <torben.hohn@linutronix.de>
Message-ID: <1031805083.71374.1593427612787.JavaMail.zimbra@nod.at>
In-Reply-To: <20200629090734.GB17241@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
 <20200629090734.GB17241@linutronix.de>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication without hmac
Thread-Index: FVK9TEnM0XTAkNCUmJydLUxsCxi8Tg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200629_114659_146321_99E9C159 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 tglx <tglx@linutronix.de>, david <david@sigma-star.at>,
 Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VG9yYmVuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBUaGUgcm8gbW91bnQg
d2lsbCBmYWlsIGJlY2F1c2UgVUJJRlMgaXMgbm8gbG9uZ2VyIGFibGUgdG8gdmVyaWZ5IHRoZSBz
dXBlciBibG9jawo+PiB1c2luZyB0aGUgc3lzdGVtIGtleSByaW5nLiBJdCB3YXMgb3ZlcndyaXR0
ZW4gYnkgdGhleSB1YmlmczphdXRoZnMga2V5Lgo+IAo+IFllcy4gQnV0IHRoYXQgaXMgdGhlIGlu
dGVuZGVkIGJlaGF2aW91ci4KPiBJZiB0aGUgZmlsZXN5c3RlbSBoYXMgYmVlbiBjaGFuZ2VkLCBp
dCBtdXN0IG5vdCBiZSBtb3VudGVkIGFnYWluLgoKSW4geW91ciB1c2UgY2FzZS4KIAo+IEkgd291
bGQgcmF0aGVyIGxpa2UgdG8gbWFrZSBpdCBpbXBvc3NpYmxlIHRvIG1vdW50IHRoZSBmaWxlc3lz
dGVtIGluIHJ3Cj4gbW9kZSwgYmVjYXVzZSB0aGlzIGlzIGFuIGF0dGFjayBzY2VuYXJpby4gSXQg
d291bGQgcmVmdXNlIHRvIG1vdW50IHVwb24KPiByZWJvb3QuIE1ha2luZyBpdCBwb3NzaWJsZSB0
byByZW1vdW50IHJvb3QgcncsIHdpdGggYSBmcmVzaCBrZXkgaXMKPiBuaWNlIGZvciBkZXZlbG9w
bWVudCwgYnV0IGl0cyBub3QgZGVzaXJlZCBpbiBwcm9kdWN0aW9uLgo+IAo+IAo+PiAKPj4gQSBw
b3NzaWJsZSBzb2x1dGlvbiBpcyBrZWVwaW5nIGEgY29weSBvZiB0aGUgb2ZmbGluZSBzaWduIGtl
eSBmb3JldmVyIGluIHRoZSBmcy4KPj4gQnV0IEknbSBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgaXMg
d2lzZS4KPiAKPiBIZWggPyB5b3UgbWVhbiB0aGUgcHJpdmF0ZSBrZXkuIE5PCgpObywgSSB1c2Vk
IGJhZCB3b3JkaW5nLiA6LSkKVGhlIHN1cGVyYmxvY2sgaXMgc2lnbmVkIGJ5IHRoZSBvZmZsaW5l
IGtleS4gQXMgc29vbiB5b3Ugc3dpdGNoIHRvIHRoZSBuZXcga2V5CnRoZSBzdXBlciBibG9jayBp
cyByZXdyaXR0ZW4gYW5kIGNhbiBubyBsb25nZXIgdmVyaWZpZWQgdGhpcyBrZXkuCkluc3RlYWQg
b2YgcmV3cml0aW5nIHRoZSBpZGVhIHdhcyBrZWVwaW5nIGEgY29weS4KCkFueXdheSwgbGlrZSBz
YWlkIGluIHRoZSBvdGhlciBtYWlsLCBJIHRoaW5rIGlmIHdlIGNoYW5nZSB0aGUgZmVhdHVyZSB0
bwoia2VlcCBvZmZsaW5lIHNpZ24ga2V5IGFuZCBpbXBseSBybyBtb3VudCIgdGhpbmdzIHdpbGwg
YmUgbW9yZSBzbW9vdGggd2l0aCBsZXNzIGNvcm5lcgpjYXNlcy4KClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
