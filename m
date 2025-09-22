Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370E1CAC5AA
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4IfQxdUQsOgCijKy6Sgj5k41ss8Iov2Tgt2zYwDIZo=; b=MrYBEZFbrK0rT1
	6jDDDHzKzJCeFICE6dKrevJGY6URSLgpzNpf30F+ZKYhv0s9ckHRI0RYipMW3gI48Xh8oF4Pq91zE
	WSMausS/ls29bQf9o99ug+aHmf+Zjtl4x/5jlikFFwsRkxmYKqTgSVmaEcOePs+//bcmfeCst1Wc5
	DWVMtEoswTzcYesohYksuijIa+ABeQPJ5w/l6zgIq+5wFZQHpmKGt2uVIut/+R019snuG604PWY/d
	JsB7v6Ldl+N2I8JQ62ZJx18RJ0jjE5+Gr3sdvuCrp3Lt6HsRDuLB0k1tiLhG9Qs6djnXOclyamu7+
	aCOmk7ZfKOkmRlDI1sDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iuQ-0000000AuM8-0fRW;
	Mon, 22 Sep 2025 15:56:58 +0000
Received: from smtp15.bhosted.nl ([2a02:9e0:8000::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iuN-0000000AuLQ-3oYv
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=dnxsXnzMfxrD8+re7WIJCjdAfu5yHxyZgjdVmRrDzZc=;
	b=v7TJKlbltdvu2szaL1HTBkerW5GYUq4QQwOomP5I1nogRrIKfYa/umsJwY0V4w49rdCSkHTGjoGeA
	 0GLVvBjOys/0ffRiPdUfC40rh3urzecKaTrmsgvyyBOislJx8vYOo7v8jmV1x8VDnrF36FeGT1PJqG
	 K0BdA79jXZXjr60j+3Yb1s8m4lj5/r2zVKKT8nsTPwZZka8qjAp6AitkYpivzsxlm2aOfa5Lf1gKwx
	 6cmi0rVdbKy5c8KTKE9GcLlo25e0IrotXOkwqDb1SP7QxZEKzLG8675N2F9+QDp6G++MK27CBRkFNJ
	 Ci1JJOTxTu1dMXsPjjxMcuCZy7cpsCQ==
X-MSG-ID: c27314e0-97cc-11f0-9d69-00505681446f
From: Maarten Zanders <maarten@zanders.be>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>
Cc: Maarten Zanders <maarten@zanders.be>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: spi-nor: macronix: use RDCR opcode 0x15
Date: Mon, 22 Sep 2025 17:56:33 +0200
Message-ID: <20250922155635.749975-3-maarten@zanders.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922155635.749975-1-maarten@zanders.be>
References: <20250922155635.749975-1-maarten@zanders.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_085656_083893_25AB2266 
X-CRM114-Status: GOOD (  15.17  )
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

Macronix devices use opcode 0x15 to read the configuration register (CR)
instead of the default 0x35. On parts such as the MX25L12833F, reading
the CR with 0x35 returns garbage values, which are then written back
when updating the status register (SR). This may unintentionally program
OTP bits (e.g. top/bottom block protection) and change other default
values.

Other Macronix parts avoid this issue because their SFDP data specifies
that CR is not read (BFPT_DWORD15_QER_SR2_BIT1_NO_RD), and the driver
assumes CR defaults to all zeroes which matches the hardware register.

Set the RDCR opcode to 0x15 for Macronix flashes to avoid corrupt CR
writes in cases where it is used.

Note that for affected parts, the block protection mechanism might
remain broken through the OTP bit: locking an upper block (which is the
only one supported by the driver) is now locking the lower block in HW.

Fixes: 10526d85e4c6 ("mtd: spi-nor: Move Macronix bits out of core.c")
Signed-off-by: Maarten Zanders <maarten@zanders.be>
---
 drivers/mtd/spi-nor/macronix.c | 1 +
 include/linux/mtd/spi-nor.h    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index e97f5cbd9aad..de3f3d963f86 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -322,6 +322,7 @@ static int macronix_nor_late_init(struct spi_nor *nor)
 	if (!nor->params->set_4byte_addr_mode)
 		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
 	nor->params->set_octal_dtr = macronix_nor_set_octal_dtr;
+	nor->params->rdcr_opcode = SPINOR_OP_RDCR_MX;
 
 	return 0;
 }
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..e35405b126c2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -92,6 +92,9 @@
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
 #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
 
+/* Used for Macronix flashes only. */
+#define SPINOR_OP_RDCR_MX	0x15	/* Read configuration register */
+
 /* Used for GigaDevices and Winbond flashes. */
 #define SPINOR_OP_ESECR		0x44	/* Erase Security registers */
 #define SPINOR_OP_PSECR		0x42	/* Program Security registers */
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
