Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECB1606A329
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ff0OkbhV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vh9LkuSc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aBhEew1rptByJeWsmJB2rVUXD39IJITrfYtOGJ1kgyc=; b=Ff0OkbhVMuRtLWiYvqa1KZsANB
	aji9YO4/5CjUcf6oho5JCdwX1tDYvDOY9/tesMm2fBoM/OpMehZCcXpfwZ8TylmQ1I3stJKPDyMwH
	dbUwcn3DxvFCnTYU9ylExV/vDXy6F2MaO5ksZ8mdzZD4r6lIG1gbIYM1P+FJFmFB8l/I+GSG89ALN
	qV0heef0FtLHlDoHISILrUIRU+YBFm1nlJ+r123uVkO7GZYgfXszyvouX3Y7wiTKC1Z7AlJITLSDO
	0emzUgRe77qQpeyyNcz5pzkqob06X70ipicRqhnLa/+KjMvqEPoHQnZPG5pkuw6TAF8d45U4J5VdQ
	lGPC0/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAdJ-00000001inN-0nkZ;
	Tue, 03 Nov 2026 09:16:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAdF-00000001imf-40LQ
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 09:16:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 745DC41F25;
	Tue,  3 Nov 2026 09:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10DA1F00919;
	Tue,  3 Nov 2026 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793697401;
	bh=AK+c6aifMl9iB3hzlvaP1Ilqj/Z5NZiRamVgYM9pv88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vh9LkuScBJmoW+B+tIS2YADAe9aJVUfBCets3ZcPX1qErrB2oCneOcSSbI6y0C24O
	 WkGnxKBQ5wvOaE5cndoDKmsLqdJLRbupAjgeWvZzGLCePRB7FmfYz2XhasHlVtEuzF
	 Scq2Z0KHv385BlAGui/XjLrUYMPiP5baeeW2WtjFHCsY5jv9G91PLfpGWIZnWW5GOv
	 QQ4fMexxwA+0+7awymtAZNpOFGIRqUJi4jEUyLDERIbIBs8fmG6fDuuNFjRU8f5z0h
	 OPCeQv14nlpve5HDV7WiiJfviy7zaUIpZPlCeK4Fwy+gva+vjSfNezcKEKhRrvvzwK
	 vBj90BlkfAEKg==
Message-ID: <sashiko-outbox-194947@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] jffs2: fix use-after-free in
 jffs2_garbage_collect_thread
To: "Yiqing Wu" <wuyiqing@cmss.chinamobile.com>, "David Woodhouse" <dwmw2@infradead.org>, "Richard
 Weinberger" <richard@nod.at>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, "David Howells" <dhowells@redhat.com>, linux-mtd@lists.infradead.org, syzbot+ae2d1f6d474e1725bdc0@syzkaller.appspotmail.com
In-Reply-To: <20261103090018.157034-1-wuyiqing@cmss.chinamobile.com>
References: <20261103090018.157034-1-wuyiqing@cmss.chinamobile.com>
Date: Tue, 03 Nov 2026 09:16:40 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGpmZnMyOiB1bmluaXRp
YWxpemVkIHNwaW5sb2NrIGluIGpmZnMyX2tpbGxfc2IoKSBvbiBycF9zaXplIG1vdW50IGVycm9y
Ci0tCgpjb21taXQgODg2Njk4MGM4MTc0N2Q2OGY2MDM3ZTI1MTcwMjAyM2Q2MTQwZmQ5ZApBdXRo
b3I6IFlpcWluZyBXdSA8d3V5aXFpbmdAY21zcy5jaGluYW1vYmlsZS5jb20+CgpqZmZzMjogZml4
IHVzZS1hZnRlci1mcmVlIGluIGpmZnMyX2dhcmJhZ2VfY29sbGVjdF90aHJlYWQKClRoaXMgY29t
bWl0IGZpeGVzIGEgdXNlLWFmdGVyLWZyZWUgb2Ygc3RydWN0IGpmZnMyX3NiX2luZm8gYnkgY29t
cHV0aW5nIHRoZQplZmZlY3RpdmUgc3VwZXJibG9jayBmbGFncyBpbiBqZmZzMl9kb19yZW1vdW50
X2ZzKCkgYmVmb3JlIHN0YXJ0aW5nIHRoZQpnYXJiYWdlIGNvbGxlY3Rpb24gdGhyZWFkLCBhbmQg
YnkgdW5jb25kaXRpb25hbGx5IGNhbGxpbmcKamZmczJfc3RvcF9nYXJiYWdlX2NvbGxlY3RfdGhy
ZWFkKCkgaW4gamZmczJfa2lsbF9zYigpLgoKWyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEvZnMvamZm
czIvc3VwZXIuYyBiL2ZzL2pmZnMyL3N1cGVyLmMKPiBpbmRleCA4MTM5NmEwOTJiYTg4Li5jODQ2
YjQzNWEzOGI2IDEwMDY0NAo+IC0tLSBhL2ZzL2pmZnMyL3N1cGVyLmMKPiArKysgYi9mcy9qZmZz
Mi9zdXBlci5jCj4gQEAgLTM0NSw3ICszNDUsNyBAQCBzdGF0aWMgdm9pZCBqZmZzMl9wdXRfc3Vw
ZXIgKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCj4gIHN0YXRpYyB2b2lkIGpmZnMyX2tpbGxfc2Io
c3RydWN0IHN1cGVyX2Jsb2NrICpzYikKPiAgewo+ICAJc3RydWN0IGpmZnMyX3NiX2luZm8gKmMg
PSBKRkZTMl9TQl9JTkZPKHNiKTsKPiAtCWlmIChjICYmICFzYl9yZG9ubHkoc2IpKQo+ICsJaWYg
KGMpCj4gIAkJamZmczJfc3RvcF9nYXJiYWdlX2NvbGxlY3RfdGhyZWFkKGMpOwoKW1NldmVyaXR5
OiBIaWdoXQpDYW4gY2FsbGluZyBqZmZzMl9zdG9wX2dhcmJhZ2VfY29sbGVjdF90aHJlYWQoYykg
dW5jb25kaXRpb25hbGx5IGhlcmUgbG9jayBhbgp1bmluaXRpYWxpemVkIGMtPmVyYXNlX2NvbXBs
ZXRpb25fbG9jayB3aGVuIGEgbW91bnQgZmFpbHMgZWFybHkgaW4KamZmczJfZmlsbF9zdXBlcigp
PwoKRHVyaW5nIG1vdW50IGNvbnRleHQgaW5pdGlhbGl6YXRpb24sIGpmZnMyX2luaXRfZnNfY29u
dGV4dCgpIGluCmZzL2pmZnMyL3N1cGVyLmMgYWxsb2NhdGVzIHN0cnVjdCBqZmZzMl9zYl9pbmZv
IGFuZCBhc3NpZ25zIGl0IHRvCmZjLT5zX2ZzX2luZm8gd2l0aG91dCBpbml0aWFsaXppbmcgYy0+
ZXJhc2VfY29tcGxldGlvbl9sb2NrLiBXaGVuCmdldF90cmVlX210ZCgpLT5tdGRfZ2V0X3NiKCkt
PnNnZXRfZGV2KCktPnNnZXRfZmMoKSBjcmVhdGVzIHRoZSBzdXBlcmJsb2NrLApmYy0+c19mc19p
bmZvIGlzIHRyYW5zZmVycmVkIHRvIHNiLT5zX2ZzX2luZm8gYmVmb3JlIG10ZF9nZXRfc2IoKSBj
YWxscwpqZmZzMl9maWxsX3N1cGVyKHNiLCBmYykuCgpJbiBmcy9qZmZzMi9zdXBlci5jOmpmZnMy
X2ZpbGxfc3VwZXIoKToKCglpZiAoYy0+bW91bnRfb3B0cy5ycF9zaXplID4gYy0+bXRkLT5zaXpl
KQoJCXJldHVybiBpbnZhbGYoZmMsICJqZmZzMjogVG9vIGxhcmdlIHJlc2VydmUgcG9vbCBzcGVj
aWZpZWQsIG1heCBpcyAlbGx1IEtCIiwKCQkJICAgICAgYy0+bXRkLT5zaXplIC8gMTAyNCk7CgoJ
LyogSW5pdGlhbGl6ZSBKRkZTMiBzdXBlcmJsb2NrIGxvY2tzLCB0aGUgZnVydGhlciBpbml0aWFs
aXphdGlvbiB3aWxsCgkgKiBiZSBkb25lIGxhdGVyICovCgltdXRleF9pbml0KCZjLT5hbGxvY19z
ZW0pOwoJbXV0ZXhfaW5pdCgmYy0+ZXJhc2VfZnJlZV9zZW0pOwoJaW5pdF93YWl0cXVldWVfaGVh
ZCgmYy0+ZXJhc2Vfd2FpdCk7Cglpbml0X3dhaXRxdWV1ZV9oZWFkKCZjLT5pbm9jYWNoZV93cSk7
CglzcGluX2xvY2tfaW5pdCgmYy0+ZXJhc2VfY29tcGxldGlvbl9sb2NrKTsKCklmIGEgbW91bnQg
c3BlY2lmaWVzIGFuIHJwX3NpemUgbGFyZ2VyIHRoYW4gYy0+bXRkLT5zaXplLCBqZmZzMl9maWxs
X3N1cGVyKCkKcmV0dXJucyAtRUlOVkFMIGJlZm9yZSBzcGluX2xvY2tfaW5pdCgmYy0+ZXJhc2Vf
Y29tcGxldGlvbl9sb2NrKSBpcyBjYWxsZWQuCm10ZF9nZXRfc2IoKSB0aGVuIGNhbGxzIGRlYWN0
aXZhdGVfbG9ja2VkX3N1cGVyKHNiKS0+amZmczJfa2lsbF9zYihzYiksIHdoZXJlCmMgaXMgbm9u
LU5VTEwuCgpQcmV2aW91c2x5LCBmYWlsZWQgcmVhZC1vbmx5IG1vdW50cyBza2lwcGVkIGpmZnMy
X3N0b3BfZ2FyYmFnZV9jb2xsZWN0X3RocmVhZCgpCmJlY2F1c2Ugc2JfcmRvbmx5KHNiKSB3YXMg
dHJ1ZSAodGhvdWdoIGZhaWxlZCByZWFkLXdyaXRlIG1vdW50cyBhbHJlYWR5IGhpdAp0aGlzIHBh
dGgpLiBXaXRoIHRoZSAhc2JfcmRvbmx5KHNiKSBjaGVjayByZW1vdmVkLCBhbnkgbW91bnQgZmFp
bGluZyBhdCB0aGUKcnBfc2l6ZSBjaGVjayBub3cgY2FsbHMgamZmczJfc3RvcF9nYXJiYWdlX2Nv
bGxlY3RfdGhyZWFkKGMpIGluCmZzL2pmZnMyL2JhY2tncm91bmQuYzoKCnZvaWQgamZmczJfc3Rv
cF9nYXJiYWdlX2NvbGxlY3RfdGhyZWFkKHN0cnVjdCBqZmZzMl9zYl9pbmZvICpjKQp7CglpbnQg
d2FpdCA9IDA7CglzcGluX2xvY2soJmMtPmVyYXNlX2NvbXBsZXRpb25fbG9jayk7CgpTaG91bGQg
Yy0+ZXJhc2VfY29tcGxldGlvbl9sb2NrIGJlIGluaXRpYWxpemVkIGVhcmxpZXIgKGZvciBleGFt
cGxlLCBpbgpqZmZzMl9pbml0X2ZzX2NvbnRleHQoKSBvciBiZWZvcmUgdGhlIHJwX3NpemUgY2hl
Y2sgaW4gamZmczJfZmlsbF9zdXBlcigpKSBzbwpqZmZzMl9raWxsX3NiKCkgY2FuIHNhZmVseSBj
YWxsIGpmZnMyX3N0b3BfZ2FyYmFnZV9jb2xsZWN0X3RocmVhZChjKSBvbiBlYXJseQptb3VudCBm
YWlsdXJlPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MTEwMzA5MDAxOC4xNTcwMzQtMS13dXlpcWluZ0BjbXNzLmNoaW5hbW9iaWxl
LmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
