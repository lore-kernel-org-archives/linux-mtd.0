Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7924C606A335
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tw0Lsu5J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=facCz0qq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H2fhtrVewyr0eYb8gW5XoUfySJpFhDK8zs617+qNvMc=; b=Tw0Lsu5Jj8HkhIJx705im61dBa
	m5QpuzNuPeMdXqTnMUgE9NvCWHoB5XQrpPUr3EqMewwOONbmzhAWm/DG52+Cv9qeW1ePkKgJE+Q4e
	OnTQucn5EK+Ms1GvYTJxDz/9sByp5yb8XkJqjj6sYRvSbSkpkxp4ecea2TkS5XwUsxpqKsa8ctpEs
	smiDrhxC4rh4ZfspsdbXC+Y5MFAKHke6JUzlKH2Y4CfVPh7GU4qV1+kkfjg+neN6f3ID+gtV0tZ29
	rq66EgOklalbsUBf6XKiAFg9DH5oOhX7dvEAT++S6hP+ijCCXRlwSZThc5IiD9VNh1KI9XrN6WqML
	MvZocjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTp-0000000Fywn-0kjI;
	Sat, 14 Nov 2026 12:03:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTl-0000000FyuH-2gTR
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 12:03:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D61145D3C;
	Sat, 14 Nov 2026 12:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A9B1F000C5;
	Sat, 14 Nov 2026 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657813;
	bh=Wv8I5sT0IlSg6c2AVaztBfZxjeSqbtwOh/i1U+WLAMs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=facCz0qqs9QrwkdnVkScfrWc4RWGu0fgu+gPH1rhfIGd2cxJQ2KSJ/ctGaPNos2xi
	 yWhxu7QJ0i6YpbkN1Wc7D2N4KWL4torud90tRKqnT6ebGmQdOGnRAv7l3HnBZhDBeD
	 dTbRGlUT6jWcK5MpPZwGqYZCs6bj2fMnoEOWDQ+NoPZXgiTSdKMWs2m4EXF8YJ6NhV
	 r/j2o+eDJOR6wn2tJuY5RiKieaDzELDUnGuzt4memBBwaPzmLhfkDG/rL/Smd3sOZ3
	 mZ+VG+Xng4Jy/xzTFLsbuNEpb29N0PWcpdH+7/NnfZ0DANXp4W53CWW62b9PrVL4Ef
	 KXJ02F5rI1Fnw==
Message-ID: <sashiko-outbox-214464@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/33] hfs: don't set SB_RDONLY after MDB write
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, "Viacheslav
 Dubeyko" <slava@dubeyko.com>, dsterba@suse.cz, tytso@mit.edu, "Mark Fasheh" <mark@fasheh.com>, "Joel
 Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-13-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-13-0be92bb73709@kernel.org>
Date: Sat, 14 Nov 2026 12:03:32 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaGZzOiBlYXJseSByZXR1
cm4gaW4gaGZzX2ZpbGVfdHJ1bmNhdGUoKSBjb3JydXB0cyBpbm9kZSBhbmQKICBjYXRhbG9nIHNp
emVzCi0tCgpjb21taXQgYmZhODBlMTljNmM5ZWE2YjEyOTQzYWJiMjgzOTc4MWJlNzgzNWQ5OApB
dXRob3I6IENocmlzdGlhbiBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+CgpoZnM6IGRvbid0
IHNldCBTQl9SRE9OTFkgYWZ0ZXIgTURCIHdyaXRlIGVycm9ycwoKSW5zdGVhZCBvZiBzZXR0aW5n
IFNCX1JET05MWSB3aXRob3V0IGhvbGRpbmcgc191bW91bnQgd2hlbiBhbiBNREIgd3JpdGUKZmFp
bHMsIHRoaXMgY29tbWl0IGludHJvZHVjZXMgSEZTX0ZMR19FTUVSR0VOQ1lfUk8gYW5kIHJlamVj
dHMgZmlsZXN5c3RlbQptb2RpZmljYXRpb25zIHdpdGggLUVST0ZTIG9uY2UgdGhlIGZsYWcgaXMg
c2V0LgoKPiBkaWZmIC0tZ2l0IGEvZnMvaGZzL2V4dGVudC5jIGIvZnMvaGZzL2V4dGVudC5jCj4g
aW5kZXggMjYzNTcwODY1MTdmYy4uZGFjZjdjZTFmZmU0YSAxMDA2NDQKPiAtLS0gYS9mcy9oZnMv
ZXh0ZW50LmMKPiArKysgYi9mcy9oZnMvZXh0ZW50LmMKWyAuLi4gXQo+IEBAIC00OTEsNiArNDk0
LDggQEAgdm9pZCBoZnNfZmlsZV90cnVuY2F0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ICAJaGZz
X2RiZygiaW5vICVsbHUsIHBoeXNfc2l6ZSAlbGx1IC0+IGlfc2l6ZSAlbGx1XG4iLAo+ICAJCWlu
b2RlLT5pX2lubywgKGxvbmcgbG9uZylIRlNfSShpbm9kZSktPnBoeXNfc2l6ZSwKPiAgCQlpbm9k
ZS0+aV9zaXplKTsKPiArCWlmICh1bmxpa2VseShoZnNfZW1lcmdlbmN5X3JvKHNiKSkpCj4gKwkJ
cmV0dXJuOwo+ICAJaWYgKGlub2RlLT5pX3NpemUgPiBIRlNfSShpbm9kZSktPnBoeXNfc2l6ZSkg
ewo+ICAJCXN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nID0gaW5vZGUtPmlfbWFwcGluZzsK
PiAgCQl2b2lkICpmc2RhdGEgPSBOVUxMOwoKW1NldmVyaXR5OiBNZWRpdW1dCkNhbiByZXR1cm5p
bmcgYXQgdGhlIHRvcCBvZiBoZnNfZmlsZV90cnVuY2F0ZSgpIGxlYXZlIGlub2RlLT5pX3NpemUg
b3V0Cm9mIHN5bmMgd2l0aCBIRlNfSShpbm9kZSktPnBoeXNfc2l6ZSBhbmQgSEZTX0koaW5vZGUp
LT5hbGxvY19ibG9ja3M/CgpDUFUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQ
VTEKaGZzX2lub2RlX3NldGF0dHIoKQogIGhmc19lbWVyZ2VuY3lfcm8oc2IpIC0+IGZhbHNlCiAg
aW5vZGVfZGlvX3dhaXQoaW5vZGUpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaGZzX21kYl9jb21taXQoKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2V0X2JpdChIRlNfRkxHX0VNRVJHRU5DWV9STywgLi4uKQogIHRydW5jYXRlX3NldHNpemUo
aW5vZGUsIGlhX3NpemUpCiAgaGZzX2ZpbGVfdHJ1bmNhdGUoaW5vZGUpCiAgICBpZiAoaGZzX2Vt
ZXJnZW5jeV9ybyhzYikpCiAgICAgIHJldHVybjsgIDwtLSBza2lwcyBpX3NpemUgcm9sbGJhY2sK
ICBtYXJrX2lub2RlX2RpcnR5KGlub2RlKQoKV2hlbiBhbiBleHBhbmRpbmcgdHJ1bmNhdGUgaGl0
cyAtRVJPRlMgaW4gaGZzX3dyaXRlX2JlZ2luKCksIHRoZQppbm9kZS0+aV9zaXplID4gSEZTX0ko
aW5vZGUpLT5waHlzX3NpemUgYnJhbmNoIG5vcm1hbGx5IHJlc2V0cwppbm9kZS0+aV9zaXplID0g
SEZTX0koaW5vZGUpLT5waHlzX3NpemUuICBSZXR1cm5pbmcgYmVmb3JlIHRoYXQgYnJhbmNoCmxl
YXZlcyBpbm9kZS0+aV9zaXplIGV4cGFuZGVkIHdpdGhvdXQgYWxsb2NhdGVkIGJsb2NrcywgYW5k
IGJlY2F1c2UKaGZzX3dyaXRlX2lub2RlKCkgc3RpbGwgcnVucyBhZnRlciBhbiBNREIgZXJyb3Is
IHdyaXRlYmFjayBwZXJzaXN0cwpMZ0xlbiA+IFB5TGVuIGludG8gdGhlIGNhdGFsb2cgQi10cmVl
IHJlY29yZCB2aWEgaGZzX2lub2RlX3dyaXRlX2ZvcmsoKS4KClNpbWlsYXJseSwgaWYgYW4gZXh0
ZW5kaW5nIHdyaXRlIGFsbG9jYXRlcyBibG9ja3MgaW4gaGZzX2dldF9ibG9jaygpIGFuZAp0aGVu
IGZhaWxzIGEgbGF0ZXIgYmxvY2sgYWxsb2NhdGlvbiBhZnRlciBIRlNfRkxHX0VNRVJHRU5DWV9S
TyBpcyBzZXQsCmhmc193cml0ZV9mYWlsZWQoKSAtPiBoZnNfZmlsZV90cnVuY2F0ZSgpIHJldHVy
bnMgYmVmb3JlIHRoZSBvdXQ6IGxhYmVsCnJlc2V0cyBwaHlzX3NpemUsIGZzX2Jsb2NrcywgYW5k
IHRoZSBpbm9kZSBieXRlIGNvdW50IGJhY2sgdG8KaW5vZGUtPmlfc2l6ZS4KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTMtd29y
ay1mcy1zYl9yZG9ubHktdjMtMC0wYmU5MmJiNzM3MDlAa2VybmVsLm9yZz9wYXJ0PTEzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
