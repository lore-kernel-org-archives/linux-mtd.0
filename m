Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD153606A31C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iCLBOmqd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0V7gPDs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qqywxG04RWmSmAQWA09eZWR6X6Ro8Fw4l/9S/hKmelg=; b=iCLBOmqdoKk/HkFWHJC3V/fRer
	QP58MkTFs0Kcnqx5EfcfkcTWcdwjZgZGEso+y3XBnKXTdsxlvba0Xtp0TO5aiMrNPwVsWUgCnIfuZ
	hAuztvTYRuEdZcf2p1ot3wo96Wuwrw6RJ2g9uvmF+isJlvsOD5tOp3r+rT2USIhURVvJhmCdrs6No
	i1StagoESMKDd7whXyFP1MDh0qtMXAAQOIM/j8VEHLPrBNsGVmcj/+XvFCptV+OAAeUkUclKttScS
	QdjVAYeAOgYm4Z0j/oA11ke8j2c/arFpPCP2BRRpeCsQie+oBCJ3kh7NCrZgKHbs/niyE9hK2vuWZ
	MGgmHxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVcX-00000001buk-0ejU;
	Mon, 09 Nov 2026 20:05:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVcU-00000001buP-1XEb
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 20:05:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAF42411DF;
	Mon,  9 Nov 2026 20:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761FE1F0089F;
	Mon,  9 Nov 2026 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254733;
	bh=QcrhMYp+lBaWawSsPUi3Yreo39wvJjAKjAaBIcpC634=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m0V7gPDsb8L5KLbg3WJ8VDfw1/4e2LaBg3lT3aKN7O6ntaje08+U4cQFsIFbhR0t4
	 oWpKqLHxmTN/FFHVIqk6FrXKwZIKU3hmGt9mLIjI30lRZ3l/CC3Kb1Sbdw+6+lPJ0F
	 kbvu22w1+y0TZ9T1sbIGIQWihs9UZnpuaqxyLwUl/J+m1o/A9n+Gf6MvGWQue+0fXs
	 l7jAJmstEkqyewt5PHw7KstqRdC68mwX4aWBSC57df6187Ionz7YumPRp+Gk9w5jRB
	 07xdmbzt82RjzJEaGbJ8KhU4l2KERN9ZJVv8JCH4yvz0ISUMo4KNZUixpnrTcyvxS3
	 KE+cVbmJ3vM4g==
Message-ID: <sashiko-outbox-205535@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: fix GPIO descriptor leak in
 rawnand_dt_parse_gpio_cs()
To: "Zhao Feng" <zhaofeng2@cmss.chinamobile.com>, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, michal.simek@amd.com
In-Reply-To: <20261109052724.1032-2-zhaofeng2@cmss.chinamobile.com>
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
 <20261109052724.1032-2-zhaofeng2@cmss.chinamobile.com>
Date: Mon, 09 Nov 2026 20:05:33 +0000
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
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbTWVkaXVtXSBtdGQ6IHJhd25h
bmQ6IGFyYXNhbjogR1BJTyBkZXNjcmlwdG9yIGxlYWsgaW4gYW5mY19wcm9iZSgpCiAgYW5kIGFu
ZmNfcGFyc2VfY3MoKSBbMV0KLS0KCmNvbW1pdCAxNWYzNTg5YTFkMmE3OTBmMTg4NWViNWJiNDI4
Njk0YjUxODk4ZmQzCkF1dGhvcjogWmhhbyBGZW5nIDx6aGFvZmVuZzJAY21zcy5jaGluYW1vYmls
ZS5jb20+CgptdGQ6IHJhd25hbmQ6IGZpeCBHUElPIGRlc2NyaXB0b3IgbGVhayBpbiByYXduYW5k
X2R0X3BhcnNlX2dwaW9fY3MoKQoKVGhpcyBjb21taXQgcmVsZWFzZXMgcHJldmlvdXNseSBhY3F1
aXJlZCBHUElPIGRlc2NyaXB0b3JzIHdpdGggZ3Bpb2RfcHV0KCkKaWYgZ3Bpb2RfZ2V0X2luZGV4
X29wdGlvbmFsKCkgZmFpbHMgZHVyaW5nIHRoZSBsb29wIGluCnJhd25hbmRfZHRfcGFyc2VfZ3Bp
b19jcygpLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4IGE1YjI3OGFiOTM4NGYu
LmZhOTIzZWY5NjI2MmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9i
YXNlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IEBAIC01NDY2
LDcgKzU0NjYsNyBAQCBpbnQgcmF3bmFuZF9kdF9wYXJzZV9ncGlvX2NzKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGdwaW9fZGVzYyAqKipjc19hcnJheSwKPiAgCQkJICAgICB1bnNpZ25lZCBp
bnQgKm5jc19hcnJheSkKPiAgewo+ICAJc3RydWN0IGdwaW9fZGVzYyAqKmRlc2NzOwo+IC0JaW50
IG5kZXNjcywgaTsKPiArCWludCBuZGVzY3MsIGksIHJldDsKPiAgCj4gIAluZGVzY3MgPSBncGlv
ZF9jb3VudChkZXYsICJjcyIpOwo+ICAJaWYgKG5kZXNjcyA8IDApIHsKPiBAQCAtNTQ4MSw4ICs1
NDgxLDE0IEBAIGludCByYXduYW5kX2R0X3BhcnNlX2dwaW9fY3Moc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgZ3Bpb19kZXNjICoqKmNzX2FycmF5LAo+ICAJZm9yIChpID0gMDsgaSA8IG5kZXNj
czsgaSsrKSB7Cj4gIAkJZGVzY3NbaV0gPSBncGlvZF9nZXRfaW5kZXhfb3B0aW9uYWwoZGV2LCAi
Y3MiLCBpLAo+ICAJCQkJCQkgICAgR1BJT0RfT1VUX0hJR0gpOwo+IC0JCWlmIChJU19FUlIoZGVz
Y3NbaV0pKQo+IC0JCQlyZXR1cm4gUFRSX0VSUihkZXNjc1tpXSk7Cj4gKwkJaWYgKElTX0VSUihk
ZXNjc1tpXSkpIHsKPiArCQkJcmV0ID0gUFRSX0VSUihkZXNjc1tpXSk7Cj4gKwo+ICsJCQl3aGls
ZSAoLS1pID49IDApCj4gKwkJCQlncGlvZF9wdXQoZGVzY3NbaV0pOwo+ICsKPiArCQkJcmV0dXJu
IHJldDsKPiArCQl9Cj4gIAl9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KVGhpcyBwcm9ibGVtIHdhc24n
dCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBjYW4gaXRzIGNhbGxlciBsZWFrIHRoZQpz
YW1lIG5mYy0+Y3NfYXJyYXkgR1BJTyBkZXNjcmlwdG9ycyBbMV0gd2hlbiBwcm9iZSBmYWlscyBh
ZnRlcgpyYXduYW5kX2R0X3BhcnNlX2dwaW9fY3MoKSBzdWNjZWVkcz8KCkJlY2F1c2UgcmF3bmFu
ZF9kdF9wYXJzZV9ncGlvX2NzKCkgdXNlcyB1bm1hbmFnZWQgZ3Bpb2RfZ2V0X2luZGV4X29wdGlv
bmFsKCksCnRob3NlIGRlc2NyaXB0b3JzIGFyZSBvbmx5IHJlbGVhc2VkIGluIGFuZmNfcmVtb3Zl
KCk6Cgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmM6YW5mY19w
YXJzZV9jcygpIHsKCXJldCA9IHJhd25hbmRfZHRfcGFyc2VfZ3Bpb19jcyhuZmMtPmRldiwgJm5m
Yy0+Y3NfYXJyYXksICZuZmMtPm5jcyk7CglpZiAocmV0KQoJCXJldHVybiByZXQ7CgkuLi4KCWlm
IChuZmMtPmNzX2FycmF5KSB7CgkJaWYgKG5mYy0+bmNzID4gMiAmJiAhbmZjLT5jc19hcnJheVsw
XSAmJiAhbmZjLT5jc19hcnJheVsxXSkgewoJCQlkZXZfZXJyKG5mYy0+ZGV2LAoJCQkJIkFzc2ln
biBhIHNpbmdsZSBuYXRpdmUgQ1Mgd2hlbiB1c2luZyBHUElPc1xuIik7CgkJCXJldHVybiAtRUlO
VkFMOwoJCX0KfQoKSWYgdGhlIG5hdGl2ZSBjaGlwLXNlbGVjdCBjaGVjayBpbiBhbmZjX3BhcnNl
X2NzKCkgb3IgYSBzdWJzZXF1ZW50IGNhbGwgdG8KYW5mY19jaGlwc19pbml0KCkgaW4gYW5mY19w
cm9iZSgpIGZhaWxzLCB0aGUgR1BJTyBsaW5lcyByZW1haW4gcmVxdWVzdGVkIGFuZApjYXVzZSBs
YXRlciBwcm9iZSBhdHRlbXB0cyB0byBmYWlsIHdpdGggLUVCVVNZLiAgU3dpdGNoaW5nIHRvCmRl
dm1fZ3Bpb2RfZ2V0X2luZGV4X29wdGlvbmFsKCkgKGFuZCBkcm9wcGluZyB0aGUgbWFudWFsIGdw
aW9kX3B1dCgpIGxvb3AgaW4KYW5mY19yZW1vdmUoKSkgd291bGQgYXZvaWQgbGVha2luZyBkZXNj
cmlwdG9ycyBpbiBib3RoIHBsYWNlcy4KClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xp
bnV4LTU5ZDhhNmQ0LTMyYmItNGE3ZC04MDA4LWMyYzI3MjA4MWUxMQoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwOTA1MjcyNC4x
MDMyLTEtemhhb2ZlbmcyQGNtc3MuY2hpbmFtb2JpbGUuY29tP3BhcnQ9MQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
