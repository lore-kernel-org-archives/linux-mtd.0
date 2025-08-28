Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BC1CA0EED
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Aug 2025 09:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=221tARGAD5oN2OnDji5Pd0YW3X2i+pcb9Ba49es1U3A=; b=jLvf4qFKwWUKJD
	NtbRSJPscnf+FnzmnbqRc26dHykCumHfnhJLQpGRfFvNq05wPMl94UwE4K+KcpXa6zu+N8ycH88NJ
	+WvrX9yfJqlLNS3rxSZVeJku/R3/6j68DSG3OOFYqLYuPbvRPgvH/glbqYc3fL1SgqtWuD/6jv6P0
	GYsC0BHwx5p0borRQ95P9Jl2GP51FLw9DxHoLfIFdyfuiMyaRf0tjWwBIF6qdo7yccwSVlhyvKh+3
	E8llwoOoh+KGM3AO1TowS2FI0ubXbqSdwRS4VsITVte4pNC9YP/UATU3WISLfiY7SeUslM8uYIdeq
	lmj9ahVfddpYP6pLftiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYrL-00000000wvk-18fW;
	Thu, 28 Aug 2025 09:23:55 +0000
Received: from mail.dealista.pl ([94.177.238.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXoP-00000000lHQ-3rTY
	for linux-mtd@lists.infradead.org;
	Thu, 28 Aug 2025 08:16:51 +0000
Received: by mail.dealista.pl (Postfix, from userid 1002)
	id BF44086C99; Thu, 28 Aug 2025 10:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dealista.pl; s=mail;
	t=1756368676; bh=qcP5dcos5mZ8jV4yTLFLEHzXO5jTY/q0Nu8iMRmEEWE=;
	h=Date:From:To:Subject:From;
	b=jKChtXZ8Vh4nH4NrmoZVuzM1pmZaKU085eEvkxZdoH0wv/fGiFyIGnflHoiuvLOwc
	 Obi4iyYxz0L/TKaZ/DVfnbvz+/xnEMv7ry1oCd/SK5LMnt73asyslloQlCfkYDzmep
	 D2ybyd8C9zzlNBff/p24hclWOdi/Mf1bt+PFx+Bpsx6o67DMIn5exy9KfO0R6KO3MG
	 tZc3D3IQGijq01hH2FL+/xziXGEfaheUzDTaYsMaX4AiY2LtOdNYYuvgkSLvaPZOly
	 byx9tq2woZftp+MmblYiqcqD7HlTKv5h6R0aA1S9KjbjpVVjQrtP4V7fO8QGQjLC1u
	 WVRsGOkfV23lw==
Received: by mail.dealista.pl for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2025 08:10:27 GMT
Message-ID: <20250828084501-0.1.bi.1bm0g.0.57xf7f4son@dealista.pl>
Date: Thu, 28 Aug 2025 08:10:27 GMT
From: "Robert Kozielski" <robert.kozielski@dealista.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Pozycjonowanie - informacja
X-Mailer: mail.dealista.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_011650_213284_388FFA8E 
X-CRM114-Status: UNSURE (   0.52  )
X-CRM114-Notice: Please train this message.
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

RHppZcWEIGRvYnJ5LCAKCmpha2nFmyBjemFzIHRlbXUgemfFgm9zacWCYSBzacSZIGRvIG5hcyBm
aXJtYSwga3TDs3JlaiBzdHJvbmEgaW50ZXJuZXRvd2EgbmllIHBvenljam9ub3dhxYJhIHNpxJkg
d3lzb2tvIHcgd3lzenVraXdhcmNlIEdvb2dsZS4gCgpOYSBwb2RzdGF3aWUgd3lrb25hbmVnbyBw
cnpleiBuYXMgYXVkeXR1IFNFTyB6b3B0eW1hbGl6b3dhbGnFm215IHRyZcWbY2kgbmEgc3Ryb25p
ZSBwb2Qga8SFdGVtIHdjemXFm25pZWogb3ByYWNvd2FueWNoIHPFgsOzdyBrbHVjem93eWNoLiBO
YXN6IHdld27EmXRyem55IHN5c3RlbSBjb2R6aWVubmllIGFuYWxpenVqZSBwcmF3aWTFgm93ZSBk
emlhxYJhbmllIHdpdHJ5bnkuICBEemnEmWtpIGluZHl3aWR1YWxuZWogc3RyYXRlZ2lpLCBmaXJt
YSB6ZG9ieXdhIGNvcmF6IHdpxJljZWogS2xpZW50w7N3LiAgCgpDenkgY2hjaWVsaWJ5IFBhxYRz
dHdvIHp3acSZa3N6ecSHIGxpY3pixJkgb3PDs2Igb2R3aWVkemFqxIVjeWNoIHN0cm9uxJkgaW50
ZXJuZXRvd8SFIGZpcm15PyAKCk3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgb2ZlcnTEmT8gCgoKUG96
ZHJhd2lhbQpSb2JlcnQgS296aWVsc2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
