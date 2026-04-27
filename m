Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC123FF886A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 13:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OnCJIl04qGNTIp7Yr9jmhcQ6pTNM5saLPQ7mySaTKY=; b=eYeW1CF9blh6/g
	cEH3dSGFJnrVNiEN9pG5SBt0d+1yv7Ux3l6YIb0xMDVs56EHjCWy3s/a5z9DHWq7pa+64yOaa9DzS
	77Xbb12i3f6EZWk8cM2oMotH0tu4WKAtXMY9qU3zdxPVzuCS7jgfzuuLqzrT3KAxZpp7txaPs2xag
	u3ilftb/wk6MG4xYZfEYgLe/93nkKEtuiPLC5FMTJzPCYTFMVxecSiWw3yd3kga31bSp4NVPT2K1s
	DzWJfDObofBavNaXmdL/a3WOQrQBBxsWgo1LY0LnjpfuikUurWm+arXFSD6PMMRtiHdQlCenR+vqT
	/yE2Put4YH1GYfXM8PQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLhw-0000000GyZY-0Wr3;
	Mon, 27 Apr 2026 13:09:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLhs-0000000GyZ9-3JNY
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 13:09:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 097EF1A3443;
	Mon, 27 Apr 2026 13:08:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBC16600D1;
	Mon, 27 Apr 2026 13:08:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EE9510728039;
	Mon, 27 Apr 2026 15:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777295337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O8yxX0gO7nTEAcY/1Dd9O+rvwBL+vwhqZY4uok46s0Y=;
	b=JB5ppoGws1cWp+TPLhjXB5zGL54fxXQKVnuBVJ+xwaYL/LTsh9W86NI79+k3pKTL4+0rDU
	D+evLg+uwrklJarNRyhcQ6zlBErM75BWT4B7J8eduTjGV1cTBwvRlUMoD/eaclWTh0Td5J
	k+OWhNWUqrRAmwL0wht1io4Ayzu87O+26Jd4fY+orcP8PxdCoXyXTjO6wC+zKaSLIEmG+6
	ZYXZfa5YD8JQdhlxZqFJkQWyrWfXQA2aoNJwEXf9qc/9ONswo3SHB56r848y6uFKLLQ5qY
	wcYTNjiiFgzXXyg9ZZ1RvDRIgFPSxoHN8isdX/FOOYy7S++7UNxoD/9FhyICOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
References: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
Subject: Re: [PATCH] mtd: spi-nor: debugfs: fix out-of-bounds read in
 spi_nor_params_show()
Message-Id: <177729533643.179808.1459860787473321982.b4-ty@bootlin.com>
Date: Mon, 27 Apr 2026 15:08:56 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_060900_981273_5BF12690 
X-CRM114-Status: UNSURE (   6.58  )
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

T24gRnJpLCAxNyBBcHIgMjAyNiAxNToyNDozOSArMDAwMCwgVHVkb3IgQW1iYXJ1cyB3cm90ZToK
PiBTYXNoaWtvIG5vdGljZWQgYW4gb3V0LW9mLWJvdW5kcyByZWFkIFsxXS4KPiAKPiBJbiBzcGlf
bm9yX3BhcmFtc19zaG93KCksIHRoZSBzbm9yX2ZfbmFtZXMgYXJyYXkgaXMgcGFzc2VkIHRvCj4g
c3BpX25vcl9wcmludF9mbGFncygpIHVzaW5nIHNpemVvZihzbm9yX2ZfbmFtZXMpLgo+IAo+IFNp
bmNlIHNub3JfZl9uYW1lcyBpcyBhbiBhcnJheSBvZiBwb2ludGVycywgc2l6ZW9mKCkgcmV0dXJu
cyB0aGUgdG90YWwKPiBudW1iZXIgb2YgYnl0ZXMgb2NjdXBpZWQgYnkgdGhlIHBvaW50ZXJzCj4g
CShlbGVtZW50X2NvdW50ICogc2l6ZW9mKHZvaWQgKikpCj4gcmF0aGVyIHRoYW4gdGhlIGVsZW1l
bnQgY291bnQgaXRzZWxmLiBPbiA2NC1iaXQgc3lzdGVtcywgdGhpcyBtYWtlcyB0aGUKPiBwYXNz
ZWQgbGVuZ3RoIDh4IGxhcmdlciB0aGFuIGludGVuZGVkLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRv
IG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiBzcGktbm9yOiBkZWJ1Z2ZzOiBmaXggb3V0
LW9mLWJvdW5kcyByZWFkIGluIHNwaV9ub3JfcGFyYW1zX3Nob3coKQogICAgICBjb21taXQ6IGU0
NzAyOWI5NzdlNzQ3Y2IzYTkxNzQzMDhmZDU1NzYyY2NlNzAxNDcKClBhdGNoZShzKSBzaG91bGQg
YmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4
dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJl
Z2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
