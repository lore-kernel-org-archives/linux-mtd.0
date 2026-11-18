Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0FD606A32F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQa5ZXOq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flP6NtLl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f++ZBpkiIQBjnWx9Hzpu/K56RSemeplxzbs16EkS5vg=; b=VQa5ZXOqnvBPTlMgHyzJpQB3SA
	Lp2HBX3fWKzyG9+Wf8fFQ9loBNtL4FhJj56oItZroImhzpfR4Tdeed9LU4QDeDUJ91gYEg10azUlI
	ChjuvQSyQ0/PnGQ9HfB2xTKqeYssXP6IglkVcbRq2L8Au2buvIiiV0Rqp/2TBIe/OBAfSxXxbJgd6
	U4KLAZ854mIdjKB7C3f1YRCEFAxJX0RFDkz1Mqp2hG46I5ghXPs1a53Ks9SJ9XRhx9XVWYpq97doz
	DPPikWik2rEsTmjNSJDwxwpVL3wewtwuiFLHvnB+Tj6cb2L0ZFgY8GqDc8mFAF4ZYJuM8EJ+15bu5
	uz6boMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTdZ-00000007Mp7-0awo;
	Wed, 18 Nov 2026 00:34:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTdY-00000007Moz-1TUw
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 00:34:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B9B040457;
	Wed, 18 Nov 2026 00:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FF71F000C4;
	Wed, 18 Nov 2026 00:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794962095;
	bh=grDX5BW3y3nwxYvdAlv8lyOrchhlt+LOaHhEjnfWQSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=flP6NtLlcvo6w68rWjQHjp+nC/w63CAflOFj+LLB1EG7zzwRao2UYoLxQCWdI7yTz
	 5RluHJiCOJuvt7/i4Z0vXXgL/Mhg4JSHunGrMGSmnMMFlw+6Y5J2aXYaZTifMiitLj
	 eHX9HqPgvexkloZ42mg72R7VzslMQj9aKqHiKGeIjefXjkbjtH6pGLkXkEs3w90mmW
	 1L0Hr0ubVZbDeV98xlGkm1/8ufNYG2dSNiJKCFVsFs/sQbx44c0x9lNL/KpV9/7pQf
	 IWHCiPHPvCJ4+I1AtClmZidpLSGkU2iqX6tP6sg1jLo5F0Z7HcqfykT6VDfdIdcJGV
	 GoglZMjh/l5Cg==
Message-ID: <sashiko-outbox-219851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ubifs: Use FSTR() in ubifs_xattr_{set,get,remove}()
To: "Thorsten Blum" <blum@kernel.org>, "David Sterba" <dsterba@suse.com>, "Chris
 Mason" <mason@kernel.org>, "Jaegeuk Kim" <jaegeuk@kernel.org>, "Chao Yu" <chao@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Zhihao Cheng" <chengzhihao1@huawei.com>, "Eric
 Biggers" <ebiggers@kernel.org>, =?utf-8?b?VGhlb2RvcmUgWS4gVHMnbw==?= <tytso@mit.edu>
Cc: linux-mtd@lists.infradead.org, linux-fscrypt@vger.kernel.org, dsterba@suse.cz
In-Reply-To: <20261118002845.574426-10-blum@kernel.org>
References: <20261118002845.574426-6-blum@kernel.org>
 <20261118002845.574426-10-blum@kernel.org>
Date: Wed, 18 Nov 2026 00:34:54 +0000
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
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbSGlnaF0gdWJpZnM6IG1pc3Np
bmcgcmVhZC1vbmx5IGFuZCBlcnJvciBzdGF0ZSBjaGVja3MgaW4gZmlsZWF0dHIgYW5kCiAgeGF0
dHIgc2V0dGVycyBbMV0KLS0KCmNvbW1pdCBiOGZjZDhiMzY1Zjc3NzUzMDA3YWM2ODA4ZDhhNmI5
OThhMzRjNzczCkF1dGhvcjogVGhvcnN0ZW4gQmx1bSA8Ymx1bUBrZXJuZWwub3JnPgoKdWJpZnM6
IFVzZSBGU1RSKCkgaW4gdWJpZnNfeGF0dHJfe3NldCxnZXQscmVtb3ZlfSgpCgpUaGlzIGNvbW1p
dCByZXBsYWNlcyBGU1RSX0lOSVQoLi4uLCBzdHJsZW4obmFtZSkpIHdpdGggdGhlIEZTVFIoKSBt
YWNybyBpbgp1Ymlmc194YXR0cl9zZXQoKSwgdWJpZnNfeGF0dHJfZ2V0KCksIGFuZCB1Ymlmc194
YXR0cl9yZW1vdmUoKS4KCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3hhdHRyLmMgYi9mcy91Ymlm
cy94YXR0ci5jCj4gaW5kZXggM2IwZThhMjcwZjU5NC4uMDM2ZWI3ZTJiZTBiMiAxMDA2NDQKPiAt
LS0gYS9mcy91Ymlmcy94YXR0ci5jCj4gKysrIGIvZnMvdWJpZnMveGF0dHIuYwo+IEBAIC0yNTIs
NyArMjUyLDcgQEAgaW50IHViaWZzX3hhdHRyX3NldChzdHJ1Y3QgaW5vZGUgKmhvc3QsIGNvbnN0
IGNoYXIgKm5hbWUsIGNvbnN0IHZvaWQgKnZhbHVlLAo+ICB7Cj4gIAlzdHJ1Y3QgaW5vZGUgKmlu
b2RlOwo+ICAJc3RydWN0IHViaWZzX2luZm8gKmMgPSBob3N0LT5pX3NiLT5zX2ZzX2luZm87Cj4g
LQlzdHJ1Y3QgZnNjcnlwdF9uYW1lIG5tID0geyAuZGlza19uYW1lID0gRlNUUl9JTklUKChjaGFy
ICopbmFtZSwgc3RybGVuKG5hbWUpKX07Cj4gKwlzdHJ1Y3QgZnNjcnlwdF9uYW1lIG5tID0geyAu
ZGlza19uYW1lID0gRlNUUigoY2hhciAqKW5hbWUpIH07Cj4gIAlzdHJ1Y3QgdWJpZnNfZGVudF9u
b2RlICp4ZW50Owo+ICAJdW5pb24gdWJpZnNfa2V5IGtleTsKPiAgCWludCBlcnI7CgpbIC4uLiBd
Cgo+IEBAIC01NTcsNyArNTU3LDcgQEAgc3RhdGljIGludCB1Ymlmc194YXR0cl9yZW1vdmUoc3Ry
dWN0IGlub2RlICpob3N0LCBjb25zdCBjaGFyICpuYW1lKQo+ICB7Cj4gIAlzdHJ1Y3QgaW5vZGUg
Kmlub2RlOwo+ICAJc3RydWN0IHViaWZzX2luZm8gKmMgPSBob3N0LT5pX3NiLT5zX2ZzX2luZm87
Cj4gLQlzdHJ1Y3QgZnNjcnlwdF9uYW1lIG5tID0geyAuZGlza19uYW1lID0gRlNUUl9JTklUKChj
aGFyICopbmFtZSwgc3RybGVuKG5hbWUpKX07Cj4gKwlzdHJ1Y3QgZnNjcnlwdF9uYW1lIG5tID0g
eyAuZGlza19uYW1lID0gRlNUUigoY2hhciAqKW5hbWUpIH07Cj4gIAlzdHJ1Y3QgdWJpZnNfZGVu
dF9ub2RlICp4ZW50Owo+ICAJdW5pb24gdWJpZnNfa2V5IGtleTsKPiAgCWludCBlcnI7CgpbU2V2
ZXJpdHk6IEhpZ2hdClRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNo
LCBidXQgY2FuIHViaWZzX3hhdHRyX3NldCgpLAp1Ymlmc194YXR0cl9yZW1vdmUoKSwgYW5kIHNl
dGZsYWdzKCkgKHZpYSB1Ymlmc19maWxlYXR0cl9zZXQoKSkgbXV0YXRlIHN0YXRlCm9uIGEgcmVh
ZC1vbmx5IG9yIGVycm9yZWQgVUJJRlMgZmlsZXN5c3RlbSBbMV0/CgpBIHN0YWNrZWQgZmlsZXN5
c3RlbSBzdWNoIGFzIGVjcnlwdGZzIGNhbiBjYWxsIHZmc19zZXR4YXR0cigpLAp2ZnNfcmVtb3Zl
eGF0dHIoKSwgb3IgdmZzX2ZpbGVhdHRyX3NldCgpIG9uIGEgbG93ZXIgVUJJRlMgbW91bnQgd2l0
aG91dAphY3F1aXJpbmcgd3JpdGUgYWNjZXNzIG9uIHRoZSBsb3dlciBtb3VudCwgYW5kIHRob3Nl
IFZGUyBoZWxwZXJzIGRpc3BhdGNoCmludG8gVUJJRlMgd2l0aG91dCByZWplY3RpbmcgcmVhZC1v
bmx5IG9yIGVtZXJnZW5jeSByZWFkLW9ubHkgbG93ZXIKc3VwZXJibG9ja3MuCgp1Ymlmc194YXR0
cl9zZXQoKSBhbmQgdWJpZnNfeGF0dHJfcmVtb3ZlKCkgdGhlbiBjYWxsIGNyZWF0ZV94YXR0cigp
LApjaGFuZ2VfeGF0dHIoKSwgYW5kIHJlbW92ZV94YXR0cigpLCB3aGljaCBtdXRhdGUgaW4tbWVt
b3J5IGhvc3QgYW5kIHhhdHRyCmlub2RlIHN0YXRlIGJlZm9yZSByZWFjaGluZyByZXNlcnZlX3Nw
YWNlKCksIHdoZXJlIHViaWZzX2Fzc2VydChjLAohYy0+cm9fbWVkaWEgJiYgIWMtPnJvX21vdW50
KSBmaXJlcywgYy0+cm9fZXJyb3IgaXMgc2V0LCBhbmQgdGhlIHhhdHRyIGlub2RlCmlzIG1hcmtl
ZCBiYWQuICBTaW1pbGFybHksIHNldGZsYWdzKCkgaW4gZnMvdWJpZnMvaW9jdGwuYyBhbGxvY2F0
ZXMgZGlydHkKaW5vZGUgYnVkZ2V0IHZpYSB1Ymlmc19idWRnZXRfc3BhY2UoKSBhbmQgZGlydGll
cyB0aGUgaW5vZGUgd2l0aG91dCBjaGVja2luZwpjLT5yb19tb3VudCwgYy0+cm9fbWVkaWEsIG9y
IGMtPnJvX2Vycm9yLCBsZWFraW5nIGMtPmJpLmRkX2dyb3d0aCBvbiBhCnJlYWQtb25seSBtb3Vu
dCBhbmQgdHJpcHBpbmcgdWJpZnNfYXNzZXJ0KGMsIGMtPmJpLmRkX2dyb3d0aCA9PSAwKSBhdAp1
bm1vdW50LgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcvbGludXgtNWJiMjI3NWQtNzZl
NS00ZDZhLWI4MTQtYTdhYzkyMTc3OGJmCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTE4MDAyODQ1LjU3NDQyNi02LWJsdW1Aa2Vy
bmVsLm9yZz9wYXJ0PTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
