Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C95DD1D478
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUI7D1BzsM1arWZswxtHjIt+fybxVUKng3LvVnJ4cWg=; b=1YArUDjxNFeGFr
	I8YzqVDh4z0+mjQDkaQnww9cizcqqTiad6+cnt00859rEp4k2Q5S9D2sjT5d0sLJtmp3oYRr5w8+k
	XKsxmzT13y7J8SrdPsQfRAZxH9tr9Wyg28rBG+eBfpK002AoXHbbQ8U4o8s5RvPvujGCNZJFna5Hb
	VsczrxDvXGUA9w8KUIVME/Anz8LoxAYZwsD7HMg7WIDtKKfGwQ2zP9dqY5pMU6PSvXgwC2PI3GaiY
	0PcqwWJRUX1TkIH1Kc3jGzeHkHFxiIPGNcWE3kzzsQdknsPx15cvhaVvuNJKGX7i4z4kFAGUS+q9s
	fiWckSex5eW0IlCdVw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtMm-00000000GRs-1zP6;
	Thu, 08 Jan 2026 17:00:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtMS-00000000FxB-0eve
	for linux-mtd@bombadil.infradead.org;
	Thu, 08 Jan 2026 16:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xcYJgRzc5IqRAQH6jo52JPsF7X3RMUjzZg/GlVf9yBA=; b=ZQP80ug7gx7Rf2qT4cqhTxna/2
	sMfvHfeajCUrLtqVOvv1+euX9h0WWkaLbytWSvcx6e6bDixSl6guwVxkpD9ZqSZP4GQyc+kz1ElsT
	T7veAprah2wqS72z6I05ON2uylKV/s0u9UIYCqQofGp+e8uf0Pi1uyILwWfGAvQCd++r7uHXARaKT
	3AUink5w0nlzH9LEPm3quiwgm/QB4lItEDnC1+wQ3B3uUynEgP1AxxcbMHh/6O6EUBJwcq5BLQ56q
	TrHI+o/tUQk+nIuEZ2M7FWu4DuBZiWRwFpt2NiiYgiV+0P+BLqWFdbmWTSr4IRhKORfBDNlqMisay
	1Gax/XiA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtMO-0000000Djds-1Gbu
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 16:59:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57C131A2713;
	Thu,  8 Jan 2026 16:59:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B1E56072B;
	Thu,  8 Jan 2026 16:59:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 712A1103C8897;
	Thu,  8 Jan 2026 17:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xcYJgRzc5IqRAQH6jo52JPsF7X3RMUjzZg/GlVf9yBA=;
	b=OuU6d/rqHnFnL/dJucYXq+OFx1ZTFwmw+mz+XtdYxAeK4npMpb3E53xKYewBSkVIvqeQLZ
	1nROS63axgdWrjVS66wWso266esV/87XgWhwuOZplkZxHK1GPJyyExIyzqouRL0DncXmNy
	UV2HeCe7WNEuqEg0jaBdvK005nnu7q4J3qm54mAmKEMvtJxpVbkIsQAybTYDwT7kDDNs/e
	2AyLmXIaXX04eSxVfHvo836blGcxkr6qeMhimAjnTi+WvUxuZ1CLSdZkJ4y5Bcgj7rPInD
	b+DWFmdSleKzA1hrmvmIlzmfmCv+5wKEYIPd/bQ2EaZ01e+bS8Cbp5zkMgJVAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:57 +0100
Subject: [PATCH v2 24/27] mtd: spi-nor: winbond: Add W25H02NWxxAM CMP
 locking support
MIME-Version: 1.0
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-24-c462ef806130@bootlin.com>
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_165945_360661_AB63EA1E 
X-CRM114-Status: GOOD (  16.06  )
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
index 1b9b0e9598ef..959fd4f46eb5 100644
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
@@ -368,7 +388,9 @@ static const struct flash_info winbond_nor_parts[] = {
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
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
