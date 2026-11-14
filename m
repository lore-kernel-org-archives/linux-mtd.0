Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F3606A894
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ur24hwPw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SJXRZ7UC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YScnnrXEL+m7zWVAHctDjo5gRwXAHS8eI//oR7iGZVo=; b=Ur24hwPwnZRlsW/dwFwEyEBirO
	FzqR+YTdcAezjGbrSpTu405ggZuYyeNF/SHOUNoZ+c3dLCDpCvExE8QCucpKehWjbCyYEd1+HKn3l
	inXOdmqFIreRNlJExz/kdjIA0S6LUidtr8dOiGgL3IKuIj8ZtIlpHXH84vLrX+6CbXPHsCOq61JAG
	nCXQ2RSm6RtdrrG0lY9NHeyEYJ7xCnrKaLNlnQ1++x5zK+x/7TUjXMwoMuMDE1VIDdPa0OZuMOYLI
	jet96ciU7k7x5Hz6I4TmHtouxesz/7UXQ1L0gLV1H2SUfhqWp4Wdenxb0TCXmy5HqpMV2usv336rP
	Zs1cLnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTs-0000000FyzA-1AFI;
	Sat, 14 Nov 2026 12:03:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTq-0000000FyyW-4894
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 12:03:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5EDE435E4;
	Sat, 14 Nov 2026 12:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA6C1F000C4;
	Sat, 14 Nov 2026 12:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657818;
	bh=VJvTxxxVKFSKaVy4VwipIwjtqqi4NX20dtdLW1nv+Hc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SJXRZ7UCCdy3QZyo+FxMDY7k8UIUGk6IYo89lBu3JfDwkdzTs3BZnWyGaCc/ULTNn
	 hTClA74WxBneCreuWBl8YFI8tBn7zxnnD9TXVlOMqnV+xQ6uV8PhP1S9SPwJ6ZTpSO
	 5zAHKao9moTQQgbLDO8sbnPffmS1wkAjk8AyR8QA7xbPlYrXri8uKa7QkpNcwLQwID
	 Wxo2z8l+5N6HHOqpdrXitXhs30JB45pi0jnIIoiIE1pk9b1JjFa/5wKPTdMicUZTzV
	 9CQoNePsc39FBbjGyiptDy9bf0aHlUaDlJQsHsyhfRni7RfJyClfhj54WdR0L/qJMM
	 FNvbQxj3FfiCg==
Message-ID: <sashiko-outbox-214468@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/33] ufs: don't set SB_RDONLY after filesystem
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-17-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-17-0be92bb73709@kernel.org>
Date: Sat, 14 Nov 2026 12:03:35 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gdWZzOiBjeWxpbmRlciBn
cm91cCBsZWFrIGFuZCBTQl9SRE9OTFkgY2xlYXIgaW4KICB1ZnNfcmVjb25maWd1cmUoKQotLQoK
Y29tbWl0IGVhZjQxMmY1MzkwZmE2ZjFjMzAwMDEwNDBiMTE4NjYwMTQxYTliZDYKQXV0aG9yOiBD
aHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgoKdWZzOiBkb24ndCBzZXQgU0Jf
UkRPTkxZIGFmdGVyIGZpbGVzeXN0ZW0gZXJyb3JzCgpUaGlzIGNvbW1pdCBzd2l0Y2hlcyB1ZnNf
ZXJyb3IoKSBhbmQgdWZzX3BhbmljKCkgZnJvbSBzZXR0aW5nIFNCX1JET05MWSB0bwpjYWxsaW5n
IHNiX3NldF9lbWVyZ2VuY3lfcm8oKSwgYW5kIGtlZXBzIGN5bGluZGVyIGdyb3VwIHN0cnVjdHVy
ZXMgYWxsb2NhdGVkCmFjcm9zcyByZWFkLW9ubHkgcmVtb3VudHMgYWZ0ZXIgYW4gZXJyb3Igc28g
aW5vZGUgZXZpY3Rpb24gY2FuIHN0aWxsIHVzZQp0aGVtLgoKPiBkaWZmIC0tZ2l0IGEvZnMvdWZz
L3N1cGVyLmMgYi9mcy91ZnMvc3VwZXIuYwo+IGluZGV4IDM1NjlhYzkyYjA2NWIuLmQ4MmNmNzMz
NjBhNzkgMTAwNjQ0Cj4gLS0tIGEvZnMvdWZzL3N1cGVyLmMKPiArKysgYi9mcy91ZnMvc3VwZXIu
YwoKWyAuLi4gXQoKPiBAQCAtMTI2NSwxNCArMTI4MSwyMCBAQCBzdGF0aWMgaW50IHVmc19yZWNv
bmZpZ3VyZShzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4gIAkgKiBmcyB3YXMgbW91dGVkIGFzIHJ3
LCByZW1vdW50aW5nIHJvCj4gIAkgKi8KPiAgCWlmIChmYy0+c2JfZmxhZ3MgJiBTQl9SRE9OTFkp
IHsKPiAtCQl1ZnNfcHV0X3N1cGVyX2ludGVybmFsKHNiKTsKPiAtCQl1c2IxLT5mc190aW1lID0g
dWZzX2dldF9zZWNvbmRzKHNiKTsKPiAtCQlpZiAoKGZsYWdzICYgVUZTX1NUX01BU0spID09IFVG
U19TVF9TVU4KPiAtCQkgIHx8IChmbGFncyAmIFVGU19TVF9NQVNLKSA9PSBVRlNfU1RfU1VOT1MK
PiAtCQkgIHx8IChmbGFncyAmIFVGU19TVF9NQVNLKSA9PSBVRlNfU1RfU1VOeDg2KSAKPiAtCQkJ
dWZzX3NldF9mc19zdGF0ZShzYiwgdXNiMSwgdXNiMywKPiAtCQkJCVVGU19GU09LIC0gZnMzMl90
b19jcHUoc2IsIHVzYjEtPmZzX3RpbWUpKTsKPiAtCQl1YmhfbWFya19idWZmZXJfZGlydHkgKFVT
UElfVUJIKHVzcGkpKTsKPiArCQkvKgo+ICsJCSAqIEFmdGVyIGFuIGVycm9yIGxlYXZlIHRoZSBz
dXBlcmJsb2NrIGFsb25lIGFuZCBrZWVwIHRoZQo+ICsJCSAqIGN5bGluZGVyIGdyb3VwcywgZXZp
Y3Qgc3RpbGwgbmVlZHMgdGhlbS4KPiArCQkgKi8KPiArCQlpZiAoIXNiX2VtZXJnZW5jeV9ybyhz
YikpIHsKPiArCQkJdWZzX3B1dF9zdXBlcl9pbnRlcm5hbChzYik7Cj4gKwkJCXVzYjEtPmZzX3Rp
bWUgPSB1ZnNfZ2V0X3NlY29uZHMoc2IpOwo+ICsJCQlpZiAoKGZsYWdzICYgVUZTX1NUX01BU0sp
ID09IFVGU19TVF9TVU4KPiArCQkJICB8fCAoZmxhZ3MgJiBVRlNfU1RfTUFTSykgPT0gVUZTX1NU
X1NVTk9TCj4gKwkJCSAgfHwgKGZsYWdzICYgVUZTX1NUX01BU0spID09IFVGU19TVF9TVU54ODYp
Cj4gKwkJCQl1ZnNfc2V0X2ZzX3N0YXRlKHNiLCB1c2IxLCB1c2IzLAo+ICsJCQkJCVVGU19GU09L
IC0gZnMzMl90b19jcHUoc2IsIHVzYjEtPmZzX3RpbWUpKTsKPiArCQkJdWJoX21hcmtfYnVmZmVy
X2RpcnR5IChVU1BJX1VCSCh1c3BpKSk7Cj4gKwkJfQo+ICAJCXNiLT5zX2ZsYWdzIHw9IFNCX1JE
T05MWTsKPiAgCX0gZWxzZSB7Cj4gIAkvKgoKW1NldmVyaXR5OiBNZWRpdW1dCkNhbiByZWNvbmZp
Z3VyaW5nIHZpYSBmc3BpY2soKSBhZnRlciBhbiBlcnJvciBhbmQgYSByZWFkLW9ubHkgcmVtb3Vu
dApsZWFrIHRoZSByZXRhaW5lZCBjeWxpbmRlciBncm91cCBzdHJ1Y3R1cmVzIGFuZCBjbGVhciBT
Ql9SRE9OTFk/CgpXaGVuIGEgcmVhZC13cml0ZSBtb3VudCBoaXRzIGFuIGVycm9yIGFuZCBpcyB0
aGVuIHJlbW91bnRlZCByZWFkLW9ubHksCnRoaXMgYnJhbmNoIHNraXBzIHVmc19wdXRfc3VwZXJf
aW50ZXJuYWwoKSBzbyBzYmktPnNfY3NwLCBzYmktPnNfdWNnLCBhbmQKc2JpLT5zX3VjcGkgc3Rh
eSBhbGxvY2F0ZWQgd2hpbGUgU0JfUkRPTkxZIGlzIHNldCBvbiBzYi0+c19mbGFncy4KCklmIHVz
ZXJzcGFjZSB0aGVuIHJlY29uZmlndXJlcyB0aGUgbW91bnQgdmlhIGZzcGljaygpIGFuZCBmc2Nv
bmZpZygpCndpdGhvdXQgc3BlY2lmeWluZyBybyBvciBydyAoZm9yIGV4YW1wbGUsIGNoYW5naW5n
IG9uZXJyb3I9KSwgZmMtPnNiX2ZsYWdzCmFuZCBmYy0+c2JfZmxhZ3NfbWFzayBhcmUgYm90aCAw
LiAgcmVjb25maWd1cmVfc3VwZXIoKSBvbmx5IHJlamVjdHMKc2JfZW1lcmdlbmN5X3JvKHNiKSB3
aGVuIFNCX1JET05MWSBpcyBpbiBmYy0+c2JfZmxhZ3NfbWFzaywgYW5kCnVmc19yZWNvbmZpZ3Vy
ZSgpIGNoZWNrcyAoYm9vbCkoZmMtPnNiX2ZsYWdzICYgU0JfUkRPTkxZKSA9PSBzYl9yZG9ubHko
c2IpCndpdGhvdXQgY29uc3VsdGluZyBmYy0+c2JfZmxhZ3NfbWFzay4gIEV4ZWN1dGlvbiB0aGVu
IGZhbGxzIGludG8gdGhlIGVsc2UKYnJhbmNoLCB3aGVyZSB1ZnNfcmVhZF9jeWxpbmRlcl9zdHJ1
Y3R1cmVzKCkgb3ZlcndyaXRlcyB0aGUgZXhpc3RpbmcKc2JpLT5zX2NzcCwgc2JpLT5zX3VjZywg
YW5kIHNiaS0+c191Y3BpIHBvaW50ZXJzIChsZWFraW5nIG1lbW9yeSBhbmQKYnVmZmVyX2hlYWRz
KSBhbmQgY2xlYXJzIFNCX1JET05MWSBmcm9tIHNiLT5zX2ZsYWdzLgoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTExMy13b3JrLWZz
LXNiX3Jkb25seS12My0wLTBiZTkyYmI3MzcwOUBrZXJuZWwub3JnP3BhcnQ9MTcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
