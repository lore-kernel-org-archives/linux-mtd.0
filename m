Return-Path: <SRS0=p/ok=GY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EB7C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 11:07:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FD3F23602
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 11:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FD3F23602
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nxgBPZpG9lccJY9DKO8Vh1jlqVKJblnqPkYwUZHSh/Y=; b=0uLisLdeq4rlRntpSgc6RfA9M
	GDNDTKUqP89Y3ac6hpfzwC+5HheywgALNtJ1m83NaOYqjDt736OOKm/iG9G/VkCy80v01wCueM9z6
	jEiuxEIHKtog/rW0ZHtMNhXopcGhQmBCy4gFGrySG2YE141mdbW3G7MRqWZSpB0+JsP6jPvQbPvKh
	14t/dH9WKwHnPjIcU32K8K5l8ql53UlFnMeiwYf3IdiHHbDEnAFMl90X6lb3PxgVONBed8Sb0+Q9K
	IwlMM88diB/vLOhb9dBypLW0Ns8O9r8sXytTuxpLZfJ4WIFWOVJjIzzC6D9Ku4Lb2W2G5O+9R2hvk
	ql+ep3mVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Xmq-0003QJ-Ij; Thu, 21 Jan 2021 11:06:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Xmm-0003P5-G9
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2021 11:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611227157; x=1642763157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZW2Po+iRxqwT+mLgUcs2IUScO0elOp7Zu2+SE07oNTg=;
 b=vxO6V1Ov5PqsDi46tVLFfezbmcwMjuLdgSYYmtHS70aCXc18TWtELl1e
 pOS+KreivmACseEgsUYbuFErcF4faBNavd8v9B/9paMLsSbbKXCk6x8rS
 StvHf713tlQmyOf+4+ux7rxYMY/XCVP7JTZEfOvTVnPnPWCu1SsM/8V2O
 rpr185Zzoxuz9W/DPR5S3f029YgFoawFb2E5zLESFgFXVt9KN5hDNlvvs
 YtWuKG+pvu1mJrbWRmTaoVLhxRyAfJAKBNliDUd4XKNK209zwEAISCYD9
 cWfLPvgxPl7c9LDKEAnw8d7XvuGbyYYmwKtmiWrZDRn7ugj+WZhCsYOJ8 g==;
IronPort-SDR: c908ihq3s6qI/Sif7VnrLhVUNLfjLsIr6rxzGXoN55VhrNfnXEnIosSRiPJbIehqzlyO4BgW52
 nvr+MRdP/phDe9P2604xtpds2MkReu8UrXboBT6sf5r61RbjUnhp8VhDdDiFuBuBpHvL8+I+Ko
 6ogWZ0G03zHhRLfX/D/PV839lCqyJBruM0SwqU1PDCdbFKDrQNQ3pWkQnf9cf69L8xnuemVglA
 K/lZGimaQmUBGN2XPOyrT+WRR7NeCEXK+/aJPr5kquZA/pZRESsvOoZMuCG2XsccEks/UD2pD1
 Hhs=
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="106240014"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jan 2021 04:05:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 21 Jan 2021 04:05:53 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 21 Jan 2021 04:05:50 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 2/2] mtd: spi-nor: sst: Add support for Global Unlock on
 sst26vf
Date: Thu, 21 Jan 2021 13:05:46 +0200
Message-ID: <20210121110546.382633-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121110546.382633-1-tudor.ambarus@microchip.com>
References: <20210121110546.382633-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_060556_664796_EEB0CCCF 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Kavyasree.Kotagiri@microchip.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Even if sst26vf shares the SPINOR_OP_GBULK opcode with
Macronix (ex. MX25U12835F) and Winbound (ex. W25Q128FV),
it has its own Individual Block Protection scheme, which
is also capable to read-lock individual parameter blocks.
Thus the sst26vf's Individual Block Protection scheme will
reside in the sst.c manufacturer driver.

Add support to unlock the entire flash memory. The device
is write-protected by default after a power-on reset cycle
(volatile software protection), in order to avoid inadvertent
writes during power-up. Could do an erase, write, read back,
and compare when MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v3:
- s/Winbound/Winbond/
- read CR.BPNV and check if we can really unlock the entire flash array
- sst26vf_unlock: return -EINVAL instead of -EOPNOTSUPP when caller
asks to unlock a range/granularity that we can't unlock

v2: v2: s/!ofs/ofs == 0/

 drivers/mtd/spi-nor/core.c |  2 +-
 drivers/mtd/spi-nor/core.h |  1 +
 drivers/mtd/spi-nor/sst.c  | 52 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e82732dd31e1..c50b30fbb912 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -465,7 +465,7 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
+int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index eb26796db026..4a3f7f150b5d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -441,6 +441,7 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
 int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
+int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
 
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 00e48da0744a..980f4c09c91d 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -8,6 +8,53 @@
 
 #include "core.h"
 
+#define SST26VF_CR_BPNV		BIT(3)
+
+static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	return -EOPNOTSUPP;
+}
+
+static int sst26vf_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	int ret;
+
+	/* We only support unlocking the entire flash array. */
+	if (ofs != 0 || len != nor->params->size)
+		return -EINVAL;
+
+	ret = spi_nor_read_cr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	if (!(nor->bouncebuf[0] & SST26VF_CR_BPNV)) {
+		dev_dbg(nor->dev, "Any block has been permanently locked\n");
+		return -EINVAL;
+	}
+
+	return spi_nor_global_block_unlock(nor);
+}
+
+static int sst26vf_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct spi_nor_locking_ops sst26vf_locking_ops = {
+	.lock = sst26vf_lock,
+	.unlock = sst26vf_unlock,
+	.is_locked = sst26vf_is_locked,
+};
+
+static void sst26vf_default_init(struct spi_nor *nor)
+{
+	nor->params->locking_ops = &sst26vf_locking_ops;
+}
+
+static const struct spi_nor_fixups sst26vf_fixups = {
+	.default_init = sst26vf_default_init,
+};
+
 static const struct flash_info sst_parts[] = {
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
@@ -39,8 +86,9 @@ static const struct flash_info sst_parts[] = {
 	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
 			      SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
-			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst26vf_fixups },
 };
 
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
