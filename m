Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34522606A329
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EtBioNrJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEJ68jbk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fo4caegB8NbTPOOdzs8bB+s0CGfkiv02i8V3Oj3350g=; b=EtBioNrJaHjMUODvmysYSR4ulK
	8kNyAY+cl7EW7+ndOlji6ycYUKUFjoRBdwkbLFwjzkpTTsCBc908Kyj7qSH73BwFu45qlVhkKzDLr
	uU1GkV43/N8E5ZBF0jfxJ06b9klzF79qLfZQbvpI9kf2xinJSiyhFbKDzrwu/xKls31yVMNgElSfD
	ADEYSHIluYrOYgKO4GqS3lLpWNrwyetbLtIidq678fhUHEc7EZDtdWtkMX7Nk3Z/ozi7/l41wSpPp
	eaZDq8L6AENjnEBK+QXw5km3jvTts+5yqNtxgTcqGzsO5olmTj5z/9H8scQLljJWgUdi5gECjQ5Vi
	zIRmJLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBpa-00000009m00-2nBe;
	Wed, 25 Nov 2026 12:10:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBpW-00000009lzh-3wHN
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 12:10:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A60843DB0;
	Wed, 25 Nov 2026 12:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B055E1F000C0;
	Wed, 25 Nov 2026 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608629;
	bh=UR7B1RiIETxaeE4WWMQ+Dgjd4yUFfxOB9unpYUwB9BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZEJ68jbkVZtyFnYn++Y1wP6U7KHrsCDTe5j1MrGqjBdXyCqG3s/T77cu0z6NlTpmH
	 /NSjl274QzbVm/IB8MdAXGMhRqNFtH7qBwmHZCfQD0wEOMoDo62HV1QEKy1J8jKyG6
	 162kbLjcpzUjiC1HuMRQyV8rtDwJAE760erhktwfEvp9PsEfKhdn747UCyMdaD9Pfu
	 3yETP54TNy59sz935jRuPaFN6WrcGPNikf7Hp45WBH1WGZv1jnkH6fzhCuuoVuJxJL
	 mVitADPIZr71Gjmu1TB4cn9ibzvE5citvT3kQvsYss+olS4GzutK6B3rxgwLKn/lgb
	 KzaA8aP+ihasg==
Message-ID: <sashiko-outbox-233336@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
To: "Ping Li" <leeonion.muyu@gmail.com>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261125115108.4147741-4-leeonion.muyu@gmail.com>
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
 <20261125115108.4147741-1-leeonion.muyu@gmail.com>
 <20261125115108.4147741-4-leeonion.muyu@gmail.com>
Date: Wed, 25 Nov 2026 12:10:29 +0000
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiByODUy
OiB1bmNvbmRpdGlvbmFsIE5BTkRfVVNFU19ETUEgaW4KICByODUyX3JlZ2lzdGVyX25hbmRfZGV2
aWNlKCkKLS0KCmNvbW1pdCBiY2M2ODM3NTJjMDE4Y2YwMzhlYzk3MWM4ZWQxYTFmYmNhNDlkMzI1
CkF1dGhvcjogUGluZyBMaSA8bGVlb25pb24ubXV5dUBnbWFpbC5jb20+CgptdGQ6IHJhd25hbmQ6
IHI4NTI6IGRlY2xhcmUgTkFORF9VU0VTX0RNQQoKVGhpcyBjb21taXQgc2V0cyBOQU5EX1VTRVNf
RE1BIGFuZCBjaGlwLT5idWZfYWxpZ24gPSBSODUyX0RNQV9MRU4gaW4Kcjg1Ml9yZWdpc3Rlcl9u
YW5kX2RldmljZSgpIHNvIG5hbmRfYmFzZSBib3VuY2VzIG5vbi1saW5lYXIgYW5kIG1pc2FsaWdu
ZWQKYnVmZmVycyBiZWZvcmUgcjg1Ml9kb19kbWEoKSBtYXBzIHRoZW0gd2l0aCBkbWFfbWFwX3Np
bmdsZSgpLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jCj4gaW5kZXggOTJjNDdkMzUxYzI3OC4uYTY4ZjU4Yzgx
ZDZjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yODUyLmMKPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9yODUyLmMKPiBAQCAtNjQwLDYgKzY0MCw5IEBAIHN0YXRpYyBp
bnQgcjg1Ml9yZWdpc3Rlcl9uYW5kX2RldmljZShzdHJ1Y3Qgcjg1Ml9kZXZpY2UgKmRldikKPiAg
CWlmIChkZXYtPnJlYWRvbmx5KQo+ICAJCWRldi0+Y2hpcC0+b3B0aW9ucyB8PSBOQU5EX1JPTTsK
PiAgCj4gKwlkZXYtPmNoaXAtPm9wdGlvbnMgfD0gTkFORF9VU0VTX0RNQTsKPiArCWRldi0+Y2hp
cC0+YnVmX2FsaWduID0gUjg1Ml9ETUFfTEVOOwoKW1NldmVyaXR5OiBMb3ddClNob3VsZCBOQU5E
X1VTRVNfRE1BIGFuZCBjaGlwLT5idWZfYWxpZ24gYmUgZ2F0ZWQgb24gZGV2LT5kbWFfdXNhYmxl
PwoKcjg1Ml9kbWFfdGVzdCgpIHNldHMgZGV2LT5kbWFfdXNhYmxlID0gMCB3aGVuIHRoZSBjb250
cm9sbGVyIGxhY2tzIERNQQpzdXBwb3J0IG9yIHRoZSByODUyX2VuYWJsZV9kbWEgbW9kdWxlIHBh
cmFtZXRlciBpcyBkaXNhYmxlZCwgYW5kCnI4NTJfcmVhZF9idWYoKSBhbmQgcjg1Ml93cml0ZV9i
dWYoKSBvbmx5IGNhbGwgcjg1Ml9kb19kbWEoKSB3aGVuCmxlbiA9PSBSODUyX0RNQV9MRU4gJiYg
ZGV2LT5kbWFfdXNhYmxlLiAgU2V0dGluZyB0aGVzZSB1bmNvbmRpdGlvbmFsbHkKZm9yY2VzIG5h
bmRfYmFzZSB0byBib3VuY2Ugbm9uLWxpbmVhciBhbmQgbm9uLTUxMi1ieXRlLWFsaWduZWQgYnVm
ZmVycwp0aHJvdWdoIGNoaXAtPmRhdGFfYnVmIGV2ZW4gd2hlbiB0aGUgZHJpdmVyIG9wZXJhdGVz
IHB1cmVseSBpbiBQSU8gbW9kZS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMjUxMTUxMDguNDE0Nzc0MS0xLWxlZW9uaW9uLm11
eXVAZ21haWwuY29tP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
