Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0729CC6B1F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrCDorIdwKojXLEUv2T33kbwP9dtC2Y+byulAfLJH0w=; b=qAnfHLU88vj7kN
	/5w6ZwNNYotBitO79qlfkMpnQ3gWim4L2zVbhssiHkAaIzm8cDPjUUCjtGiBxNBHXykudkshs7toL
	9KtzlDrBH9GImBPaMe9oU6uxNHYf5cFIgNkv3Gg57Jlf2MKVF5hgCKAQEGhtchSAE8Bsnukbrb7tT
	VZA+eVD9sjFTYZ7QLwwdv4ddFYv1lMhuMc0lKJXcE1t05AzkFQgNCuv4XRf3OWWiKU0efKdZXW7hG
	Y080tRpz0Uz4rmyuWUY4xVUX4oHlQ6n8G1kBFnOpCIO8/FA0KXlRWIOSSxpFOmfJx6pPeEk0Ug071
	1981GvuRffFJ94Y6Vrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvCl-0000000F18u-3D8e;
	Wed, 14 Oct 2026 09:23:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvCj-0000000F18d-0Bi6
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PJo/30EMwUOBpVKCcQN/QLtqzn1mD7FXBRIoJHgrYK4=; b=IGlFg7/Pd2ZrsDGZKCmMRkpEZ2
	qt6E5Zh/l/ugYk/c6l248ks6nLFEqdh0i7zffICAbfiwpHO9xXDbzUvCEaVpf22CGklgDxjuO16WY
	CRmjwe5FQoV6yMctsftDY3y09my6mJggCOz+z3EGYWMAqFS/G60LLUcgyXe68vImb17JHXgF4x7lN
	7rRDASvGFRjdO7z+punQ8JHlEcq7y6cWQrn2ou5svGRsab51kwceE9SVmGsUEIxEBY7czhC6hqV0e
	Fik8nblqQepRhpb3yew0wof1LvHfIfFdTv7XFpFII1huEfAEqHrllBmKwzvZ7tEpQ3cwRTjjP8whI
	bvR1SEbA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvCf-0000000GYTd-3zSF
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 09:23:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D8241A1220;
	Wed, 14 Oct 2026 09:23:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD90360368;
	Wed, 14 Oct 2026 09:23:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E694610328A40;
	Wed, 14 Oct 2026 11:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791969795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PJo/30EMwUOBpVKCcQN/QLtqzn1mD7FXBRIoJHgrYK4=;
	b=qlOlzr0Hnljz8yjOgBjceryUsyXl3Gh0Z6EeQ0ORJaJj0bXQEe2Yqrp9w7XqxbrtFvxCOG
	babnMjVN4omvmbk35kN/7BNIr1YZwt5VzqGjXOF4HlVlMZ/Pr9Vv2W8vNJ7EmSM4q4lNt3
	ikXxNNm22HhGK3hJIKj6yNFh/ooknQoo3n+fs+EPkF6hPFOccdBl14lNW41ZB43f1UbIwn
	ee+uAoBaG4fBUWDmRc4uLwemCG3UrKKT401+crTwRuNsSRYuKunAHQ+1XbOwHtki40pk5R
	O7vr4iUaXwu8wCQk9ew2kXyXfL3TLOR7H80D47I1WdP9VEnSNknBx8L4uQzz2g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Kees Cook <kees@kernel.org>,  Manuel Lauss
 <manuel.lauss@googlemail.com>,  Artem Bityutskiy <dedekind1@gmail.com>,
  linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] MTD: nand: Fix release_mem_region() size
In-Reply-To: <20261014082258.33315-2-fourier.thomas@gmail.com> (Thomas
	Fourier's message of "Wed, 14 Oct 2026 10:22:51 +0200")
References: <20261014082258.33315-2-fourier.thomas@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 11:23:13 +0200
Message-ID: <87jynky6ta.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_102318_152106_F90A3C22 
X-CRM114-Status: UNSURE (   9.01  )
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

SGkgVGhvbWFzLAoKPiBJbiBhdTE1NTBuZF9wcm9iZSgpLCByZXF1ZXN0X21lbV9yZWdpb24oKSBp
cyBjYWxsZWQgd2l0aCBzaXplCj4gcmVzb3VyY2Vfc2l6ZShyKSwgYW5kIHJlbGVhc2VfbWVtX3Jl
Z2lvbigpIGlzIGNhbGxlZCBpbiB0aGUgZXJyb3IgcGF0aAo+IHdpdGggdGhlIHNhbWUgc2l6ZS4g
SG93ZXZlLCBpbiB0aGUgY2xlYW51cCBmdW5jdGlvbiBhdTE1NTBuZF9yZW1vdmUoKQo+IGNhbGxz
IHJlbGVhc2VfbWVtX3JlZ2lvbigpIHdpdGggc2l6ZSAweDEwMDAuCj4KPiBDaGFuZ2UgcmVsZWFz
ZSBzaXplIHRvIG1hdGNoIHJlcXVlc3QuCj4KPiBGaXhlczogYjY3YTFhMDJkNDYzICgiTVREOiBu
YW5kOiBtYWtlIGF1MTU1MG5kLmMgYSBwbGF0Zm9ybV9kcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6
IFRob21hcyBGb3VyaWVyIDxmb3VyaWVyLnRob21hc0BnbWFpbC5jb20+Cj4gLS0tCgpUaGlzIGRy
aXZlciBpcyB2ZXJ5IG9sZC4gSWYgeW91IGNhcmUgYWJvdXQgY2xlYW5pbmcgaXQgdXAsIEkgd291
bGQKc3VnZ2VzdCBkb2luZyBzb21ldGhpbmcgYmlnZ2VyLiBGb3IgaW5zdGFuY2UgcGxhdGZvcm1f
Z2V0X3Jlc291cmNlLApyZXF1ZXN0X21lbV9yZWdpb24gYW5kIGlvcmVtYXAgYXJlIG5vdyBhIHNp
bmdsZSBoZWxwZXIgbmFtZWQKZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkuIFRoZSBr
emFsbG9jIGNvdWxkIGFsc28gYmVjb21lIGRldmljZQptYW5hZ2VkLiBUaGlzIHdpbGwgZnVydGhl
ciByZWR1Y2UgdGhlIHNpemUgb2YgdGhlIGVycm9yIHBhdGggYW5kIHRoZQpyZW1vdmFsLgoKVGhl
IHN1YmplY3QgcHJlZml4IGJ0dyBzaG91bGQgYmUgdXBkYXRlZCB0byBtYXRjaCB0b2RheSdzIHN0
YW5kYXJkcyAoc2VlCmdpdCBsb2cgLS1vbmVsaW5lIC0tIGRyaXZlcnMvbXRkL25hbmQvcmF3Lyku
CgpEbyB5b3Ugb3duIHRoZSBoYXJkd2FyZT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
