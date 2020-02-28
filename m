Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E2BC3F2CD
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:04:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F9524699
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:04:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BVP0oaMw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVvNfSka"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F9524699
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pSm2gdjhdqNbDLmPqXLrUDxQ//B2RmgKgeK/BCcaUqo=; b=BVP0oaMwzGq90QUEXz865zJpYz
	XWjtu5+Ubn6mEsf3xer5/o5KCsAFyuoIH+kaT2N5Dd4jsqylvfImPx12gtMdvfcwZRdUPkmIW868T
	h+g2yTChIqTdHG76R5NGzqk/0yL3Np5nJxCn9PkBhRxmLJDdNbGhueEsU1IB/gDcGMXHk6I56S7aO
	Dv2DN0FZh5girKHjUI8reLiYvah9UZw54z3/fXfxtzHrIJ/A0s4PJpalS2R52y/F4u/pAZuQNz5db
	N2dKC+Sbc7KmMtfnldZxJqsNtqhNM/8MzQh0pyadh8nF7ochMcjfC+x1t9+V5U4HemuSbKVhMSO/9
	gGC0+9rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7hBR-0003Ez-KX; Fri, 28 Feb 2020 15:04:09 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7hAk-0002WW-HD
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 15:03:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id p9so3525626wmc.2
 for <linux-mtd@lists.infradead.org>; Fri, 28 Feb 2020 07:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z66mLROcRb3dfNo7Pup4ya4KCgpDgjiDJSKhfyea8EI=;
 b=MVvNfSkauJWhUbnCvTlwgt+WK0GJuss5eYHpGFQNCEYQz5ebG7+YPjkvKOv1Nu5/NH
 lGKXDjNbisRzcp5kNDR5GDcQnnM/FLF8A1kQWpIrmiBlvD6HndP3zNZ2pdMz/0vWSDN5
 /DJ1OmOYhT1ksNTDXlMLMozRdwUfw70TYCBaz3AWyFW3bBL/qXOKt4q5XOV5rhGN2XFN
 LyA6zjTKtr4ZAXUpGC3LmhDSS7kXY7hOmRlk8B/kZL1VSNwJa1MeuKfavVZ5e/6cerYV
 AtUgBNJUEof+ju1iVUGvirpApsFLJisd3BWA5RAejUhOkKbDVP1XNpGSWyOc6Sb7i0ue
 x+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z66mLROcRb3dfNo7Pup4ya4KCgpDgjiDJSKhfyea8EI=;
 b=aBx+WZAXXppoU73F/fLGv0w5hSvulydcO8M3YYRNdAkvw3Rkb3qraaksfkjZtyI2cY
 YtcjpzmyC7FypdJEHDhOLphmDEfQfr344pPHlua7hmakV3tGowhAPbRePxwdVF+KUvU8
 9Xw9sL2poYX/iuouLYvSIrOUgB8lNnzKsfP2DcbbQPpeXy7edNdSnNu7tqyLjniPDdYW
 lu5kArBjo/mrFwwwYp+s2mBw4mdkD6t3mFAnpaPPQfl8v1VZSscVDPlEwHylqvEFDCwI
 Uj8OBf8F7tT/aZItDn4s/cX1uLhRprM8UZ4kKFDxYXRcNX0mcTl++OYzfCvlSaA6t70L
 qJGA==
X-Gm-Message-State: APjAAAXkqqTMbMSXaQVZYo38fQt7TqhZPDqxEnzlJgMkaklgC7wZM746
 cEDxZCFVjW/xKEcpayovm/U=
X-Google-Smtp-Source: APXvYqyo6eUltgC/0VeEQHUVYmSWhqQ042mazC8I7e7+T6HHSQXxNVpp3kEy3nkPR2JYd8pilIYjvA==
X-Received: by 2002:a7b:c3cd:: with SMTP id t13mr5194931wmj.88.1582902205278; 
 Fri, 28 Feb 2020 07:03:25 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id m125sm2540235wmf.8.2020.02.28.07.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:03:24 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] mtd: spinand: micron: Add new Micron SPI NAND devices
Date: Fri, 28 Feb 2020 16:03:08 +0100
Message-Id: <20200228150311.12184-4-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150311.12184-1-sshivamurthy@micron.com>
References: <20200228150311.12184-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_070326_583256_A6B4B539 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Add device table for M79A and M78A series Micron SPI NAND devices.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index e4aeafc56f4e..5fd1f921ef12 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -101,6 +101,36 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M79A 2Gb 1.8V */
+	SPINAND_INFO("MT29F2G01ABBGD", 0x25,
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M78A 1Gb 3.3V */
+	SPINAND_INFO("MT29F1G01ABAFD", 0x14,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M78A 1Gb 1.8V */
+	SPINAND_INFO("MT29F1G01ABAFD", 0x15,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
