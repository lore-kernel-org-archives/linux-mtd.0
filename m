Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6235AECD994
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zQI8D8FgySyHpbsVAuzKnkAxgaiXvhY8HgGnSCIqGU=; b=VTrDtDQgih9pVE
	kRpOW8GzrQI53+Dsi8wGA0PefzRFVKjSNTKuvyVov5kXQ4POH12rg+ZiHJr5Cv+h+9DkNFPioT+ng
	HuFsWHhbrpeoLUndpANDfjinR734oauSGRQz66/kI2U4Kr6mvcJpFg+fsRljnEkJ+Y3udvoh5yqqm
	6KJe/n73ywTPWeaRIpxxSLggOz78DWsNb730A0VWR9uSYE0n7hszx3i62U0iZXeYY0/m/DrUUYISB
	PKwvQb9vDrZGHCTl+KssR08vn6s3+2msIX9/dvXf5gb1B/MXU1O6HkWptbyTAuCz/O2TFD8oQcTyp
	ptkTXBiEZ7ZN0+3VzZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3rX-0000000ALY4-2Y3E;
	Thu, 05 Feb 2026 18:13:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3rU-0000000ALWz-2rIJ
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 18:13:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A9CF1A2C34;
	Thu,  5 Feb 2026 18:13:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D43436074D;
	Thu,  5 Feb 2026 18:13:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4E32119D171E;
	Thu,  5 Feb 2026 19:13:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770315225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=413aQUhLq+G5yJdqFzbp8M+/FpAddQjlaLFjb2O9QRc=;
	b=gRy8ickMJTRbopD0sdkutIRcD8C50SWYy8V7uaLBr88nQn9v4nZ1Rg6c0iNuVBpBbJmENP
	+fnOluHJ0q4W79KfI2iTFKc4v3+kMCetbKja7TFbJpwCqknAqe6tWPILW+zgXcGhzeSTnk
	SfXnPS5fF31zJD01LmZsukXP8Rvs+A2+eiXrmocu366+o8kocUTD8Rw/ixoXMDjf//oYma
	O9EM/sx6oAwW4uvB2GwJRCPlLEHU/kFdsqMFlqNUfLXRpMIDYRn1wcSOwXIdnH6NQQH5n1
	BwikReTxXHVupG4ZSPcqndrVJ826EuMhzNfmUIIjuiaI5kk2f+1sJ+ul9+Irjw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Andrea Scian <andrea.scian@dave.eu>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org
In-Reply-To: <20260204-pl353-soft-ecc-support-v3-0-fd8ee7595cc1@dave.eu>
References: <20260204-pl353-soft-ecc-support-v3-0-fd8ee7595cc1@dave.eu>
Subject: Re: [PATCH v3 0/2] PL353 SW ECC fixes
Message-Id: <177031522113.1081992.15611255492818340482.b4-ty@bootlin.com>
Date: Thu, 05 Feb 2026 19:13:41 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_101352_855778_3FCFA105 
X-CRM114-Status: UNSURE (   8.30  )
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

T24gV2VkLCAwNCBGZWIgMjAyNiAxODo0MTo0MyArMDEwMCwgQW5kcmVhIFNjaWFuIHdyb3RlOgo+
IFBMMzUzIGhhcyBzb21lIGtub3duIGVycmF0YSB3aXRoIGl0cyBFQ0MgaW1wbGVtZW50YXRpb24g
YW5kIGl0IG1heSBiZQo+IHVzZWZ1bCB0byBzd2l0Y2ggdG8gc29mdHdhcmUgRUNDLCB0byBhdm9p
ZCBpc3N1ZSB3aXRoIHRoaXMuCj4gCj4gT24tZGllIEVDQyBpcyBhbHJlYWR5IHN1cHBvcnRlZCAo
d2hpbGUgSSBkaWRuJ3QgdGVzdCBpdCkgYnV0IHdoZW4KPiBlbmFibGluZyBTVyBFQ0Mgd2UgZ2V0
IG9wZXJhdGlvbi1ub3Qtc3VwcG9ydGVkIGVycm9yIGR1cmluZyBwYWdlIHdyaXRlCj4gKHBhZ2Ug
cmVhZCBhbHJlYWR5IHdvcmsgY29ycmVjdGx5KQo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQv
bmV4dCwgdGhhbmtzIQoKWzEvMl0gbXRkOiByYXduYW5kOiBwbDM1MzogRml4IHNvZnR3YXJlIEVD
QyBzdXBwb3J0CiAgICAgIGNvbW1pdDogODliODMxZWJkYWNhMGRmNGNhM2IyMjZmN2U3YTFkMWRi
MTYyOTA2MApbMi8yXSBtdGQ6IHJhd25hbmQ6IHBsMzUzOiBBZGQgbWVzc2FnZSBhYm91dCBFQ0Mg
bW9kZQogICAgICBjb21taXQ6IDFlMDZkYmZkZmI4NTExNzBiMjQzZDY0OThlNDQyYjQ0OTMyNGM2
NjQKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdp
bGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFp
bnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
