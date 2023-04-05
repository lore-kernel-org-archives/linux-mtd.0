Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EC0C76188
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Apr 2023 20:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DAtqgqePRjD5jhGoVVBaST/bA9SecgCph+nu9d64csk=; b=i/19TniBgzaCV2HFjVrGazaXzl
	ZEXfR/DYTX0cl3VXDgeWmVUcFUSFjGus8YnqH0q4a+bAs5JkHMBW1ofFln2rpcQGKUKFxF3D0Xr0F
	EZeR5PzGe/CahffnzLlNE0ptecq/sRx4+X3L3dg7o4SsUj4Dvb+JalcsCmEkYIl++qjtIn9ULJl1l
	XqmYu0GaSMpVLQydA+D+JRiPenOKccFUhjStdvtWU6NTbpMzsnUs3G6CfbWRCm4Pb4kqmqGMEfY5L
	zXfY/3n8JLJs7gBQkeVpSDOcC69EnmJrGXXTEKu+uGIns42zcmirf9/88ppXICjH5210w19GfHajX
	me0HqqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkA3F-005g5c-1v;
	Wed, 05 Apr 2023 20:48:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkA3B-005g4s-2C
	for linux-mtd@lists.infradead.org;
	Wed, 05 Apr 2023 20:48:15 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2001164551C7;
	Wed,  5 Apr 2023 22:48:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id glZd3BUeaffm; Wed,  5 Apr 2023 22:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 845CA64551C8;
	Wed,  5 Apr 2023 22:48:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LHzPPT6J0Dm5; Wed,  5 Apr 2023 22:48:09 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6781064551C7;
	Wed,  5 Apr 2023 22:48:09 +0200 (CEST)
Date: Wed, 5 Apr 2023 22:48:09 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, guoxuenan@huawei.com
Message-ID: <2092125501.19940.1680727689243.JavaMail.zimbra@nod.at>
In-Reply-To: <f55c0db7-ef93-86ae-c4f9-476515358787@huawei.com>
References: <20230403020402.2261218-1-wangzhaolong1@huawei.com> <f55c0db7-ef93-86ae-c4f9-476515358787@huawei.com>
Subject: Re: Two bug fix commit fixes in the ubi_resize_volume() were fixed
 by a patch in the mailing list
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Two bug fix commit fixes in the ubi_resize_volume() were fixed by a patch in the mailing list
Thread-Index: UGqAej9UYWx8ZCBMXhiOUkqECVPqLg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_134813_870873_E29A22BB 
X-CRM114-Status: GOOD (  12.91  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+PiAgICAgIEknZCBsaWtlIHRvIGtub3cgd2h5IHBhdGNo
WzFdIGRpZG4ndCBnZXQgaW50byB0aGUgbWFpbmxpbmUuCj4+Cj4+IFsxXSBodHRwOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvcGF0Y2gvMjAyMjAxMjQwMjQwNTYuMTk5
Njc2My0xLWd1b3h1ZW5hbkBodWF3ZWkuY29tLwoKU29ycnksIGl0IGZlbGwgdGhyb3VnaCB0aGUg
Y3JhY2tzLgoKPiBJIGZpbmQgdGhlcmUgd2VyZSB0aHJlZSBwcm9ibGVtcyBpbiB1YmlfcmVzaXpl
X3ZvbHVtZSgpOgo+IAo+IDEuIE1lbWxlYWsgIC0gZml4ZWQgYnkgMWU1OTFlYTA3MmRmICgidWJp
OiBGaXggdW5yZWZlcmVuY2VkIG9iamVjdAo+IHJlcG9ydGVkIGJ5IGttZW1sZWFrIGluIHViaV9y
ZXNpemVfdm9sdW1lKCkiKQoKQWdyZWVkLgoKPiAyLiBVQUYgaW4gZXJyb3IgaGFuZGxpbmcgcGF0
aCAgLSBmaXhlZCBieSA5YWYzMWQ2ZWMxYTQgKCJ1Ymk6IEZpeAo+IHVzZS1hZnRlci1mcmVlIHdo
ZW4gdm9sdW1lIHJlc2l6aW5nIGZhaWxlZCIpCgpBZ3JlZWQuCgo+IDMuIFVBRiBpbiBjb25jdXJy
ZW50IHNocmluZyB2b2x1bWUgYW5kIHdyaXRpbmcKPiBmYXN0bWFwKHZvbC0+cmVzZXJ2ZWRfcGVi
cyBpdGVyYXRpb24pICAtIGZpeGVkIGJ5IFsxXQo+IDQuIFBvdGVudGlvbmFsIGRhdGEgbG9zdCBp
biBmYWlsZWQgc2hyaW5raW5nKGZhaWxlZCBhZnRlciB1bm1hcHBpbmcKPiBsZWJzKSAgLSBtZW50
aW9uZWQgaW4gWzFdLCB3aGljaCBpcyBub3QgYSBiaWcgcHJvYmxlbSwgd2UgY2FuIGFkZCBzb21l
Cj4gY29tbWVudHMgdG8gZXhwbGFpbiBpdC4KPiA1LiBUb28gbWFueSBsZWJzIHVzZWQgaWYgZXhw
YW5kaW5nIHZvbHVtZSBmYWlsZWQgYWZ0ZXIgWzFdIGFwcGxpZWQ6Cj4gSWYgd2UgdXBkYXRlIHZv
bC0+cmVzZXJ2ZWRfcGVicyB0b2dldGhlciB3aXRoIHZvbC0+ZWJhX3RibCwgdGhlbiBvdGhlcgo+
IHdyaXRpbmcgcHJvY2VzcyBjb3VsZCB0YWtlIGxudW0gYmlnZ2VyIHRoYW4gb2xkIHZvbC0+cmVz
ZXJ2ZWRfcGVicy4KPiBUaGVyZSB3aWxsIGJlIHpvbWJpZSBsb2dpY2FsIHBlYnMobG51bSBncmVh
dGVyIHRoYW4gdm9sLT5yZXNlcnZlZF9wZWJzLAo+IGNvdWxkIG5vdCBiZSBhY2Nlc3NlZCBvciBy
ZWNsYWltZWQpIGlmIHJlc2l6aW5nIGZhaWxlZC4KPiBNYXliZSB3ZSBzaG91bGQgZml4IHRoYXQg
YnkgaG9sZGluZyAnbGViX3dyaXRlX2xvY2snIHdoaWxlIGV4cGFuZGluZyB2b2x1bWU/Cj4gNi4g
SW4gZXJyb3IgaGFuZGxpbmcgcGF0aCAnb3V0X2FjYycsIFVCSSBzaG91bGQgcmVjb3ZlciAndWJp
LT5yc3ZkX3BlYnMnCj4gYW5kICd1YmktPmF2YWlsX3BlYnMnIGluICdwZWJzID4gMCcgY2FzZSwg
b3RoZXJ3aXNlIFVCSSB3aWxsIGRpc3BsYXkKPiB3cm9uZyBhdmFpbGFibGUgcGViIGNvdW50Lgo+
IAo+IFJpY2hhcmQsIEhvdyBkbyB5b3UgdGhpbms/CgpJIGFncmVlLCB3ZSBzaG91bGQgYXBwbHkg
dGhpcyBwYXRjaC4gR3VvIFh1ZW5hbiwgY2FuIHlvdSBwbGVhc2UgcmViYXNlIHlvdXIgcGF0Y2gK
b24gdGhlIGxhdGVzdCBrZXJuZWwgYW5kIHJlc2VuZD8Kdm10LmMgc2F3IHNvbWUgY2hhbmdlcyBh
bmQgdGhlIHBhdGNoIGRvZXMgbm90IGxvbmdlciBhcHBseS4KClRoYW5rcywKLy9yaWNoYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
