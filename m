Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9048ACD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRP0WUDZo1MZerWGA0VUBU1ZOCtC6BM5I7nXtOrZQX8=; b=HTXVN+xSCO9WRw
	FYGKYexxMILG78iwm/8T7vt0AlGPiUnf1sBNgXMtcpJe9EGFt2uUp52RrC+ZYOYKo1pR0TMErwYdo
	NWCDGro97SQJIctq11N2BcssZWL9291NkraqymWbLGqvl1+13ZQq2oar8iEafO3YrtkR8oUfC9MNF
	J7sZouNiBlLoKl+avIikYpX9ZlmEh0eBpiZraiZ1TmznX7Pgw+52acD53nJc+x3wGCov/8NmAXVRK
	267CvV7bKCvxY9/2yw+8qx8agTxCPhHpnjj5DKICPJ6WDC+EvxRHOIcFPl3GpwpBeeaRVUEcrWGrp
	iygputhN6NEDCF/1XF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtE7-00000002GUg-0SGZ;
	Tue, 26 May 2026 14:57:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtE4-00000002GNp-2R1h
	for linux-mtd@bombadil.infradead.org;
	Tue, 26 May 2026 14:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tZrjKlrSTIx0EpT8S91i2zZxREgNAGIUjyhXtv54w/g=; b=IHg8UwuaX2pGJE5BHullyihUVP
	3/hZb+vEE/iFN+r5AtchiBEAHB5J1stbevw65wn8jiseMKLZCBSEfKefJy03rUmRYNVTmg+RGYz6v
	6t6TJOjeAvbYChfR5F+mddD/Gthk398Mlrce0PYIDrWmnnk4P8vuQtGL+PRWUJ0gHRMUnKJVGxSrp
	DAyN9MpZyJQB1+ktx2oJZ1DsMkeLt1yI/46Rm6SOH17ToQrNS/rHxHt5Uft1Oz3lLdUqQydhDMzEY
	d5z+nKFSVow+F4NjurPrueuJpGriDCnMnhTm4nYqQsmrCWToNR9c0y2OWkw06dR9X9LRcITNk+VTd
	VONnceCQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDz-0000000Bazl-4AUd
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3EF39C79ABE;
	Tue, 26 May 2026 14:57:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D52166011D;
	Tue, 26 May 2026 14:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F4AD10888865;
	Tue, 26 May 2026 16:57:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tZrjKlrSTIx0EpT8S91i2zZxREgNAGIUjyhXtv54w/g=;
	b=2u4ore6k2VW6md2mMVcAkBL+AYihfqTaVZB2EzIbys+W+OFuunvTVrbvzu2rfMDDI+snz2
	o5KtTejGgqptkKJ8l7/4Jws+dcLRqWDDsAU0d8wtN9K7QE0bSIozzn+DdOd+DbUBo6/zG0
	1otK91C0SR+dHzIZbAtk1AmKcm7bxGPLUXbWOwWCmKKdgQljy5s33c9JHUSyCpf4VfyZpI
	JzfuHzFwaFnp4NNePOErVXpz6qIlbIYZg7V37B6HSrPObaTa4YKLM6mIivvy6XzLcIFlLT
	1sPk2ClgHBR7GO8cJYXjVhHlulRZC9E5MFkCvZ6nm5CCeU7f2iU3rY6wuJekjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:52 +0200
Subject: [PATCH v6 28/28] mtd: spi-nor: winbond: Add W25Q02NWxxIM CMP
 locking support
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-28-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
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
X-CRM114-CacheID: sfid-20260526_155744_370273_6730BC2A 
X-CRM114-Status: GOOD (  13.59  )
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
Test run with W25Q02NWxxIM:
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
 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 3a3b7f2f1659..8ebdbcec0b3f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -379,7 +379,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q02NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x22),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25H512NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
