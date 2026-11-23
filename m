Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E3606A31E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 06:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ysTMDdLj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jL3LxH8B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+lU+OMV5vsxU8zIxiRs0ZUpHT2soIFOTfgMSQhX81RI=; b=ysTMDdLjnh+sF9hrdpz4Dv1XMD
	JojJOvB8BAjKjkHL4vJ/xMJ0sczhnn5TvwrWvy2aN/A8Jeo0vkgJoyDumZSH8YdET5JkkZ7JqRhXO
	mwQQP3OEpAcf5YnkvhDcVn9XQsWnUQB0K4ygICgAZ5KglncU8Qj6PbRnLXX6qNbGmWoAlJPfR/L8d
	S18OdQ8Vwka5NLSvWlTDh1f6qywvQgYmjMqARIlsOuWGH8BfkouO8JN0I2XyPaxC8FK97vvXP3Lo+
	0qqjSwttgH5mVPfqusIBTas50df+ysugeKrKkZPieC8vROKGn0Ffj3nC7dFl/v+V18/9JKR2XtBh0
	Fj6rADuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN7Q-00000002Lut-2rY5;
	Mon, 23 Nov 2026 06:01:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVN7N-00000002LuO-0FnM
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 06:01:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FE6C43A86;
	Mon, 23 Nov 2026 06:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5251F000C4;
	Mon, 23 Nov 2026 06:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795413692;
	bh=7YRmru7uandsCEEkshW9NgHqUyLvcgJBTEW9Yksy6do=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jL3LxH8BQ/bib3PnLbw652AUWKnZ2wAiKp/+WvlxthFIrpeEEfns9Kh8SAt9ME4Sn
	 0fomG2qo58Ayfi/kmYW0OvLMf4RxrRHuKY7Y9wcoIT+1QD1JuajMiFvTzeEOFwWXb7
	 QnD1HxtkppW+KgFqyKlzW/M1MJ3zCJkiUxowdKJ40IHrEDUl+zMvDr4ElmdkkQk126
	 njzsL6XWEtW/n8J5JeKoA3Ymf07oe7u1Y4D5EQWvXdmw94+npUvflOiYhzVBq8OQJH
	 tqppExzxsmzrvrfKvFGcHyB1TPeVCgYXNZtpCEEeEqNqxOHql4t/enoOvfuz7n17m4
	 tOC+P7FepUvQQ==
Message-ID: <sashiko-outbox-228749@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: intel: declare NAND_USES_DMA
To: ping.li <leeonion.muyu@gmail.com>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261123055020.1995251-3-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
 <20261123055020.1995251-3-ping.li@horizon.auto>
Date: Mon, 23 Nov 2026 06:01:31 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiBpbnRl
bDogRml4ZXMgdGFnIGNpdGVzIG10ZGNoYXIgaW5zdGVhZCBvZiBkcml2ZXIKICBjb21taXQKSXQg
YWxzbyBub3RpY2VkIDEgcmVsYXRlZCBwcmUtZXhpc3RpbmcgaXNzdWUgdGhpcyBwYXRjaCBkb2Vz
IG5vdAppbnRyb2R1Y2U6Ci0gW0NyaXRpY2FsXSBtdGQ6IHJhd25hbmQ6IGludGVsOiBETUEgbWFw
cGluZyBsZWFrIGFuZCBpbnZhbGlkIHVubWFwIGluCiAgZWJ1X2RtYV9zdGFydCgpIFsxXQotLQoK
Y29tbWl0IDQxNDQzMmZhOWQzMDdmYTVlM2FlOGVjZjM1ZDc4NjhmYzdiNDE0NjcKQXV0aG9yOiBQ
aW5nIExpIDxsZWVvbmlvbi5tdXl1QGdtYWlsLmNvbT4KCj4gbXRkOiByYXduYW5kOiBpbnRlbDog
ZGVjbGFyZSBOQU5EX1VTRVNfRE1BCj4gCj4gZWJ1X25hbmRfcmVhZF9wYWdlX2h3ZWNjKCkvZWJ1
X25hbmRfd3JpdGVfcGFnZV9od2VjYygpIGZlZWQgdGhlCj4gcGFnZSBidWZmZXJzIHByb3ZpZGVk
IGJ5IHRoZSBOQU5EIGNvcmUgc3RyYWlnaHQgdG8gdGhlIERNQQo+IGVuZ2luZSwgYnV0IHRoZSBk
cml2ZXIgbmV2ZXIgZGVjbGFyZXMgTkFORF9VU0VTX0RNQS4gIEJlY2F1c2Ugb2YKPiB0aGlzLCBu
YW5kX2Jhc2UgY2Fubm90IGtub3cgdGhlIGNvbnRyb2xsZXIgRE1BcyB0aGVzZSBidWZmZXJzIGFu
ZAo+IG5ldmVyIGJvdW5jZXMgbm9uLWxpbmVhci1tYXAgb25lcyAoc2VlIHRoZSB1c2VfYm91bmNl
X2J1ZiBsb2dpYwo+IGluIG5hbmRfZG9fcmVhZF9vcHMoKS9uYW5kX2RvX3dyaXRlX29wcygpKS4K
PiAKPiBTaW5jZSB0aGUgbXRkY2hhciBNRU1SRUFEL01FTVdSSVRFIGlvY3RscyBhbGxvY2F0ZSB0
aGVpciBidWZmZXJzCj4gd2l0aCBrdm1hbGxvYygpLCBhIGhlYXZpbHkgZnJhZ21lbnRlZCBzeXN0
ZW0gY2FuIGFscmVhZHkgZmVlZCBhCj4gdm1hbGxvYydkIGJ1ZmZlciBpbnRvIHRoZSBjb250cm9s
bGVyJ3MgRE1BIGVuZ2luZSwgd2hpY2ggaXMgbm90IGEKPiB2YWxpZCBkbWFfbWFwX3NpbmdsZSgp
IGlucHV0Lgo+IAo+IERlY2xhcmUgTkFORF9VU0VTX0RNQSBzbyB0aGF0IG5hbmRfYmFzZSBib3Vu
Y2VzIG5vbi1saW5lYXItbWFwCj4gYnVmZmVycyB0aHJvdWdoIGNoaXAtPmRhdGFfYnVmLCBhcyB0
aGUgb3RoZXIgRE1BLWNhcGFibGUKPiBjb250cm9sbGVycyBhbHJlYWR5IGRvLgo+IAo+IEZpeGVz
OiA4MzIwOGUxMDZhOGU4ICgibXRkY2hhcjogdXNlIGt2bWFsbG9jKCkgZm9yIHBvdGVudGlhbGx5
IGxhcmdlIGFsbG9jYXRpb25zIikKPiBTaWduZWQtb2ZmLWJ5OiBQaW5nIExpIDxsZWVvbmlvbi5t
dXl1QGdtYWlsLmNvbT4KCltTZXZlcml0eTogTG93XQpTaG91bGQgdGhlIEZpeGVzOiB0YWcgcG9p
bnQgdG8gMGIxMDM5ZjAxNmU4ICgibXRkOiByYXduYW5kOiBBZGQgTkFORApjb250cm9sbGVyIHN1
cHBvcnQgb24gSW50ZWwgTEdNIFNvQyIpIGluc3RlYWQ/ICBVcHBlciBNVEQgbGF5ZXJzIHN1Y2gg
YXMKVUJJLCBKRkZTMiwgYW5kIG10ZGJsb2NrIGFscmVhZHkgcGFzcyB2bWFsbG9jKCkgYnVmZmVy
cyB0byBtdGRfcmVhZCgpIGFuZAptdGRfd3JpdGUoKSwgc28gdGhlIG1pc3NpbmcgTkFORF9VU0VT
X0RNQSBmbGFnIGhhcyBiZWVuIGFuIGlzc3VlIHNpbmNlIHRoZQpkcml2ZXIgd2FzIGludHJvZHVj
ZWQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNvbnRy
b2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jCj4g
aW5kZXggY2ZiNGIyMzFlMDY3Mi4uMWY0OTNmYjQyNmQ2MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNvbnRyb2xsZXIuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jCj4gQEAgLTY4OCw2ICs2ODgsNyBAQCBz
dGF0aWMgaW50IGVidV9uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IAluYW5kID0gJmVidV9ob3N0LT5jaGlwOwo+ICAJbmFuZC0+Y29udHJvbGxlciA9ICZlYnVfaG9z
dC0+Y29udHJvbGxlcjsKPiAgCW5hbmQtPmNvbnRyb2xsZXItPm9wcyA9ICZlYnVfbmFuZF9jb250
cm9sbGVyX29wczsKPiArCW5hbmQtPm9wdGlvbnMgfD0gTkFORF9VU0VTX0RNQTsKPiAgCj4gIAkv
KiBTY2FuIHRvIGZpbmQgZXhpc3RlbmNlIG9mIHRoZSBkZXZpY2UgKi8KPiAgCXJldCA9IG5hbmRf
c2NhbigmZWJ1X2hvc3QtPmNoaXAsIDEpOwoKW1NldmVyaXR5OiBDcml0aWNhbF0KVGhpcyBwcm9i
bGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIGVidV9kbWFfc3Rh
cnQoKQpsZWFrIGJ1Zl9kbWEgb24gdGhlIHN1Y2Nlc3MgcGF0aCBhbmQgdW5tYXAgdGhlIHdyb25n
IGRldmljZSBvbiBlcnJvcgpbMV0/Cgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNv
bnRyb2xsZXIuYzplYnVfZG1hX3N0YXJ0KCkgewoJLi4uCglkbWFfZGV2ID0gZG1hZW5naW5lX2dl
dF9kbWFfZGV2aWNlKGNoYW4pOwoJYnVmX2RtYSA9IGRtYV9tYXBfc2luZ2xlKGRtYV9kZXYsICh2
b2lkICopYnVmLCBsZW4sIGRpcik7CglpZiAoZG1hX21hcHBpbmdfZXJyb3IoZG1hX2RldiwgYnVm
X2RtYSkpIHsKCQlkZXZfZXJyKGVidV9ob3N0LT5kZXYsICJGYWlsZWQgdG8gbWFwIERNQSBidWZm
ZXJcbiIpOwoJCXJldCA9IC1FSU87CgkJZ290byBlcnJfdW5tYXA7Cgl9CgkuLi4KCXJldHVybiAw
OwoKZXJyX3VubWFwOgoJZG1hX3VubWFwX3NpbmdsZShlYnVfaG9zdC0+ZGV2LCBidWZfZG1hLCBs
ZW4sIGRpcik7CgoJcmV0dXJuIHJldDsKfQoKT24gdGhlIHN1Y2Nlc3MgcGF0aCwgYnVmX2RtYSBp
cyBuZXZlciB1bm1hcHBlZCBhZnRlciB0aGUgdHJhbnNmZXIKY29tcGxldGVzLCBsZWFraW5nIElP
TU1VIG1hcHBpbmdzIGFuZCBza2lwcGluZyBjYWNoZSBpbnZhbGlkYXRpb25zIG9uCm5vbi1jb2hl
cmVudCBhcmNoaXRlY3R1cmVzLiAgQWxzbywgd2hlbiBkbWFfbWFwX3NpbmdsZSgpIGZhaWxzLCBq
dW1waW5nIHRvCmVycl91bm1hcCB1bm1hcHMgYW4gaW52YWxpZCBETUEgYWRkcmVzcywgYW5kIGVy
cl91bm1hcCBwYXNzZXMKZWJ1X2hvc3QtPmRldiBpbnN0ZWFkIG9mIGRtYV9kZXYuCgpbMV0gaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC1mN2ZkODk3OS1jYTMxLTQ4MWMtYjc5YS0yNTNm
ODIyNTk5MGIKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjExMjMwNTUwMjAuMTk5NTI1MS0xLXBpbmcubGlAaG9yaXpvbi5hdXRvP3Bh
cnQ9MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
