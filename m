Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAEFCF3966
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YTPXZG/C+JkxRSOhu9DRYhupEZ96TUzToVzLW62280=; b=br3v2R4zeodlD1
	k88WAsSsOe3UjjjFjUVGfOxtU/B01roJa3fW6gRXrZiabS+vwF/pazuR35dQlmcDmd0qSaJWaVzey
	tV9fsE3fUvLqzY0C696OVT9/J9vaLyQqo9L3lvwwB5SYKdRMm8AMd2FK6/ZFZIQB1zpxmJCYoir9V
	HWVEN7s6NDdXCIyPz9gVcQiADdFqV0IsWA8xJ24Tdr1hZYwlWSe2gBK8ZT5qEfpfIjKnoTk6eiFq5
	5SiKf2Q3+Ku6brzjybnelxKW/IgdlUSEdhPWJuavhXtH1LIYVoZWGu8TcOZ0CRoX+EvuGFVh58KYc
	KHZNjXxGSYnMQpA7oJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlov-000000040Dm-1aqI;
	Wed, 19 Nov 2025 17:18:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlos-000000040Bn-2OHw
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 17:18:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 908351A1BEB;
	Wed, 19 Nov 2025 17:18:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 651E660699;
	Wed, 19 Nov 2025 17:18:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C236B10371A79;
	Wed, 19 Nov 2025 18:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763572691; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4cxcVUj5M5eta6dgUmGXA1pHA83Ea+XKRHROrVMcz74=;
	b=1Rb9Vg2GIPy2BtYk8RC2tBW5CrnQD2o/kuHFheZ4w/GnJbYeYG85sByYkvu0VcBUrp7fNy
	iVVyVVy2fMHzFOJ3pwCWxUK1sgm87AJI9S6YapTKLeuXAOvaIRPN6pGPdhzIGaJe97TKIL
	j11d2Tvka14EGNoqkJxrhd4iVL4vx9QPRUvlkgI5idWwxM92x9L1H9HS1vjqHeszaLAH52
	GrXcb5MVV/ndHD5jHM7aLAOld2j5PgK6U8oeUBuC+EX/uN4w7EeRFbzu/IILVeihf3tHLi
	LDuHXPI5LyLm4bSi6uIxxTmfv5IUrS02jUwId2Q5/65lbwRwdvOPG7+kR4bC2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K <s-k6@ti.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 04/28] mtd: spinand: Fix kernel doc
In-Reply-To: <efb8bba5-8805-4c95-ba1b-3bde46a4e528@linaro.org> (Tudor
	Ambarus's message of "Wed, 5 Nov 2025 16:57:39 +0100")
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
	<20251031-winbond-v6-17-rc1-oddr-v1-4-be42de23ebf1@bootlin.com>
	<efb8bba5-8805-4c95-ba1b-3bde46a4e528@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 18:18:08 +0100
Message-ID: <87v7j6aqlr.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_091814_745332_B3A7A15D 
X-CRM114-Status: GOOD (  11.33  )
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

T24gMDUvMTEvMjAyNSBhdCAxNjo1NzozOSArMDEsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDEwLzMxLzI1IDY6MjYgUE0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4+IFRoZSBAZGF0YSBidWZmZXIgaXMgNSBieXRlcywgbm90IDQsIGl0IGhhcyBi
ZWVuIGV4dGVuZGVkIGZvciB0aGUgbmVlZCBvZgo+PiBkZXZpY2VzIHdpdGggYW4gZXh0cmEgSUQg
Ynl0ZXMuCj4+IAo+PiBGaXhlczogMzRhOTU2NzM5ZDI5ICgibXRkOiBzcGluYW5kOiBBZGQgc3Vw
cG9ydCBmb3IgNS1ieXRlIElEcyIpCj4KPiBubyBmaXhlcyB0YWcgZm9yIGRvY3VtZW50YXRpb24u
Cj4KPiB3aXRoIHRoYXQ6Cj4gUmV2aWV3ZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4KPgo+IChjb21taXQgbXNnIGNhbiBiZSB1cGRhdGVkIHRvIHNtdGggbGlr
ZSAidXBkYXRlIGtlcm5lbCBkb2MgY29tbWVudCIKPiB0b28pCgpJIHBhcnRpYWxseSBkaXNhZ3Jl
ZS4gVGVsbCBtZSBpZiBJJ20gd3JvbmcsIGJ1dCBtYXkgSSBndWVzcyB0aGF0IHlvdQpoYXZlIGJh
Y2twb3J0cyBpbiBtaW5kPyBBcyBvcHBvc2VkIHRvIGJhY2twb3J0aW5nIGNvbW1lbnQgZml4ZXMg
d2hpY2gKbWlnaHQgbm90IG1ha2UgbXVjaCBzZW5zZSBpbmRlZWQsIF9maXhpbmdfIGEgY29tbWVu
dCBtYWtlcyBzZW5zZS4gV2UKa25vdyB0aGF0IHN0YWJsZSBtYWludGFpbmVycywgZXZlbiB0aG91
Z2ggdGhleSBhc2sgcGVvcGxlIHRvIENjIHN0YWJsZQpmb3IgYmFja3BvcnRzLCB0aGV5IGF1dG9t
YXRpY2FsbHkgcGljayB3aXRoIHRoZSBoZWxwIG9mIEFJIGFsbW9zdCBhbnkKY29tbWl0IHdpdGgg
YSBGaXhlcyB0YWcuIEkgYmVsaWV2ZSBpdCBpcyB3cm9uZyB0byBub3QgbWFyayBzdWNoIGNvbW1p
dAphbmQgZXZlbiBjaGFuZ2UgdGhlIHRpdGxlIChiZWNhdXNlICJmaXgiIGluIHRoZSB0aXRsZSBt
YXkgYWxzbyBsZWFkIHRvCmFuIGF1dG9tYXRpYyBiYWNrcG9ydCkgdG8gY2lyY3VtdmVudCB0aGVp
ciB0b29saW5nLiBUaGUgdG9vbGluZyBtdXN0CmFkYXB0LCBub3QgdGhlIGFjY3VyYWN5IG9mIHRo
ZSBjb21taXRzLiBQbHVzLCBiYWNrcG9ydGluZyB0aGlzIGtpbmQgb2YKY29tbWl0IGlzIGhhcm1s
ZXNzLCBzbyBJIHdvdWxkbid0IGNhcmUgdG9vIG11Y2g/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
