Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E70CA9EC1
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 17:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hy2+mhHVwQ51fFZeuox7FLefQ4siufSZjc8zKewFsso=; b=JHML+XO1o2fqkm
	kXbKBDQgPZt7leIamVHW+1S3FI4lRsqP6OmcaePWRXmLWu5jT5DDSa6PesY6aSVG3Gi1IBT+Fbcv7
	73r5ZCyh6LkRk3r1RU+NdDKIhVguUoYed+GSvXbHUmvIMeDuyONM0UtYj4yep9Tqp50CVs2eEdUJt
	UgjzaF1lAgp5p26uXmqdZ3KXL2ckAz6hdpdOCNqEbm4XwebIa3vxh9RdTPB67tUoxPPOz2JiqGM0F
	tybBSXwX27P0L7fEwMYkHqZLjJdH5tnQLWS048JOGekceYnagFTFQ+bYPMF0dG3RpdZ58lpySzNdm
	uB38gpI9TdW4pjxTJedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFava-00000008Kmy-18uC;
	Sat, 10 Oct 2026 17:32:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFavY-00000008Kmn-0tmW
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 17:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86083602C5;
	Sat, 10 Oct 2026 17:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402E51F000FF;
	Sat, 10 Oct 2026 17:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791653526;
	bh=IUWT7DJ5VKwNdScNJZ8XESSRx4a5ok3hMOTtULGo01c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aPjwLqH7egSTzP1IkBPDk2TlfLdFTZdgB55PDKqpN1nkbztn5M6kEUVZXb3nKloLg
	 jxL61pFl8oKn7Mn8Hb0wMIKmhmRs4hj21xUkGNSh7/e+Z24AS0lBcv/RkePkZaPCTO
	 i6uT7shFGhXDdWrhrPceSx857jgMV0Tk1k1XZfAvP9dJUm3eIKuuiXZx9XIwBD9aIf
	 5C/g92ER491xKjr5V6rF65IBatxFdEio7Yce4jCr9EMtWzVoUbDdv2qngluQrq9MMM
	 eO2tl0hr6LmbXlroecDhljh6eT6GsRvzlX543jP7mKq+GzdRbyWZpIOgTncJTVr0p/
	 hfBKLbw4XrN8w==
Message-ID: <sashiko-outbox-166778@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] MIPS: Octeon: flash: use the simple map accessors
 without a shared eMMC
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, "Orgad
 Shaneh" <orgads@gmail.com>, tsbogend@alpha.franken.de
Cc: dwmw2@infradead.org, ulli.kroll@googlemail.com, corbet@lwn.net, kaloz@openwrt.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linusw@kernel.org, nico@fluxnic.net, linux-mtd@lists.infradead.org, linux-mips@vger.kernel.org, john@phrozen.org
In-Reply-To: <20261010172142.2138956-4-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010172142.2138956-4-orgads@gmail.com>
Date: Sat, 10 Oct 2026 17:32:04 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG1pcHM6IGNhdml1bS1v
Y3Rlb246IGdsb2JhbCBzdGF0ZSBjb3JydXB0aW9uIG9uIG11bHRpcGxlIGZsYXNoIHByb2Jlcwot
LQoKY29tbWl0IDllMjQyZWM0MTYyZDljN2MwNmJkMTBkOThmMmJiZmIzMjg2OWQxNTAKQXV0aG9y
OiBPcmdhZCBTaGFuZWggPG9yZ2Fkc0BnbWFpbC5jb20+CgpNSVBTOiBPY3Rlb246IGZsYXNoOiB1
c2UgdGhlIHNpbXBsZSBtYXAgYWNjZXNzb3JzIHdpdGhvdXQgYSBzaGFyZWQgZU1NQwoKVGhpcyBw
YXRjaCB1cGRhdGVzIHRoZSBDYXZpdW0gT2N0ZW9uIGZsYXNoIHNldHVwIHRvIHVzZSBzaW1wbGUg
bWFwIGFjY2Vzc29ycwp3aGVuIHRoZXJlIGlzIG5vIHNoYXJlZCBlTU1DIGhvc3Qgb24gdGhlIGJv
b3QgYnVzLiBJdCBhbHNvIGNoYW5nZXMgdGhlIGZsYXNoCmJhbmsgd2lkdGggY2hlY2sgdG8gZmFp
bCBhbmQgdW5tYXAgdGhlIG1lbW9yeSBpZiB1bnN1cHBvcnRlZCwgcmF0aGVyIHRoYW4KanVzdCB3
YXJuaW5nLgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vZmxhc2hfc2V0
dXAuYyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL2ZsYXNoX3NldHVwLmMKPiBpbmRleCAzMzk1
YWNkZTRkNjBhLi4yOGZiZTNkMTVjOTU2IDEwMDY0NAo+IC0tLSBhL2FyY2gvbWlwcy9jYXZpdW0t
b2N0ZW9uL2ZsYXNoX3NldHVwLmMKPiArKysgYi9hcmNoL21pcHMvY2F2aXVtLW9jdGVvbi9mbGFz
aF9zZXR1cC5jClsgLi4uIF0KPiBAQCAtMTAyLDExICsxMTMsMjYgQEAgc3RhdGljIGludCBvY3Rl
b25fZmxhc2hfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlmbGFzaF9t
YXAudmlydCA9IGlvcmVtYXAoZmxhc2hfbWFwLnBoeXMsIGZsYXNoX21hcC5zaXplKTsKPiAgCQlw
cl9ub3RpY2UoIkJvb3RidXMgZmxhc2g6IFNldHRpbmcgZmxhc2ggZm9yICVsdU1CIGZsYXNoIGF0
ICIKPiAgCQkJICAiMHglMDhsbHhcbiIsIGZsYXNoX21hcC5zaXplID4+IDIwLCBmbGFzaF9tYXAu
cGh5cyk7Cj4gLQkJV0FSTl9PTighbWFwX2Jhbmt3aWR0aF9zdXBwb3J0ZWQoZmxhc2hfbWFwLmJh
bmt3aWR0aCkpOwo+IC0JCWZsYXNoX21hcC5yZWFkID0gb2N0ZW9uX2ZsYXNoX21hcF9yZWFkOwo+
IC0JCWZsYXNoX21hcC53cml0ZSA9IG9jdGVvbl9mbGFzaF9tYXBfd3JpdGU7Cj4gLQkJZmxhc2hf
bWFwLmNvcHlfZnJvbSA9IG9jdGVvbl9mbGFzaF9tYXBfY29weV9mcm9tOwo+IC0JCWZsYXNoX21h
cC5jb3B5X3RvID0gb2N0ZW9uX2ZsYXNoX21hcF9jb3B5X3RvOwo+ICsJCWlmICghbWFwX2Jhbmt3
aWR0aF9zdXBwb3J0ZWQoZmxhc2hfbWFwLmJhbmt3aWR0aCkpIHsKPiArCQkJcHJfZXJyKCJVbnN1
cHBvcnRlZCBmbGFzaCBiYW5rIHdpZHRoICVkXG4iLAo+ICsJCQkgICAgICAgZmxhc2hfbWFwLmJh
bmt3aWR0aCk7Cj4gKwkJCWlvdW5tYXAoZmxhc2hfbWFwLnZpcnQpOwo+ICsJCQlyZXR1cm4gLUVJ
TlZBTDsKPiArCQl9CgpbU2V2ZXJpdHk6IEhpZ2hdClNpbmNlIGZsYXNoX21hcCBpcyBhIHN0YXRp
YyBnbG9iYWwgc3RydWN0dXJlLCB3aGF0IGhhcHBlbnMgaWYgdGhlcmUgYXJlCm11bHRpcGxlIGZs
YXNoIGRldmljZXMgcHJvYmVkIHNlcXVlbnRpYWxseT8KClRoZSBsaW5lIGp1c3QgYWJvdmUgdGhp
cyBibG9jayB1bmNvbmRpdGlvbmFsbHkgb3ZlcndyaXRlcyBmbGFzaF9tYXAudmlydAp3aXRoIGEg
bmV3IGlvcmVtYXAoKSBvbiBlYWNoIHByb2JlLCB3aGljaCBhcHBlYXJzIHRvIGxlYWsgdGhlIHBy
ZXZpb3VzCm1hcHBpbmcgYW5kIGNvcnJ1cHQgdGhlIHN0YXRlIG9mIGFueSBhbHJlYWR5LXJlZ2lz
dGVyZWQgTVREIGRldmljZS4KCklmIG9jdGVvbl9mbGFzaF9wcm9iZSgpIGV4ZWN1dGVzIGEgc2Vj
b25kIHRpbWUgYW5kIGZhaWxzIHRoZSBiYW5rIHdpZHRoIGNoZWNrCmhlcmUsIGl0IGNhbGxzIGlv
dW5tYXAoZmxhc2hfbWFwLnZpcnQpIGFuZCByZXR1cm5zIGFuIGVycm9yLiBEb2VzIHRoaXMgdW5t
YXAKb3BlcmF0aW9uIHR1cm4gdGhlIGZpcnN0IHN1Y2Nlc3NmdWxseSBwcm9iZWQgTVREIGRldmlj
ZSdzIHNoYXJlZCByZWZlcmVuY2UKaW50byBhIGRhbmdsaW5nIHBvaW50ZXIsIGxlYWRpbmcgdG8g
YW4gaW52YWxpZCBtZW1vcnkgYWNjZXNzIHdoZW4gdGhlIGZpcnN0CmRldmljZSBpcyBhY2Nlc3Nl
ZD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjEwMTAxNzIxNDIuMjEzODk1Ni0xLW9yZ2Fkc0BnbWFpbC5jb20/cGFydD0zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
