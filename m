Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D4ACCD193
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pO1d4LfLsj5Jf/BBzA7TwSVTP09EkmYlVFbxbFYJaHU=; b=kNak1XHD+VdGAI
	IvWecjb4RvSwsxPSNutubXVGT0WoFmXgbERbpSLOnw0sRBIncFqhCNCAUdJ+obvwZjeLIbXPmvZsp
	pHPlwQzNtBHi/7FqWDBMPargNS+5m2DL3iEwZtVXbe0UUf0+ZmouHZXrXOFsa7I+sY4bg8i3JFH//
	aPy0VVC1ZzBrFlnwSxwYBqVKnNs1IvbghqMhfMracOlo9Id6fyXEJe63vlXn/Nj00dbjtFj7YO49I
	2sB1NlsPYB0koi9Oq8QswTWdQ7j4/InUAnxzNTd/V0qCU5u17e5HhR2bwXWK00ZQY0cSozrksnStD
	NLGbWFDRbmEoxgVstp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpN8-00000005IKP-2S17;
	Thu, 23 Oct 2025 07:04:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpN4-00000005IJr-3u50
	for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2025 07:04:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 248471A15EA;
	Thu, 23 Oct 2025 07:04:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6D596062C;
	Thu, 23 Oct 2025 07:04:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C558102F2408;
	Thu, 23 Oct 2025 09:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761203064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A6EIv7MbbGBRMKtax/govJMi5UBAxZZaOhBy6c7KAOM=;
	b=nlr6XBmJgAKd4tnoGws3RG7ArQpPQ538EUt70eafCV+kpVf43I+E/6P21S2CibNHQ7YGoU
	a5wpzmVfYbGna1syZEzT3TYL2nS0vvlePMFg2xb3QKYws3bIb8B5RrYt4kQcTgoxuhEhf4
	jBh+ZxDvfD3i3i36Ty58EsHgA9tCQj3kleq1tUkfik54orKniD3NnR87Bp5NPnezs8dcdZ
	6XxWEwSb6NSfe+5uGZ8YiN9d8vsj/mFpr3wGyE2vgjRenB1SB9X5QceQhByTdxMweUJEDC
	W8SWJ3tVo1tMrawUQanAHrn+H9xDxlLjQKzO1CSzlayqMixXg864BZyYvHPN/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, niravkumarlaxmidas.rabara@altera.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20251023033201.2182-1-niravkumarlaxmidas.rabara@altera.com>
References: <20251023033201.2182-1-niravkumarlaxmidas.rabara@altera.com>
Subject: Re: [PATCH] mtd: rawnand: cadence: fix DMA device NULL pointer
 dereference
Message-Id: <176120306155.174442.12328338821059704795.b4-ty@bootlin.com>
Date: Thu, 23 Oct 2025 09:04:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_000427_099367_D5048EDD 
X-CRM114-Status: UNSURE (   5.20  )
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

T24gVGh1LCAyMyBPY3QgMjAyNSAxMTozMjowMSArMDgwMCwgbmlyYXZrdW1hcmxheG1pZGFzLnJh
YmFyYUBhbHRlcmEuY29tIHdyb3RlOgo+IFRoZSBETUEgZGV2aWNlIHBvaW50ZXIgYGRtYV9kZXZg
IHdhcyBiZWluZyBkZXJlZmVyZW5jZWQgYmVmb3JlIGVuc3VyaW5nCj4gdGhhdCBgY2Ruc19jdHJs
LT5kbWFjYCBpcyBwcm9wZXJseSBpbml0aWFsaXplZC4KPiAKPiBNb3ZlIHRoZSBhc3NpZ25tZW50
IG9mIGBkbWFfZGV2YCBhZnRlciBzdWNjZXNzZnVsbHkgYWNxdWlyaW5nIHRoZSBETUEKPiBjaGFu
bmVsIHRvIGVuc3VyZSB0aGUgcG9pbnRlciBpcyB2YWxpZCBiZWZvcmUgdXNlLgo+IAo+IAo+IFsu
Li5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBj
YWRlbmNlOiBmaXggRE1BIGRldmljZSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UKICAgICAgY29t
bWl0OiA1YzU2YmYyMTRhZjg1Y2EwNDJiZjk3Zjg1ODRhYWIyMTUxMDM1ODQwCgpQYXRjaGUocykg
c2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2Yg
dGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoK
S2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
