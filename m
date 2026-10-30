Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A6C606A33A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rpe4NdnN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMKXxT+B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PDXYZSqcB7is2hDBq6pVdImif6Xif/HNxPHWn7fzP2Q=; b=Rpe4NdnNrscUs5q5LjVC7tE2u0
	qwKJvwL4G57FmTYu6DIL60QZ2aFC3MqT5ZcNcgPJEA4UguzxK69rrstd5QTOq5oqknzZ35WXWgM1M
	2hUNqqVJSGdQSU2w2BHVR1lTEZNAJpv6cFIEbUi3s49/rVjOODP0jtwN47uUMtie8EbeXNwqE/Zao
	PLK/3zFWZ0NxT5hMqKKO/LZdGcLMcRoTtIXa9LYDMRtUsRJ4bbmmuPRL4rn8HwvhxZpDymIH57FcG
	NnjJKZmtVJxMyrLGExRRYseEHAPhZ3nlQfgs0hviB0xKobvqI3rvC2USf5nQobLmr4eMRPYJ9s6Fq
	fOdf4Qdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpAu-0000000C5a4-3Bj4;
	Fri, 30 Oct 2026 16:09:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpAt-0000000C5Zv-0eCY
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:09:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF77B602CA;
	Fri, 30 Oct 2026 16:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68531F0093A;
	Fri, 30 Oct 2026 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376589;
	bh=/Mychch7C97ZshwEL9ueE88CfYbxixMq3ZaDwvqpgks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RMKXxT+B4dNKzdHHvyHv7QRa6GglJeLRWrTxOikxDwc+SHMb9xEBrc8c1E9TrVOgi
	 mGRCZmfYcTpwdmiI/rDvNEsuRV9zmPLQs9306hQFzPqtnwO1tweYM6fsBJmWTJHCls
	 M60ZKwJvGWH6hZPdqx5fTZg68tpin62dI971F3w0H7Evh06LXtdzT/FuCJKVvucO4h
	 9kTAPmXgB97nIAHmjSnQLmOlFmtmqO4k81UX7OuFWTo/Ti9+6gy8rvCksSOeO5HcOA
	 nP8VIjciRIKaR9iRXnHUu4XmgWL2lJe7XKja19iNq7XFA4nJOjWleVOBosgPGKedBh
	 ZR6+8hCxaOHHQ==
Message-ID: <sashiko-outbox-191221@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/34] ecryptfs: fall back to a read-only lower file
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-2-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-2-2f44f64f0b66@kernel.org>
Date: Fri, 30 Oct 2026 16:09:48 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZWNyeXB0ZnM6IEVD
UllQVEZTX0tFWV9WQUxJRCBsZWZ0IHNldCBhZnRlciBlY3J5cHRmc19pbml0aWFsaXplX2ZpbGUo
KSBmYWlscwotLQoKY29tbWl0IGY3ZGJjNzg1YTMzZjBhMTg4YjYyZjFkMGFlNmMyNGU1ZmMzMmE2
MmMKQXV0aG9yOiBDaHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgoKZWNyeXB0
ZnM6IGZhbGwgYmFjayB0byBhIHJlYWQtb25seSBsb3dlciBmaWxlCgpUaGlzIGNvbW1pdCBmYWxs
cyBiYWNrIHRvIG9wZW5pbmcgdGhlIGxvd2VyIGZpbGUgcmVhZC1vbmx5IHdoZW4gb3BlbmluZyBp
dApyZWFkLXdyaXRlIGZhaWxzIHdpdGggRVJPRlMsIGFuZCByZWplY3RzIHdyaXRlcyB0byBhIHJl
YWQtb25seSBsb3dlciBmaWxlIGluCmVjcnlwdGZzX3dyaXRlX2xvd2VyKCkgYW5kIF9fZWNyeXB0
ZnNfdHJ1bmNhdGUoKSB3aXRoIEVST0ZTLgoKPiBkaWZmIC0tZ2l0IGEvZnMvZWNyeXB0ZnMvcmVh
ZF93cml0ZS5jIGIvZnMvZWNyeXB0ZnMvcmVhZF93cml0ZS5jCj4gaW5kZXggYjNiNDUxYzJiOTQx
MC4uYjM5NTZhZTUwZmY2NiAxMDA2NDQKPiAtLS0gYS9mcy9lY3J5cHRmcy9yZWFkX3dyaXRlLmMK
PiArKysgYi9mcy9lY3J5cHRmcy9yZWFkX3dyaXRlLmMKPiBAQCAtMzMsNiArMzMsOSBAQCBpbnQg
ZWNyeXB0ZnNfd3JpdGVfbG93ZXIoc3RydWN0IGlub2RlICplY3J5cHRmc19pbm9kZSwgY2hhciAq
ZGF0YSwKPiAgCWxvd2VyX2ZpbGUgPSBlY3J5cHRmc19pbm9kZV90b19wcml2YXRlKGVjcnlwdGZz
X2lub2RlKS0+bG93ZXJfZmlsZTsKPiAgCWlmICghbG93ZXJfZmlsZSkKPiAgCQlyZXR1cm4gLUVJ
TzsKPiArCS8qIGVjcnlwdGZzX29wZW5fbG93ZXIoKSBtYXkgaGF2ZSBmYWxsZW4gYmFjayB0byBh
IHJlYWQtb25seSBmaWxlLiAqLwo+ICsJaWYgKCEobG93ZXJfZmlsZS0+Zl9tb2RlICYgRk1PREVf
V1JJVEUpKQo+ICsJCXJldHVybiAtRVJPRlM7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KV2hlbiBvcGVu
aW5nIGFuIGV4aXN0aW5nIDAtYnl0ZSBsb3dlciBmaWxlIHdpdGggT19SRE9OTFkgb24gYSByZWFk
LW9ubHkgbG93ZXIKbW91bnQgKG9yIGEgbG93ZXIgZmlsZXN5c3RlbSBpbiBhbiBlcnJvciBzdGF0
ZSkgd2l0aCBkZWZhdWx0IG1vdW50IG9wdGlvbnMsCmVjcnlwdGZzX29wZW4oKSBzZXRzIEVDUllQ
VEZTX1BPTElDWV9BUFBMSUVEIHwgRUNSWVBURlNfRU5DUllQVEVEIG9uCmNyeXB0X3N0YXQtPmZs
YWdzIGFuZCBjYWxscyByZWFkX29yX2luaXRpYWxpemVfbWV0YWRhdGEoKS4KCkJlY2F1c2UgdGhl
IGxvd2VyIGZpbGUgaXMgZW1wdHksIGVjcnlwdGZzX3JlYWRfbWV0YWRhdGEoKSBmYWlscyBhbmQK
cmVhZF9vcl9pbml0aWFsaXplX21ldGFkYXRhKCkgY2FsbHMgZWNyeXB0ZnNfaW5pdGlhbGl6ZV9m
aWxlKCk6Cgpmcy9lY3J5cHRmcy9pbm9kZS5jOmVjcnlwdGZzX2luaXRpYWxpemVfZmlsZSgpIHsK
CXJjID0gZWNyeXB0ZnNfbmV3X2ZpbGVfY29udGV4dChlY3J5cHRmc19pbm9kZSk7CglpZiAocmMp
IHsKCQkuLi4KCQlnb3RvIG91dDsKCX0KCXJjID0gZWNyeXB0ZnNfZ2V0X2xvd2VyX2ZpbGUoZWNy
eXB0ZnNfZGVudHJ5LCBlY3J5cHRmc19pbm9kZSk7CgkuLi4KCXJjID0gZWNyeXB0ZnNfd3JpdGVf
bWV0YWRhdGEoZWNyeXB0ZnNfZGVudHJ5LCBlY3J5cHRmc19pbm9kZSk7CglpZiAocmMpCgkJcHJp
bnRrKEtFUk5fRVJSICJFcnJvciB3cml0aW5nIGhlYWRlcnM7IHJjID0gWyVkXVxuIiwgcmMpOwoJ
ZWNyeXB0ZnNfcHV0X2xvd2VyX2ZpbGUoZWNyeXB0ZnNfaW5vZGUpOwpvdXQ6CglyZXR1cm4gcmM7
Cn0KCmVjcnlwdGZzX25ld19maWxlX2NvbnRleHQoKSBzZXRzIEVDUllQVEZTX0VOQ1JZUFRFRCB8
IEVDUllQVEZTX0tFWV9WQUxJRCBpbgpjcnlwdF9zdGF0LT5mbGFncyBiZWZvcmUgZWNyeXB0ZnNf
d3JpdGVfbWV0YWRhdGEoKSBjYWxscwplY3J5cHRmc193cml0ZV9sb3dlcigpIGFuZCBmYWlscyB3
aXRoIC1FUk9GUy4gTmVpdGhlcgplY3J5cHRmc19pbml0aWFsaXplX2ZpbGUoKSBub3IgcmVhZF9v
cl9pbml0aWFsaXplX21ldGFkYXRhKCkgY2xlYXJzCkVDUllQVEZTX0tFWV9WQUxJRCAob3IgRUNS
WVBURlNfUE9MSUNZX0FQUExJRUQpIG9uIGZhaWx1cmUuCgpPbiBhIHNlY29uZCBvcGVuKE9fUkRP
TkxZKSBvciBlY3J5cHRmc19zZXRhdHRyKCkgb24gdGhlIHNhbWUgY2FjaGVkIGlub2RlLApyZWFk
X29yX2luaXRpYWxpemVfbWV0YWRhdGEoKSBjaGVja3MgdGhlIGZsYWdzIGF0IHRoZSBzdGFydCBv
ZiB0aGUgZnVuY3Rpb246Cgpmcy9lY3J5cHRmcy9maWxlLmM6cmVhZF9vcl9pbml0aWFsaXplX21l
dGFkYXRhKCkgewoJaWYgKGNyeXB0X3N0YXQtPmZsYWdzICYgRUNSWVBURlNfUE9MSUNZX0FQUExJ
RUQgJiYKCSAgICBjcnlwdF9zdGF0LT5mbGFncyAmIEVDUllQVEZTX0tFWV9WQUxJRCkgewoJCXJj
ID0gMDsKCQlnb3RvIG91dDsKCX0KCS4uLgp9CgpCZWNhdXNlIGJvdGggZmxhZ3MgcmVtYWluIHNl
dCBmcm9tIHRoZSBmYWlsZWQgaW5pdGlhbGl6YXRpb24sIGRvZXMgdGhlIHNlY29uZApvcGVuIHNo
b3J0LWNpcmN1aXQgbWV0YWRhdGEgdmFsaWRhdGlvbiBhbmQgc3VjY2VlZCBvbiB0aGUgdW5pbml0
aWFsaXplZCBlbXB0eQpmaWxlIChhbmQgaWYgdGhlIGxvd2VyIG1vdW50IGlzIGxhdGVyIHJlbW91
bnRlZCByZWFkLXdyaXRlLCBhbGxvdyB3cml0ZXMgdXNpbmcKYW4gaW4tbWVtb3J5IGtleSB3aG9z
ZSBoZWFkZXIgd2FzIG5ldmVyIHdyaXR0ZW4gdG8gZGlzayk/CgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDI5LXdvcmstZnMtc2Jf
cmRvbmx5LXYyLTAtMmY0NGY2NGYwYjY2QGtlcm5lbC5vcmc/cGFydD0yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
