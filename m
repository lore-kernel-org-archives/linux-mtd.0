Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83ABC25B4F
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2024 20:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qm2ETe+JrXgLcSGNoiJY/lcYDIPqaIxRg9Ae0WZUMDQ=; b=PprbkgLxqJjUOTS7AnRzISKmV8
	lT1PAGV90SsVHfk6fnGzRmrKsGdXDkxHIC1++kToOIkYhgY0HImTIE34b7YO3K/s5EgrCA2SGz3Gf
	jt/4O45EtwV/dk4PPyofCQ4ZSAyGdQ1NQ2G8EH9I7q23tLrUHDCriwxQhWcXoJcC0W/9J37SgnudC
	KmwqCr37yipHofRWXrp57ZM76XUbCGKL1hrgtnOo0c28HYuzkTxInd6bnHx6ZO/hUEHAQvi8dS97j
	ajW7qMHUhG3bEu5GSXxTwP2ljFxtReHrPQ76yjYS8LqvApOm2F6YLgHOwMrv3ShrGFCTdXnUcsMvC
	LvXkSNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Fyf-0000000AmFh-0mCl;
	Sun, 12 May 2024 20:39:25 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Fya-0000000AmEP-3xxa
	for linux-mtd@lists.infradead.org;
	Sun, 12 May 2024 20:39:23 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 216D6647A81E;
	Sun, 12 May 2024 22:39:08 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id K9RyJ2jP0xmW; Sun, 12 May 2024 22:39:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 893EE626FAF9;
	Sun, 12 May 2024 22:39:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zTe9dMvffljG; Sun, 12 May 2024 22:39:07 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 69F4C647A81E;
	Sun, 12 May 2024 22:39:07 +0200 (CEST)
Date: Sun, 12 May 2024 22:39:07 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Artem Chernyshev <artem.chernyshev@red-soft.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	lvc-project@linuxtesting.org
Message-ID: <1371873614.97879.1715546347299.JavaMail.zimbra@nod.at>
In-Reply-To: <20240329121629.316171-1-artem.chernyshev@red-soft.ru>
References: <20240329121629.316171-1-artem.chernyshev@red-soft.ru>
Subject: Re: [PATCH] fs/jffs2: Fix NULL deref in jffs2_scan_dirty_space
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: fs/jffs2: Fix NULL deref in jffs2_scan_dirty_space
Thread-Index: y5ad11duY8iSWWYoNLafHLQXdw07tQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_133921_226983_6B3C59AB 
X-CRM114-Status: GOOD (  12.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkFydGVtIENoZXJueXNoZXYi
IDxhcnRlbS5jaGVybnlzaGV2QHJlZC1zb2Z0LnJ1Pgo+IEFuOiAiRGF2aWQgV29vZGhvdXNlIiA8
ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gQ0M6ICJB
cnRlbSBDaGVybnlzaGV2IiA8YXJ0ZW0uY2hlcm55c2hldkByZWQtc29mdC5ydT4sICJsaW51eC1t
dGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJuZWwiCj4gPGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCBsdmMtcHJvamVjdEBsaW51eHRlc3Rpbmcub3Jn
Cj4gR2VzZW5kZXQ6IEZyZWl0YWcsIDI5LiBNw6RyeiAyMDI0IDEzOjE2OjI5Cj4gQmV0cmVmZjog
W1BBVENIXSBmcy9qZmZzMjogRml4IE5VTEwgZGVyZWYgaW4gamZmczJfc2Nhbl9kaXJ0eV9zcGFj
ZQoKPiBBcyB3YXMgbWVudGlvbmVkIGluIDJlYmYwOWMyLCBpdCBpcyBwb3NzaWJsZSB0byBnZXQg
b29wcywKPiB3aGVuIG1hcmtpbmcgc3BhY2UgZGlydHkgaW4gc2NhbiwgYnV0IG5vIHByZXZpb3Vz
IG5vZGUgZXhpc3RzCj4gCj4gSXQgc3RpbGwgY2FuIGJlIGluIGpmZnMyX2xpbmtfbm9kZV9yZWYo
KSB2aWEgZGVyZWYgamViLT5sYXN0X25vZGUuCj4gU2luY2UgYWxsIGpmZnMyX3NjYW5fZGlydHlf
c3BhY2UoKSBjYWxsZXJzIGNoZWNrIHZhbHVlIG9mIGEKPiBmdW5jdGlvbiwgd2UgY2FuIHJldHVy
biBlcnJvciBjb2RlIHNhZmVseS4KPiAKPiBGb3VuZCBieSBMaW51eCBWZXJpZmljYXRpb24gQ2Vu
dGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFNWQUNFLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFy
dGVtIENoZXJueXNoZXYgPGFydGVtLmNoZXJueXNoZXZAcmVkLXNvZnQucnU+Cj4gLS0tCj4gZnMv
amZmczIvbm9kZWxpc3QuYyB8IDUgKysrKy0KPiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2pmZnMyL25vZGVsaXN0LmMg
Yi9mcy9qZmZzMi9ub2RlbGlzdC5jCj4gaW5kZXggYjg2Yzc4ZDE3OGM2Li42YmViZjFkNjQwMDAg
MTAwNjQ0Cj4gLS0tIGEvZnMvamZmczIvbm9kZWxpc3QuYwo+ICsrKyBiL2ZzL2pmZnMyL25vZGVs
aXN0LmMKPiBAQCAtNjY5LDggKzY2OSwxMSBAQCBpbnQgamZmczJfc2Nhbl9kaXJ0eV9zcGFjZShz
dHJ1Y3QgamZmczJfc2JfaW5mbyAqYywgc3RydWN0Cj4gamZmczJfZXJhc2VibG9jayAqamViCj4g
CQkJc2l6ZSwgamViLT5mcmVlX3NpemUsIGplYi0+d2FzdGVkX3NpemUpOwo+IAkJQlVHKCk7Cj4g
CX0KPiArCWlmICghamViLT5sYXN0X25vZGUpIHsKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0K
CkRpZCB5b3UgdGVzdCB0aGlzIGNoYW5nZT8gSSdtIG5vdCBzbyBzdXJlIHdoZXRoZXIgcmV0dXJu
aW5nIC1FSU5WQUwgaXMKY29ycmVjdC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
