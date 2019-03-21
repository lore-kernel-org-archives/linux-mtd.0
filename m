Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86328C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 12:56:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55922218D4
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 12:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/iq+ZiB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55922218D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PIZWeEWsbo7wGks3FAcNM7t+gDgayJcNGquyBTJOV30=; b=P/iq+ZiBVo2oRj
	p8hCNolxQgsobscD6xmLLpJT/lZud1ZQk3qiYaRc76KIOtqRkcGwb3VI3ikf9zROY8epzc1xZzhik
	DngXlDlXCjKlv6Dz5tbKPKFqAx3wNZMbZfLV+96/rn4P/ovkrKGKv0iyJap3FthHzr80iCaiAVJjh
	QyVjTO1zwgY2Ja6wwn/k8rau2CKj4Y84+yL5rdBT7ThP7p5xLgBhHHH8nLPAADXeGu8j5AWQLIEJh
	5AdberO/Cq7H224gOjbdo8fBs5IJhvGW4On6oCSa4+1iAd4LdqgVR/1JsHpRb61n6u9KR7EdOMh8S
	neDePjOFeFxrd4xOX9fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6xFH-0000hk-Lh; Thu, 21 Mar 2019 12:56:31 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6xFE-0000gn-GG
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 12:56:30 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 5.5.0) with ESMTP id SG003762520.MSG 
 for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2019 13:56:21 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Thu, 21
 Mar 2019 13:56:19 +0100
Received: from flavio-x.asem.intra (172.16.17.161) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1261.35 via Frontend
 Transport; Thu, 21 Mar 2019 13:56:19 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC spi nor
Date: Thu, 21 Mar 2019 13:55:46 +0100
Message-ID: <1553172946-2251-1-git-send-email-f.suligoi@asem.it>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B020B.5C9389F4.0024, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_055628_914885_B6C2EBA1 
X-CRM114-Status: GOOD (  18.04  )
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
Cc: linux-kernel@vger.kernel.or, Flavio Suligoi <f.suligoi@asem.it>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch fixes the following kernel error message:

"flash operation timed out"

that occurs when a non-JEDEC spi-nor, declared in a Device Tree, but not
physically present on the board, is involved in a write operation, as:

cat datafile > /dev/mtd0

In some cases, with enough quantity of data, the writing hangs for minutes.

This situation can happen, for example, in some embedded systems, when
a non-JEDEC spi-nor is mounted using a removable add-on board. So is
important to find a method to check a non-JEDEC device presence before
using it.

The presence of a JEDEC compliant device is implicitly verified during the
JEDEC auto-detect procedure.
But for a non-JEDEC device, the presence must be explicitly checked,
reading one or more known registers, according to the chip features.

Without any check, if the spi-nor is declared in a Device Tree but not
physically present on the board, the driver (i.e. m25p80) is loaded anyway
and the correspondent mtd device is also created.
In this way any read operation on this device returns 0xff (or 0x00,
depending on the driver and the hardware used) and any write operation
hangs until the flash operation timeout occurs, with the "flash operation
timed out" error message.

This patch adds the non-JEDEC spi-nor presence check before initializing
the device.

Note: currently this presence check supports only the Everspin mr25h40,
      reading its status register.

      The support for other non-JEDEC devices has to be added.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/mtd/spi-nor/spi-nor.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae1474..d2cb710 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3981,6 +3981,42 @@ static const struct flash_info *spi_nor_match_id(const char *name)
 	return NULL;
 }
 
+/**
+ * check_nojedec_nor_presence() - check the real presence of a non-JEDEC nor
+ * @nor: pointer to a 'struct spi_nor'
+ *
+ * The presence of a JEDEC compliant device is implicity verified during the
+ * JEDEC auto-detect procedure.
+ * For a non-JEDEC device, the presence have to explicity checked, reading
+ * one or more known registers, according to the chip features.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int check_nojedec_nor_presence(struct spi_nor *nor)
+{
+	struct device *dev = nor->dev;
+	const struct flash_info *info = nor->info;
+	int ret = 0;
+	u8 val;
+
+	/* Check presence for Everspin mr25h40 MRAM */
+	if (!strcmp(info->name, "mr25h40")) {
+		/* Read the status register */
+		ret = nor->read_reg(nor, SPINOR_OP_RDSR, &val, 1);
+		if (ret)
+			return ret;
+
+		dev_dbg(dev, "%s - status register = 0x%2.2x\n",
+			info->name, val);
+
+		/* The factory preset of the status register is 0x00 */
+		if (val == 0xff)
+			return -ENODEV;
+	}
+
+	return 0;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -4158,6 +4194,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			return ret;
 	}
 
+	/* Check non-JEDEC nor presence */
+	if (!info->id_len) {
+		ret = check_nojedec_nor_presence(nor);
+		if (ret)
+			return ret;
+	}
+
 	/* Send all the required SPI flash commands to initialize device */
 	ret = spi_nor_init(nor);
 	if (ret)
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
