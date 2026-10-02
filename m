Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4D8CA5FD4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdJNqIXG0y8es8Cib/lbqfJtn/mUN1E9tjUNkka/ECE=; b=aH6T/5LfJpgUoN
	OEwnup1Gjbz4MDoeEBZstVuq0ISoiWObBkymb24KdFPwPu7eufElX1UKaHHJa56U2AHfVEuzynHiT
	XSSg0FBGovYq9mXNg6Y7xHsY11JbX8TYkL9z1xf/DfLWGljTJ/dUWtZxMaFbTwOe9bcLGwzFA2Rv8
	clXxUDGHiGknaF3IOhpTVKjHUhofCc8tlb62bIoAsXN5ME6XorBf+StPLsH5ErpLi2hQYSQ3scgzJ
	Gu7E7cQe5YoVRZL/yj/V2x7zelc9J4KTv6spKOu+5sTJvcEMPIdSBHsxPCMWZjjzdpyXScjKn3kjs
	BskVvqnP/ztMDkE7s0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcSx-0000000BaQb-2Enb;
	Fri, 02 Oct 2026 12:34:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcSv-0000000BaPs-3HMi
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:34:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E34860A8C;
	Fri,  2 Oct 2026 12:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3699B1F000FF;
	Fri,  2 Oct 2026 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944456;
	bh=HaRlx89/YCJKq+iiqj3O4qkK79gw+8549i5bxgzW9C8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BkjYMDMcodUGT2H3p40/slxRe4o7l+h2KKsAEdEl1T4ceTiL06z0gcdRDV8a9hnGI
	 KoA0mVsVmsojY5KP5j5mavRZoGmmGSCc0twB2hWCYQD8NH9sUCVtOajxLcR59IBECq
	 /Zj0dOYDVUcBUSm35Jm0dxROFLYApysZ/CQlSddA+xq866FABP1XrgPgQUySeI4bCo
	 VLNIQkkPVpzXKUcJn66rY0GrQOMiYheM6XGNAlJS5xyL2WR/LaEPvN6P5mq++pALv9
	 rgBXwtM42kHrsB6GZ1zMmTQBCXMigGOrrkmPQ5IHmH4KhESfsUI4FCH9iEW3IGc2lt
	 ScNwWiN8YX5jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/15] mtd: spi-nor: Allow configuring the actual number
 of dummy cycles
To: "Pratyush Yadav" <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, "Steam
 Lin" <STLin2@winbond.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-7-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-7-a22a2f95c26e@bootlin.com>
Date: Fri, 02 Oct 2026 12:34:15 +0000
Message-Id: <20261002123416.3699B1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
dm9sYXRpbGUgZHVtbXkgY3ljbGUgaGFyZHdhcmUgY29uZmlnIGxvc3Qgb24gcmVzdW1lCi0tCgpj
b21taXQgNTU4MDdmN2Y4N2Y0YzY2YzA1YzRkNWM2Nzg1NzBlMGU2ZTIxYzBjOQpBdXRob3I6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgptdGQ6IHNwaS1ub3I6IEFs
bG93IGNvbmZpZ3VyaW5nIHRoZSBhY3R1YWwgbnVtYmVyIG9mIGR1bW15IGN5Y2xlcwoKVGhpcyBj
b21taXQgaW50cm9kdWNlcyBhIGNhbGxiYWNrIHRvIGNvbmZpZ3VyZSB0aGUgYWN0dWFsIG51bWJl
ciBvZiBkdW1teQpjeWNsZXMgZXhwZWN0ZWQgYnkgdGhlIFNQSSBOT1IgY2hpcC4gSXQgZW5zdXJl
cyB0aGF0IHRoZSBjaGlwIGlzIGNvbmZpZ3VyZWQKcHJvcGVybHkgd2hlbiB0aGUgbnVtYmVyIG9m
IGR1bW15IGN5Y2xlcyBpcyBtYXhpbWl6ZWQgZm9yIHRoZSBmYXN0ZXN0IHJlYWQKdmFyaWFudCBh
ZHZlcnRpc2VkIGJ5IHRoZSBTRkRQIHRhYmxlcy4KCj4gQ3JldGUgYSBjYWxsYmFjayB0byBjb25m
aWd1cmUgdGhlIGNoaXAgZm9yIGV4cGVjdGluZyBhIHNwZWNpZmljIG51bWJlcgo+IG9mIGR1bW15
IGN5Y2xlcy4KCltTZXZlcml0eTogTG93XQpUaGlzIGlzbid0IGEgYnVnLCBidXQgdGhlcmUncyBh
IHR5cG8gKENyZXRlKSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gaW5k
ZXggMzgxYmJjMTNmODJmZi4uZjQ1YzJjMDdkMDI0NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9zcGktbm9yL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gQEAg
LTI2MzYsNyArMjYzNiwxNyBAQCBzdGF0aWMgaW50IHNwaV9ub3Jfc2V0dXAoc3RydWN0IHNwaV9u
b3IgKm5vciwKPiAgCQlyZXR1cm4gZXJyOwo+ICAJfQo+ICAKPiAtCXJldHVybiBzcGlfbm9yX3Nl
dF9hZGRyX25ieXRlcyhub3IpOwo+ICsJZXJyID0gc3BpX25vcl9zZXRfYWRkcl9uYnl0ZXMobm9y
KTsKPiArCWlmIChlcnIpCj4gKwkJcmV0dXJuIGVycjsKPiArCj4gKwlpZiAobm9yLT5wYXJhbXMt
PnNldF9kdW1teSkgewo+ICsJCWVyciA9IG5vci0+cGFyYW1zLT5zZXRfZHVtbXkobm9yLCBub3It
PnJlYWRfZHVtbXkpOwo+ICsJCWlmIChlcnIpCj4gKwkJCXJldHVybiBlcnI7Cj4gKwl9CgpbU2V2
ZXJpdHk6IEhpZ2hdCklzIHRoZSBkdW1teSBjeWNsZSBoYXJkd2FyZSBjb25maWd1cmF0aW9uIGxv
c3QgZHVyaW5nIGEgc3VzcGVuZCBhbmQgcmVzdW1lCmN5Y2xlPwoKV2hlbiBhIFNQSSBOT1IgY2hp
cCBsb3NlcyBwb3dlciBkdXJpbmcgc3lzdGVtIHN1c3BlbmQsIGl0cyB2b2xhdGlsZSBkdW1teQpj
eWNsZSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIGlzIHJlc2V0IHRvIGl0cyBwb3dlci1vbiBkZWZh
dWx0LgoKVXBvbiBzeXN0ZW0gcmVzdW1lLCBzcGlfbm9yX3Jlc3VtZSgpIGNhbGxzIHNwaV9ub3Jf
aW5pdCgpIHRvIHJlLWluaXRpYWxpemUKdGhlIHZvbGF0aWxlIHN0YXRlIG9mIHRoZSBjaGlwOgoK
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmM6c3BpX25vcl9yZXN1bWUoKSB7CgkuLi4KCS8qIHJl
LWluaXRpYWxpemUgdGhlIG5vciBjaGlwICovCglyZXQgPSBzcGlfbm9yX2luaXQobm9yKTsKCS4u
Lgp9CgpIb3dldmVyLCBzcGlfbm9yX2luaXQoKSBkb2VzIG5vdCByZXN0b3JlIHRoZSBkdW1teSBj
eWNsZSBjb25maWd1cmF0aW9uIHVzaW5nCm5vci0+cGFyYW1zLT5zZXRfZHVtbXkoKS4KClNpbmNl
IHRoZSBzb2Z0d2FyZSBzdGF0ZSAobm9yLT5yZWFkX2R1bW15KSByZXRhaW5zIHRoZSBjdXN0b20g
ZHVtbXkgY3ljbGUKY291bnQgd2hpbGUgdGhlIGhhcmR3YXJlIHJldmVydHMgdG8gdGhlIGRlZmF1
bHQgY291bnQsIHdpbGwgc3Vic2VxdWVudCByZWFkcwpiZSBtaXNhbGlnbmVkIGFuZCBsZWFkIHRv
IGRhdGEgY29ycnVwdGlvbj8KCj4gKwo+ICsJcmV0dXJuIDA7Cj4gIH0KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMDItd2luYm9u
ZC1tYXN0ZXItc3BpLW5vci13MzV0LXYxLTAtYTIyYTJmOTVjMjZlQGJvb3RsaW4uY29tP3BhcnQ9
NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
