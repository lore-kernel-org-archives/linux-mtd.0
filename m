Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778FEC982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pobQTO1T1cBQiKKq1Kyd73wdxJv3eZSuc5E42FzxAT0=; b=i6feVsSnVeP9Va
	TukSWJKxONL5okWrhP6Kw3v4dmuZFhdtgiiasSGqey9toUspA/HWSD/FhLyWi9GFgk2aAbpP0TYG3
	yZfwlHLR41h3szH0gqdHMOIdSUm1q7ljeywFZQ8r6s/lk6BxR+jalo+gDYSiDcYNiGGM2LRP1AJqD
	C+VtzGDDdQxVTafaice8MXkCSQpJTPAGM+szoOGY2iRHZPZeaWURpIflcMmIawGnCGmIvdjX149WI
	2oxE8DHnflPNYvuq6S7D+I41ilSYivL13h4omK4YKSTCCgBx8CJ2/ienB7erp+4qQ8a/3qaW+tmoz
	yO9jxeUZhK2lBKnbzMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6z-0000000HYFJ-0Nyb;
	Sun, 20 Sep 2026 14:01:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6y-0000000HYDu-0DOn
	for linux-mtd@bombadil.infradead.org;
	Sun, 20 Sep 2026 14:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Rqtx2xl9E7jS5Ru/exlFY1XMfpvRfYdJmFNa4tW5yMU=; b=LHXJIrRwJyVaA3LQJTUSLr/Urk
	T5D/A/jsCVNPm+QMlnb7FoZ9YCPCk5OLPeNOeqfVirok/+KVzY3v0O6fQJ2zvuPwzgaMNvh8Jp8Db
	gjqkNnXHxNuavhGPwmUqx+FUUTU/0PkSGdZS98/UwXrePHV/cK1Xt7/0kWRjLFAlPY0HmGuQtho0j
	epFvaUvvIObKFprfNzv8LtW6c93nEONMNhBfpqkkFfXx7UfAH6BZkPx+Vv+jPSAfXKb9DEmz17B1V
	3tb6rwdy/1yGyo4qk8ssesx0JB0fC4IGCwk6dfbok8cvzcxK+uzDIVlSwv4Y1CoE1ZWbdNP1HvXVd
	sLOuFu+w==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8I6r-0000000BPyk-46J6
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:01:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 458571A09A4;
	Sun, 20 Sep 2026 14:01:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AA026033F;
	Sun, 20 Sep 2026 14:01:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AF05103286A4;
	Sun, 20 Sep 2026 16:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912896; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rqtx2xl9E7jS5Ru/exlFY1XMfpvRfYdJmFNa4tW5yMU=;
	b=TgkXc45j5iN28Lyzufyk83yvjpteO0BC/OSui0w3CgubGLITqxnEy9Mg8rrbGwYRHmMHzX
	L/DLmrm4Ib6ONQBLoW72HvajwNfnfO/floVk6MAVs9P/7dTspyhgZIwrj9rZXQaO67kuSs
	zdQMXGtIHWmAVenLaL3TnYPpNQr9GxM3hnTiV37V6w2g7fl2cbUsm5jHvUFlWhxRHlD564
	EY4CTyKvKUKb196g3c0enzUFP4ntC/GubPRcC2zXMOf9U6Bcj/e3FVA2XJxubvQsvfoFh6
	SfnTgorMlxMrvM1AP7JYaOIyWAAZ5lce4RyXLjsyFZSdQK0PilZ69rBDNBmVYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:30 +0200
Subject: [PATCH v2 21/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-M parts
MIME-Version: 1.0
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-21-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_150138_392272_8B20FE4C 
X-CRM114-Status: UNSURE (   9.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is an ID collision between chips of same density from the JW
family (which it self conflicted with yet another family) with new PW
parts. Chips are very similar in practice, it is mostly a matter of
electrical differences (mostly power consumption being lower) as well as
the addition of inline ECC capability for the higher devices (> 32Mb).

Chips with ECC capability protect 16 bytes chunks are against single
errors. In case a non-aligned write happens, ECC is locally disabled
until the next erase.

Another significant difference is that PW chips identify themselves as
supporting the new SFDP (rev F) QER field which forces an alternate
write SR2 opcode (0x31).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 4c9cbe0240d8..c1792b12db63 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -684,6 +684,10 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x80), .match = winbond_pw_with_ecc_match,
+	  .fixups = &winbond_nor_ecc_configuration_fixups },
+	{ .id = SNOR_ID(0xef, 0x80), .match = winbond_pw_match,
+	  .fixups = &winbond_nor_partname_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_winbond = {

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
