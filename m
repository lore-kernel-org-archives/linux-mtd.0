Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28104CAC587
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mGTjYN5YNEq28Hqg5XIONpTl4ODSqTdroiW9KF868Q=; b=BxYkr3F3FPt8jE
	HkIF2f6Jh5Fgr7mu5vTL1PeFbpdZ+6MM8eRObuX+6J3cHlZuKTrFKDfnQy/anTuH0IwLkjMFGSTpl
	PX9z7/JRHjI3Jfkmu8grzY9zefw6cMSHoS9UZa1nTvbtoJVAIWfUtJ2lensVX7Z8aue4j7xG8cbq2
	tq69/d3DQfhc8fYvm8s5f1XvZNxuY56UAWSYP+So1V8C6N9Aw/dLoYLgsF9W2VKUON2EaHJyPY9Uc
	VwGb6BfAPQp1PLf8HWFPEg6TkuNmhry9Yno4HLHQoBkr9j8ZBKmQ2lFYW4n9ko6ZGlwDTjO8huDyc
	qy0Qmd257uhFtpXhbjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhve-00000003RU1-0PGW;
	Thu, 11 Sep 2025 14:05:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhvc-00000003RTe-0ehq
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 14:05:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCF511A0DE4;
	Thu, 11 Sep 2025 14:05:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 938EB60630;
	Thu, 11 Sep 2025 14:05:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77946102F28ED;
	Thu, 11 Sep 2025 16:05:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757599534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZRVLDX6fwrfDYhNM3J3FGUJH3ZvtwHGxkJzJLV/IGqA=;
	b=SDnrZy2vS1E3ke7pypMMRvQhvZj3r4097DXXUas5BpMF+OOcY81Bk5GXG5/scIDl0JkPE5
	cBVoEmHCVCATnH3bdnQqDQyLvcAA/bYlFzaOyld5GNeT98l1qavrE6tOtXI6WoF+Zzy5Q+
	gPx6Z/yHj1J0DqfO1YJTlpaNVQzKcu2F8Ncuu9wnQRoY5nslGXNZG4c98ksmYRUoYzrcTb
	oDaYUFTyDiodl9CzbjViSAOUK+o1kNseqR+8I8PT7bASeRgA3YhcZ4GMcluMzYrGf/40kN
	zmGwxrTG7b6dFldNPV0gjD5LbShm+k6Ddgv0UnbumEce1Wxd1JzuPh3F++9toQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Gabor Juhos <j4g8y7@gmail.com>,  Santhosh Kumar K <s-k6@ti.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org,  Daniel Golle
 <daniel@makrotopia.org>
Subject: Re: [PATCH v2] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
In-Reply-To: <mafs0v7lpi1j5.fsf@kernel.org> (Pratyush Yadav's message of "Thu,
	11 Sep 2025 15:03:58 +0200")
References: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
	<175708415877.334139.11409801733118104229.b4-ty@bootlin.com>
	<454e092d-5b75-4758-a0e9-dfbb7bf271d7@ti.com>
	<87348tbeqg.fsf@bootlin.com>
	<a208824c-acf6-4a48-8fde-f9926a6e4db5@gmail.com>
	<mafs0v7lpi1j5.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 11 Sep 2025 16:05:31 +0200
Message-ID: <87a5319j9w.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_070536_333282_D25CCF5F 
X-CRM114-Status: GOOD (  10.15  )
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

Pj4gU29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlLgo+Pgo+Pj4gR2Fib3IsIGNhbiB5b3UgY2hl
Y2sgd2hhdCBoYXBwZW5zIHdpdGggbXRkYmxvY2s/Cj4KPiBNeSBndWVzcyBmcm9tIGEgcXVpY2sg
bG9vayBhdCB0aGUgY29kZSBpcyB0aGF0IE5PUiBkZXZpY2VzIGhhdmUKPiBtdGQtPm9vYnNpemUg
PT0gMCBhbmQgbXRkX3JlYWQoKSBzZXRzIG9wcy0+b29ib2ZmcyBhbmQgb3BzLT5vb2JsZW4gdG8g
MC4KPiBTbyBub3cgdGhhdCB0aGlzIGNoZWNrIGlzIG5vdCBndWFyZGVkIGJ5IGlmIChvcHMtPm9v
YmxlbiksIGl0IGdldHMKPiB0cmlnZ2VyZWQgZm9yIE5PUiBkZXZpY2VzIG9uIHRoZSBtdGRfcmVh
ZCgpIHBhdGggYW5kIGVzc2VudGlhbGx5IHR1cm5zCj4gaW50byBhbiBpZiAoMCA+PSAwKSwgcmV0
dXJuaW5nIC1FSU5WQUwuCj4KPiBNYXliZSBhIGJldHRlciBjaGVjayBpcyBpZiAoKG9wcy0+b29i
b2ZmcyArIG9wcy0+b29ibGVuKSA+Cj4gbXRkX29vYmF2YWlsKCkpPwoKSW50ZXJlc3RpbmcsIG1p
Z2h0IG1ha2Ugc2Vuc2UgdG8gZG8gaXQgdGhpcyB3YXkuCgpUaGFua3MgUHJhdHl1c2ggZm9yIHRo
ZSBzdWdnZXN0aW9uLCBpdCBpcyB3b3J0aCB0aGUgdHJ5LgoKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
