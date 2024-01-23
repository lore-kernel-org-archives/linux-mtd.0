Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FF0C47DDF
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 03:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Av2kQ0G57ol4LP/hPSOLnKJvOyXfH1TsrZ68LkU1TBc=; b=NUbIWr/qLTJD7L
	y4GN/9UoiAlvU2GoJTJ6ztUgq+ORRuGNdrvJDog9MFn20PQo7zFIQJjNGFz2U4FFai/HSxW8rEuy9
	I7sgDSFwSasOFIHCjN3LyMELed0iDMziiYC4H2IKE3JVr8Ih+Nz2Axpkz79MxxzHZhNEvNmTkdfnq
	oJ/Uj03pZ44tzRSSlcym5ebSsYdpLvuCzrEgC7SLzrFWtiPBI+R+hPDq3a3GwLdf//Jai55m7lcC4
	3vHu5f6xP1jrLM8wN2xhsunzdXzToLgil3gn6s1D/XOWHqC+96X95+2OT9TRVIRrujBXP0b++p8sE
	FK4whP8AYAW4C6kKvcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS782-00EyJU-26;
	Tue, 23 Jan 2024 03:07:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS780-00EyJK-2g
	for linux-mtd@bombadil.infradead.org;
	Tue, 23 Jan 2024 03:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ic2nATbiXm9R2IlwSXguUmjj0oo6dL5Rd0kMzvsHELI=; b=gkFbV7F0CjrC/pSZz3wqim+O4U
	LuVH0INss0/RQunBAMrTIHIcVQhjJcFWHtXWX3rUxfG+zZQyyf/c9GN9PCLQQw6lb287u2qTbHyi5
	5BrPwczz80eQEkmGbXPnI+YPMfcdEgpPcfVXYCTHBK+VheVEsi45LQWcNl9R1a6wsR/ESA2BbrcUd
	RL9zFvhBEzLiqzJLGtV6za8WGx+Gx9nZQIaelwwjOoal7Gzpuip9L4+jp8zYmePgy6Kj94Lj/Z6h9
	hJ6wnirHRW3b1GG1l80f2Y/HVM0Qh/SMhd2no/t9/sAj/JQW77KQZVb2bMekVO6acHfEwj0hd5FCB
	AiRnXvQQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rS77t-00000001zIr-0xBL;
	Tue, 23 Jan 2024 03:07:01 +0000
Date: Tue, 23 Jan 2024 03:07:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 08/15] ubifs: Convert ubifs_write_begin() to use a folio
Message-ID: <Za8tVQv_V0084b-C@casper.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-9-willy@infradead.org>
 <0f015efd-4142-764c-24b3-e413f5e16d4c@huawei.com>
 <Za5-_9hwEdPhI-or@casper.infradead.org>
 <1df263aa-99bc-81d2-305e-f5c7a6cc690c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1df263aa-99bc-81d2-305e-f5c7a6cc690c@huawei.com>
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

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMTA6MTU6NTBBTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzEvMjIgMjI6NDMsIE1hdHRoZXcgV2lsY294IOWGmemBkzoKPiA+IE9u
IE1vbiwgSmFuIDIyLCAyMDI0IGF0IDA3OjUxOjAzUE0gKzA4MDAsIFpoaWhhbyBDaGVuZyB3cm90
ZToKPiA+ID4gV2h5IG5vdCBsZW4gPT0gZm9saW9fc2l6ZShmb2xpbyk/IEFsdGhvdWdoICdsZW4g
Pj0gZm9saW9fc2l6ZShmb2xpbyknIGlzIG5vdAo+ID4gPiB3cm9uZy4KPiA+IAo+ID4gVGhpcyBp
cyBiYXNlZCBvbiBteSBleHBlcmllbmNlIHdpdGggaW9tYXAuICBUb2RheSwgdGhlIGNhbGxlciBw
YXNzZXMgaW4KPiA+IG1pbihsZW5ndGgtb2Ytd3JpdGUsIFBBR0VfU0laRSkuICBJbiBvcmRlciB0
byBiZSBhYmxlIHRvIGNyZWF0ZSBsYXJnZQo+ID4gZm9saW9zIGluIHRoZSB3cml0ZSBwYXRoLCB3
ZSB3YW50IHRvIGNoYW5nZSB0aGUgY2FsbGVyIG9mIHdyaXRlX2JlZ2luCj4gPiB0byBwYXNzIGlu
IHRoZSBsZW5ndGggb2YgdGhlIHdyaXRlLCBzbyB3ZSBjYW4gc2VlIGEgbGVuIHdoaWNoIGlzIGxh
cmdlcgo+ID4gdGhhbiB0aGUgc2l6ZSBvZiB0aGUgZm9saW8gd2UgZm91bmQuCj4gCj4gSSBndWVz
cyB5b3UgYXJlIHByZXBhcmluZyBmb3IgYWRkaW5nIGxhcmdlIGZvbGlvIHN1cHBvcnQgZm9yCj4g
Z2VuZXJpY19wZXJmb3JtX3dyaXRlIHBhdGgsIG1heSBJIGhhdmUgYSBsb29rIGZvciB0aGUgZGVt
byBjb2RlPyBJJ20gYQoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZnNkZXZlbC8yMDI0
MDExMTE5MjUxMy4zNTA1NzY5LTEtd2lsbHlAaW5mcmFkZWFkLm9yZy8KKG5vdyB3aXRoZHJhd24g
YmVjYXVzZSBpdCBicmVha3MgZXh0NCkKCj4gbGl0dGxlIGNvbmZ1c2VkIGZvciB0aGlzIHdvcmRz
ICJ3ZSB3YW50IHRvIGNoYW5nZSB0aGUgY2FsbGVyIG9mIHdyaXRlX2JlZ2luCj4gdG8gcGFzcyBp
biB0aGUgbGVuZ3RoIG9mIHRoZSB3cml0ZSIuIEFjY29yZGluZyB0byB0aGUgaW1wbGVtZW50YXRp
b24gb2YKPiBpb21hcF93cml0ZV9pdGVyKCksIEkgZmluZCB0aGUgd3JpdGUgbGVuZ3RoIGluIGVh
Y2ggaXRlcmF0aW9uIGlzCj4gbWluKHdyaXRlX2J5dGVzLCBmb2xpb19zaXplKSwgc28gSSBndWVz
cyB0aGUgd3JpdGUgbGVuZ3RoIHBhc3NlZCBpbgo+IHViaWZzX3dyaXRlX2JlZ2luIHdvbid0IGV4
Y2VlZCBmb2xpb19zaXplLgoKQnV0IHRoYXQgaGFwcGVucyBhZnRlciB3cml0ZV9iZWdpbiwgYmVj
YXVzZSB3ZSBkb24ndCBrbm93IHdoYXQgdGhlIGZvbGlvCnNpemUgd2lsbCBiZSB1bnRpbCB3ZSd2
ZSBjYWxsZWQgd3JpdGVfYmVnaW4uCgppZSB3ZSBjYWxsIHdyaXRlX2JlZ2luLCBwYXNzaW5nIGlu
IHRoZSBzaXplIHJlbWFpbmluZyBmcm9tIHRoZSB3cml0ZS4KSWYgd3JpdGVfYmVnaW4gZmluZHMg
YW4gZXhpc3RpbmcgZm9saW8gaW4gdGhlIHBhZ2UgY2FjaGUsIHdlIHVzZSBpdC4KSWYgbm90LCB3
ZSBhbGxvY2F0ZSBhIGZvbGlvIGJhc2VkIG9uIHRoZSBzaXplIG9mIHRoZSB3cml0ZS4gIEFmdGVy
CndyaXRlX2JlZ2luIHJldHVybnMgYSBmb2xpbywgd2UgbGltaXQgdGhlIG51bWJlciBvZiBieXRl
cyBjb3BpZWQgdG8gdGhlCnNpemUgb2YgdGhlIGZvbGlvLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
