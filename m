Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F76606A33D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ncVt0Wre;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QI6bw7Wp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DDyfTxLiGOY348PMpb0BlVILdtn0Zu1mWjghD6tpYDY=; b=ncVt0WrejEevtpak9j+7HDB10x
	zmzOeu4k1LZqcMLoloDTqfUgM06u7sJ05v0LgtZc7JD2o0qxaH6/MnrEWyW2+l9ls5SCp6emSSsy7
	/9cigpAqyrkLhQz5YAN45YgnRWp/67z6t/itEkexOFSNrbbn8WA7Ydf45mLME4Sn4EH69PyNKI/ht
	Lzc7M/oGwiVd/RR7AA5lGJxaka0ktGjguAAN+mrKhGDjSzzdX+JxfEWhDCUtAMMTsz4C/zR561LIz
	qztVaXZmTBBB6V+wkatTZpd84xzGoSY3YU9TRRmWzAWuJaRTgrV8DaOoLOjqF/0wu0ByoEUqRYu7+
	R4FcHuMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpAz-0000000C5c0-0nWK;
	Fri, 30 Oct 2026 16:09:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpAy-0000000C5bb-3GBG
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:09:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39FDA43EAE;
	Fri, 30 Oct 2026 16:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF091F00A17;
	Fri, 30 Oct 2026 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376596;
	bh=Fcm+hIfEyXj/1FIUdG0rmsM/tGutxaQ6UYWcc0TMcU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QI6bw7Wpe0jvnRPZ/15BzNWtxNle/TBdjDueozdSB/u2+/+fN4EKSixohfH5HY8vF
	 hPc/925bZQTYTslO+O7V3sjaQP8Q4jnS47UWxyoQhVd3NuruyQmqu5PyHSYDWcmfVF
	 2r6pd4ob3QSIt8N/S0Ra/BZ8+RRVJk2wFTjqxvITxBIchJXK6FE66lWDShwdQqP0CN
	 lUBtcpSOBG+XvEynjhP6CpHYGeTlxDVG3rz9pVGpRy/D8t6rMhUhVLrDhyseFKXrbY
	 b0W63QZ0rPxzdHARLQo2Yxq7pucvv7/7vOOY68ITxchgMhLfPg+AWOiAcUjYzSEkWH
	 Rw2ljddrjlsEg==
Message-ID: <sashiko-outbox-191228@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/34] exfat: don't set SB_RDONLY after filesystem
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-9-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-9-2f44f64f0b66@kernel.org>
Date: Fri, 30 Oct 2026 16:09:55 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGV4ZmF0OiBfX2V4ZmF0
X3RydW5jYXRlKCkgYW5kIGV4ZmF0X2V2aWN0X2lub2RlKCkgbW9kaWZ5IGZzIGluIGVtZXJnZW5j
eSBSTwotLQoKY29tbWl0IDE3YzEwYWMwNGIzZGFkNTBiYjg3MGU5NzdkOTJlNzJlYTlkM2JjZmQK
QXV0aG9yOiBDaHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgoKZXhmYXQ6IGRv
bid0IHNldCBTQl9SRE9OTFkgYWZ0ZXIgZmlsZXN5c3RlbSBlcnJvcnMKClRoaXMgY29tbWl0IGlu
dHJvZHVjZXMgRVhGQVRfRkxBR1NfRU1FUkdFTkNZX1JPIGFuZCBleGZhdF9lbWVyZ2VuY3lfc3Rh
dGUoKSBzbwp0aGF0IGZpbGVzeXN0ZW0gZXJyb3JzIGFmdGVyIG1vdW50IG1hcmsgdGhlIGZpbGVz
eXN0ZW0gZW1lcmdlbmN5IHJlYWQtb25seQpyYXRoZXIgdGhhbiBzZXR0aW5nIFNCX1JET05MWSB3
aXRob3V0IGhvbGRpbmcgc191bW91bnQuCgo+IGRpZmYgLS1naXQgYS9mcy9leGZhdC9pbm9kZS5j
IGIvZnMvZXhmYXQvaW5vZGUuYwo+IGluZGV4IDUxMjlkZjFlNzliNDQuLjNmMjRlNWJkM2ViMTEg
MTAwNjQ0Cj4gLS0tIGEvZnMvZXhmYXQvaW5vZGUuYwo+ICsrKyBiL2ZzL2V4ZmF0L2lub2RlLmMK
PiBAQCAtMTE0LDggKzExNCw5IEBAIGludCBleGZhdF93cml0ZV9pbm9kZShzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKndiYykKPiAgewo+ICAJaW50IHJldDsK
PiAgCj4gLQlpZiAodW5saWtlbHkoZXhmYXRfZm9yY2VkX3NodXRkb3duKGlub2RlLT5pX3NiKSkp
Cj4gLQkJcmV0dXJuIC1FSU87Cj4gKwlyZXQgPSBleGZhdF9lbWVyZ2VuY3lfc3RhdGUoaW5vZGUt
Pmlfc2IpOwo+ICsJaWYgKHVubGlrZWx5KHJldCkpCj4gKwkJcmV0dXJuIHJldDsKPiAgCj4gIAlt
dXRleF9sb2NrKCZFWEZBVF9TQihpbm9kZS0+aV9zYiktPnNfbG9jayk7Cj4gIAlyZXQgPSBfX2V4
ZmF0X3dyaXRlX2lub2RlKGlub2RlLCB3YmMtPnN5bmNfbW9kZSA9PSBXQl9TWU5DX0FMTCk7Cgpb
U2V2ZXJpdHk6IEhpZ2hdClNob3VsZCBfX2V4ZmF0X3RydW5jYXRlKCkgb3IgZXhmYXRfZXZpY3Rf
aW5vZGUoKSBhbHNvIGNoZWNrCmV4ZmF0X2VtZXJnZW5jeV9zdGF0ZSgpPwoKV2hlbiBhbiB1bmxp
bmtlZCBmaWxlIGlzIGNsb3NlZCAob3IgZHVyaW5nIHVubW91bnQpIGFmdGVyIGEgZmlsZXN5c3Rl
bSBlcnJvcgpzZXRzIEVYRkFUX0ZMQUdTX0VNRVJHRU5DWV9STyAob3IgU0JfU1RBVEVfRU1FUkdF
TkNZX1JPIGluIHRoZSBmb2xsb3ctdXAKY29tbWl0ICJleGZhdDogdXNlIHRoZSBnZW5lcmljIGVt
ZXJnZW5jeSByZWFkLW9ubHkgc3RhdGUiKSwKZXhmYXRfZXZpY3RfaW5vZGUoKSBjYWxscyBfX2V4
ZmF0X3RydW5jYXRlKCk6Cgpmcy9leGZhdC9pbm9kZS5jOmV4ZmF0X2V2aWN0X2lub2RlKCkgewoJ
dHJ1bmNhdGVfaW5vZGVfcGFnZXNfZmluYWwoJmlub2RlLT5pX2RhdGEpOwoKCWlmICghaW5vZGUt
PmlfbmxpbmspIHsKCQlpX3NpemVfd3JpdGUoaW5vZGUsIDApOwoJCW11dGV4X2xvY2soJkVYRkFU
X1NCKGlub2RlLT5pX3NiKS0+c19sb2NrKTsKCQlfX2V4ZmF0X3RydW5jYXRlKGlub2RlKTsKCQlt
dXRleF91bmxvY2soJkVYRkFUX1NCKGlub2RlLT5pX3NiKS0+c19sb2NrKTsKCX0KICAgIC4uLgp9
CgpTaW1pbGFybHksIGlmIGEgd3JpdGUgaW4gZXhmYXRfZmlsZV93cml0ZV9pdGVyKCkgZW5jb3Vu
dGVycyBhIGNvcnJ1cHRlZCBGQVQKY2hhaW4gb3IgY2x1c3RlciBlcnJvciB0aGF0IHNldHMgRVhG
QVRfRkxBR1NfRU1FUkdFTkNZX1JPIHZpYQpleGZhdF9mc19lcnJvcigpLCB0aGUgZXJyb3IgdW53
aW5kIGluIGV4ZmF0X2V4dGVuZF92YWxpZF9zaXplKCkgb3IKZXhmYXRfd3JpdGVfZmFpbGVkKCkg
Y2FsbHMgZXhmYXRfdHJ1bmNhdGUoKSAtPiBfX2V4ZmF0X3RydW5jYXRlKCkuCgpCZWNhdXNlIF9f
ZXhmYXRfdHJ1bmNhdGUoKSBpbiBmcy9leGZhdC9maWxlLmMgY2FsbHMgX19leGZhdF93cml0ZV9p
bm9kZSgpCmRpcmVjdGx5IHJhdGhlciB0aGFuIGV4ZmF0X3dyaXRlX2lub2RlKCksIGl0IGJ5cGFz
c2VzIHRoZQpleGZhdF9lbWVyZ2VuY3lfc3RhdGUoKSBjaGVjayBhYm92ZToKCmZzL2V4ZmF0L2Zp
bGUuYzpfX2V4ZmF0X3RydW5jYXRlKCkgewogICAgLi4uCglpZiAoX19leGZhdF93cml0ZV9pbm9k
ZShpbm9kZSwgaW5vZGVfbmVlZHNfc3luYyhpbm9kZSkpKQoJCXJldHVybiAtRUlPOwoKCS8qIGN1
dCBvZmYgZnJvbSB0aGUgRkFUIGNoYWluICovCglpZiAoZWktPmZsYWdzID09IEFMTE9DX0ZBVF9D
SEFJTiAmJiBsYXN0X2NsdSAhPSBFWEZBVF9GUkVFX0NMVVNURVIgJiYKCQkJbGFzdF9jbHUgIT0g
RVhGQVRfRU9GX0NMVVNURVIpIHsKCQlpZiAoZXhmYXRfZW50X3NldChzYiwgbGFzdF9jbHUsIEVY
RkFUX0VPRl9DTFVTVEVSKSkKCQkJcmV0dXJuIC1FSU87Cgl9CiAgICAuLi4KCS8qIGZyZWUgdGhl
IGNsdXN0ZXJzICovCglpZiAoZXhmYXRfZnJlZV9jbHVzdGVyKGlub2RlLCAmY2x1KSkKCQlyZXR1
cm4gLUVJTzsKICAgIC4uLgp9CgpUaGlzIG1vZGlmaWVzIGRpcmVjdG9yeSBlbnRyaWVzLCBGQVQg
ZW50cmllcywgYW5kIGFsbG9jYXRpb24gYml0bWFwIGJ1ZmZlcnMgdmlhCmV4ZmF0X2ZyZWVfY2x1
c3RlcigpIC0+IF9fZXhmYXRfZnJlZV9jbHVzdGVyKCkgLT4gZXhmYXRfY2xlYXJfYml0bWFwKCkg
KHdoaWNoCmFsc28gd3JpdGVzIHN5bmNocm9ub3VzbHkgd2hlbiBJU19ESVJTWU5DKGlub2RlKSBp
cyBzZXQpLCBhbmQgaWYgbW91bnRlZCB3aXRoCmRpc2NhcmQgKHdoaWNoIF9fZXhmYXRfZnNfZXJy
b3IoKSBkb2VzIG5vdCBjbGVhciwgdW5saWtlCmV4ZmF0X2ZvcmNlX3NodXRkb3duKCkpLCBpc3N1
ZXMgYmxvY2sgZGV2aWNlIGRpc2NhcmQgcmVxdWVzdHMgdmlhCmV4ZmF0X2Rpc2NhcmRfY2x1c3Rl
cigpIHdoaWxlIHdhbGtpbmcgYSBwb3RlbnRpYWxseSBjb3JydXB0ZWQgY2x1c3RlciBjaGFpbi4K
RnVydGhlcm1vcmUsIGJlY2F1c2UgU0JfUkRPTkxZIGlzIG5vIGxvbmdlciBzZXQgb24gZXJyb3Is
IHN5bmNfZmlsZXN5c3RlbSgpIG5vCmxvbmdlciByZXR1cm5zIGVhcmx5IGF0IHNiX3Jkb25seShz
YikgYW5kIGZsdXNoZXMgdGhvc2UgZGlydGllZCBtZXRhZGF0YQpidWZmZXJzIHRvIGRpc2suCgpD
YW4gX19leGZhdF90cnVuY2F0ZSgpIGFuZC9vciBleGZhdF9ldmljdF9pbm9kZSgpIGNoZWNrCmV4
ZmF0X2VtZXJnZW5jeV9zdGF0ZSgpIHRvIHByZXZlbnQgbWV0YWRhdGEgbW9kaWZpY2F0aW9ucyBh
bmQgZGlzY2FyZHMgYWZ0ZXIKdGhlIGZpbGVzeXN0ZW0gZW50ZXJzIGVtZXJnZW5jeSByZWFkLW9u
bHkgc3RhdGU/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYxMDI5LXdvcmstZnMtc2JfcmRvbmx5LXYyLTAtMmY0NGY2NGYwYjY2QGtl
cm5lbC5vcmc/cGFydD05CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
