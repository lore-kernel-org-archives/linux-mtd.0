Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EE1C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=og+uDZK6oOE7JVwtCxgMrQ4Ip3/f6YT2HNuDA8hdJUE=; b=xu6Sfj2Hzn63Md
	kc4Qixi9m/7CQJEzMserLOyP6aUMLbD3ZpGSZI/g3CyVmSGecUAJE8Z2PcF9evnDZ1co7DMifw16N
	0uFG9tUmbixyDLtwI0kcdWKECSk6us5yVzVjLO1pPYcG+BVr4g77qc+UILpJ+VlcK7okROMZ9DQfg
	NsRLpE7bKKccETFB+plLVR+jWgiDX2sZGZbGr9zVGcHLv4PEy5Eyaw2ZdgoRk2P9j+wWHwTWaBg5F
	bJNWP7B9xFivAW2AhTh2Crn4B4W9Dl4eBWweH1UdDg6aiM1a1NinLhu0bSyZdrZ4IpHD0ria9ZKiq
	n2nMOVnVzXuNsFMCJbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuLV-007XBe-Le; Mon, 25 Jul 2022 09:25:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuLH-007WjU-Pm
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 09:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658741135; x=1690277135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zs3KtNrL0u/Uwlb1EoVJtZRnFnebSO0PG5ZH3WP2+Kg=;
  b=du7N9+YmV5cJgMjw+pZ1ksrO6T2L0QVYkmVyLqVVw4sSnsYe5MsIMfJ9
   IVox6MZ0u+uFnoqVN96x0qROJXYIEcceqpD2lubIdxUb2of4wZuPnGonn
   22LUIbGIiqjbmXD5YxVYZJ2bPZ9t9978d/k1L6lOuHyev4c0eUdFgdcSJ
   Wlb8HjQbc02Kbdscx2aSzkhM27nkMLgEWZDKjsqeOsjimB8xuj5d48lcV
   hhHv6U2vw3QKLXM90xiUEiyh3QnULjIXSui7yABou49DRpOoYJaO8LiKM
   UOWMq9wZhOoOdoo681rdCpfwZ8XSLb0EYJWzHjMdSwVVU3qJGQHPJJRla
   A==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; 
   d="scan'208";a="169328787"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jul 2022 02:25:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 02:25:34 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 02:25:32 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <tkuw584924@gmail.com>,
	<Takahiro.Kuwano@infineon.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v17 5/7] mtd: spi-nor: core: Track flash's internal address mode
Date: Mon, 25 Jul 2022 12:25:03 +0300
Message-ID: <20220725092505.446315-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725092505.446315-1-tudor.ambarus@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_022536_183455_76A25366 
X-CRM114-Status: GOOD (  18.10  )
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

We need to track the flash's internal address mode as there are flashes
that can operate with 4B opcodes but unfortunately do not have a 4B opcode
correspondent for all the 3B opcodes. Such an example is the Infineon
Semper chips which provide 4B opcodes for read/program/erase but do not
provide 4B opcodes for Read/Write Any Register. These registers are
indexed by address and require the internal address mode of the flash
before Read/Write Any Register opcodes are issued.
4B opcodes are preferred over changing the flash's address mode to 4byte,
as set_4byte_addr_mode could be done in a non-volatile way and could break
the boot sequence. Thus we need to track the flash's internal address mode
so that we can use 4B opcodes together with opcodes that don't have a 4B
opcode correspondent. Track flash's internal address mode.

addr_mode_nbytes is discovered when parsing BFPT. For the
BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 case, one could introduce a method that
queries the flash's internal address mode at run-time (works for Winbond).
If a run-time querying can not be accomplished or if SFDP is not defined
at all, but the address mode is volatile and resets to a default known
value at boot, one can change the default addr_mode_nbytes value of 3 by
introducing a flash_info flag. If the address mode can not be queried,
discovered and it is configured via a non-volatile register, we may
introduce a dt property, but it will harm the generic approach of the
jedec,spi-nor compatible. All this complexity is not needed now, so let it
for future development.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.h | 5 +++++
 drivers/mtd/spi-nor/sfdp.c | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 7dc4cda41db3..85b0cf254e97 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -341,6 +341,10 @@ struct spi_nor_otp {
  *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
  * @addr_nbytes:	number of address bytes to send.
+ * @addr_mode_nbytes:	number of address bytes of current address mode. Useful
+ *			when the flash operates with 4B opcodes but needs the
+ *			internal address mode for opcodes that don't have a 4B
+ *			opcode correspondent.
  * @rdsr_dummy:		dummy cycles needed for Read Status Register command
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
@@ -374,6 +378,7 @@ struct spi_nor_flash_parameter {
 	u32				writesize;
 	u32				page_size;
 	u8				addr_nbytes;
+	u8				addr_mode_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
 
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 3a48173a2d78..c7973368f5dc 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -462,11 +462,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
 	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
 	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
-		params->addr_nbytes = 3;
+		params->addr_mode_nbytes = params->addr_nbytes = 3;
 		break;
 
 	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
-		params->addr_nbytes = 4;
+		params->addr_mode_nbytes = params->addr_nbytes = 4;
 		break;
 
 	default:
@@ -653,7 +653,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
 		return 4;
 	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
 	default:
-		return nor->params->addr_nbytes;
+		return nor->params->addr_mode_nbytes;
 	}
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
