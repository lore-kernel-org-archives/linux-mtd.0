Return-Path: <SRS0=50Qk=S6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A696CC43219
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 18:10:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A2502067C
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 18:10:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pcpe1Yj2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MDXXcj5m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A2502067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DW6WBvIYEYVs6hFRRUije//0XCNzDUjoHCAIHvJ26A8=; b=pcpe1Yj2Xr8MlNwsDMnS8uEizP
	q1d5ORaQpNTwoSocxZnBAWFLkQoGcXfgqcdpWglkMaIGmlCtOtOuvYVDkTp76L3FGubO/wPHnUuih
	KmC0vjMbHgT28tQQLROu7SC5jdC1K7htnUo9el7trcNFGnLcV2m3modrIPmrG29oEdNlJBQMWCd4h
	gDg/9fMVeS6CbbadZnfRLrjh/xULPOWBOV0FWVV9vyA1cuXQmZ1b051Er2MBrUcoRSonJoHRm1Gmd
	R7n/auu02qW3yuXr0dkzGogFXWyTjgeRMhfZzeGCCIUVzwuwp2k2Ek4nTlN370HyUl9NnJBRuyQXe
	+IzFp7Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKoFo-0006cy-9d; Sun, 28 Apr 2019 18:10:20 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKoFU-00059E-BY
 for linux-mtd@lists.infradead.org; Sun, 28 Apr 2019 18:10:03 +0000
Received: by mail-pg1-x544.google.com with SMTP id k19so4080293pgh.0
 for <linux-mtd@lists.infradead.org>; Sun, 28 Apr 2019 11:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ohuUhz4x6Zl7HFy2hPxACEBNrjELYOPEczRq/3tltOQ=;
 b=MDXXcj5mz3+eAxqbaDVzpkVfcgJmHrCr8AtD5PVH1KAtWp0FrHIsBcm4Uz1Cdt+s4k
 3to7Sl9MRMa0jhkyLEK/xTeakw5Cd4sWtPHuw6p1ejVGzDChlw0BH5mXenX8dBRqCBZx
 h2cadE9uPrBsicmPSIBbCtkMy0ZAvTT/DhuLDkS1HjM2WvFwllL637GAtXi7MjBq/Q+t
 FM1YQZ9p5OZyRmvZXSBC83V0SxlbXRsLBBNdqNALePeP7KYtRvZf5V/ifaROowGYqqlL
 zOSFEUM4k4tbtPLQyTINrBRxmh18eMFshNBx61WKDPU8dKcKnvxdD+gHezXzUy2R9YMZ
 mN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ohuUhz4x6Zl7HFy2hPxACEBNrjELYOPEczRq/3tltOQ=;
 b=ldU0Q8BtWBD87vlMbZqQP9FLTqRy7CBEjI7yIhygBPmi1mwQipwrRmF/XvF7lulnJL
 2PCZN8MDRgh3/ntO8yvO8POYDavWu8/cAKKDwJw+CB1K/mb2jlxhf8CXRmE4HAT4CZLw
 rBB0NzJfFGMSJeF6lrtxKpUGcpus2pTiHBWYlhoBrHluuCCUtemQ5OFJqSqsnEJEQ8Z0
 Y9HTHzGkJHE6t793kFOUXuxnGHFc8gOaHcdpaLBESNZIe40GP0CdFZ3g/VglkYEpmsoG
 nFqG0/MO4vjkfJt4NFr1rWG9K7Xk75ZhMCkpCdauJW0QzBSUR7HpVAHE833Qanx/dv8C
 QSKA==
X-Gm-Message-State: APjAAAV6aVrYcBYzHOj5aRCQRFP5bAB+gZwjNJpVq3t1/SC8xm915jlN
 9WX/VZEesfYfglff8FjOYUXdzA==
X-Google-Smtp-Source: APXvYqyq0E1OO/NnqwXgZaHv0s0uS3p5TaTatpJ9CmBFjEw+fj7Fo0DXSUyTxVQBiRirvIcR+F9TBA==
X-Received: by 2002:a65:60ca:: with SMTP id r10mr4401741pgv.64.1556474999956; 
 Sun, 28 Apr 2019 11:09:59 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id l2sm36177136pgl.2.2019.04.28.11.09.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 28 Apr 2019 11:09:59 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at
Subject: [PATCH v2 3/3] mtd: spi-nor: add locking support for is25xxxxx device
Date: Sun, 28 Apr 2019 23:39:16 +0530
Message-Id: <1556474956-27786-4-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556474956-27786-1-git-send-email-sagar.kadam@sifive.com>
References: <1556474956-27786-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_111000_408697_AA3292E9 
X-CRM114-Status: GOOD (  16.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The locking scheme for ISSI devices is based on stm_lock mechanism.
The is25xxxxx  devices have 4 bits for selecting the range of blocks to
be locked for write.

The current implementation, blocks entire 512 blocks of flash memory.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 60 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 81c7b3e..2dba7e9 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1459,6 +1459,65 @@ static int macronix_quad_enable(struct spi_nor *nor)
 
 	return 0;
 }
+/**
+ * Lock a region of the flash.Implementation is based on stm_lock
+ * Supports the block protection bits BP{0,1,2,3} in the status register
+ * Returns negative on errors, 0 on success.
+ */
+static int issi_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	int status_old, status_new;
+	u8 mask = SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0;
+	u8 shift = ffs(mask) - 1, pow, val = 0;
+	loff_t lock_len;
+	bool use_top = true;
+
+	status_old = read_sr(nor);
+
+	if (status_old < 0)
+		return status_old;
+
+	/* lock_len: length of region that should end up locked */
+	if (use_top)
+		lock_len = mtd->size - ofs;
+	else
+		lock_len = ofs + len;
+
+	/*
+	 * Need smallest pow such that:
+	 *
+	 *   1 / (2^pow) <= (len / size)
+	 *
+	 * so (assuming power-of-2 size) we do:
+	 *
+	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
+	 */
+	pow = ilog2(mtd->size) - ilog2(lock_len);
+	val = mask - (pow << shift);
+
+	if (val & ~mask)
+		return -EINVAL;
+
+	/* Don't "lock" with no region! */
+	if (!(val & mask))
+		return -EINVAL;
+
+	status_new = (status_old & ~mask & ~SR_TB) | val;
+
+	/* Disallow further writes if WP pin is asserted */
+	status_new |= SR_SRWD;
+
+	/* Don't bother if they're the same */
+	if (status_new == status_old)
+		return 0;
+
+	/* Only modify protection if it will not unlock other areas */
+	if ((status_new & mask) < (status_old & mask))
+		return -EINVAL;
+
+	return write_sr_and_check(nor, status_new, mask);
+}
 
 /**
  * issi_unlock() - clear BP[0123] write-protection.
@@ -4121,6 +4180,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/* NOR protection support for ISSI chips */
 	if (JEDEC_MFR(info) == SNOR_MFR_ISSI ||
 	    info->flags & SPI_NOR_HAS_LOCK) {
+		nor->flash_lock = issi_lock;
 		nor->flash_unlock = issi_unlock;
 
 	}
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
