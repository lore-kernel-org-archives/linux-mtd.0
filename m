Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E829C19F2A
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Aug 2022 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnQHWEQA7TZ3ux0o7ALuoK6iNZDYGCAc/pSzYvPE1+Y=; b=2oVIA3+4ysrA6q
	yB7ok+rF7K1WYfUBiej/MsUdrgVeghthEOR2FHjL1dwmAkl7J0/QPVsVXDAC2Q6RPjUINM6LLQFzD
	t+W9HKYnMlAsYdHlA4APlGp669OZkQErXFNy9yN6me8G9RgXIFdBsO6XHj/75MUjyoiQCzQ+ZZvWJ
	86sWGG+qwhIjFiDqG1tagn9903Ex1L/Mf+ExI3Dmmm15Lasp2bLBrq4ElWSulNbD+JYXXN+ekdMvC
	3O/W/C8kYLQ065+gwcDlp+qMHc1z6TdNVG4jqaEYGDkP2YNpzqlO1HwsiHfdxqqWoKBXpZSZT+Kmr
	2fVxJM3w8DX8k0dGj0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKh1l-00DNnV-0T; Sun, 07 Aug 2022 14:13:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKh1h-00DNle-P2
	for linux-mtd@lists.infradead.org; Sun, 07 Aug 2022 14:13:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C8103B80CC5;
	Sun,  7 Aug 2022 14:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB51C433C1;
	Sun,  7 Aug 2022 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659881584;
	bh=blAT4AcwR9FCI1UfBvvX9+DzAmqX0Bxhrura869j/C8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=YRUKlBiB8WmwONtyG3xj92O2zRq98zmaTPaljgMRYarvCcKPKi6s8TCxtPYIgm0hZ
	 YdRhtBLmLGd6CyWkUBMUK2tUTMBQGAaj7OHjSWhHaQ0NUQNji1qktNU36zUDMUkvPH
	 Gazc2l8TcsEElEr5VUvg7qvwf1rvUxZNjrQaSZyh7332Ea0PA0mcP9U1i1tNniOG6r
	 63kgWNnfpsgF21Kzzvl3/r85ab/xIeF2Fp2+1Vh7Enk5ZsQ+rDGCQ+Op95Zj9T5mbD
	 +Fjq4AK8FMFXUzCgJQprr6PP+TWECc4ibtSNWz/PIPMEhM55tNNa+gVqyhm4KUXLAF
	 6/6DMn3aVyjHw==
Received: by pali.im (Postfix)
	id E767B97B; Sun,  7 Aug 2022 16:13:00 +0200 (CEST)
Date: Sun, 7 Aug 2022 16:13:00 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Scott Wood <oss@buserror.net>, u-boot@lists.denx.de,
	linux-mtd@lists.infradead.org
Subject: Re: Have fsl_elbc_nand controllers subpage write support?
Message-ID: <20220807141300.tatzjlsjyhcxgegs@pali>
References: <20220807120027.2zz43afbqtqljhul@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220807120027.2zz43afbqtqljhul@pali>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_071309_981587_794DDBFD 
X-CRM114-Status: GOOD (  15.38  )
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

T24gU3VuZGF5IDA3IEF1Z3VzdCAyMDIyIDE0OjAwOjI3IFBhbGkgUm9ow6FyIHdyb3RlOgo+IEhl
bGxvIFNjb3R0IQo+IAo+IEluIHBhc3QgeW91IGRpc2FibGVkIG5hbmQgc3VicGFnZSB3cml0ZSBz
dXBwb3J0IGZvciBmcmVlc2NhbGUgZUxCQyBhbmQKPiBJRkMgVS1Cb290IG5hbmQgZHJpdmVycyBp
biBmb2xsb3dpbmcgcGF0Y2g6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIwMTIx
MTAyMjM0NDMyLkdBMTgxMjlAYnVzZXJyb3IubmV0Lwo+IAo+IEJ1dCBpbiBMaW51eCBrZXJuZWwg
eW91IGRpc2FibGVkIGl0IG9ubHkgaW4gZnJlZXNjYWxlIElGQyBuYW5kIGRyaXZlcjoKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAxMzA0MTAyMjM0MzcuR0EyNjkwMEBob21l
LmJ1c2Vycm9yLm5ldC8KPiAKPiBsZXR0aW5nIGtlcm5lbCdzIGZyZWVzY2FsZSBlTEJDIGRyaXZl
ciB0byBoYXZlIGVuYWJsZWQgc3VicGFnZSB3cml0ZQo+IHN1cHBvcnQuCj4gCj4gSSB3b3VsZCBs
aWtlIHRvIGFzaywgaGFzIGZyZWVzY2FsZSBlTEJDIG5hbmQgY29udHJvbGxlciBzdXBwb3J0IGZv
cgo+IHN1YnBhZ2Ugd3JpdGVzPyBPciBub3QgYW5kIGl0IHNob3VsZCBiZSBkaXNhYmxlZCBhbHNv
IGluIGtlcm5lbD8KPiAKPiBPciBoYXMgc29tZWJvZHkgZWxzZSB0aGVzZSBkZXRhaWxzPwoKTm93
IEkgZm91bmQgZm9sbG93aW5nIGNvbW1pdCBodHRwOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMv
Yy9mMDM0ZDg3ZGVmNTEKd2hpY2ggc2VlbXMgdG8gYmUgZml4aW5nL2VtdWxhdGluZyBzdWJwYWdl
IHdyaXRlIHN1cHBvcnQuCgo+IFRoZSBtYWluIGlzc3VlIGlzIHRoYXQgVS1Cb290IG5hbmQgYW5k
IFVCSSBzdXBwb3J0IGZvciBib2FyZHMgd2l0aCBlTEJDCj4gY29udHJvbGxlcnMgaXMgY29tcGF0
aWJsZSB3aXRoIExpbnV4IGtlcm5lbCBuYW5kIGFuZCBVQkkgc3VwcG9ydCBiZWNhdXNlCj4gdGhl
c2UgdHdvIGRyaXZlcnMgY2FsY3VsYXRlIFVCSSBnZW9tZXRyeSBkaWZmZXJlbnRseS4gVUJJIGhl
YWRlciBvZmZzZXQKPiBpcyBjYWxjdWxhdGVkIGZyb20gbmFuZCBzdWJwYWdlIHNpemUgYW5kIG5h
bmQgc3VicGFnZSBzaXplIG9idmlvdXNseQo+IGRlcGVuZHMgb24gdGhlIGZhY3QgaWYgc3VicGFn
ZSB3cml0ZSBpcyBzdXBwb3J0ZWQgb3Igbm90Lgo+IAo+IEkgd291bGQgbGlrZSB0byBmaXggdGhp
cyBpc3N1ZSwgYnV0IEkgZG8gbm90IGtub3cgaWYgd3JvbmcgaW5mb3JtYXRpb24KPiBpcyBpbiBV
LUJvb3QgZHJpdmVyIG9yIGluIExpbnV4IGtlcm5lbCBkcml2ZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
