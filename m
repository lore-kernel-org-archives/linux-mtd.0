Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2F3C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 08:21:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804942070C
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 08:21:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lHH4dJ4J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 804942070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5hzMTjSvKSGu/JIw1NDw4sB4IO82ZvdQ+D8nE835LGM=; b=lHH4dJ4JyW/QjCZaukSAaZvYr
	25rh6pznBSLBoNIHYwbXw0vNFfaUjoqX3aAtLFZTFw51E3MwkJRZybjvI010eQ+lTjGgRHa+CMOU8
	YJQDsdhI4aq1r+Es80Rk7nQ8JB5nKe+rGbljSlE9LSECqKDW06wG/8PP675XhlhzqIX90+guHO0ly
	5TSr1yuD4sC8gocEc1H2+DHNdBjfpZuaMxIhlYQ29KC6c2kwZ88y/0+3dTRzFSP0nCuovTRL+DVWj
	4QMK+8soDigiLc5yNCY4N2t2JGU6irxfGbQ7UVJ4x8qXYsLyLTR3V/WzLs3YYztYKUXTQ5KN1PJlA
	6NFDNWEJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGvy-0007BD-EA; Fri, 03 Jul 2020 08:20:34 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGvw-0007Ae-6s
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 08:20:33 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 376EC628A674;
 Fri,  3 Jul 2020 10:20:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id uHqZSG5AZlXs; Fri,  3 Jul 2020 10:20:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D36BB607402C;
 Fri,  3 Jul 2020 10:20:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dY-0nHXNzE4j; Fri,  3 Jul 2020 10:20:29 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id AAFAC628A674;
 Fri,  3 Jul 2020 10:20:29 +0200 (CEST)
Date: Fri, 3 Jul 2020 10:20:29 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: bigeasy <bigeasy@linutronix.de>
Message-ID: <1352684131.86554.1593764429561.JavaMail.zimbra@nod.at>
In-Reply-To: <20200703081627.pifi4rwafza6ii7n@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200629090734.GB17241@linutronix.de>
 <1031805083.71374.1593427612787.JavaMail.zimbra@nod.at>
 <875zb6t1yf.fsf@nanos.tec.linutronix.de>
 <1142766008.83787.1593702042460.JavaMail.zimbra@nod.at>
 <87wo3lsqg6.fsf@nanos.tec.linutronix.de>
 <1162063436.84431.1593716634407.JavaMail.zimbra@nod.at>
 <20200703081627.pifi4rwafza6ii7n@linutronix.de>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication without hmac
Thread-Index: 2PxM7qwFj0ypBOFD8EB4meCkY5NRSg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_042032_400684_2B17D049 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: tglx <tglx@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, david <david@sigma-star.at>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U2ViYXN0aWFuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiA+IEFuZCB0aGF0
J3Mgd2hhdCBUb3JiZW4gaW1wbGVtZW50ZWQgdW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZy4K
Pj4gCj4+IFRvcmJlbiBpbXBsZW1lbnRlZCBpdCB0aGUgb3RoZXIgd2F5IGFyb3VuZCwgaGUgYWxs
b3dzIG1vdW50aW5nIHdpdGhvdXQKPj4gdGhlIEhNQUMgaWYgVUJJRlMgbW91bnQgaXMgcmVhZC1v
bmx5Lgo+PiBUaGlzIGNvdmVycyBhbHNvIHRoZSBwcm9wb3NlZCB1c2UtY2FzZSBidXQgYXMgSSBz
dGF0ZWQgaXQgaGFzIGlzc3VlcyB3aXRoCj4+IHJlbW91bnRpbmcgYW5kIG1ha2VzIHRoZSBpbXBs
ZW1lbnRhdGlvbiBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gaXQgc2hvdWxkIGJlLgo+PiAKPj4gVGhh
dCdzIHdoeSBJIHByb3Bvc2VkIGFkZGluZyBhIG5ldyBtb3VudCBvcHRpb24gbGlrZSAia2VlcF9v
ZmZsaW5lX3NpZ25hdHVyZSIgb3IKPj4gd2hhdCBuYW1lIGZpdHMgYmV0dGVyLiBUaGF0IGdpdmVz
IHVzIHRoZSBmb2xsb3dpbmcgcHJvczoKPiAKPiBzbyB5b3Ugd2FudCBhbiBleHRyYSBvcHRpb24g
aW5zdGVhZCBvZiBzZXR0aW5nIFNCX1JET05MWSBvbiBSTyBtb3VudHMKPiB3aXRob3V0IHRoZSBr
ZXkgYW5kIG5vdCBhbGxvd2luZyBSVyBtb3VudHMgaW4gdGhpcyBjYXNlPwoKWWVzLgoKPj4gMS4g
TWFrZXMgdGhlIGltcGxlbWVudGF0aW9uIHN1cGVyIHNpbXBsZS4KPj4gICAgSWYga2VlcF9vZmZs
aW5lX3NpZ25hdHVyZSBpcyBzZXQgYW5kIHJ3IG1vdW50IHJlcXVlc3RlZCwgcmVqZWN0Lgo+PiAg
ICBSVyByZW1vdW50IGNhbiByZWplY3RlZCB2ZXJ5IGVhc2lseSwgc3RvcmUga2VlcF9vZmZsaW5l
X3NpZ25hdHVyZSBpbiB0aGUgdWJpZnMKPj4gICAgY29udGV4dC4KPj4gCj4+IDIuIElmIHRoZSBz
dXBlciBibG9jayBnb3QgYWxyZWFkeSByZS13cml0dGVuLCByZWplY3QuCj4+ICAgIFlvdSBjYW4g
Y2hlY2sgc3ViLT5obWFjW10gZm9yIGJlaW5nIG5vbi16ZXJvLgo+PiAgICBUaGF0IHdheSB3ZSBj
YW4gZ2l2ZSB0aGUgdXNlciBhIGRlY2VudCBlcnJvciBtZXNzYWdlIGluIGNhc2UgdGhleSBkbyBz
dHVwaWQKPj4gICAgdGhpbmdzLgo+IAo+IHJlLXdyaXR0ZW4gYXMgaW4gYSBwcmlvciBSVyBtb3Vu
dCB3aXRoIHRoZSBrZXk/CgpZZXMuCgo+PiAzLiBVc2Vyc3BhY2UgY2FuIHZlcmlmeSB3aGV0aGVy
IHRoZSBVQklGUyBmcyBpcyBwcmlzdGluZSBieSBjaGVja2luZwo+PiAgICBmb3IgdGhlIGtlZXBf
b2ZmbGluZV9zaWduYXR1cmUgbW91bnQgZmxhZyBpbiAvcHJvYy9zZWxmL21vdW50aW5mby4KPiAK
PiBDb3VsZCB0aGlzIGluZm9ybWF0aW9uIGJlIGR1YmlvdXMgaWYgdGhlIFVCSUZTIHdhcyBtb3Vu
dGVkIFJXIG9uY2UgKHdpdGgKPiB0aGUga2V5IGFyb3VuZCkgYW5kIHRoZW4gbW91bnRlZCBSTyxr
ZWVwX29mZmxpbmVfc2lnbmF0dXJlID8gU28geW91Cj4gd291bGQgaGF2ZSB0byBvbmx5IGFsbG93
IGtlZXBfb2ZmbGluZV9zaWduYXR1cmUgaWYgeW91ciBwb2ludCAoMikgaXMKPiB0cnVlPwoKTm8u
IEJlY2F1c2UgYXMgc29vbiB5b3UgbW91bnQgb25jZSBSVyB0aGUgc3VwZXIgYmxvY2sgaXMgcmUt
d3JpdHRlbiB3aXRoCnRoZSBwcm92aWRlZCBITUFDLiBZb3UgY2FuIGRldGVjdCB0aGlzIGFuZCBy
ZWZ1c2UgdGhlIG1vdW50IG9wdGlvbi4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
