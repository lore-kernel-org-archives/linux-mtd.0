Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC15CC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsqin5DGh/lidT2YjuzAq25klosdHyZ/IAX30OVr3EA=; b=wlBjEzxZlc4ixJ
	n2pu+9V6HZYSF1cwnwuqD9MXy2t7jq67lxx/+Sl8eiF+seEyhWmh62aekcdti9elcxxBfpWNxedKP
	NpzHufaWyHUNDtPoyBwkIsbFNc2MjkpDL15YDW0LLJiMdxHVIo3kDyTCd+HVUBS9E3c9PZ0z8g8T2
	mY3jWeIVFd2/X9+Uk0WnjYInVRHAiXLPfrR5vVbsL/qWLyXmP4oJhP91WOSjtdguZtbyiprAt62fQ
	tWNTeGX3s9mu07l1pGYSj2F9WYgXJXsH90p2q3NEPYC6PTyx8ZPxTE5USOtmGaa15iPtm0WXYzmJm
	gx6gfZzJ4XutJmSHgpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHbZ-0000000HEnq-3pz0;
	Thu, 15 Oct 2026 09:18:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHbY-0000000HEnA-2fgZ
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 09:18:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C856A601F0;
	Thu, 15 Oct 2026 09:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093EA1F000C4;
	Thu, 15 Oct 2026 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792055907;
	bh=FHX1B+PwNcksy8AccQt0af7pULhCorT/H3LjQu/dxpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ld3ynPsSj0MFTWVD5z0Kxxtd4HCtQld7rJ34yXswjhUWJiN0lBEAgkxz2lYzbZOqH
	 oQRcBCLyWEWLHY7OslJ9qxx6ssavsJ+RjEaZmUtaY2ceisW56wMtM1rSGA7MifdMcd
	 YzEDswAgzUpfh0iFnSjbiaSHz+gxzPGgorxuUR/3gc5tdEXU3RdlL5x1MUme6TZgU0
	 uvzNGVOG+6oqdC+VrC2266olsd/fHtYCPEGmn7xk+FoBddEXSDjrOBhXeRF1jHONlT
	 qcndF0Y8oPwCzRGdpBxXnju+k2vMlWJz+Ub2OV3kEj5UypPZuW2yXtBp1nq2eFg+9E
	 ojy5L/+wLrXiQ==
Message-ID: <sashiko-outbox-172559@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spi-nor: sfdp: reduce stack usage in
 spi_nor_parse_sfdp()
To: "Michael Walle" <mwalle@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "David Laight" <david.laight.linux@gmail.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261015090516.924703-1-mwalle@kernel.org>
References: <20261015090516.924703-1-mwalle@kernel.org>
Date: Thu, 15 Oct 2026 09:18:26 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gY2xlYW51cDogbWl4
aW5nIGdvdG8tYmFzZWQgY2xlYW51cCBhbmQgX19mcmVlKCkgaW4gc3BpX25vcl9wYXJzZV9zZmRw
KCkKLS0KCmNvbW1pdCA0ODdjMzI0ODgwZjkxMzY5NDE5MmFiNTQ1OTE0NzJjYmI1YmIyMmMwCkF1
dGhvcjogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+CgptdGQ6IHNwaS1ub3I6IHNm
ZHA6IHJlZHVjZSBzdGFjayB1c2FnZSBpbiBzcGlfbm9yX3BhcnNlX3NmZHAoKQoKVGhpcyBjb21t
aXQgYWxsb2NhdGVzIHRoZSByb2xsYmFjayBjb3BpZXMgb2Ygc3BpX25vcl9mbGFzaF9wYXJhbWV0
ZXIKc3RydWN0dXJlcyBvbiB0aGUgaGVhcCB0byByZWR1Y2Ugc3RhY2sgdXNhZ2UgaW4gc3BpX25v
cl9wYXJzZV9zZmRwKCkuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAu
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4gaW5kZXggYmViMGY1YzY2MjEyYy4uZTMw
Y2RiNWIxOGVkZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4gQEAgLTE1MzUsOSArMTUzNSw5IEBAIGlu
dCBzcGlfbm9yX2NoZWNrX3NmZHBfc2lnbmF0dXJlKHN0cnVjdCBzcGlfbm9yICpub3IpCj4gICAq
Lwo+ICBpbnQgc3BpX25vcl9wYXJzZV9zZmRwKHN0cnVjdCBzcGlfbm9yICpub3IpCj4gIHsKPiAr
CXN0cnVjdCBzcGlfbm9yX2ZsYXNoX3BhcmFtZXRlciAqc2F2ZV9wYXJhbXMgX19mcmVlKGtmcmVl
KSA9IGttYWxsb2Nfb2Jqcygqc2F2ZV9wYXJhbXMsIDIpOwo+ICAJY29uc3Qgc3RydWN0IHNmZHBf
cGFyYW1ldGVyX2hlYWRlciAqcGFyYW1faGVhZGVyLCAqYmZwdF9oZWFkZXI7CgpbIC4uLiBdCgo+
IEBAIC0xNzI0LDcgKzE3MjYsNyBAQCBpbnQgc3BpX25vcl9wYXJzZV9zZmRwKHN0cnVjdCBzcGlf
bm9yICpub3IpCj4gIGZyZWVfcGFyYW1faGVhZGVyczoKPiAgCWtmcmVlKHBhcmFtX2hlYWRlcnMp
Owo+ICAJaWYgKGVycikKPiAtCQltZW1jcHkobm9yLT5wYXJhbXMsICZwYXJhbXMsIHNpemVvZigq
bm9yLT5wYXJhbXMpKTsKPiArCQkqbm9yLT5wYXJhbXMgPSBzYXZlX3BhcmFtc1swXTsKPiAgCj4g
IAlyZXR1cm4gZXJyOwo+ICB9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KSXMgaXQgc2FmZSB0byBtaXgg
c2NvcGUtYmFzZWQgY2xlYW51cCB3aXRoIGdvdG8gbGFiZWxzIGluIHRoaXMgZnVuY3Rpb24/CgpU
aGUgcGF0Y2ggaW50cm9kdWNlcyBhIHNjb3BlLWJhc2VkIGNsZWFudXAgaGVscGVyIF9fZnJlZShr
ZnJlZSkgZm9yCnNhdmVfcGFyYW1zLCBidXQgbGVhdmVzIG11bHRpcGxlIGV4aXN0aW5nIGdvdG8g
ZXJyb3IgbGFiZWxzIChzdWNoIGFzCmZyZWVfcGFyYW1faGVhZGVycywgZnJlZV9zZmRwLCBhbmQg
ZnJlZV9kd29yZHMpIHVudG91Y2hlZCBpbgpzcGlfbm9yX3BhcnNlX3NmZHAoKS4KClRoZSBjbGVh
bnVwIHN1YnN5c3RlbSBndWlkZWxpbmVzIHN0YXRlIHRoYXQgdGhlIGV4cGVjdGF0aW9uIGlzIHRo
YXQgdXNhZ2Ugb2YKZ290byBhbmQgY2xlYW51cCBoZWxwZXJzIGlzIG5ldmVyIG1peGVkIGluIHRo
ZSBzYW1lIGZ1bmN0aW9uLiAKCkNvdWxkIHRoaXMgbGVhZCB0byBjb25mdXNpbmcgb3duZXJzaGlw
IHNlbWFudGljcywgYW5kIHNob3VsZCBhbGwgcmVzb3VyY2VzIGluCnRoaXMgcm91dGluZSBiZSBj
b252ZXJ0ZWQgdG8gc2NvcGUtYmFzZWQgY2xlYW51cCAob3Igbm9uZSBvZiB0aGVtKT8KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEw
MTUwOTA1MTYuOTI0NzAzLTEtbXdhbGxlQGtlcm5lbC5vcmc/cGFydD0xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
