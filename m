Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C613BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 22:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/0K+rEg1wcLDoAkBOosXkqWFaKVmTJRyupgfW9XeSU=; b=bBoHZUROBakESy
	trHsCfbxxQD1RFF/nzdFjN88EvNALOXVffETBBFEo9GNnS3rdvL6kmxcBjJhe8y65nR4yZCcci/uM
	mYMycdtxGEJId+97qWx/LJBiSa9zlnVcakFt7QVoufJrId7Z2xfvMEt3F2xnHSVa6klGh16oiq4i1
	IFPmtvNiXPJg3EQApLHEYL+gMwmu/0b7YwiJKhaw9RYN66DpSrIX776nK1OrbaNJ2Cl5V52QjMVHq
	I+pRElmBgRxbAe/m/af7NzUcQLm/QWDSaoskcWiHD9IdbPrgjqC1xL9FY80qIz3pgVsZ97DxVBBQi
	wJ3xygftkn1nsuCHQhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBae-00GVcZ-Mk; Mon, 09 May 2022 22:10:52 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBaY-00GVZp-T2
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 22:10:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id p8so13379635pfh.8
 for <linux-mtd@lists.infradead.org>; Mon, 09 May 2022 15:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GlboxtcXw2K3DEmnOIQgG9eRSQYANBtcoIDqjvEyDKA=;
 b=SV6l0ktDkxQ6jH0zhNUeELNUjMuAsn0z1ALa5w/dGKRS0tOGo5+/3n/KMgUiToTuq1
 7AO7lBZL2WX0X7KEO8eu+3BIBiLf5BDPoPOCIuVH9jWy30dd29zMtJljkwbfOFQuT0Be
 rOFWwtSlNO2mRIbUvz4wD4Y9bQRMda+Wvym0tW4F4kP90ZP0UVMr4xTno5Ek54HpTZHD
 3CAC3VaRa18BrFv99lGxiOB/W74Y9T9V7JJUb0BmfAxk98SKZJWarCb44ZOUEpzm8HeN
 ZUq9qoodWpDktoRWFWg/Kek/8C/nIAZWu7eK9irfjuqXPu3TD/WZBnxWaOnHBJ2lMjsw
 QqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GlboxtcXw2K3DEmnOIQgG9eRSQYANBtcoIDqjvEyDKA=;
 b=psrcSBAsVoDhSbMofy773eFFRjhcTrF9RoLwYX70X51CgN70QKuNFrMPWqdBlRF3IK
 nugStEdD+OEWbKNOtOVZ5EOe5KFm/m3a+LBifvndX8SQe663LKMvDav2Ku7UUUVZaXCC
 l9Io3aQ9aDUvqOrDIdDGfP/moOjQXlu1JJ/2fUOL4l5RzaSLmGtPC6FNtmoVy7/k8wsS
 qtMuSi2ftXkBdyHC3cc/dxl2iVPS0GPDA0YFAcDyFO31+fWVhcOuC/S5qR9+VizaSX49
 OPd2EPWXI/HdAH8ia+5+a4Smr572GNELbX+UzPPs12GU0vgBoFE07LjXQK0zgidvtM9L
 Yhow==
X-Gm-Message-State: AOAM531/4ZwcUC/RJrgabglkYpbE8Ng4+4bDL2iA9ic4qjCZacrlto7i
 Ha1Zrs5g4gd4gh1u+ZYKoa2l2xpmxds=
X-Google-Smtp-Source: ABdhPJxg281jRb0ikmjpqPRYDOev1llgFG4ADwiDlFKSHFNc14sTiU+UjDXBEPI3XUYuH1rLGEwodw==
X-Received: by 2002:a62:cd49:0:b0:50d:b02e:11df with SMTP id
 o70-20020a62cd49000000b0050db02e11dfmr17924880pfg.4.1652134245496; 
 Mon, 09 May 2022 15:10:45 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 q27-20020a056a0002bb00b0050dc76281ebsm9043247pfs.197.2022.05.09.15.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:10:45 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, michael@walle.cc, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v15 5/8] mtd: spi-nor: core: Couple the number of address
 bytes with the address mode
Date: Tue, 10 May 2022 07:10:06 +0900
Message-Id: <e79c68ce2a82ecfa301962104c877401417a5a62.1652063152.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_151046_982470_8864D7CF 
X-CRM114-Status: GOOD (  26.41  )
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

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Some of Infineon chips support volatile version of configuration registers
and it is recommended to update volatile registers in the field application
due to a risk of the non-volatile registers corruption by power interrupt.
Such a volatile configuration register is used to enable the Quad mode.
The register write sequence requires the number of bytes of address in
order to be programmed. As it was before, the nor->addr_nbytes was set to 4
before calling the volatile Quad enable method. This was incorrect because
the Write Any Register command does not have a 4B opcode equivalent and the
address mode was still at default (3-byte mode) and not changed to 4 by
entering in the 4 Byte Address Mode, so the operation failed.

Move the setting of the number of bytes of address after the Quad Enable
method to allow reads or writes to registers that require the number of
address bytes to work with the default address mode. The number of address
bytes and the address mode are tightly coupled, this is a natural change.

Other (standard) Quad Enable methods are not affected, as they don't
require the number of address bytes, so no functionality changes expected.

Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 134 +++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 64 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index dd71deba9f11..1c14a95a23fd 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2270,49 +2270,6 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 	return 0;
 }
 
-static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
-{
-	if (nor->params->addr_nbytes) {
-		nor->addr_nbytes = nor->params->addr_nbytes;
-	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
-		/*
-		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
-		 * in this protocol an odd address width cannot be used because
-		 * then the address phase would only span a cycle and a half.
-		 * Half a cycle would be left over. We would then have to start
-		 * the dummy phase in the middle of a cycle and so too the data
-		 * phase, and we will end the transaction with half a cycle left
-		 * over.
-		 *
-		 * Force all 8D-8D-8D flashes to use an address width of 4 to
-		 * avoid this situation.
-		 */
-		nor->addr_nbytes = 4;
-	} else if (nor->info->addr_nbytes) {
-		nor->addr_nbytes = nor->info->addr_nbytes;
-	} else {
-		nor->addr_nbytes = 3;
-	}
-
-	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_nbytes = 4;
-	}
-
-	if (nor->addr_nbytes > SPI_NOR_MAX_ADDR_NBYTES) {
-		dev_dbg(nor->dev, "address width is too large: %u\n",
-			nor->addr_nbytes);
-		return -EINVAL;
-	}
-
-	/* Set 4byte opcodes when possible. */
-	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
-	    !(nor->flags & SNOR_F_HAS_4BAIT))
-		spi_nor_set_4byte_opcodes(nor);
-
-	return 0;
-}
-
 static int spi_nor_setup(struct spi_nor *nor,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -2322,10 +2279,7 @@ static int spi_nor_setup(struct spi_nor *nor,
 		ret = nor->params->setup(nor, hwcaps);
 	else
 		ret = spi_nor_default_setup(nor, hwcaps);
-	if (ret)
-		return ret;
-
-	return spi_nor_set_addr_nbytes(nor);
+	return ret;
 }
 
 /**
@@ -2707,6 +2661,74 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 	return nor->params->quad_enable(nor);
 }
 
+static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
+{
+	if (nor->params->addr_nbytes) {
+		nor->addr_nbytes = nor->params->addr_nbytes;
+	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
+		/*
+		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
+		 * in this protocol an odd address width cannot be used because
+		 * then the address phase would only span a cycle and a half.
+		 * Half a cycle would be left over. We would then have to start
+		 * the dummy phase in the middle of a cycle and so too the data
+		 * phase, and we will end the transaction with half a cycle left
+		 * over.
+		 *
+		 * Force all 8D-8D-8D flashes to use an address width of 4 to
+		 * avoid this situation.
+		 */
+		nor->addr_nbytes = 4;
+	} else if (nor->info->addr_nbytes) {
+		nor->addr_nbytes = nor->info->addr_nbytes;
+	} else {
+		nor->addr_nbytes = 3;
+	}
+
+	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
+		/* enable 4-byte addressing if the device exceeds 16MiB */
+		nor->addr_nbytes = 4;
+	}
+
+	if (nor->addr_nbytes > SPI_NOR_MAX_ADDR_NBYTES) {
+		dev_dbg(nor->dev, "address width is too large: %u\n",
+			nor->addr_nbytes);
+		return -EINVAL;
+	}
+
+	/* Set 4byte opcodes when possible. */
+	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
+	    !(nor->flags & SNOR_F_HAS_4BAIT))
+		spi_nor_set_4byte_opcodes(nor);
+
+	return 0;
+}
+
+static int spi_nor_set_addr_mode(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_set_addr_nbytes(nor);
+	if (ret)
+		return ret;
+
+	if (nor->addr_nbytes == 4 && nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
+	    !(nor->flags & SNOR_F_4B_OPCODES)) {
+		/*
+		 * If the RESET# pin isn't hooked up properly, or the system
+		 * otherwise doesn't perform a reset command in the boot
+		 * sequence, it's impossible to 100% protect against unexpected
+		 * reboots (e.g., crashes). Warn the user (or hopefully, system
+		 * designer) that this is bad.
+		 */
+		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
+			  "enabling reset hack; may not recover from unexpected reboots\n");
+		nor->params->set_4byte_addr_mode(nor, true);
+	}
+
+	return 0;
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
@@ -2738,22 +2760,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
 		spi_nor_try_unlock_all(nor);
 
-	if (nor->addr_nbytes == 4 &&
-	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
-	    !(nor->flags & SNOR_F_4B_OPCODES)) {
-		/*
-		 * If the RESET# pin isn't hooked up properly, or the system
-		 * otherwise doesn't perform a reset command in the boot
-		 * sequence, it's impossible to 100% protect against unexpected
-		 * reboots (e.g., crashes). Warn the user (or hopefully, system
-		 * designer) that this is bad.
-		 */
-		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
-			  "enabling reset hack; may not recover from unexpected reboots\n");
-		nor->params->set_4byte_addr_mode(nor, true);
-	}
-
-	return 0;
+	return spi_nor_set_addr_mode(nor);
 }
 
 /**
@@ -3014,7 +3021,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.
-	 * - set the address width.
 	 */
 	ret = spi_nor_setup(nor, hwcaps);
 	if (ret)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
