Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F513C88E50
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOHNNjxNZkPF+Ktt6SN0+hIzGSX5Hb9oFswae4W1UzQ=; b=W4A/bBQxGmaw6U
	9bObe0J5wF0d7HncYCNDzRGxWUbnzT1uAdpyn8rrvoFbdylDaiffvgaCypDelVMJyFzWMOwQgVwKe
	Ssj/k/jMQWrPNnCYV9HT4rpFa5kh0Hi+nq+xqGtGu8MTLRo7BMVVx5D3BgAbbQsUjbfKTL+XUSMnS
	86ODCntOtHrHqoK9WrfWZ0MjtaxaABpQhdfo4zyLGwl7lUFzYdGWQEyuflAocORx/59kgRcaTXFkW
	W7O8VV6uBg8AZoH0k/idCDrRwHqHXF/13GknYlX0zan/lEYPTH30s7+1Uc6+nxN325hkO+yiUYtSC
	SgiizmN15vTy3tv1iKAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xJU-0000000GEZb-141C;
	Fri, 11 Sep 2026 09:12:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xJS-0000000GEZU-3kHz
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 09:12:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 253E360213;
	Fri, 11 Sep 2026 09:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383221F000FF;
	Fri, 11 Sep 2026 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117969;
	bh=HirL8e1DCCh13QCT80B26M8DkyqTvQzzFoROzZnoOrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZkXmTXpYaewG1OVQ7Q58YgJloq0+LssD8KDAz2TNrrX9JGjxIDZ9OFkdThtMQ/X/A
	 oezwYxP0OhrSNw0Ln534bUt9AdvGdNNiqaG1fTQ6kMsblzqMEqnq31wQlLYK4kIGPz
	 flO4x9kI14t5ypBwh0APDA17P7lGi9H0hPztCyL9IJ0phB1MSIYdi9ZMJ5LuJn/F1H
	 IFIbBObILoBBeeLvixUByuJ3Fpb6sGZmN2r/Eu1Zg/0Bq3F028zxi+T8HLsJCt2gEx
	 2GGgiIczm5QOQftzAlXFPpk2UfHR7LSoflCWiwiBnn1OHky59Utwzz3Ec6Ax+EFPS6
	 uJjsXYdfZ5wxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Jon Hunter" <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, "Steam
 Lin" <STLin2@winbond.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
Date: Fri, 11 Sep 2026 09:12:48 +0000
Message-Id: <20260911091249.383221F000FF@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBV
bmludGVuZGVkIFJlZ2lzdGVyIENvcnJ1cHRpb24gZm9yIEZsYXNoZXMgd2l0aCBgcWVfbWFza1sw
XWAgYW5kIGFuIEFjdGl2ZSBTUjIuCgpQcmUtZXhpc3RpbmcgaXNzdWVzOgotIFtIaWdoXSBzcGlf
bm9yX3dyaXRlX3NyMV9hbmRfc3IyX2FuZF9jaGVjaygpIHN0aWxsIGZhaWxzIHVuY29uZGl0aW9u
YWxseSBmb3IgZmxhc2hlcyB3aXRob3V0IFNSMiBpZiB0aGUgUUUgYml0IG5lZWRzIHRvIGJlIHNl
dC4KLS0KCmNvbW1pdCBmMmZkNTkyM2Q1YzMxMjFhNGM3NTEzODE2YjJiNGNlM2ZiN2UzYTQ4CkF1
dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCm10ZDogc3Bp
LW5vcjogRml4IHF1YWQtZW5hYmxlIGZvciBmbGFzaGVzIHdpdGggUUVSIGJpdCBpbiBTUjEKClRo
ZSBwYXRjaCBtb2RpZmllcyBzcGlfbm9yX2dlbmVyaWNfcXVhZF9lbmFibGUgdG8gb25seSByZWFk
IFNSMSB3aGVuCnFlX21hc2tbMF0gaXMgc2V0LiBUaGlzIGFpbXMgdG8gZml4IHByb2JlIGZhaWx1
cmVzIG9uIGZsYXNoZXMgbGFja2luZwphbiBTUjIuCgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC8xNzg4NzY3MTkyMzIuMzU0MzkwMi4xNDQ1MTYyNTAzNzY3NjQyMTI1
NC5iNC10eUBiNC9ULyNtNWJjNGJhNjc3NjQzNmYyODcwY2VkMGViNTc4OWQyMjkwMzdhZDg0MAoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwo+IGluZGV4IGUyYjZlZmFmZGQ4ZDAuLmFjOTA5ZGZiOTY1N2MgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwo+IEBAIC05ODUsNyArOTg1LDEwIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9n
ZW5lcmljX3F1YWRfZW5hYmxlKHN0cnVjdCBzcGlfbm9yICpub3IpCj4gIAlpZiAoIXFlX21hc2tb
MF0gJiYgIXFlX21hc2tbMV0pCj4gIAkJcmV0dXJuIDA7Cj4gIAo+IC0JcmV0ID0gc3BpX25vcl9y
ZWFkX3NyMV9hbmRfc3IyKG5vciwgc3IpOwo+ICsJaWYgKHFlX21hc2tbMF0pCj4gKwkJcmV0ID0g
c3BpX25vcl9yZWFkX3NyMShub3IsIHNyKTsKCltTZXZlcml0eTogSGlnaF0KSWYgcWVfbWFza1sw
XSBpcyBzZXQgYW5kIHRoZSBmbGFzaCBoYXMgYW4gYWN0aXZlIFNSMiwgZG9lcyB0aGlzIGxlYXZl
IHNyWzFdCnVucG9wdWxhdGVkIGFzIDB4MDAgd2l0aG91dCBlbnN1cmluZyB0aGUgZmxhc2ggYWN0
dWFsbHkgbGFja3MgYSB0d28tYnl0ZQp3cml0ZSBvcGNvZGU/CgpMYXRlciBpbiB0aGlzIGZ1bmN0
aW9uLCBpZiB0aGUgUUUgYml0IGlzIG5vdCBhbHJlYWR5IHNldCwgaXQgY2FsbHM6CgogICAgcmV0
dXJuIHNwaV9ub3Jfd3JpdGVfc3IxX2FuZF9zcjJfYW5kX2NoZWNrKG5vciwgc3IpOwoKVGhpcyB3
aWxsIGludm9rZSB0aGUgaGVscGVyIHdoaWNoIGV4ZWN1dGVzIHRoZSB0d28tYnl0ZSB3cml0ZV9z
cjFfYW5kX3NyMgpvcGNvZGUgaWYgc2V0LCB3cml0aW5nIHRoZSB1bnBvcHVsYXRlZCBzclsxXSAo
MHgwMCkgdG8gdGhlIGZsYXNoJ3MgU1IyL0NSLgpDYW4gdGhpcyBjb3JydXB0IHRoZSBmbGFzaCBz
dGF0ZSBhbmQgZmFpbCB0aGUgdmFsaWRhdGlvbiBjaGVjayBpZiB0aGUgc2Vjb25kCmJ5dGUgcmVh
ZHMgYmFjayBhcyBub24temVybz8KCj4gKwllbHNlCj4gKwkJcmV0ID0gc3BpX25vcl9yZWFkX3Ny
MV9hbmRfc3IyKG5vciwgc3IpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKCltT
ZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhp
cyBzdGlsbCBmYWlsIHVuY29uZGl0aW9uYWxseSBmb3IKZmxhc2hlcyB3aXRob3V0IFNSMiBpZiB0
aGUgUUUgYml0IG5lZWRzIHRvIGJlIHNldD8KCklmIHRoZSBRRSBiaXQgaXMgbm90IGFscmVhZHkg
c2V0LCBzcGlfbm9yX2dlbmVyaWNfcXVhZF9lbmFibGUoKSBwcm9jZWVkcyB0bwpjYWxsIHNwaV9u
b3Jfd3JpdGVfc3IxX2FuZF9zcjJfYW5kX2NoZWNrKCksIHdoaWNoIHJlYWRzIGJvdGggcmVnaXN0
ZXJzIGZvcgp2ZXJpZmljYXRpb246Cgpkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYzpzcGlfbm9y
X3dyaXRlX3NyMV9hbmRfc3IyX2FuZF9jaGVjaygpIHsKCS4uLgoJcmV0ID0gc3BpX25vcl9yZWFk
X3NyMV9hbmRfc3IyKG5vciwgdG1wKTsKCWlmIChyZXQpCgkJcmV0dXJuIHJldDsKCS4uLgp9CgpC
ZWNhdXNlIHJlYWRfc3IyIGlzIDAgZm9yIGZsYXNoZXMgbGFja2luZyBTUjIsIHNwaV9ub3JfcmVh
ZF9zcjIoKSByZXR1cm5zCi1FSU5WQUwuIERvZXNuJ3QgdGhpcyBtZWFuIHRoZSBnZW5lcmljIGhl
bHBlciBzdGlsbCBmYWlscyB3aXRoIC1FSU5WQUwgZHVyaW5nCnZlcmlmaWNhdGlvbj8KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5
MTEtcGVyc28tZml4LXNwaS1ub3ItcWUtbXhpYy12MS0xLWZkNmQ5MTQxNmEyYUBib290bGluLmNv
bT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
