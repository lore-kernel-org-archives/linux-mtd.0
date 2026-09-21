Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC81C982E6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATkl1R9G21OoBxS2ZxsX2p78heLIFzbkaw3ZkJ4bmpI=; b=Ar6TYdV2z9kxKD
	Z9Jn0K9atNcFtGNXScmM1ey2tL8JBBrCfLYLllgOVNfYG4hfSyzpSX3d962+Q+YWKbW7SWOSvP78w
	f2gg/oI0GrBhiIrPIfkSCCNfVIayrq+u78BLUhRSw1ydj8ehp2KVKpGt1QeYk/1dSb5qgtlvcc/ZF
	b1yRdPL1T2av8KFX/g1ZmgFGO4/aX3IXyh1/e/95MaXb7XGEzjrV/lWi7HrIcCN/rMzp9uvBhjR2n
	wYaWheUYryTlq5q6L2BvCJLNadJPK+PHyHAHL/Zmh3U7S6JrrOEKuhi1rkJ6jxgX0J8UW8JuUpWIT
	AEXdc/zQh2alyUljMOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlT-000000015o7-3OG9;
	Mon, 21 Sep 2026 06:44:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlP-000000015ga-1zvp
	for linux-mtd@bombadil.infradead.org;
	Mon, 21 Sep 2026 06:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=TNwgarWq0JHZs1SD5eqs91+wzorfos1+poTgxbfbpGw=; b=dFTxVWxxgqjK9MySbKsX078DnK
	nhg5vAV1YcnX3rGllWTWnD63ZQ9wpjldacBHnHRCa4Km87/jxexQYkqTkFcLlFITzFjBJK3wIFrW/
	q7EvEHLKJQJWYLIrc3DCR1x07+Ief8vFzFRgxQWJ3GyGnpPk7x5sCxM2wL0+rlNggnHLU+WyKKDrA
	AHKF+do3+nQ/L4FVP8v1vA24G0fCu8DGTpoWyh8P+70LW9HEMekeGG4QwVY1+8whhv0vV9msI/xHb
	IDameftbyRTWgHSbt3UQ0sP6ALs3F9pR/+fi7fedePDYK8WsMiXTk0yDxIMz8RbBSAV+K8ThUPmcc
	DDYy+HQg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlG-0000000Ffx3-45f0
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:44:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 941801A0DBD
	for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2026 06:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68D0760339;
	Mon, 21 Sep 2026 06:44:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1497F103290D8;
	Mon, 21 Sep 2026 08:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TNwgarWq0JHZs1SD5eqs91+wzorfos1+poTgxbfbpGw=;
	b=LYnqliO9jZ8rtoqXVLtla8glc+BBDa0vMKZ7lAnexw665HcqpSvBpqQauolHad/aCtbnPJ
	LuoWRlbsA4E9Q6/TchSajT7Ocq74Uz7Gbt94Ounfh5cdGhZ3kIBroFrAE/nXZbQ9Ew+cSP
	sr2Mqf6SL+5tEcJhnD7q14/7ppH6OunYCpwGC6ifNf3Sp/9ual20HnIPw/FZq5mpNdU7nt
	VrktNXwGeJdKBmPbAezglatfIF4iRfBq6bAvONDeb+VxbfaAKbr5z1/GV5XkU0jKCxyzd3
	e0WFSQynL90CvA3tggG9o75C6PLNEu6vMEos7leRyk96+uvtg7wSE71Y14pcpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:52 +0200
Subject: [PATCH v3 21/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-M parts
MIME-Version: 1.0
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-21-38eef3b6a7db@bootlin.com>
References: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
In-Reply-To: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_074423_119066_628D8902 
X-CRM114-Status: GOOD (  11.66  )
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
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
