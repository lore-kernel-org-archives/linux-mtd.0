Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA76AC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F0220721
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TLH8d3ND"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F0220721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwmM4ln2humJ3uenkNNq5AhxtPWjCg7AgixESdw9lXY=; b=TLH8d3ND6g2Ztc
	uGp2hXjPPsDuLEx9MbrupouAHz0evYk/VrRh39PbvJgwlrrrIy0AjVUOM0kOoN+MIkVwxM+s7NJQy
	G+mepyEyZGjQV7X0f58Rvx6XIcK9aVFh6NqDPRhlInORnyi+vd3QmEwLWYfcks5Hx8g6iQA+qP8ER
	WfINqbz/93yb92JR1ZMI3Bxb0frKdqkEzIQUC0dp2IyLqTsIw0m86KWhlZ29YPdfl6tmmdbX409aS
	lZKk/rzF5aOF4GmBP0rob8VS6qFBiPcdoPTyP3USOwC4uzClQOZoR4wu8P6X0rO7+cDyVgG9HN/4J
	neiBsgsZX7JvyOOUfxgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jed3y-0005gg-PX; Fri, 29 May 2020 11:20:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jecxS-0003W9-Lf
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 11:14:00 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 788CB240002;
 Fri, 29 May 2020 11:13:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v7 19/28] mtd: rawnand: s/data_interface/interface_config/
Date: Fri, 29 May 2020 13:13:13 +0200
Message-Id: <20200529111322.7184-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111322.7184-1-miquel.raynal@bootlin.com>
References: <20200529111322.7184-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_041351_529869_7BE68BD1 
X-CRM114-Status: GOOD (  15.59  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The name/suffix data_interface is a bit misleading in that the field
or functions actually represent a configuration that can be applied by
the controller/chip. Let's rename all fields/functions/hooks that are
worth renaming.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/ams-delta.c              |  6 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c |  6 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c  | 34 ++++-----
 .../mtd/nand/raw/cadence-nand-controller.c    |  6 +-
 drivers/mtd/nand/raw/denali.c                 |  8 +--
 drivers/mtd/nand/raw/fsmc_nand.c              |  6 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  6 +-
 drivers/mtd/nand/raw/internals.h              | 12 ++--
 drivers/mtd/nand/raw/marvell_nand.c           |  9 ++-
 drivers/mtd/nand/raw/meson_nand.c             |  6 +-
 drivers/mtd/nand/raw/mtk_nand.c               |  6 +-
 drivers/mtd/nand/raw/mxc_nand.c               | 20 +++---
 drivers/mtd/nand/raw/mxic_nand.c              |  6 +-
 drivers/mtd/nand/raw/nand_base.c              | 69 ++++++++++---------
 drivers/mtd/nand/raw/nand_legacy.c            |  2 +-
 drivers/mtd/nand/raw/nand_timings.c           | 17 ++---
 drivers/mtd/nand/raw/s3c2410.c                |  6 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        |  4 +-
 drivers/mtd/nand/raw/sunxi_nand.c             |  6 +-
 drivers/mtd/nand/raw/tango_nand.c             |  4 +-
 drivers/mtd/nand/raw/tegra_nand.c             |  6 +-
 include/linux/mtd/rawnand.h                   | 33 +++++----
 22 files changed, 139 insertions(+), 139 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 3711e7a0436c..fdba155416d2 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -191,8 +191,8 @@ static int gpio_nand_exec_op(struct nand_chip *this,
 	return ret;
 }
 
-static int gpio_nand_setup_data_interface(struct nand_chip *this, int csline,
-					  const struct nand_data_interface *cf)
+static int gpio_nand_setup_interface(struct nand_chip *this, int csline,
+				     const struct nand_interface_config *cf)
 {
 	struct gpio_nand *priv = nand_get_controller_data(this);
 	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(cf);
@@ -217,7 +217,7 @@ static int gpio_nand_setup_data_interface(struct nand_chip *this, int csline,
 
 static const struct nand_controller_ops gpio_nand_ops = {
 	.exec_op = gpio_nand_exec_op,
-	.setup_data_interface = gpio_nand_setup_data_interface,
+	.setup_interface = gpio_nand_setup_interface,
 };
 
 /*
diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 7141dcccba3c..12c643e97c85 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -854,8 +854,8 @@ static int anfc_exec_op(struct nand_chip *chip,
 	return nand_op_parser_exec_op(chip, &anfc_op_parser, op, check_only);
 }
 
-static int anfc_setup_data_interface(struct nand_chip *chip, int target,
-				     const struct nand_data_interface *conf)
+static int anfc_setup_interface(struct nand_chip *chip, int target,
+				const struct nand_interface_config *conf)
 {
 	struct anand *anand = to_anand(chip);
 	struct arasan_nfc *nfc = to_anfc(chip->controller);
@@ -1083,7 +1083,7 @@ static void anfc_detach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops anfc_ops = {
 	.exec_op = anfc_exec_op,
-	.setup_data_interface = anfc_setup_data_interface,
+	.setup_interface = anfc_setup_interface,
 	.attach_chip = anfc_attach_chip,
 	.detach_chip = anfc_detach_chip,
 };
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 46a3724a788e..c9818f548d07 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -200,8 +200,8 @@ struct atmel_nand_controller_ops {
 	void (*nand_init)(struct atmel_nand_controller *nc,
 			  struct atmel_nand *nand);
 	int (*ecc_init)(struct nand_chip *chip);
-	int (*setup_data_interface)(struct atmel_nand *nand, int csline,
-				    const struct nand_data_interface *conf);
+	int (*setup_interface)(struct atmel_nand *nand, int csline,
+			       const struct nand_interface_config *conf);
 };
 
 struct atmel_nand_controller_caps {
@@ -1168,7 +1168,7 @@ static int atmel_hsmc_nand_ecc_init(struct nand_chip *chip)
 }
 
 static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
-					const struct nand_data_interface *conf,
+					const struct nand_interface_config *conf,
 					struct atmel_smc_cs_conf *smcconf)
 {
 	u32 ncycles, totalcycles, timeps, mckperiodps;
@@ -1397,9 +1397,9 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
 	return 0;
 }
 
-static int atmel_smc_nand_setup_data_interface(struct atmel_nand *nand,
+static int atmel_smc_nand_setup_interface(struct atmel_nand *nand,
 					int csline,
-					const struct nand_data_interface *conf)
+					const struct nand_interface_config *conf)
 {
 	struct atmel_nand_controller *nc;
 	struct atmel_smc_cs_conf smcconf;
@@ -1422,9 +1422,9 @@ static int atmel_smc_nand_setup_data_interface(struct atmel_nand *nand,
 	return 0;
 }
 
-static int atmel_hsmc_nand_setup_data_interface(struct atmel_nand *nand,
+static int atmel_hsmc_nand_setup_interface(struct atmel_nand *nand,
 					int csline,
-					const struct nand_data_interface *conf)
+					const struct nand_interface_config *conf)
 {
 	struct atmel_hsmc_nand_controller *nc;
 	struct atmel_smc_cs_conf smcconf;
@@ -1452,8 +1452,8 @@ static int atmel_hsmc_nand_setup_data_interface(struct atmel_nand *nand,
 	return 0;
 }
 
-static int atmel_nand_setup_data_interface(struct nand_chip *chip, int csline,
-					const struct nand_data_interface *conf)
+static int atmel_nand_setup_interface(struct nand_chip *chip, int csline,
+				      const struct nand_interface_config *conf)
 {
 	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_nand_controller *nc;
@@ -1464,7 +1464,7 @@ static int atmel_nand_setup_data_interface(struct nand_chip *chip, int csline,
 	    (csline < 0 && csline != NAND_DATA_IFACE_CHECK_ONLY))
 		return -EINVAL;
 
-	return nc->caps->ops->setup_data_interface(nand, csline, conf);
+	return nc->caps->ops->setup_interface(nand, csline, conf);
 }
 
 static void atmel_nand_init(struct atmel_nand_controller *nc,
@@ -1483,7 +1483,7 @@ static void atmel_nand_init(struct atmel_nand_controller *nc,
 	chip->legacy.write_buf = atmel_nand_write_buf;
 	chip->legacy.select_chip = atmel_nand_select_chip;
 
-	if (!nc->mck || !nc->caps->ops->setup_data_interface)
+	if (!nc->mck || !nc->caps->ops->setup_interface)
 		chip->options |= NAND_KEEP_TIMINGS;
 
 	/* Some NANDs require a longer delay than the default one (20us). */
@@ -1956,7 +1956,7 @@ static int atmel_nand_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops atmel_nand_controller_ops = {
 	.attach_chip = atmel_nand_attach_chip,
-	.setup_data_interface = atmel_nand_setup_data_interface,
+	.setup_interface = atmel_nand_setup_interface,
 };
 
 static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
@@ -2318,7 +2318,7 @@ static const struct atmel_nand_controller_ops atmel_hsmc_nc_ops = {
 	.remove = atmel_hsmc_nand_controller_remove,
 	.ecc_init = atmel_hsmc_nand_ecc_init,
 	.nand_init = atmel_hsmc_nand_init,
-	.setup_data_interface = atmel_hsmc_nand_setup_data_interface,
+	.setup_interface = atmel_hsmc_nand_setup_interface,
 };
 
 static const struct atmel_nand_controller_caps atmel_sama5_nc_caps = {
@@ -2375,10 +2375,10 @@ atmel_smc_nand_controller_remove(struct atmel_nand_controller *nc)
 
 /*
  * The SMC reg layout of at91rm9200 is completely different which prevents us
- * from re-using atmel_smc_nand_setup_data_interface() for the
- * ->setup_data_interface() hook.
+ * from re-using atmel_smc_nand_setup_interface() for the
+ * ->setup_interface() hook.
  * At this point, there's no support for the at91rm9200 SMC IP, so we leave
- * ->setup_data_interface() unassigned.
+ * ->setup_interface() unassigned.
  */
 static const struct atmel_nand_controller_ops at91rm9200_nc_ops = {
 	.probe = atmel_smc_nand_controller_probe,
@@ -2399,7 +2399,7 @@ static const struct atmel_nand_controller_ops atmel_smc_nc_ops = {
 	.remove = atmel_smc_nand_controller_remove,
 	.ecc_init = atmel_nand_ecc_init,
 	.nand_init = atmel_smc_nand_init,
-	.setup_data_interface = atmel_smc_nand_setup_data_interface,
+	.setup_interface = atmel_smc_nand_setup_interface,
 };
 
 static const struct atmel_nand_controller_caps atmel_sam9260_nc_caps = {
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index c405722adfe1..574cbd3446e5 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2303,8 +2303,8 @@ static inline u32 calc_tdvw(u32 trp_cnt, u32 clk_period, u32 trhoh_min,
 }
 
 static int
-cadence_nand_setup_data_interface(struct nand_chip *chip, int chipnr,
-				  const struct nand_data_interface *conf)
+cadence_nand_setup_interface(struct nand_chip *chip, int chipnr,
+			     const struct nand_interface_config *conf)
 {
 	const struct nand_sdr_timings *sdr;
 	struct cdns_nand_ctrl *cdns_ctrl = to_cdns_nand_ctrl(chip->controller);
@@ -2690,7 +2690,7 @@ static int cadence_nand_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops cadence_nand_controller_ops = {
 	.attach_chip = cadence_nand_attach_chip,
 	.exec_op = cadence_nand_exec_op,
-	.setup_data_interface = cadence_nand_setup_data_interface,
+	.setup_interface = cadence_nand_setup_interface,
 };
 
 static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 4e6e1578aa2d..9d99dade95ce 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -761,8 +761,8 @@ static int denali_write_page(struct nand_chip *chip, const u8 *buf,
 	return denali_page_xfer(chip, (void *)buf, mtd->writesize, page, true);
 }
 
-static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
-				       const struct nand_data_interface *conf)
+static int denali_setup_interface(struct nand_chip *chip, int chipnr,
+				  const struct nand_interface_config *conf)
 {
 	static const unsigned int data_setup_on_host = 10000;
 	struct denali_controller *denali = to_denali_controller(chip);
@@ -1173,7 +1173,7 @@ static int denali_exec_op(struct nand_chip *chip,
 static const struct nand_controller_ops denali_controller_ops = {
 	.attach_chip = denali_attach_chip,
 	.exec_op = denali_exec_op,
-	.setup_data_interface = denali_setup_data_interface,
+	.setup_interface = denali_setup_interface,
 };
 
 int denali_chip_init(struct denali_controller *denali,
@@ -1230,7 +1230,7 @@ int denali_chip_init(struct denali_controller *denali,
 		chip->buf_align = 16;
 	}
 
-	/* clk rate info is needed for setup_data_interface */
+	/* clk rate info is needed for setup_interface */
 	if (!denali->clk_rate || !denali->clk_x_rate)
 		chip->options |= NAND_KEEP_TIMINGS;
 
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 3909752b14c5..92ddc41d0ff0 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -327,8 +327,8 @@ static int fsmc_calc_timings(struct fsmc_nand_data *host,
 	return 0;
 }
 
-static int fsmc_setup_data_interface(struct nand_chip *nand, int csline,
-				     const struct nand_data_interface *conf)
+static int fsmc_setup_interface(struct nand_chip *nand, int csline,
+				const struct nand_interface_config *conf)
 {
 	struct fsmc_nand_data *host = nand_to_fsmc(nand);
 	struct fsmc_nand_timings tims;
@@ -951,7 +951,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 static const struct nand_controller_ops fsmc_nand_controller_ops = {
 	.attach_chip = fsmc_nand_attach_chip,
 	.exec_op = fsmc_exec_op,
-	.setup_data_interface = fsmc_setup_data_interface,
+	.setup_interface = fsmc_setup_interface,
 };
 
 /**
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 061a8ddda275..5d4aee46cc55 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -736,8 +736,8 @@ static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
 	udelay(dll_wait_time_us);
 }
 
-static int gpmi_setup_data_interface(struct nand_chip *chip, int chipnr,
-				     const struct nand_data_interface *conf)
+static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
+				const struct nand_interface_config *conf)
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *sdr;
@@ -2400,7 +2400,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 
 static const struct nand_controller_ops gpmi_nand_controller_ops = {
 	.attach_chip = gpmi_nand_attach_chip,
-	.setup_data_interface = gpmi_setup_data_interface,
+	.setup_interface = gpmi_setup_interface,
 	.exec_op = gpmi_nfc_exec_op,
 };
 
diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index f851ed210d70..114c63a6a349 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -84,10 +84,10 @@ int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
-int onfi_fill_data_interface(struct nand_chip *chip,
-			     struct nand_data_interface *iface,
-			     enum nand_data_interface_type type,
-			     unsigned int timing_mode);
+int onfi_fill_interface_config(struct nand_chip *chip,
+			       struct nand_interface_config *iface,
+			       enum nand_interface_type type,
+			       unsigned int timing_mode);
 unsigned int
 onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings);
 int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
@@ -133,10 +133,10 @@ static inline int nand_exec_op(struct nand_chip *chip,
 	return chip->controller->ops->exec_op(chip, op, false);
 }
 
-static inline bool nand_controller_can_setup_data_iface(struct nand_chip *chip)
+static inline bool nand_controller_can_setup_interface(struct nand_chip *chip)
 {
 	if (!chip->controller || !chip->controller->ops ||
-	    !chip->controller->ops->setup_data_interface)
+	    !chip->controller->ops->setup_interface)
 		return false;
 
 	if (chip->options & NAND_KEEP_TIMINGS)
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index df859889e4eb..8482d3bd8b1f 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2308,9 +2308,8 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 	.pattern = bbt_mirror_pattern
 };
 
-static int marvell_nfc_setup_data_interface(struct nand_chip *chip, int chipnr,
-					    const struct nand_data_interface
-					    *conf)
+static int marvell_nfc_setup_interface(struct nand_chip *chip, int chipnr,
+				       const struct nand_interface_config *conf)
 {
 	struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
@@ -2511,7 +2510,7 @@ static int marvell_nand_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops marvell_nand_controller_ops = {
 	.attach_chip = marvell_nand_attach_chip,
 	.exec_op = marvell_nfc_exec_op,
-	.setup_data_interface = marvell_nfc_setup_data_interface,
+	.setup_interface = marvell_nfc_setup_interface,
 };
 
 static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
@@ -2647,7 +2646,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 
 	/*
 	 * Save a reference value for timing registers before
-	 * ->setup_data_interface() is called.
+	 * ->setup_interface() is called.
 	 */
 	marvell_nand->ndtr0 = readl_relaxed(nfc->regs + NDTR0);
 	marvell_nand->ndtr1 = readl_relaxed(nfc->regs + NDTR1);
diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 580b7be0719f..0e5829a2b54f 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1097,8 +1097,8 @@ static int meson_chip_buffer_init(struct nand_chip *nand)
 }
 
 static
-int meson_nfc_setup_data_interface(struct nand_chip *nand, int csline,
-				   const struct nand_data_interface *conf)
+int meson_nfc_setup_interface(struct nand_chip *nand, int csline,
+			      const struct nand_interface_config *conf)
 {
 	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
 	const struct nand_sdr_timings *timings;
@@ -1222,7 +1222,7 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
 static const struct nand_controller_ops meson_nand_controller_ops = {
 	.attach_chip = meson_nand_attach_chip,
 	.detach_chip = meson_nand_detach_chip,
-	.setup_data_interface = meson_nfc_setup_data_interface,
+	.setup_interface = meson_nfc_setup_interface,
 	.exec_op = meson_nfc_exec_op,
 };
 
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index c1a6e31aabb8..a3bc1b2d6bbd 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -501,8 +501,8 @@ static void mtk_nfc_write_buf(struct nand_chip *chip, const u8 *buf, int len)
 		mtk_nfc_write_byte(chip, buf[i]);
 }
 
-static int mtk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
-					const struct nand_data_interface *conf)
+static int mtk_nfc_setup_interface(struct nand_chip *chip, int csline,
+				   const struct nand_interface_config *conf)
 {
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *timings;
@@ -1325,7 +1325,7 @@ static int mtk_nfc_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.attach_chip = mtk_nfc_attach_chip,
-	.setup_data_interface = mtk_nfc_setup_data_interface,
+	.setup_interface = mtk_nfc_setup_interface,
 };
 
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 09dacb83cb5a..07c41e8bae2d 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -137,8 +137,8 @@ struct mxc_nand_devtype_data {
 	u32 (*get_ecc_status)(struct mxc_nand_host *);
 	const struct mtd_ooblayout_ops *ooblayout;
 	void (*select_chip)(struct nand_chip *chip, int cs);
-	int (*setup_data_interface)(struct nand_chip *chip, int csline,
-				    const struct nand_data_interface *conf);
+	int (*setup_interface)(struct nand_chip *chip, int csline,
+			       const struct nand_interface_config *conf);
 	void (*enable_hwecc)(struct nand_chip *chip, bool enable);
 
 	/*
@@ -1139,8 +1139,8 @@ static void preset_v1(struct mtd_info *mtd)
 	writew(0x4, NFC_V1_V2_WRPROT);
 }
 
-static int mxc_nand_v2_setup_data_interface(struct nand_chip *chip, int csline,
-					const struct nand_data_interface *conf)
+static int mxc_nand_v2_setup_interface(struct nand_chip *chip, int csline,
+				       const struct nand_interface_config *conf)
 {
 	struct mxc_nand_host *host = nand_get_controller_data(chip);
 	int tRC_min_ns, tRC_ps, ret;
@@ -1521,7 +1521,7 @@ static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
 	.get_ecc_status = get_ecc_status_v2,
 	.ooblayout = &mxc_v2_ooblayout_ops,
 	.select_chip = mxc_nand_select_chip_v2,
-	.setup_data_interface = mxc_nand_v2_setup_data_interface,
+	.setup_interface = mxc_nand_v2_setup_interface,
 	.enable_hwecc = mxc_nand_enable_hwecc_v1_v2,
 	.irqpending_quirk = 0,
 	.needs_ip = 0,
@@ -1738,17 +1738,17 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
 	return 0;
 }
 
-static int mxcnd_setup_data_interface(struct nand_chip *chip, int chipnr,
-				      const struct nand_data_interface *conf)
+static int mxcnd_setup_interface(struct nand_chip *chip, int chipnr,
+				 const struct nand_interface_config *conf)
 {
 	struct mxc_nand_host *host = nand_get_controller_data(chip);
 
-	return host->devtype_data->setup_data_interface(chip, chipnr, conf);
+	return host->devtype_data->setup_interface(chip, chipnr, conf);
 }
 
 static const struct nand_controller_ops mxcnd_controller_ops = {
 	.attach_chip = mxcnd_attach_chip,
-	.setup_data_interface = mxcnd_setup_data_interface,
+	.setup_interface = mxcnd_setup_interface,
 };
 
 static int mxcnd_probe(struct platform_device *pdev)
@@ -1809,7 +1809,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	if (!host->devtype_data->setup_data_interface)
+	if (!host->devtype_data->setup_interface)
 		this->options |= NAND_KEEP_TIMINGS;
 
 	if (host->devtype_data->needs_ip) {
diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 57f36721f4c6..d66b5b0971fa 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -451,8 +451,8 @@ static int mxic_nfc_exec_op(struct nand_chip *chip,
 	return ret;
 }
 
-static int mxic_nfc_setup_data_interface(struct nand_chip *chip, int chipnr,
-					 const struct nand_data_interface *conf)
+static int mxic_nfc_setup_interface(struct nand_chip *chip, int chipnr,
+				    const struct nand_interface_config *conf)
 {
 	struct mxic_nand_ctlr *nfc = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *sdr;
@@ -480,7 +480,7 @@ static int mxic_nfc_setup_data_interface(struct nand_chip *chip, int chipnr,
 
 static const struct nand_controller_ops mxic_nand_controller_ops = {
 	.exec_op = mxic_nfc_exec_op,
-	.setup_data_interface = mxic_nfc_setup_data_interface,
+	.setup_interface = mxic_nfc_setup_interface,
 };
 
 static int mxic_nfc_probe(struct platform_device *pdev)
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 7d393e1d0252..4fa18fb68d62 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -898,7 +898,7 @@ static bool nand_supports_set_features(struct nand_chip *chip, int addr)
 }
 
 /**
- * nand_reset_data_interface - Reset data interface and timings
+ * nand_reset_interface - Reset data interface and timings
  * @chip: The NAND chip
  * @chipnr: Internal die id
  *
@@ -906,11 +906,12 @@ static bool nand_supports_set_features(struct nand_chip *chip, int addr)
  *
  * Returns 0 for success or negative error code otherwise.
  */
-static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
+static int nand_reset_interface(struct nand_chip *chip, int chipnr)
 {
+	const struct nand_controller_ops *ops = chip->controller->ops;
 	int ret;
 
-	if (!nand_controller_can_setup_data_iface(chip))
+	if (!nand_controller_can_setup_interface(chip))
 		return 0;
 
 	/*
@@ -927,9 +928,9 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 	 * timings to timing mode 0.
 	 */
 
-	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
-	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
-							&chip->data_interface);
+	onfi_fill_interface_config(chip, &chip->interface_config,
+				   NAND_SDR_IFACE, 0);
+	ret = ops->setup_interface(chip, chipnr, &chip->interface_config);
 	if (ret)
 		pr_err("Failed to configure data interface to SDR timing mode 0\n");
 
@@ -937,7 +938,7 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 }
 
 /**
- * nand_setup_data_interface - Setup the best data interface and timings
+ * nand_setup_interface - Setup the best data interface and timings
  * @chip: The NAND chip
  * @chipnr: Internal die id
  *
@@ -946,13 +947,13 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
  *
  * Returns 0 for success or negative error code otherwise.
  */
-static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
+static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 {
-	u8 mode = chip->data_interface.timings.mode;
+	u8 mode = chip->interface_config.timings.mode;
 	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { mode, };
 	int ret;
 
-	if (!nand_controller_can_setup_data_iface(chip))
+	if (!nand_controller_can_setup_interface(chip))
 		return 0;
 
 	/* Change the mode on the chip side (if supported by the NAND chip) */
@@ -966,8 +967,8 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	}
 
 	/* Change the mode on the controller side */
-	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
-							&chip->data_interface);
+	ret = chip->controller->ops->setup_interface(chip, chipnr,
+						     &chip->interface_config);
 	if (ret)
 		return ret;
 
@@ -996,7 +997,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	 * Fallback to mode 0 if the chip explicitly did not ack the chosen
 	 * timing mode.
 	 */
-	nand_reset_data_interface(chip, chipnr);
+	nand_reset_interface(chip, chipnr);
 	nand_select_target(chip, chipnr);
 	nand_reset_op(chip);
 	nand_deselect_target(chip);
@@ -1005,7 +1006,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 }
 
 /**
- * nand_choose_data_interface - find the best data interface and timings
+ * nand_choose_interface_config - find the best data interface and timings
  * @chip: The NAND chip
  *
  * Find the best data interface and NAND timings supported by the chip
@@ -1013,16 +1014,16 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
  * First tries to retrieve supported timing modes from ONFI information,
  * and if the NAND chip does not support ONFI, relies on the
  * ->onfi_timing_mode_default specified in the nand_ids table. After this
- * function nand_chip->data_interface is initialized with the best timing mode
+ * function nand_chip->interface_ is initialized with the best timing mode
  * available.
  *
  * Returns 0 for success or negative error code otherwise.
  */
-static int nand_choose_data_interface(struct nand_chip *chip)
+static int nand_choose_interface_config(struct nand_chip *chip)
 {
 	int modes, mode, ret;
 
-	if (!nand_controller_can_setup_data_iface(chip))
+	if (!nand_controller_can_setup_interface(chip))
 		return 0;
 
 	/*
@@ -1040,8 +1041,8 @@ static int nand_choose_data_interface(struct nand_chip *chip)
 	}
 
 	for (mode = fls(modes) - 1; mode >= 0; mode--) {
-		ret = onfi_fill_data_interface(chip, &chip->data_interface,
-					       NAND_SDR_IFACE, mode);
+		ret = onfi_fill_interface_config(chip, &chip->interface_config,
+						 NAND_SDR_IFACE, mode);
 		if (ret)
 			continue;
 
@@ -1049,9 +1050,9 @@ static int nand_choose_data_interface(struct nand_chip *chip)
 		 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
 		 * controller supports the requested timings.
 		 */
-		ret = chip->controller->ops->setup_data_interface(chip,
+		ret = chip->controller->ops->setup_interface(chip,
 						 NAND_DATA_IFACE_CHECK_ONLY,
-						 &chip->data_interface);
+						 &chip->interface_config);
 		if (!ret) {
 			chip->onfi_timing_mode_default = mode;
 			break;
@@ -2477,17 +2478,17 @@ EXPORT_SYMBOL_GPL(nand_subop_get_data_len);
  * @chipnr: Internal die id
  *
  * Save the timings data structure, then apply SDR timings mode 0 (see
- * nand_reset_data_interface for details), do the reset operation, and
- * apply back the previous timings.
+ * nand_reset_interface for details), do the reset operation, and apply
+ * back the previous timings.
  *
  * Returns 0 on success, a negative error code otherwise.
  */
 int nand_reset(struct nand_chip *chip, int chipnr)
 {
-	struct nand_data_interface saved_data_intf = chip->data_interface;
+	struct nand_interface_config saved_intf_config = chip->interface_config;
 	int ret;
 
-	ret = nand_reset_data_interface(chip, chipnr);
+	ret = nand_reset_interface(chip, chipnr);
 	if (ret)
 		return ret;
 
@@ -2503,18 +2504,18 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 		return ret;
 
 	/*
-	 * A nand_reset_data_interface() put both the NAND chip and the NAND
+	 * A nand_reset_interface() put both the NAND chip and the NAND
 	 * controller in timings mode 0. If the default mode for this chip is
 	 * also 0, no need to proceed to the change again. Plus, at probe time,
-	 * nand_setup_data_interface() uses ->set/get_features() which would
+	 * nand_setup_interface() uses ->set/get_features() which would
 	 * fail anyway as the parameter page is not available yet.
 	 */
-	if (!memcmp(&chip->data_interface, &saved_data_intf,
-		    sizeof(saved_data_intf)))
+	if (!memcmp(&chip->interface_config, &saved_intf_config,
+		    sizeof(saved_intf_config)))
 		return 0;
 
-	chip->data_interface = saved_data_intf;
-	ret = nand_setup_data_interface(chip, chipnr);
+	chip->interface_config = saved_intf_config;
+	ret = nand_setup_interface(chip, chipnr);
 	if (ret)
 		return ret;
 
@@ -5183,7 +5184,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	mutex_init(&chip->lock);
 
 	/* Enforce the right timings for reset/detection */
-	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
+	onfi_fill_interface_config(chip, &chip->interface_config, NAND_SDR_IFACE, 0);
 
 	ret = nand_dt_init(chip);
 	if (ret)
@@ -5971,13 +5972,13 @@ static int nand_scan_tail(struct nand_chip *chip)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
 
 	/* Find the fastest data interface for this chip */
-	ret = nand_choose_data_interface(chip);
+	ret = nand_choose_interface_config(chip);
 	if (ret)
 		goto err_nanddev_cleanup;
 
 	/* Enter fastest possible mode on all dies. */
 	for (i = 0; i < nanddev_ntargets(&chip->base); i++) {
-		ret = nand_setup_data_interface(chip, i);
+		ret = nand_setup_interface(chip, i);
 		if (ret)
 			goto err_nanddev_cleanup;
 	}
diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index fe769762e1d8..2bcc03714432 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -368,7 +368,7 @@ static void nand_ccs_delay(struct nand_chip *chip)
 	 * Wait tCCS_min if it is correctly defined, otherwise wait 500ns
 	 * (which should be safe for all NANDs).
 	 */
-	if (nand_controller_can_setup_data_iface(chip))
+	if (nand_controller_can_setup_interface(chip))
 		ndelay(sdr->tCCS_min / 1000);
 	else
 		ndelay(500);
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index efff3583c549..bf05b4bceaa0 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -19,7 +19,7 @@
  *
  * These four values are tweaked to be more accurate in the case of ONFI chips.
  */
-static const struct nand_data_interface onfi_sdr_timings[] = {
+static const struct nand_interface_config onfi_sdr_timings[] = {
 	/* Mode 0 */
 	{
 		.type = NAND_SDR_IFACE,
@@ -340,16 +340,17 @@ onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings)
 }
 
 /**
- * onfi_fill_data_interface - Initialize a data interface from a given ONFI mode
+ * onfi_fill_interface_config - Initialize an interface config from a given
+ *                              ONFI mode
  * @chip: The NAND chip
- * @iface: The data interface to fill
- * @type: The data interface type
+ * @iface: The interface configuration to fill
+ * @type: The interface type
  * @timing_mode: The ONFI timing mode
  */
-int onfi_fill_data_interface(struct nand_chip *chip,
-			     struct nand_data_interface *iface,
-			     enum nand_data_interface_type type,
-			     unsigned int timing_mode)
+int onfi_fill_interface_config(struct nand_chip *chip,
+			       struct nand_interface_config *iface,
+			       enum nand_interface_type type,
+			       unsigned int timing_mode)
 {
 	struct onfi_params *onfi = chip->parameters.onfi;
 
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index f86dff311464..f121a3ae294c 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -808,8 +808,8 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 	return -ENODEV;
 }
 
-static int s3c2410_nand_setup_data_interface(struct nand_chip *chip, int csline,
-					const struct nand_data_interface *conf)
+static int s3c2410_nand_setup_interface(struct nand_chip *chip, int csline,
+					const struct nand_interface_config *conf)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
@@ -999,7 +999,7 @@ static int s3c2410_nand_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops s3c24xx_nand_controller_ops = {
 	.attach_chip = s3c2410_nand_attach_chip,
-	.setup_data_interface = s3c2410_nand_setup_data_interface,
+	.setup_interface = s3c2410_nand_setup_interface,
 };
 
 static const struct of_device_id s3c24xx_nand_dt_ids[] = {
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 7320c0fc19ec..a4140af43ed4 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1546,7 +1546,7 @@ static void stm32_fmc2_nfc_calc_timings(struct nand_chip *chip,
 }
 
 static int stm32_fmc2_nfc_setup_interface(struct nand_chip *chip, int chipnr,
-					  const struct nand_data_interface *conf)
+					  const struct nand_interface_config *conf)
 {
 	const struct nand_sdr_timings *sdrt;
 
@@ -1764,7 +1764,7 @@ static int stm32_fmc2_nfc_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops stm32_fmc2_nfc_controller_ops = {
 	.attach_chip = stm32_fmc2_nfc_attach_chip,
 	.exec_op = stm32_fmc2_nfc_exec_op,
-	.setup_data_interface = stm32_fmc2_nfc_setup_interface,
+	.setup_interface = stm32_fmc2_nfc_setup_interface,
 };
 
 static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ffbc1651fadc..9c50c2b965e1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1376,8 +1376,8 @@ static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 #define sunxi_nand_lookup_timing(l, p, c) \
 			_sunxi_nand_lookup_timing(l, ARRAY_SIZE(l), p, c)
 
-static int sunxi_nfc_setup_data_interface(struct nand_chip *nand, int csline,
-					const struct nand_data_interface *conf)
+static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
+				     const struct nand_interface_config *conf)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -1920,7 +1920,7 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 
 static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.attach_chip = sunxi_nand_attach_chip,
-	.setup_data_interface = sunxi_nfc_setup_data_interface,
+	.setup_interface = sunxi_nfc_setup_interface,
 	.exec_op = sunxi_nfc_exec_op,
 };
 
diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
index 246871e01027..b7a487a4c3b3 100644
--- a/drivers/mtd/nand/raw/tango_nand.c
+++ b/drivers/mtd/nand/raw/tango_nand.c
@@ -477,7 +477,7 @@ static u32 to_ticks(int kHz, int ps)
 }
 
 static int tango_set_timings(struct nand_chip *chip, int csline,
-			     const struct nand_data_interface *conf)
+			     const struct nand_interface_config *conf)
 {
 	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(conf);
 	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
@@ -527,7 +527,7 @@ static int tango_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops tango_controller_ops = {
 	.attach_chip = tango_attach_chip,
-	.setup_data_interface = tango_set_timings,
+	.setup_interface = tango_set_timings,
 };
 
 static int chip_init(struct device *dev, struct device_node *np)
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index f9d046b2cd3b..6b6212ffa01c 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -813,8 +813,8 @@ static void tegra_nand_setup_timing(struct tegra_nand_controller *ctrl,
 	writel_relaxed(reg, ctrl->regs + TIMING_2);
 }
 
-static int tegra_nand_setup_data_interface(struct nand_chip *chip, int csline,
-					const struct nand_data_interface *conf)
+static int tegra_nand_setup_interface(struct nand_chip *chip, int csline,
+				      const struct nand_interface_config *conf)
 {
 	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
 	const struct nand_sdr_timings *timings;
@@ -1053,7 +1053,7 @@ static int tegra_nand_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops tegra_nand_controller_ops = {
 	.attach_chip = &tegra_nand_attach_chip,
 	.exec_op = tegra_nand_exec_op,
-	.setup_data_interface = tegra_nand_setup_data_interface,
+	.setup_interface = tegra_nand_setup_interface,
 };
 
 static int tegra_nand_chips_init(struct device *dev,
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 0852df941130..2ca56eef0f07 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -492,22 +492,22 @@ struct nand_sdr_timings {
 };
 
 /**
- * enum nand_data_interface_type - NAND interface timing type
+ * enum nand_interface_type - NAND interface type
  * @NAND_SDR_IFACE:	Single Data Rate interface
  */
-enum nand_data_interface_type {
+enum nand_interface_type {
 	NAND_SDR_IFACE,
 };
 
 /**
- * struct nand_data_interface - NAND interface timing
+ * struct nand_interface_config - NAND interface timing
  * @type:	 type of the timing
  * @timings:	 The timing information
  * @timings.mode: Timing mode as defined in the specification
  * @timings.sdr: Use it when @type is %NAND_SDR_IFACE.
  */
-struct nand_data_interface {
-	enum nand_data_interface_type type;
+struct nand_interface_config {
+	enum nand_interface_type type;
 	struct nand_timings {
 		unsigned int mode;
 		union {
@@ -521,7 +521,7 @@ struct nand_data_interface {
  * @conf:	The data interface
  */
 static inline const struct nand_sdr_timings *
-nand_get_sdr_timings(const struct nand_data_interface *conf)
+nand_get_sdr_timings(const struct nand_interface_config *conf)
 {
 	if (conf->type != NAND_SDR_IFACE)
 		return ERR_PTR(-EINVAL);
@@ -944,11 +944,10 @@ static inline void nand_op_trace(const char *prefix,
  *		 This method replaces chip->legacy.cmdfunc(),
  *		 chip->legacy.{read,write}_{buf,byte,word}(),
  *		 chip->legacy.dev_ready() and chip->legacy.waifunc().
- * @setup_data_interface: setup the data interface and timing. If
- *			  chipnr is set to %NAND_DATA_IFACE_CHECK_ONLY this
- *			  means the configuration should not be applied but
- *			  only checked.
- *			  This hook is optional.
+ * @setup_interface: setup the data interface and timing. If chipnr is set to
+ *		     %NAND_DATA_IFACE_CHECK_ONLY this means the configuration
+ *		     should not be applied but only checked.
+ *		     This hook is optional.
  */
 struct nand_controller_ops {
 	int (*attach_chip)(struct nand_chip *chip);
@@ -956,8 +955,8 @@ struct nand_controller_ops {
 	int (*exec_op)(struct nand_chip *chip,
 		       const struct nand_operation *op,
 		       bool check_only);
-	int (*setup_data_interface)(struct nand_chip *chip, int chipnr,
-				    const struct nand_data_interface *conf);
+	int (*setup_interface)(struct nand_chip *chip, int chipnr,
+			       const struct nand_interface_config *conf);
 };
 
 /**
@@ -1070,7 +1069,7 @@ struct nand_manufacturer {
  * @onfi_timing_mode_default: Default ONFI timing mode. This field is set to the
  *			      actually used ONFI mode if the chip is ONFI
  *			      compliant or deduced from the datasheet otherwise
- * @data_interface: NAND interface timing information
+ * @interface_config: NAND interface timing information
  * @bbt_erase_shift: Number of address bits in a bbt entry
  * @bbt_options: Bad block table specific options. All options used here must
  *               come from bbm.h. By default, these options will be copied to
@@ -1118,7 +1117,7 @@ struct nand_chip {
 
 	/* Data interface */
 	int onfi_timing_mode_default;
-	struct nand_data_interface data_interface;
+	struct nand_interface_config interface_config;
 
 	/* Bad block information */
 	unsigned int bbt_erase_shift;
@@ -1208,10 +1207,10 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
  *                             of a NAND chip
  * @chip: The NAND chip
  */
-static inline const struct nand_data_interface *
+static inline const struct nand_interface_config *
 nand_get_interface_config(struct nand_chip *chip)
 {
-	return &chip->data_interface;
+	return &chip->interface_config;
 }
 
 /*
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
