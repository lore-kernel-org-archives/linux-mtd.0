Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC40606A323
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n+9s3brP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VTkZ9H3k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z2JZL5UY1LarLZwSLOuWvFKwFzQJ3zge/+nnm56KihM=; b=n+9s3brP8pwL/OWuSSqxJs3aHQ
	3pI1aiJEzJdDMsA9SK0YuEVCTlUlTgk95jYSBe7IXWib2rHLJHfyXO75D2Ai25fuPE5fXMbpmPU3J
	ZlvzKXa+z/uEFxSiBIlKK6ngt8HiXpv45hJLDRqD2GV3ZiRBRUznigezUABQj1NHEI5OLFsjk6Joe
	YMD0SkvHbCm26Eg9UZz+5wM29ERwWLlLLtofB6p2sE4j5j3otV8HywwgH6wnu7xsuGX4qQxuh8AO3
	iWg6N7xnRM6u+3vBla6QXAvECYKOuEpDJOwlgsnRm5WLvR66WFtCKbSbYWRXm/Ype6yKdYw7nSXh5
	7GhQ92Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTl-0000000Fytm-02Q8;
	Sat, 14 Nov 2026 12:03:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTj-0000000FysB-3ddW
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 12:03:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CCF4602D3;
	Sat, 14 Nov 2026 12:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2641F000C4;
	Sat, 14 Nov 2026 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657811;
	bh=m8bjqjOZXXJPj1tfqG9iwnas9qJ8BH37nqepWAHXyz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VTkZ9H3kLYaSH+ftQJare6BeAJ35leW2srLLeVqVNkIYufakLwc9qsPh7q6PyK+GQ
	 2ESGn5N0LRUxkvTDHqu/Iodt7hjLHU2IBpfcd6KHkZ4X5RchqdoqPfjR2gvnP7Jzzi
	 v3r7/NXEE33bdYANLq7Kc1uharlCSFFOH1YrAdyf8EjtHgqtSd5DAIGxLsopxrYOA7
	 c5UFB4cjnyUOFj3v6kLAgLIBJGi137K/4UixHmfbUnRHqyoCrZVv17A0U1XRCHd3IW
	 xnyP/lx78ekHV4o2o9rHn12pw/WS+rCrGk1Nvtjm8XCbZZO/7VDsyEf+np+R0r3kEP
	 shGz027E42Ciw==
Message-ID: <sashiko-outbox-214462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/33] exfat: don't set SB_RDONLY after filesystem
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-11-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-11-0be92bb73709@kernel.org>
Date: Sat, 14 Nov 2026 12:03:30 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZXhmYXQ6IGV4ZmF0X3Bh
Z2VfbWt3cml0ZSgpIGNoZWNrcyBlbWVyZ2VuY3kgc3RhdGUgYW5kCiAgZGlydGllcyBiZWZvcmUg
c2Jfc3RhcnRfcGFnZWZhdWx0KCkKLS0KCmNvbW1pdCBlMTI3NWQ0YzA0OTI4YzgzNGE2YTM0ZjZi
MzEzM2M4OWMyNzJjMDg1CkF1dGhvcjogQ2hyaXN0aWFuIEJyYXVuZXIgPGJyYXVuZXJAa2VybmVs
Lm9yZz4KCmV4ZmF0OiBkb24ndCBzZXQgU0JfUkRPTkxZIGFmdGVyIGZpbGVzeXN0ZW0gZXJyb3Jz
CgpUaGlzIGNvbW1pdCByZXBsYWNlcyBzZXR0aW5nIFNCX1JET05MWSBvbiBydW50aW1lIGZpbGVz
eXN0ZW0gZXJyb3JzIHdpdGggYW4KRVhGQVRfRkxBR1NfRU1FUkdFTkNZX1JPIGZsYWcgYW5kIGNo
ZWNrcyBleGZhdF9lbWVyZ2VuY3lfc3RhdGUoKSBhY3Jvc3Mgd3JpdGUKYW5kIG1vZGlmaWNhdGlv
biBwYXRocyBzbyBmcm96ZW4gZmlsZXN5c3RlbXMgY2FuIHRoYXcgY2xlYW5seS4KCj4gZGlmZiAt
LWdpdCBhL2ZzL2V4ZmF0L2ZpbGUuYyBiL2ZzL2V4ZmF0L2ZpbGUuYwo+IGluZGV4IDEzODYxNDk5
MTZiYmUuLmRkZGVkZjZlNzVkYTYgMTAwNjQ0Cj4gLS0tIGEvZnMvZXhmYXQvZmlsZS5jCj4gKysr
IGIvZnMvZXhmYXQvZmlsZS5jClsgLi4uIF0KPiBAQCAtOTc0LDYgKzk4NywxMSBAQCBzdGF0aWMg
dm1fZmF1bHRfdCBleGZhdF9wYWdlX21rd3JpdGUoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4gIAlz
dHJ1Y3QgZXhmYXRfaW5vZGVfaW5mbyAqZWkgPSBFWEZBVF9JKGlub2RlKTsKPiAgCXZtX2ZhdWx0
X3QgcmV0Owo+ICAJbG9mZl90IG5ld192YWxpZF9zaXplLCBtbWFwX3ZhbGlkX3NpemUsIGZhdWx0
X3BhZ2Vfc3RhcnQ7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCWVyciA9IGV4ZmF0X2VtZXJnZW5jeV9z
dGF0ZShpbm9kZS0+aV9zYik7Cj4gKwlpZiAodW5saWtlbHkoZXJyKSkKPiArCQlyZXR1cm4gdm1m
X2ZzX2Vycm9yKGVycik7Cj4gIAo+ICAJaWYgKCFpbm9kZV90cnlsb2NrKGlub2RlKSkKPiAgCQly
ZXR1cm4gVk1fRkFVTFRfUkVUUlk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KQ2FuIGEgd3JpdGUgZmF1
bHQgdGhhdCBibG9ja3MgaW4gc2Jfc3RhcnRfcGFnZWZhdWx0KCkgYnlwYXNzCmV4ZmF0X2VtZXJn
ZW5jeV9zdGF0ZSgpIGlmIGEgZmlsZXN5c3RlbSBlcnJvciBvciBzaHV0ZG93biBoYXBwZW5zIHdo
aWxlIHRoZQpmaWxlc3lzdGVtIGlzIGZyb3plbj8KCkNQVTAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBDUFUxCmV4ZmF0X3BhZ2VfbWt3cml0ZSgpCiAgZXhmYXRfZW1lcmdlbmN5
X3N0YXRlKHNiKSAtPiAwCiAgaW5vZGVfdHJ5bG9jayhpbm9kZSkKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJkZXZfZnJlZXplKCkKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC4uLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgX19leGZhdF9mc19lcnJvcigpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNldF9iaXQoRVhGQVRfRkxBR1NfRU1FUkdFTkNZX1JPLCAuLi4pCiAgc2Jfc3Rh
cnRfcGFnZWZhdWx0KHNiKQogICAgLyogd2FpdHMgZm9yIHRoYXcgKi8KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJkZXZfdGhhdygpCiAgZmlsZV91cGRhdGVfdGltZSgu
Li4pCiAgaW9tYXBfcGFnZV9ta3dyaXRlKC4uLikgICAgICAgICAgICAgICA8LS0gaW5zdGFsbHMg
d3JpdGFibGUgUFRFIGFmdGVyIGVycm9yCgpCZWNhdXNlIHNiX3N0YXJ0X3BhZ2VmYXVsdCgpIGlz
IGNhbGxlZCBuZWFyIHRoZSBib3R0b20gb2YKZXhmYXRfcGFnZV9ta3dyaXRlKCksIGFmdGVyIGV4
ZmF0X3ByZXBhcmVfdmFsaWRfcmFuZ2UoKSBhbmQKbWFya19pbm9kZV9kaXJ0eSgpLCBhIGZhdWx0
IGFycml2aW5nIG9uIGFuIGFscmVhZHktZnJvemVuIGZpbGVzeXN0ZW0gY2FuCmFsc28gZGlydHkg
Z2FwIGZvbGlvcyBhbmQgdGhlIGlub2RlIHdoaWxlIGZyb3plbiBhbmQgdGhlbiBzbGVlcCBpbgpz
Yl9zdGFydF9wYWdlZmF1bHQoKSB3aGlsZSBob2xkaW5nIGlub2RlLT5pX3J3c2VtOgoKZnMvZXhm
YXQvZmlsZS5jOmV4ZmF0X3BhZ2VfbWt3cml0ZSgpIHsKICAgIC4uLgoJCWV4ZmF0X2FkdmFuY2Vf
emVyb2VkX3NpemUoZWksCgkJCQlyb3VuZF91cChuZXdfdmFsaWRfc2l6ZSwgaV9ibG9ja3NpemUo
aW5vZGUpKSk7CgkJZXhmYXRfc2V0X3ZhbGlkX3NpemUoZWksIG5ld192YWxpZF9zaXplKTsKCQlt
YXJrX2lub2RlX2RpcnR5KGlub2RlKTsKCX0KCglzYl9zdGFydF9wYWdlZmF1bHQoaW5vZGUtPmlf
c2IpOwoJZmlsZV91cGRhdGVfdGltZSh2bWYtPnZtYS0+dm1fZmlsZSk7CgoJZmlsZW1hcF9pbnZh
bGlkYXRlX2xvY2tfc2hhcmVkKGlub2RlLT5pX21hcHBpbmcpOwoJcmV0ID0gaW9tYXBfcGFnZV9t
a3dyaXRlKHZtZiwgJmV4ZmF0X2lvbWFwX29wcywgTlVMTCk7CiAgICAuLi4KfQoKQ2FsbGluZyBz
Yl9zdGFydF9wYWdlZmF1bHQoKSBiZWZvcmUgaW5vZGVfdHJ5bG9jaygpIGFuZCBjaGVja2luZwpl
eGZhdF9lbWVyZ2VuY3lfc3RhdGUoKSBhZnRlciBhY3F1aXJpbmcgZnJlZXplIHByb3RlY3Rpb24g
d291bGQgYXZvaWQgYm90aApkaXJ0eWluZyBzdGF0ZSB3aGlsZSBmcm96ZW4gYW5kIG1pc3Npbmcg
YW4gZXJyb3IgdGhhdCBvY2N1cnJlZCBkdXJpbmcgdGhlCmZyZWV6ZS4KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTMtd29yay1m
cy1zYl9yZG9ubHktdjMtMC0wYmU5MmJiNzM3MDlAa2VybmVsLm9yZz9wYXJ0PTExCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
