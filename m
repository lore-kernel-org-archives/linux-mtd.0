Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D989C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:31:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4947120880
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:31:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KsaYoJYf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4947120880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqLSuRrobUPKqPb0k5KWKntgb8xi09XmYQ5QGG997aM=; b=KsaYoJYfApXya7
	9RGB3wqeG97+QfSYG3xRL+ArdTatYygbBPst0kNnPojXnvDEk6eE4lH1LJa8lxjAvbCgGiZVZwv8h
	Emlu0BiFE2OEBJPBgEcAYtYQaHEpIxQBnFiZZr0ErtSc3UOEuj5JPQ3Wu3ChTK5QS7UFhVpmphqKq
	vKFG+1EYPTZ5gtlzQoSHfEMYlI1BCXDyTuYgQBKhT1zwDlh7wP5wknfasGpF1jrUoSIEWH32kxXQw
	+mTvTfLpeV9/KF8UgQka3VGgPn4o3tVoLxgtlnfK8adVt53iqNoagbB/tKKrD75qFlHQLWnkJQuBw
	zlt7bhthVwEJnnSl99mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAytz-0003M5-Tr; Mon, 01 Apr 2019 15:31:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAytp-00037R-FP
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 15:31:09 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2B8D7281FCB;
 Mon,  1 Apr 2019 16:30:59 +0100 (BST)
Date: Mon, 1 Apr 2019 17:30:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: vf610: Fix to check for NULL pointer
 dereference
Message-ID: <20190401173056.17604b54@collabora.com>
In-Reply-To: <20190401172651.158c05fe@xps13>
References: <20190318232434.9246-1-pakki001@umn.edu>
 <20190401172651.158c05fe@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_083102_285597_B4B34897 
X-CRM114-Status: GOOD (  19.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Aditya Pakki <pakki001@umn.edu>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxIEFwciAyMDE5IDE3OjI2OjUxICswMjAwCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBBZGl0eWEsCj4gCj4gQWRpdHlhIFBha2tp
IDxwYWtraTAwMUB1bW4uZWR1PiB3cm90ZSBvbiBNb24sIDE4IE1hciAyMDE5IDE4OjI0OjM0Cj4g
LTA1MDA6Cj4gCj4gPiBvZl9tYXRjaF9kZXZpY2UgY2FuIHJldHVybiBOVUxMIGlmIHRoZXJlIGlz
IG5vIG1hdGNoaW5nIGRldmljZSBpcyBmb3VuZC4KPiA+IFRoZSBwYXRjaCBhdm9pZHMgYSBwb3Rl
bnRpYWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGJ5IGNoZWNraW5nIGZvciB0aGUKPiA+IHJl
dHVybiB2YWx1ZSBhbmQgcGFzc2luZyB0aGUgZXJyb3IgdXBzdHJlYW0uCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IEFkaXR5YSBQYWtraSA8cGFra2kwMDFAdW1uLmVkdT4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3ZmNjEwX25mYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMKPiA+IGlu
ZGV4IGE2NjJjYTE5NzBlNS4uOTQ2YWJiYjI3NWMzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Zm
NjEwX25mYy5jCj4gPiBAQCAtODUwLDYgKzg1MCw4IEBAIHN0YXRpYyBpbnQgdmY2MTBfbmZjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgCX0KPiA+ICAKPiA+ICAJb2Zf
aWQgPSBvZl9tYXRjaF9kZXZpY2UodmY2MTBfbmZjX2R0X2lkcywgJnBkZXYtPmRldik7Cj4gPiAr
CWlmICghb2ZfaWQpCj4gPiArCQlyZXR1cm4gLUVOT0RFVjsKCkZvciB0aGUgcmVjb3JkLCB0aGlz
IGNhbid0IGhhcHBlbiB1bmxlc3MgeW91IGhhdmUgc2VyaW91cyBtZW1vcnkKY29ycnVwdGlvbiBp
c3N1ZXMgc2luY2UgeW91IHJlYWNoZWQgdGhlIC0+cHJvYmUoKSBmdW5jdGlvbiAod2hpY2ggbWVh
bnMKYSBtYXRjaCB3YXMgZm91bmQgYmVmb3JlKS4KCj4gPiAgCW5mYy0+dmFyaWFudCA9IChlbnVt
IHZmNjEwX25mY192YXJpYW50KW9mX2lkLT5kYXRhOwo+ID4gIAo+ID4gIAlmb3JfZWFjaF9hdmFp
bGFibGVfY2hpbGRfb2Zfbm9kZShuZmMtPmRldi0+b2Zfbm9kZSwgY2hpbGQpIHsgIAo+IAo+IAo+
IEFwcGxpZWQgdG8gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L210ZC9saW51eC5naXQKPiBvbiBuYW5kL25leHQgd2l0aCB0aGUgdGl0bGUgY2hhbmdlZCB0bwo+
IAo+ICAgICAgICAgbXRkOiByYXduYW5kOiB2ZjYxMDogQXZvaWQgYSBwb3RlbnRpYWwgTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlCj4gCj4gYW5kIGEgc3BhY2UgYWZ0ZXIgdGhlIHJldHVybiBzdGF0
ZW1lbnQuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
