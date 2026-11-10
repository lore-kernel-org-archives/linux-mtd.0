Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858FF606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 23:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OjqK9a7r;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oefXdOPc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9ZL5u+aKRYD1Eh00E3oI1JLT7e79H8nW+Kzq8CX//Qk=; b=OjqK9a7ru7ja8jkeVxhthZtrK5
	sYIHZPApcoBrh9gS45WUrfdJnfbLZZq9Vel+fZjEsjjT9W+8YRKKQQaEtoSNbzQ7+YL0DYyDd745z
	RDMi+bDWmDnB25tAmG4vABkURbTyVIb3/WJi4JRoQ8udbF8ON8w+acB3ZgP+4K4ooziiuMZoh+hlf
	lzvJefX2+hWY1+QOcTl+/dgLUS5zIXy5a27BpNwPKpSEA6dRfGOE4JOmXX2dn7UP6OLmgtKV+nxFd
	v4zqtc5Y9tYwtrOwHJ7W1NYojVUjdsH6UjZndtqhgm4M/yiakYWar9CLowObq4n63AiojaLpqmyAM
	mpuoiTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvCA-00000005Ea6-2dJ8;
	Tue, 10 Nov 2026 23:24:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvC9-00000005EZp-39Xp
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 23:24:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FA8140380;
	Tue, 10 Nov 2026 23:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7C61F0093C;
	Tue, 10 Nov 2026 23:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353045;
	bh=voSvz4NJvSMk55vWw9AmQtf+fyZlZTMgr8N5TVfnJ3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oefXdOPch2nWh6J7gBYDe60BNyJOYg49saFqe2aAp2MifpbkoCTfMUc+HzbIRqUQC
	 FSDuJYSHjsDZUtzWuyqAajfDb9stww4NF587JE558zhhYtTlduMykxwMA+KI1sI755
	 7jI/bbs4BW7nmnHcshvwfynSPpG0EYfY/vvFl++iZ/GUXd2ye9q3oZCoPjt1S10jPy
	 x5F6C5HhHV/Kq8pJqNjsq2yp70VgmGlAlAsrOE4RMYAkU2CSF63y1tY+rgP/d808PE
	 db8Q6rA91Wg5nltGXgh3V7Px2MG5DEP4JRx9ljYNfA9H0yh3Dxivkr3CueuNzve4oX
	 pXrpT1Vq4tgbg==
Message-ID: <sashiko-outbox-207894@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] spi: spi-qpic-snand: use the common
 qcom_nandc_config_page_write() function
To: "Gabor Juhos" <j4g8y7@gmail.com>, "Mark Brown" <broonie@kernel.org>
Cc: "Md Sadre Alam" <md.alam@oss.qualcomm.com>, "Sricharan Ramabadhran" <quic_srichara@quicinc.com>, "Varadarajan
 Narayanan" <varadarajan.narayanan@oss.qualcomm.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-3-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
 <20261109-qpic-snand-use-common-functions-v1-3-1e8601e2db84@gmail.com>
Date: Tue, 10 Nov 2026 23:24:04 +0000
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
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIHNwaTogcXBp
Yy1zbmFuZDogT09CIGRhdGEgaWdub3JlZCBkdXJpbmcgY29tYmluZWQgZGF0YSBhbmQKICBPT0Ig
b3BlcmF0aW9ucyBbMV0KLS0KCmNvbW1pdCA2MmUxYTUwMjk5NDY1YTEzZGExOThiMWY0YWMxNTM2
YzQ5N2I4ODc3CkF1dGhvcjogR2Fib3IgSnVob3MgPGo0Zzh5N0BnbWFpbC5jb20+CgpzcGk6IHNw
aS1xcGljLXNuYW5kOiB1c2UgdGhlIGNvbW1vbiBxY29tX25hbmRjX2NvbmZpZ19wYWdlX3dyaXRl
KCkgZnVuY3Rpb24KClRoaXMgY29tbWl0IHJlcGxhY2VzIHRoZSBsb2NhbCBxY29tX3NwaV9jb25m
aWdfcGFnZV93cml0ZSgpIGhlbHBlciB3aXRoIHRoZQpjb21tb24gcWNvbV9uYW5kY19jb25maWdf
cGFnZV93cml0ZSgpIGZ1bmN0aW9uIGZyb20gdGhlIHFwaWNfY29tbW9uIG1vZHVsZS4KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMgYi9kcml2ZXJzL3NwaS9zcGkt
cXBpYy1zbmFuZC5jCj4gaW5kZXggY2Y3NWMxNDIzMDNmOC4uYTgyNWJkYjkzYThhMSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4gKysrIGIvZHJpdmVycy9zcGkv
c3BpLXFwaWMtc25hbmQuYwoKWyAuLi4gXQoKPiBAQCAtMTE5NCw3ICsxMTg4LDcgQEAgc3RhdGlj
IGludCBxY29tX3NwaV9wcm9ncmFtX2VjYyhzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKnNu
YW5kYywKPiAgCXNuYW5kYy0+cmVncy0+ZWNjX2JjaF9jZmcgPSBjcHVfdG9fbGUzMihlY2NfYmNo
X2NmZyk7Cj4gIAlzbmFuZGMtPnJlZ3MtPmV4ZWMgPSBjcHVfdG9fbGUzMigxKTsKPiAgCj4gLQlx
Y29tX3NwaV9jb25maWdfcGFnZV93cml0ZShzbmFuZGMpOwo+ICsJcWNvbV9uYW5kY19jb25maWdf
cGFnZV93cml0ZShzbmFuZGMpOwoKW1NldmVyaXR5OiBDcml0aWNhbF0KVGhpcyBwcm9ibGVtIHdh
c24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHFjb21fc3BpX3Byb2dyYW1f
ZWNjKCkKYW5kIHFjb21fc3BpX3JlYWRfcGFnZV9lY2MoKSBpZ25vcmUgdGhlIGNhbGxlci1zdXBw
bGllZCBPT0IgZGF0YSBkdXJpbmcKY29tYmluZWQgcGFnZSBhbmQgT09CIG9wZXJhdGlvbnMgWzFd
PwoKV2hlbiB0aGUgc3BpbmFuZCBmcmFtZXdvcmsgcGVyZm9ybXMgYSBjb21iaW5lZCBvcGVyYXRp
b24gdmlhCnNwaW5hbmRfd3JpdGVfcGFnZSgpIG9yIHNwaW5hbmRfcmVhZF9wYWdlKCksIG9wLT5k
YXRhLmJ1ZiBwb2ludHMgdG8gYSBzaW5nbGUKY29udGlndW91cyBidWZmZXIgY29udGFpbmluZyBi
b3RoIHRoZSBwYWdlIGRhdGEgYW5kIE9PQiBkYXRhLiAgSG93ZXZlciwgYm90aApmdW5jdGlvbnMg
aGFyZGNvZGUgb29iX2J1ZiB0byB0aGUgaW50ZXJuYWwgc25hbmRjLT5xc3BpLT5vb2JfYnVmIHdp
dGhvdXQKY29weWluZyB0aGUgY2FsbGVyJ3MgT09CIHBheWxvYWQgaW4gZnJvbSBvcC0+ZGF0YS5i
dWYub3V0ICsgbXRkLT53cml0ZXNpemUgb24Kd3JpdGVzLCBvciBjb3B5aW5nIHRoZSByZWFkIE9P
QiBkYXRhIGJhY2sgb3V0IHRvIG9wLT5kYXRhLmJ1Zi5pbiArCm10ZC0+d3JpdGVzaXplIG9uIHJl
YWRzOgoKZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYzpxY29tX3NwaV9wcm9ncmFtX2VjYygp
IHsKCS4uLgoJaWYgKHNuYW5kYy0+cXNwaS0+ZGF0YV9idWYpCgkJZGF0YV9idWYgPSBzbmFuZGMt
PnFzcGktPmRhdGFfYnVmOwoKCW9vYl9idWYgPSBzbmFuZGMtPnFzcGktPm9vYl9idWY7CgkuLi4K
fQoKQXMgYSByZXN1bHQsIGNvbWJpbmVkIHJlYWRzIHJldHVybiBzdGFsZSBvciB1bmluaXRpYWxp
emVkIE9PQiBieXRlcyB0byB0aGUKY2FsbGVyLCBhbmQgY29tYmluZWQgd3JpdGVzIHNpbGVudGx5
IHByb2dyYW0gZ2FyYmFnZSBpbnRvIHRoZSBmbGFzaCBPT0IgYXJlYS4KClsxXSBodHRwczovL3Nh
c2hpa28uZGV2LyMvYnVnL2xpbnV4LTdkZDhlZDE2LWQyNTEtNDQ3Ny04YzE2LWE1YTdhNjhjYzZl
MQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MTEwOS1xcGljLXNuYW5kLXVzZS1jb21tb24tZnVuY3Rpb25zLXYxLTAtMWU4NjAxZTJk
Yjg0QGdtYWlsLmNvbT9wYXJ0PTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
