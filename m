Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF963C88E7D
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 19:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=et/APILD5FYoICz0NA9p8vBzZj1HUtP2lAnzIBcRHBc=; b=NaSZ79hE9vkz4R
	ImyLn2RJyqj98TKjwB+GqsSzwa+BawBpJ6l+pqZ+5ZtHOaI71tG1X6PyN86MyBWs42kLpxJaoBWIQ
	ZNVlN5eHh8r8o9TwgcGsvSKJshprzH3gFSoiFuoro2NFKS75PrWFYGLc67ce3oOk/raJUygrfm7+e
	KmBKnoB0wYOvpDcPy1JaL2MyAS2rg3T061gqXlpd1RYxp+/Jce0sIo0ptEuTVBZg0+/1JIM4+eQNO
	zM3pLIIbYWPR+XpSH2q1GYWmw0kgI7QNmTCyJJhiYlS6skoV+P+/RaugHpfBiRDhqytsk2slrCCKQ
	W0DRFI36cYNzR65jimeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Z8t-00000007t3v-3cmM;
	Tue, 15 Sep 2026 19:48:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Z8s-00000007t3l-1mIU
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 19:48:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB9DC40568;
	Tue, 15 Sep 2026 19:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245E51F000FF;
	Tue, 15 Sep 2026 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789501713;
	bh=TZZHSnTPH2xbRY+C/0wr5szLzimCe4mAHjjDiV7zCkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bA84eQ8kNm2xFEDJHaAu4/0FsNfa2dIGw688NVxMv5ztnZWcMONlCDyXVd5iS0GQ3
	 YPU3JQfOebHH47I9SKmiJYpbxRe0e/+MT3rUKvTb79N1+JXX4/0kR5lSXxcNOeXPoa
	 mFZcx9vpcSnzoQ4m/ZkR96b1BYdf2P4eLvJe8W6A9yweadHnRQEyfI6jv82NXEaVXh
	 jR7u68ZVgELGIIt2dSp/Jfd3oppLD4kQWCQERpWYS+xt/kknGaS/HK/O4ceiKoIwr7
	 66mxhSF4j+qp5p/kEtuCjvX1sYIaZhwkoq6CmUfiTbwzjyNnz2LmLiKkIWquz9SsQv
	 wtobLZFeiH+wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
To: "Michael Walle" <mwalle@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Richard Weinberger" <richard@nod.at>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "HyeongJun An" <sammiee5311@gmail.com>, "Arnd Bergmann" <arnd@arndb.de>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>
In-Reply-To: <20260915194203.3511147-1-arnd@kernel.org>
References: <20260915194203.3511147-1-arnd@kernel.org>
Date: Tue, 15 Sep 2026 19:48:32 +0000
Message-Id: <20260915194833.245E51F000FF@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGktbm9y
OiBtaXhpbmcgZ290byBhbmQgc2NvcGUtYmFzZWQgY2xlYW51cCBpbiBzcGlfbm9yX3BhcnNlX3Nm
ZHAoKQotIFtMb3ddIG10ZDogc3BpLW5vcjogc3BsaXQgZGVmaW5pdGlvbiBhbmQgaW5pdGlhbGl6
YXRpb24gb2YgX19mcmVlKCkgdmFyaWFibGUKLS0KCmNvbW1pdCAxZjA0MGRjMTA5ZWY4YWE0Yjlm
YzFjODFiY2FhOGY2ZTZhNWEyN2MwCkF1dGhvcjogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KCm10ZDogc3BpLW5vcjogcmVkdWNlIHN0YWNrIHVzYWdlIGluIHNwaV9ub3JfcGFyc2Vfc2Zk
cCgpCgpUaGlzIGNvbW1pdCByZWR1Y2VzIHN0YWNrIHVzYWdlIGluIHNwaV9ub3JfcGFyc2Vfc2Zk
cCgpIGJ5IHJlcGxhY2luZyBhbgpvbi1zdGFjayBzdHJ1Y3Qgc3BpX25vcl9mbGFzaF9wYXJhbWV0
ZXIgdmFyaWFibGUgd2l0aCBhIGR5bmFtaWNhbGx5IGFsbG9jYXRlZApvbmUuIEl0IHV0aWxpemVz
IHRoZSBfX2ZyZWUoa2ZyZWUpIHNjb3BlLWJhc2VkIGNsZWFudXAgaGVscGVyIHRvIG1hbmFnZSB0
aGUKYWxsb2NhdGVkIG1lbW9yeS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
c2ZkcC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMKPiBpbmRleCA2NDFmMTdhZDUxYTA5
Li40NjY1NThlYTUyOGQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMKPiBAQCAtMTUyMSw3ICsxNTIxLDcg
QEAgaW50IHNwaV9ub3JfcGFyc2Vfc2ZkcChzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICB7Cj4gIAlj
b25zdCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyICpwYXJhbV9oZWFkZXIsICpiZnB0X2hl
YWRlcjsKPiAgCXN0cnVjdCBzZmRwX3BhcmFtZXRlcl9oZWFkZXIgKnBhcmFtX2hlYWRlcnMgPSBO
VUxMOwo+IC0Jc3RydWN0IHNwaV9ub3JfZmxhc2hfcGFyYW1ldGVyIHBhcmFtcywgcGFyYW1zMjsK
PiArCXN0cnVjdCBzcGlfbm9yX2ZsYXNoX3BhcmFtZXRlciBfX2ZyZWUoa2ZyZWUpICpwYXJhbXMg
PSBOVUxMOwoKW1NldmVyaXR5OiBMb3ddCkRvZXMgdGhpcyBzcGxpdCBkZWZpbml0aW9uIGFuZCBp
bml0aWFsaXphdGlvbiBvZiB0aGUgcGFyYW1zIHBvaW50ZXIgdmlvbGF0ZQp0aGUgY2xlYW51cCBz
dWJzeXN0ZW0gZ3VpZGVsaW5lcz8KClRoZSBndWlkZWxpbmVzIHJlY29tbWVuZCBkZWZpbmluZyBh
bmQgaW5pdGlhbGl6aW5nIHNjb3BlLWJhc2VkIGNsZWFudXAKdmFyaWFibGVzIGluIGEgc2luZ2xl
IHN0YXRlbWVudCAoc3VjaCBhcyBhdCB0aGUga21lbWR1cCBjYWxsIGJlbG93KSByYXRoZXIKdGhh
biBpbml0aWFsaXppbmcgdG8gTlVMTCBhdCB0aGUgdG9wIHdpdGggYXNzaWdubWVudCBsYXRlci4g
V2hpbGUgdGhpcwpzcGVjaWZpYyBjYXNlIG1pZ2h0IG5vdCB0cmlnZ2VyIGEgTElGTyBvcmRlcmlu
ZyBidWcgc2luY2UgdGhlcmUgYXJlIG5vCmd1YXJkKCkgbG9ja3MgcHJlc2VudCwgaXQgZG9lcyBi
eXBhc3MgdGhlIHN1YnN5c3RlbSByZWNvbW1lbmRhdGlvbiBkZXNpZ25lZAp0byBwcmV2ZW50IHRo
b3NlIG9yZGVyaW5nIG1pc3Rha2VzLgoKPiAgCXN0cnVjdCBzZmRwX2hlYWRlciBoZWFkZXI7Cj4g
IAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBub3ItPmRldjsKPiAgCXN0cnVjdCBzZmRwICpzZmRwOwo+
IEBAIC0xNTMzLDcgKzE1MzMsOSBAQCBpbnQgc3BpX25vcl9wYXJzZV9zZmRwKHN0cnVjdCBzcGlf
bm9yICpub3IpCj4gIAkgKiBHZXQgYSBiYWNrdXAgb2YgYWxsIHRoZSBwYXJhbWV0ZXIgdG8gcm9s
bCBiYWNrIHRvIGluIGNhc2Ugb2YgYW4KPiAgCSAqIGVycm9yLgo+ICAJICovCj4gLQltZW1jcHko
JnBhcmFtcywgbm9yLT5wYXJhbXMsIHNpemVvZihwYXJhbXMpKTsKPiArCXBhcmFtcyA9IGttZW1k
dXAobm9yLT5wYXJhbXMsIHNpemVvZigqcGFyYW1zKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIXBh
cmFtcykKPiArCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gIAkvKiBHZXQgdGhlIFNGRFAgaGVhZGVy
LiAqLwoKWyAuLi4gXQoKPiBAQCAtMTcxMiw3ICsxNzE2LDcgQEAgaW50IHNwaV9ub3JfcGFyc2Vf
c2ZkcChzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICBmcmVlX3BhcmFtX2hlYWRlcnM6Cj4gIAlrZnJl
ZShwYXJhbV9oZWFkZXJzKTsKPiAgCWlmIChlcnIpCj4gLQkJbWVtY3B5KG5vci0+cGFyYW1zLCAm
cGFyYW1zLCBzaXplb2YoKm5vci0+cGFyYW1zKSk7Cj4gKwkJbWVtY3B5KG5vci0+cGFyYW1zLCBw
YXJhbXMsIHNpemVvZigqbm9yLT5wYXJhbXMpKTsKPiAgCj4gIAlyZXR1cm4gZXJyOwo+ICB9Cgpb
U2V2ZXJpdHk6IE1lZGl1bV0KSXMgaXQgc2FmZSB0byBtaXggZ290by1iYXNlZCBlcnJvciBoYW5k
bGluZyB3aXRoIHNjb3BlLWJhc2VkIGNsZWFudXAgaW4KdGhpcyBmdW5jdGlvbj8KClRoZSBrZXJu
ZWwgY2xlYW51cCBzdWJzeXN0ZW0gZ3VpZGVsaW5lcyBkaWN0YXRlIHRoYXQgZ290by1iYXNlZCBl
cnJvcgpoYW5kbGluZyBhbmQgc2NvcGUtYmFzZWQgY2xlYW51cHMgc2hvdWxkIG5ldmVyIGJlIG1p
eGVkIGluIHRoZSBzYW1lCmZ1bmN0aW9uLiBSZXRhaW5pbmcgdGhlIGZyZWVfcGFyYW1faGVhZGVy
cyBnb3RvIGxhYmVsIGFuZCBvdGhlciBtYW51YWwKY2xlYW51cHMgaW4gc3BpX25vcl9wYXJzZV9z
ZmRwKCkgd2hpbGUgaW50cm9kdWNpbmcgX19mcmVlKGtmcmVlKSBmb3IgcGFyYW1zCnZpb2xhdGVz
IHRoZSAnYWxsLW9yLW5vdGhpbmcnIGNvbnZlcnNpb24gcnVsZSBhbmQgY2FuIGNyZWF0ZSBjb25m
dXNpbmcKb3duZXJzaGlwIHNlbWFudGljcy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTUxOTQyMDMuMzUxMTE0Ny0xLWFybmRA
a2VybmVsLm9yZz9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
