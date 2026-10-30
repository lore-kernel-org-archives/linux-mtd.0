Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227B606A32E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Iqrs0Ydx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTf12mwh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+BshvLEJ+ttOsOAQwnR4aVTlM9mE/Bjbi/5lmdxg4Hc=; b=Iqrs0YdxRGadEJ3uaVDQW8zLXa
	z/MuKDYhMjla0IUEfV7rQCD9BDyAJWmuIrq9n22G4MJK8yN3Z1GtK4VEu8kW9lwzaDimPpv83eutc
	GJwa/QCY7I6F0GPJWTAj9CbUePlHKkKStsmBw0DpaEXOtEr1rRwP9LJ38IJwhhKzYIaRwqqozzTJ/
	fE3a1yvQWrsow8M7vlyTa8fTx8i2NiFi1oqprG7JwLFO8lVB6tWi6OJa1AW700DwKv2NWlef6QQHt
	aPVolZxZfdgwVzdOGXU+pLb0K8YLiTgKjIdSPOboesiDQaO1xxLE5DysyPYkcpN8FVR0TBZbTTmo1
	0AE66ypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpAx-0000000C5ao-06GN;
	Fri, 30 Oct 2026 16:09:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpAw-0000000C5aX-1RfT
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B79260617;
	Fri, 30 Oct 2026 16:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6618E1F00A1E;
	Fri, 30 Oct 2026 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376593;
	bh=2dFc8Ot80oApMbDR2tgbKCiRs0Ur7pPi8cDZxbTcx58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTf12mwhklBjlUqb3cRkM5KDg5S3wMQNXUK8Ps1PQrb4lDrPs+8SUUbNfVM9k60go
	 sq33nmWdNJP2/ooVyv/A8JtR7SqRH1xaFrIb1wTwPo6tno8R1kmwlWzPOuOQO/Wb36
	 OQY6IWhqk7dvfdBO1gkPftxQ7EYxAYANZe7W/+pTCbn5N4f7GprOcmdd+PU1OuXero
	 I3kdHZd+ycOzNZzOm6wuypLOO/3NkhATjsTlOiNSsaojyULc7J7O95lp2mt2K1FBC9
	 AOyCAtn5x2auHrMhdvw/Z7ZVbCv6dUGswZKj0CubKY1dOwMHIwIGzJXqAoIISsFj0c
	 FMOYsOZHnc1Pw==
Message-ID: <sashiko-outbox-191225@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/34] nilfs2: don't set SB_RDONLY after filesystem
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, "Karl
 Mehltretter" <kmehltretter@gmail.com>, "Ryusuke Konishi" <konishi.ryusuke@gmail.com>, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-6-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-6-2f44f64f0b66@kernel.org>
Date: Fri, 30 Oct 2026 16:09:52 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbmlsZnMyOiBuaWxm
c19yZWNvbmZpZ3VyZSgpIGFuZCBuaWxmc19nZXRfdHJlZSgpIGJ5cGFzcyBzYl9lbWVyZ2VuY3lf
cm8oKQotLQoKY29tbWl0IGZmMTYzZjEyOTdiY2E4OTY0ZjAzNzc2ODY5YzNhOGJjOWUzYzM4YmEK
QXV0aG9yOiBDaHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgoKbmlsZnMyOiBk
b24ndCBzZXQgU0JfUkRPTkxZIGFmdGVyIGZpbGVzeXN0ZW0gZXJyb3JzCgpUaGlzIGNvbW1pdCBy
ZXBsYWNlcyBzZXR0aW5nIFNCX1JET05MWSBpbiBfX25pbGZzX2Vycm9yKCkgd2l0aApzYl9zZXRf
ZW1lcmdlbmN5X3JvKCkgYW5kIGludHJvZHVjZXMgbmlsZnNfc2JfcmRvbmx5KCkgdG8gZ3VhcmQg
d3JpdGUgcGF0aHMKYWZ0ZXIgZmlsZXN5c3RlbSBlcnJvcnMgd2l0aG91dCB0YWtpbmcgc191bW91
bnQuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwOTAzMDYwODU1LjQ2MTAt
MS1rbWVobHRyZXR0ZXJAZ21haWwuY29tCgo+IGRpZmYgLS1naXQgYS9mcy9uaWxmczIvc3VwZXIu
YyBiL2ZzL25pbGZzMi9zdXBlci5jCj4gaW5kZXggMmUzYjU5MWMxMTdjOS4uZWRiN2QzNzllY2Jk
ZiAxMDA2NDQKPiAtLS0gYS9mcy9uaWxmczIvc3VwZXIuYwo+ICsrKyBiL2ZzL25pbGZzMi9zdXBl
ci5jCj4gQEAgLTEzNywxMiArMTM3LDEzIEBAIHZvaWQgX19uaWxmc19lcnJvcihzdHJ1Y3Qgc3Vw
ZXJfYmxvY2sgKnNiLCBjb25zdCBjaGFyICpmdW5jdGlvbiwKPiAgCj4gIAl2YV9lbmQoYXJncyk7
Cj4gIAo+IC0JaWYgKCFzYl9yZG9ubHkoc2IpKSB7Cj4gKwlpZiAoIW5pbGZzX3NiX3Jkb25seShz
YikpIHsKPiAgCQluaWxmc19zZXRfZXJyb3Ioc2IpOwo+ICAKPiAgCQlpZiAobmlsZnNfdGVzdF9v
cHQobmlsZnMsIEVSUk9SU19STykpIHsKPiAgCQkJcHJpbnRrKEtFUk5fQ1JJVCAiUmVtb3VudGlu
ZyBmaWxlc3lzdGVtIHJlYWQtb25seVxuIik7Cj4gLQkJCXNiLT5zX2ZsYWdzIHw9IFNCX1JET05M
WTsKPiArCQkJLyogU0JfUkRPTkxZIG5lZWRzIHNfdW1vdW50LCBzZWUgc2Jfc2V0X2VtZXJnZW5j
eV9ybygpLiAqLwo+ICsJCQlzYl9zZXRfZW1lcmdlbmN5X3JvKHNiKTsKPiAgCQl9Cj4gIAl9Cgpb
IC4uLiBdCgo+IEBAIC0xMTQxLDYgKzExNDYsMTAgQEAgc3RhdGljIGludCBuaWxmc19yZWNvbmZp
Z3VyZShzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4gIAlpZiAoZmMtPnNiX2ZsYWdzICYgU0JfUkRP
TkxZKSB7Cj4gIAkJc2ItPnNfZmxhZ3MgfD0gU0JfUkRPTkxZOwo+ICAKPiArCQkvKiBBZnRlciBh
biBlcnJvciBub3RoaW5nIG1heSBiZSB3cml0dGVuLCBqdXN0IGdvIHJlYWQtb25seS4gKi8KPiAr
CQlpZiAoc2JfZW1lcmdlbmN5X3JvKHNiKSkKPiArCQkJZ290byBvdXQ7Cj4gKwo+ICAJCS8qCj4g
IAkJICogUmVtb3VudGluZyBhIHZhbGlkIFJXIHBhcnRpdGlvbiBSRE9OTFksIHNvIHNldAo+ICAJ
CSAqIHRoZSBSRE9OTFkgZmxhZyBhbmQgdGhlbiBtYXJrIHRoZSBwYXJ0aXRpb24gYXMgdmFsaWQg
YWdhaW4uCj4gQEAgLTExNTIsNiArMTE2MSwxMiBAQCBzdGF0aWMgaW50IG5pbGZzX3JlY29uZmln
dXJlKHN0cnVjdCBmc19jb250ZXh0ICpmYykKPiAgCQlfX3U2NCBmZWF0dXJlczsKPiAgCQlzdHJ1
Y3QgbmlsZnNfcm9vdCAqcm9vdDsKPiAgCj4gKwkJLyogVGhlIFZGUyBkb2Vzbid0IHJlZnVzZSB0
aGlzIHdoZW4gbmlsZnNfZ2V0X3RyZWUoKSBjYWxscyB1cy4gKi8KPiArCQlpZiAoc2JfZW1lcmdl
bmN5X3JvKHNiKSkgewo+ICsJCQllcnIgPSAtRVJPRlM7Cj4gKwkJCWdvdG8gaWdub3JlX29wdHM7
Cj4gKwkJfQo+ICsKCltTZXZlcml0eTogTWVkaXVtXQpDYW4gdGhpcyBzYl9lbWVyZ2VuY3lfcm8o
c2IpIGNoZWNrIGluIHRoZSBlbHNlIGJyYW5jaCBvZiBuaWxmc19yZWNvbmZpZ3VyZSgpCmJlIGJ5
cGFzc2VkIGFmdGVyIGFuIGVycm9yIG9uIGEgcmVhZC13cml0ZSBtb3VudD8KCldoZW4gX19uaWxm
c19lcnJvcigpIGNhbGxzIHNiX3NldF9lbWVyZ2VuY3lfcm8oc2IpIG9uIGEgcmVhZC13cml0ZSBt
b3VudCwKU0JfUkRPTkxZIGlzIG5vdCBzZXQgaW4gc2ItPnNfZmxhZ3MsIHNvIHNiX3Jkb25seShz
YikgcmVtYWlucyBmYWxzZS4KCkluIG5pbGZzX3JlY29uZmlndXJlKCksIHJpZ2h0IGJlZm9yZSB0
aGUgaWYgKGZjLT5zYl9mbGFncyAmIFNCX1JET05MWSkgYmxvY2s6CgoJaWYgKChib29sKShmYy0+
c2JfZmxhZ3MgJiBTQl9SRE9OTFkpID09IHNiX3Jkb25seShzYikpCgkJZ290byBvdXQ7CgpXaGVu
IGEgcmVhZC13cml0ZSBtb3VudCBvciByZW1vdW50IGlzIHJlcXVlc3RlZCAoIShmYy0+c2JfZmxh
Z3MgJiBTQl9SRE9OTFkpKQpvbiBhIHN1cGVyYmxvY2sgd2hlcmUgc2JfZW1lcmdlbmN5X3JvKHNi
KSBpcyB0cnVlIGFuZCBzYl9yZG9ubHkoc2IpIGlzIHN0aWxsCmZhbHNlIChmb3IgZXhhbXBsZSwg
dmlhIG5pbGZzX2dldF90cmVlKCkgLT4gbmlsZnNfcmVjb25maWd1cmUoKSB3aGVuIHRoZQpzdXBl
cmJsb2NrIHdhcyBrZXB0IGFsaXZlIGJ5IGEgc25hcHNob3QgYWZ0ZXIgdGhlIGNvcnJ1cHRlZCBy
ZWFkLXdyaXRlIG1vdW50CndhcyB1bm1vdW50ZWQsIG9yIHZpYSByZWNvbmZpZ3VyZV9zdXBlcigp
IC0+IG5pbGZzX3JlY29uZmlndXJlKCkgb24gYSBkaXJlY3QKcmVtb3VudCxydyB3aXRob3V0IGFu
IGludGVybWVkaWF0ZSByZW1vdW50LHJvKSwgdGhpcyBjb21wYXJpc29uIGV2YWx1YXRlcwpmYWxz
ZSA9PSBmYWxzZSBhbmQganVtcHMgc3RyYWlnaHQgdG8gb3V0LCBvdmVyd3JpdGluZyBuaWxmcy0+
bnNfbW91bnRfb3B0IGFuZApyZXR1cm5pbmcgMCBpbnN0ZWFkIG9mIC1FUk9GUy4KCkFsc28sIGlu
IG5pbGZzX2dldF90cmVlKCksIHdoZW4gbmlsZnNfdHJlZV9pc19idXN5KHMtPnNfcm9vdCkgaXMg
dHJ1ZToKCgl9IGVsc2UgaWYgKCFjdHgtPmNubykgewoJCWlmIChuaWxmc190cmVlX2lzX2J1c3ko
cy0+c19yb290KSkgewoJCQlpZiAoKGZjLT5zYl9mbGFncyBeIHMtPnNfZmxhZ3MpICYgU0JfUkRP
TkxZKSB7CgkJCQluaWxmc19lcnIocywKCQkJCQkgICJ0aGUgZGV2aWNlIGFscmVhZHkgaGFzIGEg
JXMgbW91bnQuIiwKCQkJCQkgIHNiX3Jkb25seShzKSA/ICJyZWFkLW9ubHkiIDogInJlYWQvd3Jp
dGUiKTsKCQkJCWVyciA9IC1FQlVTWTsKCQkJCWdvdG8gZmFpbGVkX3N1cGVyOwoJCQl9CgpCZWNh
dXNlIHMtPnNfZmxhZ3MgZG9lcyBub3QgaGF2ZSBTQl9SRE9OTFkgc2V0IGFmdGVyIHNiX3NldF9l
bWVyZ2VuY3lfcm8ocyksCmRvZXNuJ3QgdGhpcyB0cmVhdCB0aGUgZW1lcmdlbmN5IHJlYWQtb25s
eSBzdXBlcmJsb2NrIGFzIHJlYWQvd3JpdGUsIHJlamVjdGluZwphIHNlY29uZGFyeSByZWFkLW9u
bHkgbW91bnQgd2l0aCAtRUJVU1kgd2hpbGUgYWxsb3dpbmcgYSBzZWNvbmRhcnkgcmVhZC13cml0
ZQptb3VudD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjEwMjktd29yay1mcy1zYl9yZG9ubHktdjItMC0yZjQ0ZjY0ZjBiNjZAa2Vy
bmVsLm9yZz9wYXJ0PTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
