Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1D3C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:55:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C571A2070A
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C571A2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qx+JX55H7MlnHYXHNVZzRYWubIhjtwa6RnGGJoFF/T0=; b=UdIxjjzZJMtwSFY9yQnUan37p
	36IB05mHosDYT9vo8tsmLyQDRkD/cyvTewt8m1cHTCXhoRODy6a8BBztZfMZ0MnmXF+sLIJJflRiF
	maA0qcQ7/Zi9QRZTUjSZPFpczKXlXijlO9pCmEGYZzyfH5w+1PUecnfspsc/wJ+E81d3klnbRL82s
	6MGqUtcRXt0m78MtGcj/GYxiXmoK04iiLoN6J8t/6HB6Gj4zGAM+sf4G0t8XUpUfhj3eyq9iLkkvn
	WNulc6gE27V597JYYU7oDGoMnZNrM2IyLHKVGQFy4kqUea12J3YaJJzsbK6+LbqPR23gY/8gDvZqc
	yClLGFRuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2B84-0003gF-HS; Wed, 20 Jan 2021 10:54:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2B82-0003fU-6P
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 10:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611140062; x=1642676062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j9SnMxFMohMOhtRc0zyIy62dahNt9twPv6q6Qyrq+JU=;
 b=L3KEA1hRuItd327wPqriG1JxJaCmM2Rj91MDhDatxEwX+TdaCPqPJIzl
 rLYg5Hfl782IcuXRKJhAIZyNpAQUc3eDS2q8anCUKvHtuJ2Q+cCUC/cWg
 ALuNWgL7Jkseax3rJ3go+2tsa3j2SXc/IOoNn9I5QvKYQoalL+TaOtrxF
 vlPCvBi1LQZnWJp2cTGKAv6GCeYah1ofIpQTvHpfq1CBEIyw3tc88aL3q
 XEI0hDpW/4UkeSEkEMFwlrp/RErNaQ0QURU9If9PlMvWIXA8pWLI+VkWY
 NlrUapy3QAMdGOA2icLbjIXNK/xMtj3nvIen+PlBElfZbShP5P83lt/kp g==;
IronPort-SDR: FwvCSXSfRcvvq/mR7riRqT5eHSIaKncCcYxII/fQ2vWU9xZp4tR0h/C3ljKVyx/nfQysWWOkx+
 DVIqClboniCRcUelX/JI/deIL9xrk6zru/ky7zEuOrYEfJwB7nxcQ6tXvwfshRHy7JUgd9rIp4
 2TyL8X//J6M1VOBc0dn72JpDHGEc16uf5VLrSD3LRM8aUJHxyLBm9tU1+zPzZZ6SZRiFYWawfm
 A10BPUhARqq2Kh8qSnVUyGMlueubsj/fyG53NdQ1gPSKwTuVdXdzUgyE1++NWBIikbUMsBgY/7
 so0=
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="111756525"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2021 03:54:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 20 Jan 2021 03:54:19 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 20 Jan 2021 03:54:17 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH 2/2] mtd: spi-nor: sst: Add support for Global Unlock on
 sst26vf
Date: Wed, 20 Jan 2021 12:54:11 +0200
Message-ID: <20210120105411.254890-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120105411.254890-1-tudor.ambarus@microchip.com>
References: <20210120105411.254890-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_055422_442375_BC7FEB55 
X-CRM114-Status: GOOD (  14.71  )
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
 drivers/mtd/spi-nor/sst.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 00e48da0744a..1cd2a360c41e 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -8,6 +8,39 @@
 
 #include "core.h"
 
+static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	return -EOPNOTSUPP;
+}
+
+static int sst26vf_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	if (!ofs && len == nor->params->size)
+		return spi_nor_global_block_unlock(nor);
+
+	return -EOPNOTSUPP;
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
@@ -39,8 +72,9 @@ static const struct flash_info sst_parts[] = {
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
