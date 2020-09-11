Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F968C2BC11
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 14:48:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02815223B0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 14:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8ncPtDo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02815223B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ITHa8o6SlvSWTAGkFcCL5imoy4IvpVhLpCgEH2NBBJY=; b=I8ncPtDoI8jAotqjsecaqRPia
	NRhOQ8C7l6T0YIWkM98IIC7yXCtSsFXQ7JUi3DkkFzkJT9dCc8iMfjz01GWjo0hR6Cvc9jpgpsiJG
	GoWuo44GoftGczDGIoxBy0qJTbSHZnCZsi5F93Hx0U0VitbQc0F0D4KekraWCqKUjkEbmE+qkhkyN
	H5GRv4E5+uqMdsNwhfDPe2cly25lcpT6Jk2tn5SsowiM1yDkWB309hfz2Q8v+aPYeKTqjXpxE7ylk
	ACMjwrGRWWO5w/mynuDeJpVFvFXs2d/ya1/QPBBX8qaHe+awiViR54VQtjBfhv3IClzCzwR21HXyI
	aqynOB4ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGkKl-0006IT-Fl; Fri, 11 Sep 2020 14:47:27 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGkKe-0006Gt-5x
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 14:47:21 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kGkKU-0006Pw-NV; Fri, 11 Sep 2020 16:47:10 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kGkKP-0006nh-4Z; Fri, 11 Sep 2020 16:47:05 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 boris.brezillon@collabora.com, michael@walle.cc, j.neuschaefer@gmx.net
Subject: [PATCH 3/3] mtd: spi-nor: sst: move sst_write_second to local driver
Date: Fri, 11 Sep 2020 16:47:03 +0200
Message-Id: <20200911144703.25409-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911144703.25409-1-m.felsch@pengutronix.de>
References: <20200911144703.25409-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_104720_264079_E3084059 
X-CRM114-Status: GOOD (  17.39  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Don't mess the spi-nor core with details only relating to this specific
device. Handle the addr_width locally and drop the sst related stuff
from the spi-nor core to clean it up.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/mtd/spi-nor/core.c  |  3 ---
 drivers/mtd/spi-nor/sst.c   | 10 ++++++----
 include/linux/mtd/spi-nor.h |  2 --
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 31869ac245a8..fabd8ca4e801 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -173,9 +173,6 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
 	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
 	op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
 
-	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
-		op.addr.nbytes = 0;
-
 	if (spi_nor_spimem_bounce(nor, &op))
 		memcpy(nor->bouncebuf, buf, op.data.nbytes);
 
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 644252e27a2a..7ca7e1a13511 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -58,10 +58,9 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		goto out;
 
-	nor->sst_write_second = false;
-
 	/* Start write from odd address. */
 	if (to % 2) {
+		nor->addr_width = 3;
 		nor->program_opcode = SPINOR_OP_BP;
 
 		/* write one byte. */
@@ -86,6 +85,8 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 				goto out;
 		}
 
+		/* Send address only once for each AAI_WP cycle */
+		nor->addr_width = (actual > 1) ? 0 : 3;
 		nor->program_opcode = SPINOR_OP_AAI_WP;
 
 		/* write two bytes. */
@@ -97,9 +98,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		if (ret)
 			goto out;
 		to += 2;
-		nor->sst_write_second = true;
 	}
-	nor->sst_write_second = false;
 
 	ret = spi_nor_write_disable(nor);
 	if (ret)
@@ -115,6 +114,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		if (ret)
 			goto out;
 
+		nor->addr_width = 3;
 		nor->program_opcode = SPINOR_OP_BP;
 		ret = spi_nor_write_data(nor, to, 1, buf + actual);
 		if (ret < 0)
@@ -129,6 +129,8 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		ret = spi_nor_write_disable(nor);
 	}
 out:
+	/* Set to default in case no trailing bytes are written */
+	nor->addr_width = 3;
 	*retlen += actual;
 	spi_nor_unlock_and_unprep(nor);
 	return ret;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 60bac2c0ec45..4368c0c41fda 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -343,7 +343,6 @@ struct spi_nor_flash_parameter;
  * @read_opcode:	the read opcode
  * @read_dummy:		the dummy needed by the read operation
  * @program_opcode:	the program opcode
- * @sst_write_second:	used by the SST write operation
  * @flags:		flag options for the current SPI NOR (SNOR_F_*)
  * @read_proto:		the SPI protocol for read operations
  * @write_proto:	the SPI protocol for write operations
@@ -374,7 +373,6 @@ struct spi_nor {
 	enum spi_nor_protocol	read_proto;
 	enum spi_nor_protocol	write_proto;
 	enum spi_nor_protocol	reg_proto;
-	bool			sst_write_second;
 	u32			flags;
 
 	const struct spi_nor_controller_ops *controller_ops;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
