Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FBB606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nPYDRO1a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NT1QHyAX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Km7nE/nJoygxLUWay4GomM2X4+/R/o2Z9sw8s4R0tdU=; b=nPYDRO1avefbhMNM/9lzyUPXIJ
	Xp/eBU6E6s/Enlli5AWIQ/3K+76ctcVhTU49Er3VDLDQN4oUM7Ocn1DAre1Nxpj1IN6jwfN//16oU
	ws9EN/atdAd1aLpF1NPf7Hl5EsWn2YnLkRjOlojjLsNBJqmSO6BOwKLDCdR6bUOmrtNGqMYpKStI4
	II17tzKJg15wOfqa0U1snZL5S8BpKawjTZPwiP+1Gaoztub2+c9Pj9BxpwhQ2tN7ZaOULJ5Kk8+zR
	ei7TND+Ds4mW6afTEJu5mtQhwQoIWwC9jJZy9ffy/Wz+fefno6qXfOd6ZOWpIZdnddw2/o6KRg5xc
	sxYBB4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHgt-0000000B07l-2lpm;
	Wed, 25 Nov 2026 18:25:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHgr-0000000B078-2EPE
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:25:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E99CA407E1;
	Wed, 25 Nov 2026 18:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C27D1F000C4;
	Wed, 25 Nov 2026 18:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631156;
	bh=uzwdhjgbFfnItzOKa3zl69EiNf4Ms5cF7AwiA/UeNtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NT1QHyAXoEMW+SgAYa67EB2FKVHMdLBhM2jBrRvCT9OoDDXK3trq2N8GessUycyX/
	 3h8CmMOpaNMi7v9IEiefqBhWI4epapUQFYKTjnAocyGNz82nVTewqPOSvDxf0qu52A
	 xD23EaDuIat3mng0WGme+8ygBdAc5aiF9OBty+oBdDKH2q9Hfm+LJfYrybcjPNWlvy
	 LWB3amGQ3WpygqMqQmoDYhEJkZ00BX95DrwoJMqGM9+AE42NRXCU+d+qOysz/YTUwr
	 aRt6D9QTICzMVNKFC6jAejdzd+2veEnLq17Z1MFyAQodDHNyyMMqhquT6njdCOFoAv
	 VzEokSkwo4ZIg==
Message-ID: <sashiko-outbox-233986@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] mtd: spi-nor: macronix: Describe locking support
 for MX25L51245G
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Alvin Zhou" <alvinzhou@mxic.com.tw>, "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org
In-Reply-To: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-4-0d1ab783fd8b@bootlin.com>
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
 <20261125-macronix-upstreaming-spi-nor-cleanup-v1-4-0d1ab783fd8b@bootlin.com>
Date: Wed, 25 Nov 2026 18:25:55 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiBzcGktbm9yOiBtYWNy
b25peDogb3ZlcmxhcHBpbmcgbWVtY3B5KCkgaW4KICBteDI1bDUxMjQ1X2xhdGVfaW5pdCgpCi0t
Cgpjb21taXQgNjk4MWRkYWUxNzliNGJjNGYxNDA3ODVlMjFkOGQwY2VjOWUwZjIxNgpBdXRob3I6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgptdGQ6IHNwaS1ub3I6
IG1hY3Jvbml4OiBEZXNjcmliZSBsb2NraW5nIHN1cHBvcnQgZm9yIE1YMjVMNTEyNDVHCgpUaGlz
IGNvbW1pdCBhZGRzIGEgbGF0ZV9pbml0IGZpeHVwIGZvciBNYWNyb25peCBmbGFzaCBjaGlwcyBt
YXRjaGluZyBKRURFQwpJRCAweGMyMjAxYSB0byByZWFkIHRoZSBjb25maWd1cmF0aW9uIHJlZ2lz
dGVyIGFuZCBlbmFibGUgYmxvY2sgcHJvdGVjdGlvbgpsb2NraW5nIGlmIHRoZSBPVFAgVG9wL0Jv
dHRvbSBiaXQgaXMgY2xlYXJlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
bWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+IGluZGV4IGJiYzQx
YWYxNDg4MjYuLjg3ZmRiZDZjMzgwMDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9tYWNyb25peC5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCgpbIC4u
LiBdCgo+IEBAIC04Niw2ICs4NywzNyBAQCBtYWNyb25peF9xcHA0Yl9wb3N0X3NmZHBfZml4dXBz
KHN0cnVjdCBzcGlfbm9yICpub3IpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGljIGlu
dAo+ICtteDI1bDUxMjQ1X2xhdGVfaW5pdChzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICt7Cj4gKwlz
dHJ1Y3Qgc3BpX25vcl9mbGFzaF9wYXJhbWV0ZXIgKnBhcmFtcyA9IG5vci0+cGFyYW1zOwo+ICsK
PiArCS8qCj4gKwkgKiBMb2NraW5nIGlzIG9wdGlvbmFsLCBzbyBsZWF2ZSBsb2NraW5nIGRpc2Fi
bGVkIGlmIHRoZSBDUiBjYW5ub3QgYmUKPiArCSAqIHJlYWQgKGUuZy4gdGhlIGNvbnRyb2xsZXIg
ZG9lcyBub3Qgc3VwcG9ydCB0aGUgMHgxNSBvcGNvZGUpLgo+ICsJICovCj4gKwlpZiAoc3BpX25v
cl9yZWFkX3NyMihub3IsIG5vci0+Ym91bmNlYnVmKSkKPiArCQlyZXR1cm4gMDsKCltTZXZlcml0
eTogTG93XQpEb2VzIHBhc3Npbmcgbm9yLT5ib3VuY2VidWYgdG8gc3BpX25vcl9yZWFkX3NyMigp
IGNhdXNlIGFuIG92ZXJsYXBwaW5nCm1lbWNweSgpPwoKc3BpX25vcl9yZWFkX3NyMigpIGNhbGxz
IHNwaV9ub3JfcmVhZF9zcl9sbCgpLCB3aGljaCB1c2VzIG5vci0+Ym91bmNlYnVmCmZvciB0aGUg
U1BJIHRyYW5zZmVyIGFuZCB0aGVuIHJ1bnMgbWVtY3B5KHNyLCBub3ItPmJvdW5jZWJ1ZiwgbGVu
KSB0byBjb3B5CnRoZSByZXN1bHQgdG8gdGhlIGNhbGxlcidzIGJ1ZmZlci4gIFBhc3NpbmcgYSBz
dGFjayB1OCB2YXJpYWJsZSBpbnN0ZWFkIG9mCm5vci0+Ym91bmNlYnVmIGF2b2lkcyBjYWxsaW5n
IG1lbWNweSgpIHdpdGggaWRlbnRpY2FsIHNvdXJjZSBhbmQKZGVzdGluYXRpb24gcG9pbnRlcnMu
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYxMTI1LW1hY3Jvbml4LXVwc3RyZWFtaW5nLXNwaS1ub3ItY2xlYW51cC12MS0wLTBkMWFi
NzgzZmQ4YkBib290bGluLmNvbT9wYXJ0PTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
