Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8AECD3446
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VhNmEUCc7vRDykUGZGBxZ/QiPuNxYX7DpeWiNtvgq4=; b=zmlfPsDhHsFJWX
	3v22cOd0uzA2Ec6gKQZDWI/RBp+e5v9nUdhesrA2piiOScAFC6BkKsST8KYVNXPDYxpLKcq8fPfyy
	v/3l3QeNt8KWjIRSMTF2oDBXgDIXTdc4lsxjcQV71fkb9i27cauzpU8D0cfWq43X9JLaU0ymP1bdP
	pjcA1mu/isIlMKx31pxaJIlVBd8rBkxXSjySjPNUYca49GquJGSi7zib3MxgHYV5HDrHtgqb9KX2Y
	OHgTMtRF59wpvHEdlHcDolAP/7YbInc5qJZzvG7vh8yIm00eIfxmsAP95YQeSudqlORjudQS7CaoI
	PGe17E6EjbvKQYsjh88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1t5-00000004Nrk-22LG;
	Thu, 07 May 2026 16:47:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1t3-00000004NnN-0blw
	for linux-mtd@bombadil.infradead.org;
	Thu, 07 May 2026 16:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=edSYQazxhakuu8k26vId3X0/S/a6bSHMtg1O+5hvsoM=; b=bMjqEd60f1oAJevXRWmilHHe2Z
	dlHe/DDRRTnxlwuOn2WoaDpik1o+G7CMwJD3yx6uP8EbMOM04AjvijBz8Z1ecHyY1Jru8R3VotgxK
	h41G8XKRNTdGmMfMKMsCwmEImkN7zXZrywS0G12bvToTTn0qEelneGDBWIU0vTi/tq+qbK2Y+Qxza
	nmIdWiAZX4Avpi7Ldm1XUQEXA+k5DLPnFYcR9eZX/zGukDUp4Q43n62j9PvS2kZ3tnmKWJdJhoves
	XysYBkU4SLnQQFKszn5ztPdocw3Nz0ZuTEn7c02pJzZkk/xUPtYsfot/t9vUjcZCIX+tFFVgIesmd
	L8FMcV7g==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sz-000000046M7-2PLA
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 16:47:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1110EC5DC60;
	Thu,  7 May 2026 16:48:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45842605CF;
	Thu,  7 May 2026 16:47:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 993E7108194ED;
	Thu,  7 May 2026 18:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=edSYQazxhakuu8k26vId3X0/S/a6bSHMtg1O+5hvsoM=;
	b=vKwYPBrS4YjVoVEO4GxXcjYXKV+h72br8aWoMtv0FhCJ5KuSeBmfu3DIDU4ECsReg6P0ca
	EfguaW25dJKf3N5wm4kQ3tCe6HS4cg1fUNfZfXBOvTxqU70TOC5Oh6z+PtrhlIoBhmPiDD
	hdBgu664mNRAffAJHuC26Q5IOImFvrftq9xCYsK4d/hMlENhGT+3e6QBCqyKkEs5zICihR
	THTxfOZIrdeFRZg4g7lchfeulBO6+SFiq8+UA6TtQDcoar3BIjrQOrgLU4wNdZmfxFHWBu
	ihb7sENefFdmMfUuEw8a6WyHMzZSeTzNF7zg9KfZzYu+En1sxhmtpDiAFb3bow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:47:06 +0200
Subject: [PATCH v5 25/28] mtd: spi-nor: winbond: Add W25H02NWxxAM CMP
 locking support
MIME-Version: 1.0
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-25-93453e1a9597@bootlin.com>
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_174742_002919_D9BC6F4F 
X-CRM114-Status: GOOD (  14.80  )
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

This chip has support for the locking complement (CMP) feature. Add
the relevant bit to enable it.

Unfortunately, this chip also comes with an incorrect BFPT table,
indicating the Control Register cannot be read back. This is wrong,
reading back the register works and has no (observed) side effect. The
datasheet clearly indicates supporting the 35h command and all bits from
the CR are marked readable. QE and CMP bits are inside, and can be
properly read back.

Add a fixup for this, otherwise it would defeat the use of the CMP
feature.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Test run with W25H02NWxxAM:
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0000ffff | unlocked | 1
 00010000-0fffffff |   locked | 4095
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff | unlocked | 2
 00020000-0fffffff |   locked | 4094
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0ffeffff |   locked | 4095
 0fff0000-0fffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0ffdffff |   locked | 4094
 0ffe0000-0fffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 7628fa7fb64f..2c48d6c4a0aa 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -73,6 +73,26 @@ static const struct spi_nor_fixups w25q256_fixups = {
 	.post_bfpt = w25q256_post_bfpt_fixups,
 };
 
+static int
+winbond_rdcr_post_bfpt_fixup(struct spi_nor *nor,
+			     const struct sfdp_parameter_header *bfpt_header,
+			     const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * W25H02NW, unlike its W25H512NW nor W25H01NW cousins, improperly sets
+	 * the QE BFPT configuration bits, indicating a non readable CR. This is
+	 * both incorrect and impractical, as the chip features a CMP bit for its
+	 * locking scheme that lays in the Control Register, and needs to be read.
+	 */
+	nor->flags &= ~SNOR_F_NO_READ_CR;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_rdcr_fixup = {
+	.post_bfpt = winbond_rdcr_post_bfpt_fixup,
+};
+
 /**
  * winbond_nor_select_die() - Set active die.
  * @nor:	pointer to 'struct spi_nor'.
@@ -370,7 +390,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25H02NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	},
 };
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
