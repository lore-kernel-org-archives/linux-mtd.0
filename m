Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F31ECA5FEC
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZH+2rKKBz9zPhoJFCm8PYevKVmr435i8uwNvCQaGpAw=; b=vmsT1bjnMmgoIL
	1dQGi32RF8fU4m5rJBfGfSwg6N65LseO/X9UGIiXHzxl+SrYGwguYmAt5foVqtzCF8rcAFs2itELc
	E4WzNXp28K06pQJtAIZ5U5nWLYyYe70hMBMPfIuq4c+HrWXQkrmZtLDF4fovB66AZOagvnh7fKpoX
	Vp9jSKB0TH4rHs9nKksD+MrzqliDZ5MSs9I2NiQb63yByKcN8uzAHXcRWV/TwJn/JPSbbMtBHX//B
	HcTgp4eFaU6crTl8U+A138gsqnOIo4y8GdTDtISb5B00q25I/9RrQVm0Efqh0QGcV9P39TaSQVN1g
	i/9I9HVddxIbN2DR6EwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTfe-0000000FLtz-2VGf;
	Sun, 04 Oct 2026 21:22:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTfW-0000000FLsW-1Qqa
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:22:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B72471A113A;
	Sun,  4 Oct 2026 21:22:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88600604FE;
	Sun,  4 Oct 2026 21:22:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60E1410328384;
	Sun,  4 Oct 2026 23:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791148966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WmWYV2k7FqhwmLYzxQ1/5AjtdXrLIU9ft5LFmuWJHGU=;
	b=rTXxDP/4cfRx+uJwv0cpboAYbzMtPt7OkQCiMndnI+f3I8/NzhH9sGnGuxCghbQyGJKpne
	19QEoOvreRwwBk55kvsRIQlWgQfiZQIcL/3n69SrojNtuZjegjmQD/TSDoEliQJGZqRXCf
	3PMbhlMwqjqiewKJZ5wU0ujYxhE841i1H3Wr6TvFZzqg09Jxs9IRf0q/1lKJCu6BzbQgui
	8wFUuctckV4GOj3e7lPkEIr2NlCmHD2ORXN4Wo0rNCBqzWMuuw0u0Vx8MIAUjS4nVCl8Sg
	VkLDj7K2nK5SBWsOF4ldsKFX2VMYllOLDEdOLYnXapeYhdRWM3ZVR+ftv/qWFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Richard Weinberger" <richard@nod.at>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Michael Walle"
 <mwalle@kernel.org>,  sashiko-reviews@lists.linux.dev,
  linux-mtd@lists.infradead.org,  "Steam Lin" <STLin2@winbond.com>,
  "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/15] mtd: spi-nor: Fix WRSR with ODTR chips
In-Reply-To: <20261002123432.42F6E1F00893@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 02 Oct 2026 12:34:31
	+0000")
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
	<20261002-winbond-master-spi-nor-w35t-v1-6-a22a2f95c26e@bootlin.com>
	<20261002123432.42F6E1F00893@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 04 Oct 2026 23:22:41 +0200
Message-ID: <87tsn1i2ji.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_142250_515892_2EA8BB99 
X-CRM114-Status: UNSURE (   4.84  )
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

T24gMDIvMTAvMjAyNiBhdCAxMjozNDozMSBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0hpZ2hdIG10ZDog
c3BpLW5vcjogc3RhdGUgbGVhayBpbiBzcGlfbm9yX3dyaXRlX3NyX2xsKCkgZHVlIHRvCj4gbWlz
c2luZyBXRUwgY2xlYW51cAoKSSBkb24ndCB0aGluayB3ZSBjYXJlLiBJZiB0aGUgY2hpcCBmYWls
cyBoZXJlLCB3ZSBwcm9iYWJseSBoYXZlIGEgYnVzCmlzc3VlLiBXcml0ZSBFbmFibGUgZ3VhcmRz
IHZlcnkgbGl0dGxlIGFueXdheS4KCj4gLSBbSGlnaF0gbXRkOiBzcGktbm9yOiAxNi1iaXQgc3Rh
dHVzIHJlZ2lzdGVyIHdyaXRlcyBlcnJvbmVvdXNseQo+IHJlamVjdGVkIGluIDgtOC04IERUUiBt
b2RlCgpOb3QgYSBwcm9ibGVtIHdpdGggb2N0YWwgRFRSIGNoaXBzOiB0aGVyZSBpcyBubyAid3Jp
dGUgc3IxIGFuZCBzcjIKb3Bjb2RlIi4KCkkgd2lsbCBkaXNyZWdhcmQgdGhlc2UgdHdvIGNvbW1l
bnRzLCB1bmxlc3Mgc29tZW9uZSBhc2tzIG1lIHRvIHRha2UgY2FyZQpvZiB0aGVtLgoKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
