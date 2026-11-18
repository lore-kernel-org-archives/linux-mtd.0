Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D53B606A32F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 21:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1FZ0O46c;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hgd0jGHU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zCelmOLe2R/u9UEnxgpWhfKRg8/0frX7SJ7nnXqyoB4=; b=1FZ0O46cNYek2nrznBlhBPIcLN
	bSX+TNgBCFY8t9vRmbplqyxNDwAIdYntT6BvCfsjfVwrzjWnqPl5QWDnb01PQx+pP0PWUabzD8qk2
	fD7CsjD2JW7tLNSQvd6G0uvnajzCQL/Q+p4+Sw9jnRG0MEGkLaPZ3xvQNrny882eoPQGRZ4Jz83Ad
	tiIJDV3syI5kgHTox0/k9C0cpnStrDEJTba84bqRTo4wzGSq1ssbhOzlWI3ued1KYqbqvVcvdq9Xl
	w7CE8f4myAff0FjESmo1Hg5JK9IF7kl+YNI+D9ppMLoke/0/nNC0DJwyGhO8ivj9qgrwmGUp/DrFw
	HI0BlmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnSN-0000000ALbY-40xz;
	Wed, 18 Nov 2026 21:44:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnSN-0000000ALbP-0fpu
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 21:44:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48C286341E;
	Wed, 18 Nov 2026 21:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71D41F000C4;
	Wed, 18 Nov 2026 21:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795038282;
	bh=xfG06lb30YTw8UCw/p8k0EuhuFzyEYRp+UnXfobOpP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hgd0jGHU8DSqv4YYCctQVmJI9BVJRnmekkZTiQ48HIgzrMimXItss9t/4Akuyh89o
	 8q+HGYbky9XwfJVE1LAQJFm088STVde8TBERiQX2KavEpRqdCSXNo9ryO4U/l/DVlX
	 bVXp3zWhRKb5hgIMi7jS4bfQ79WAm4cPMU61rSd9y5jmlHryJbCm8kYTSr6YDhBZ+k
	 B584xvHl/bwQbEshDfO24CWL5ivmVYm7Bp/UI8wi9nkmJaaakNzGQaRUS/uTGdKdH9
	 M4+3dkkOsptFemRvJntQXgrhdJbLjLJwu7g7iUDTPCLIPFX9u+a+FJSnSGYQF4npoy
	 TfSyQ0uVCpbJA==
Message-ID: <sashiko-outbox-222025@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] jffs2: reschedule between the data CRC checks of an
 inode
To: "Orgad Shaneh" <orgads@gmail.com>, dwmw2@infradead.org, richard@nod.at
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
In-Reply-To: <20261118214045.107562-2-orgads@gmail.com>
References: <20261118214045.107562-1-orgads@gmail.com>
 <20261118214045.107562-2-orgads@gmail.com>
Date: Wed, 18 Nov 2026 21:44:41 +0000
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gamZmczI6IG1pc3NpbmcgRml4
ZXM6IHRyYWlsZXIgZm9yIGxvc3QgY29uZF9yZXNjaGVkKCkgaW4KICByZWFkaW5vZGUKLS0KCmNv
bW1pdCBkYzY4YTVlZjQyZmFmODExYWI2MWJkODk3YThiMzVjMTEyOTFjMjRlCkF1dGhvcjogT3Jn
YWQgU2hhbmVoIDxvcmdhZHNAZ21haWwuY29tPgoKPiBqZmZzMjogcmVzY2hlZHVsZSBiZXR3ZWVu
IHRoZSBkYXRhIENSQyBjaGVja3Mgb2YgYW4gaW5vZGUKPgo+IFRoZSBmaXJzdCByZWFkIG9mIGFu
IGlub2RlIGNoZWNrcyB0aGUgZGF0YSBDUkMgb2YgZWFjaCBvZiBpdHMgdW5jaGVja2VkCj4gbm9k
ZXMsIGFsbCBpbiBvbmUgY2FsbC4gT24gYW4gT2N0ZW9uIGJvYXJkIHdpdGggYW4gOC1iaXQgTk9S
LCBhCj4gNDYuNiBNQiBmaWxlIHRha2VzIDEzLjggcyBvZiBrZXJuZWwgdGltZSB0aGVyZS4gV2l0
aG91dCBrZXJuZWwKPiBwcmVlbXB0aW9uLCBub3RoaW5nIGVsc2UgcmFuIG9uIHRoYXQgQ1BVIGlu
IHRoZSBtZWFudGltZTogYW4gUlQKPiB3YXRjaGRvZyB0aHJlYWQgbWlzc2VkIGl0cyBkZWFkbGlu
ZSBhbmQgdGhlIGJvYXJkIHJlYm9vdGVkLiBXaXRoCj4gdGhpcywgdGhlIGxvb2t1cCB0YWtlcyBh
cyBsb25nLCBidXQgdGhlIHdhdGNoZG9nLCB0aGUgcGVyLUNQVQo+IHdvcmtxdWV1ZSBhbmQgdGhl
IG90aGVyIHRhc2tzIG9mIHRoYXQgQ1BVIGtlZXAgcnVubmluZy4KPgo+IGpmZnMyX2dldF9pbm9k
ZV9ub2RlcygpIGFscmVhZHkgcmVzY2hlZHVsZXMgcGVyIG5vZGUgd2hpbGUgaXQgcmVhZHMKPiB0
aGUgaGVhZGVyczsgZG8gdGhlIHNhbWUgYmVmb3JlIGVhY2ggZGF0YSBjaGVjay4KPgo+IFNpZ25l
ZC1vZmYtYnk6IE9yZ2FkIFNoYW5laCA8b3JnYWRzQGdtYWlsLmNvbT4KCltTZXZlcml0eTogTG93
XQpQcmlvciB0byBjb21taXQgZGY4ZTk2ZjM5MTAzICgiW0pGRlMyXSBJbXByb3ZlIHJlYWRfaW5v
ZGUgbWVtb3J5IHVzYWdlLAp2Mi4iKSwgamZmczJfZG9fcmVhZF9pbm9kZV9pbnRlcm5hbCgpIGNh
bGxlZCBjb25kX3Jlc2NoZWQoKSBvbiBlYWNoIG5vZGUKd2hpbGUgY2hlY2tpbmcgZGF0YSBDUkNz
IGFuZCBidWlsZGluZyB0aGUgZnJhZ3RyZWUsIHdoaWNoIHdhcyBkcm9wcGVkIHdoZW4KdGhhdCBs
b29wIG1vdmVkIGludG8gamZmczJfYnVpbGRfaW5vZGVfZnJhZ3RyZWUoKS4gIFNob3VsZCB0aGlz
IGluY2x1ZGU6CgogIEZpeGVzOiBkZjhlOTZmMzkxMDMgKCJbSkZGUzJdIEltcHJvdmUgcmVhZF9p
bm9kZSBtZW1vcnkgdXNhZ2UsIHYyLiIpCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTE4MjE0MDQ1LjEwNzU2Mi0xLW9yZ2Fkc0Bn
bWFpbC5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
