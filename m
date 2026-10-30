Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB762606A327
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xhxRlxKP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oz9Ftrt2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QroKsuB8vtdPw/hkC0/or3gFydo+wfltBhe8IegQNiU=; b=xhxRlxKPif4vRjDeIosDipxrty
	3zcRGxoiGJAB7VKxFbrubOKRdljD/Fh7JVWr7xo1W2Ccg+v//7+YozNEzYYctEaHhKI+psYHWCG8s
	3d6CFT/8rF8EFX+YkCMy8j8DiDUt+qYjlXLBAmAhHKCuq9EwsO1xrf8GGHFXUSz8TbLUi4P5JcpuF
	WALmn8Hr3fHgyMUELlym2Rz5K5AijjTzb4E9C/Q4nFHsm8s19radvfnyIS0nx2A3wRpm2/ZcCdrm7
	gHao4M0VpZAoMQ6WA0EgY25yIvopdyQ8mZvw15IWVhD862Mv3MEieksb//ircPrCT4FX0HDIh34oR
	zsLVomGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpB6-0000000C5lH-29pM;
	Fri, 30 Oct 2026 16:10:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpB5-0000000C5k7-2sEE
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:10:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 236E2608FB;
	Fri, 30 Oct 2026 16:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA371F0093A;
	Fri, 30 Oct 2026 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376602;
	bh=W80RP8FoHcI+JtK0co8C0FcIxUgtBISIXczR1g6Mk8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oz9Ftrt2DCKtVYEclvb2IsRVsVZY0+KLOxvclWtXQMyQkAc2/gr9d/pToHs7+DGSD
	 6QaBUMlIR5kFTl7XlSBE0o+nfLKzimy+hsd+qtIDOI3ThoAk0HUt8Cfmofb/3I8cBd
	 S7bFfYj5Zw6JrrYKw24Sqze4VYer6x/zxNqvyM+9iXMdiX7lC7YYr47CzmRa0ldb0x
	 NLewi3zJ9/UYqMrg1QDri/X9tBEtDWCxZzMDZVqY+u6+5vV5z8CCgm3DqM2A8OMwHV
	 nH6lkHTv4tiKlb9q69Y3HR7qFyZJs3b5eL/s+fHMxOiIiLPNmDEamztcGjWBJAjK3u
	 ic88NhQqJjWdA==
Message-ID: <sashiko-outbox-191235@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/34] hpfs: don't set SB_RDONLY after filesystem
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-16-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-16-2f44f64f0b66@kernel.org>
Date: Fri, 30 Oct 2026 16:10:01 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaHBmczogcmVtb3Vu
dCBydyBhZnRlciBlcnJvciBzdWNjZWVkcyBhbmQgd3JpdGVzIHNwYXJlIGJsb2NrIGluIG1hcmtf
ZGlydHkoKQotLQoKY29tbWl0IDFlOGQ4NDY2MjJhZjg3MmVjMmFhYjI5Y2FmMDk5MGZjYzIwYWMy
ZjIKQXV0aG9yOiBDaHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgoKaHBmczog
ZG9uJ3Qgc2V0IFNCX1JET05MWSBhZnRlciBmaWxlc3lzdGVtIGVycm9ycwoKVGhpcyBjb21taXQg
dXBkYXRlcyBocGZzX2Vycm9yKCkgdG8gY2FsbCBzYl9zZXRfZW1lcmdlbmN5X3JvKCkgaW5zdGVh
ZCBvZgpzZXR0aW5nIFNCX1JET05MWSBkaXJlY3RseSBvbmNlIFNCX0JPUk4gaXMgc2V0LCBhdm9p
ZGluZyBhIGhhbmcgaW4KdGhhd19zdXBlcigpIHdoZW4gYW4gZXJyb3Igb2NjdXJzIHdoaWxlIHRo
ZSBmaWxlc3lzdGVtIGlzIGZyb3plbi4gSXQgYWxzbwp1cGRhdGVzIGhwZnNfdHJpbV9mcygpLCBo
cGZzX2xvb2t1cCgpLCBocGZzX21hcF9kbm9kZSgpLCBhbmQgdW5tYXJrX2RpcnR5KCkKdG8gY2hl
Y2sgc2JfZW1lcmdlbmN5X3JvKCkuCgo+IGRpZmYgLS1naXQgYS9mcy9ocGZzL3N1cGVyLmMgYi9m
cy9ocGZzL3N1cGVyLmMKPiBpbmRleCA4ZmJkYmYwODA2Mjc2Li5hYjg5ZTYyNGNkNTE3IDEwMDY0
NAo+IC0tLSBhL2ZzL2hwZnMvc3VwZXIuYwo+ICsrKyBiL2ZzL2hwZnMvc3VwZXIuYwpbIC4uLiBd
Cj4gQEAgLTgxLDcgKzgxLDE0IEBAIHZvaWQgaHBmc19lcnJvcihzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnMsIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+ICAJCQllbHNlIHsKPiAgCQkJCXByX2NvbnQoIjsg
cmVtb3VudGluZyByZWFkLW9ubHlcbiIpOwo+ICAJCQkJbWFya19kaXJ0eShzLCAwKTsKPiAtCQkJ
CXMtPnNfZmxhZ3MgfD0gU0JfUkRPTkxZOwo+ICsJCQkJLyoKPiArCQkJCSAqIEJlZm9yZSBTQl9C
T1JOIHRoZSBtb3VudGVyIGhvbGRzIHNfdW1vdW50LAo+ICsJCQkJICogbGF0ZXIgc2VlIHNiX3Nl
dF9lbWVyZ2VuY3lfcm8oKS4KPiArCQkJCSAqLwo+ICsJCQkJaWYgKHMtPnNfZmxhZ3MgJiBTQl9C
T1JOKQo+ICsJCQkJCXNiX3NldF9lbWVyZ2VuY3lfcm8ocyk7Cj4gKwkJCQllbHNlCj4gKwkJCQkJ
cy0+c19mbGFncyB8PSBTQl9SRE9OTFk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KV2hlbiBhIHJ1bnRp
bWUgZXJyb3Igb2NjdXJzIG9uIGEgcmVhZC13cml0ZSBtb3VudCBhZnRlciBTQl9CT1JOIGlzIHNl
dCwKaHBmc19lcnJvcigpIGNhbGxzIHNiX3NldF9lbWVyZ2VuY3lfcm8ocykgd2l0aG91dCBzZXR0
aW5nIFNCX1JET05MWSBpbgpzLT5zX2ZsYWdzLCBsZWF2aW5nIHNiX3Jkb25seShzKSBmYWxzZS4K
CklmIHVzZXJzcGFjZSB0aGVuIGF0dGVtcHRzIHRvIHJlbW91bnQgcmVhZC13cml0ZSAob3IgcmVj
b25maWd1cmVzIG1vdW50Cm9wdGlvbnMgd2l0aG91dCBTQl9SRE9OTFkpLCByZWNvbmZpZ3VyZV9z
dXBlcigpIGluIGZzL3N1cGVyLmMgY2hlY2tzOgoKCXJlbW91bnRfcncgPSAhKGZjLT5zYl9mbGFn
cyAmIFNCX1JET05MWSkgJiYgc2JfcmRvbmx5KHNiKTsKCXJlbW91bnRfcm8gPSAoZmMtPnNiX2Zs
YWdzICYgU0JfUkRPTkxZKSAmJiAhc2JfcmRvbmx5KHNiKTsKICAgIC4uLgoJaWYgKHJlbW91bnRf
cncgJiYgc2JfZW1lcmdlbmN5X3JvKHNiKSkKCQlyZXR1cm4gLUVST0ZTOwoKQmVjYXVzZSBzYl9y
ZG9ubHkoc2IpIGlzIGZhbHNlLCByZW1vdW50X3J3IGV2YWx1YXRlcyB0byBmYWxzZSBhbmQgYnlw
YXNzZXMKdGhlIC1FUk9GUyBjaGVjay4gcmVjb25maWd1cmVfc3VwZXIoKSB0aGVuIHByb2NlZWRz
IGludG8gaHBmc19yZWNvbmZpZ3VyZSgpCmluIGZzL2hwZnMvc3VwZXIuYzoKCglpZiAoIShmYy0+
c2JfZmxhZ3MgJiBTQl9SRE9OTFkpKSBtYXJrX2RpcnR5KHMsIDEpOwoKCWhwZnNfdW5sb2NrKHMp
OwoJcmV0dXJuIDA7CgpBbmQgbWFya19kaXJ0eSgpIGluIGZzL2hwZnMvc3VwZXIuYyBjaGVja3M6
CgoJaWYgKGhwZnNfc2IocyktPnNiX2Noa2RzayAmJiAocmVtb3VudCB8fCAhc2JfcmRvbmx5KHMp
KSkgewoJCXN0cnVjdCBidWZmZXJfaGVhZCAqYmg7CgkJc3RydWN0IGhwZnNfc3BhcmVfYmxvY2sg
KnNiOwoJCWlmICgoc2IgPSBocGZzX21hcF9zZWN0b3IocywgMTcsICZiaCwgMCkpKSB7CgkJCXNi
LT5kaXJ0eSA9IDE7CgkJCXNiLT5vbGRfd3JvdGUgPSAwOwoJCQltYXJrX2J1ZmZlcl9kaXJ0eShi
aCk7CgkJCXN5bmNfZGlydHlfYnVmZmVyKGJoKTsKCQkJYnJlbHNlKGJoKTsKCQl9Cgl9CgpVbmxp
a2UgdW5tYXJrX2RpcnR5KCksIG5laXRoZXIgaHBmc19yZWNvbmZpZ3VyZSgpIG5vciBtYXJrX2Rp
cnR5KCkgY2hlY2tzCnNiX2VtZXJnZW5jeV9ybyhzKS4KCkRvZXMgdGhpcyBhbGxvdyBhIHJlYWQt
d3JpdGUgcmVtb3VudCBvciByZWNvbmZpZ3VyZSBhZnRlciBhbiBlcnJvciB0bwpzdWNjZWVkIGFu
ZCBzeW5jaHJvbm91c2x5IHdyaXRlIHRoZSBzcGFyZSBibG9jayBhdCBzZWN0b3IgMTcgdmlhCm1h
cmtfZGlydHkoKT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjEwMjktd29yay1mcy1zYl9yZG9ubHktdjItMC0yZjQ0ZjY0ZjBiNjZA
a2VybmVsLm9yZz9wYXJ0PTE2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
