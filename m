Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C98C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:10:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B57C920FC3
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N5lAwOYQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B57C920FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IGrI2YzTsqtQ1HJHZBrcFuK1CAP0x9GpmUpY+LKRVY=; b=N5lAwOYQgct2fj
	LcO8fIDmGNBGhUpXIqwUnGoiCCr11pr1DriRrjikAWEkJ7/gyl25uyMxqsuSZQ3Zq38zXc6btFchq
	P2OC8MO4TvoIS1QIJqLqVSAQ/SKdtML68aZ5JOLPUeeyLSVd3k0dNR9KYbmr5/hCW36DfmvH0umD4
	SKOB6nsDRwcEjE0D4D7Rr8pamMI8rSZge2t6jjEIX/VlJCdLlyKRhXefzIhOwXa/M8UciUC8U7j9A
	rMNgeKmKQYsnG26YokHXtHN4osObABoBwtqyRQGqQtelqfLenV8VPiRAgDpJRrqD4C0WRbnjOV96e
	YTy0XnpHB29is5zzTpoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdr8q-00027B-K7; Wed, 27 May 2020 08:10:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdr8j-0008RH-Qm
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 08:10:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6A3D72A36ED;
 Wed, 27 May 2020 09:10:13 +0100 (BST)
Date: Wed, 27 May 2020 10:10:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 17/28] mtd: rawnand: Define a unique reset data
 interface
Message-ID: <20200527101009.4f791866@collabora.com>
In-Reply-To: <20200527092046.72280f6b@xps13>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-18-miquel.raynal@bootlin.com>
 <20200526232338.7d061be9@collabora.com>
 <20200527092046.72280f6b@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_011018_432107_31001511 
X-CRM114-Status: GOOD (  29.62  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 27 May 2020 09:20:46 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Tue, 26 May
> 2020 23:23:38 +0200:
> 
> > On Tue, 26 May 2020 21:17:14 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > All NAND chips will always use the same data interface for reset and
> > > at startup: SDR mode 0. Instead of copying around the data interface
> > > timings, let's just have a default reset data interface for that.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/mtd/nand/raw/nand_base.c    | 9 +++------
> > >  drivers/mtd/nand/raw/nand_timings.c | 3 +++
> > >  include/linux/mtd/rawnand.h         | 3 +++
> > >  3 files changed, 9 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > > index 89f10a8c1d62..1005035c233a 100644
> > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > @@ -927,9 +927,8 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
> > >  	 * timings to timing mode 0.
> > >  	 */
> > >  
> > > -	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
> > >  	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
> > > -							&chip->data_interface);
> > > +							  nand_reset_data_iface);
> > >  	if (ret)
> > >  		pr_err("Failed to configure data interface to SDR timing mode 0\n");
> > >  
> > > @@ -2484,7 +2483,6 @@ EXPORT_SYMBOL_GPL(nand_subop_get_data_len);
> > >   */
> > >  int nand_reset(struct nand_chip *chip, int chipnr)
> > >  {
> > > -	struct nand_data_interface saved_data_intf = chip->data_interface;
> > >  	int ret;
> > >  
> > >  	ret = nand_reset_data_interface(chip, chipnr);
> > > @@ -2509,11 +2507,10 @@ int nand_reset(struct nand_chip *chip, int chipnr)
> > >  	 * nand_setup_data_interface() uses ->set/get_features() which would
> > >  	 * fail anyway as the parameter page is not available yet.
> > >  	 */
> > > -	if (!memcmp(&chip->data_interface, &saved_data_intf,
> > > -		    sizeof(saved_data_intf)))
> > > +	if (!memcmp(&chip->data_interface, nand_reset_data_iface,
> > > +		    sizeof(*nand_reset_data_iface)))
> > >  		return 0;
> > >  
> > > -	chip->data_interface = saved_data_intf;
> > >  	ret = nand_setup_data_interface(chip, chipnr);
> > >  	if (ret)
> > >  		return ret;
> > > diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> > > index 52ee83e75646..343284c43e81 100644
> > > --- a/drivers/mtd/nand/raw/nand_timings.c
> > > +++ b/drivers/mtd/nand/raw/nand_timings.c
> > > @@ -285,6 +285,9 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
> > >  	},
> > >  };
> > >  
> > > +/* All NAND chips share the same reset data interface: SDR mode 0 */
> > > +const struct nand_data_interface *nand_reset_data_iface = &onfi_sdr_timings[0];    
> > 
> > Can we make that one a function?
> > 
> > const struct nand_data_interface *nand_get_reset_data_interface(void)

On a second thought, I think adding _config() would be better. And
since we are at refactoring/renaming things, I'd suggest a transversal
s/data_interface/interface_config/ rename.

--->8---
From 1a67f7f1883777b91997c2a9ec46e738689bfd8d Mon Sep 17 00:00:00 2001
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 27 May 2020 10:08:22 +0200
Subject: [PATCH] mtd: rawnand: s/data_interface/interface_config/

The name/suffix data_interface is a bit misleading in that the field
or functions actually represent a configuration that can be applied by
the controller/chip. Let's rename all fields/functions/hooks that are
worth renaming.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/ams-delta.c              |  6 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c |  6 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c  | 34 ++++----
 .../mtd/nand/raw/cadence-nand-controller.c    |  6 +-
 drivers/mtd/nand/raw/denali.c                 |  8 +-
 drivers/mtd/nand/raw/fsmc_nand.c              |  6 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  6 +-
 drivers/mtd/nand/raw/internals.h              |  8 +-
 drivers/mtd/nand/raw/marvell_nand.c           | 13 ++-
 drivers/mtd/nand/raw/meson_nand.c             | 10 +--
 drivers/mtd/nand/raw/mtk_nand.c               |  6 +-
 drivers/mtd/nand/raw/mxc_nand.c               | 20 ++---
 drivers/mtd/nand/raw/mxic_nand.c              |  6 +-
 drivers/mtd/nand/raw/nand_base.c              | 84 +++++++++----------
 drivers/mtd/nand/raw/nand_legacy.c            |  2 +-
 drivers/mtd/nand/raw/nand_timings.c           | 12 +--
 drivers/mtd/nand/raw/nand_toshiba.c           |  2 +-
 drivers/mtd/nand/raw/s3c2410.c                |  6 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        |  6 +-
 drivers/mtd/nand/raw/sunxi_nand.c             |  6 +-
 drivers/mtd/nand/raw/tango_nand.c             |  4 +-
 drivers/mtd/nand/raw/tegra_nand.c             |  6 +-
 include/linux/mtd/rawnand.h                   | 29 ++++---
 23 files changed, 145 insertions(+), 147 deletions(-)

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
index 03866b0aadea..1e85e046625b 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -84,9 +84,9 @@ int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
-int onfi_fill_data_interface(struct nand_chip *chip,
-			     enum nand_data_interface_type type,
-			     int timing_mode);
+int onfi_fill_interface_config(struct nand_chip *chip,
+			      enum nand_interface_type type,
+			      int timing_mode);
 int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
@@ -133,7 +133,7 @@ static inline int nand_exec_op(struct nand_chip *chip,
 static inline bool nand_has_setup_data_iface(struct nand_chip *chip)
 {
 	if (!chip->controller || !chip->controller->ops ||
-	    !chip->controller->ops->setup_data_interface)
+	    !chip->controller->ops->setup_interface)
 		return false;
 
 	if (chip->options & NAND_KEEP_TIMINGS)
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 260a0430313e..37d451f5e898 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1141,7 +1141,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
 		return ret;
 
 	ret = marvell_nfc_wait_op(chip,
-				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
+				  PSEC_TO_MSEC(chip->interface_config.timings.sdr.tPROG_max));
 	return ret;
 }
 
@@ -1599,7 +1599,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
 	}
 
 	ret = marvell_nfc_wait_op(chip,
-				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
+				  PSEC_TO_MSEC(chip->interface_config.timings.sdr.tPROG_max));
 
 	marvell_nfc_disable_hw_ecc(chip);
 
@@ -2305,9 +2305,8 @@ static struct nand_bbt_descr bbt_mirror_descr = {
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
@@ -2508,7 +2507,7 @@ static int marvell_nand_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops marvell_nand_controller_ops = {
 	.attach_chip = marvell_nand_attach_chip,
 	.exec_op = marvell_nfc_exec_op,
-	.setup_data_interface = marvell_nfc_setup_data_interface,
+	.setup_interface = marvell_nfc_setup_interface,
 };
 
 static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
@@ -2644,7 +2643,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 
 	/*
 	 * Save a reference value for timing registers before
-	 * ->setup_data_interface() is called.
+	 * ->setup_interface() is called.
 	 */
 	marvell_nand->ndtr0 = readl_relaxed(nfc->regs + NDTR0);
 	marvell_nand->ndtr1 = readl_relaxed(nfc->regs + NDTR1);
diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 3f376471f3f7..c9b9594efa4f 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -576,7 +576,7 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct meson_nfc *nfc = nand_get_controller_data(nand);
 	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&nand->data_interface);
+		nand_get_sdr_timings(&nand->interface_config);
 	u32 *addrs = nfc->cmdfifo.rw.addrs;
 	u32 cs = nfc->param.chip_select;
 	u32 cmd0, cmd_num, row_start;
@@ -628,7 +628,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&nand->data_interface);
+		nand_get_sdr_timings(&nand->interface_config);
 	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
 	struct meson_nfc *nfc = nand_get_controller_data(nand);
 	int data_len, info_len;
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
index 6a6a0a36b3fd..32ee84f50cf6 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -773,7 +773,7 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 		return -ENOTSUPP;
 
 	/* Wait tWB before polling the STATUS reg. */
-	timings = nand_get_sdr_timings(&chip->data_interface);
+	timings = nand_get_sdr_timings(&chip->interface_config);
 	ndelay(PSEC_TO_NSEC(timings->tWB_max));
 
 	ret = nand_status_op(chip, NULL);
@@ -898,7 +898,7 @@ static bool nand_supports_set_features(struct nand_chip *chip, int addr)
 }
 
 /**
- * nand_reset_data_interface - Reset data interface and timings
+ * nand_reset_interface_config - Reset data interface and timings
  * @chip: The NAND chip
  * @chipnr: Internal die id
  *
@@ -906,7 +906,7 @@ static bool nand_supports_set_features(struct nand_chip *chip, int addr)
  *
  * Returns 0 for success or negative error code otherwise.
  */
-static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
+static int nand_reset_interface_config(struct nand_chip *chip, int chipnr)
 {
 	int ret;
 
@@ -927,9 +927,9 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 	 * timings to timing mode 0.
 	 */
 
-	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
-	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
-							&chip->data_interface);
+	onfi_fill_interface_config(chip, NAND_SDR_IFACE, 0);
+	ret = chip->controller->ops->setup_interface(chip, chipnr,
+						     &chip->interface_config);
 	if (ret)
 		pr_err("Failed to configure data interface to SDR timing mode 0\n");
 
@@ -937,7 +937,7 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 }
 
 /**
- * nand_setup_data_interface - Setup the best data interface and timings
+ * nand_setup_interface - Setup the best data interface and timings
  * @chip: The NAND chip
  * @chipnr: Internal die id
  *
@@ -949,7 +949,7 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
  *
  * Returns 0 for success or negative error code otherwise.
  */
-static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
+static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 {
 	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
 		chip->onfi_timing_mode_default,
@@ -970,8 +970,8 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	}
 
 	/* Change the mode on the controller side */
-	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
-							&chip->data_interface);
+	ret = chip->controller->ops->setup_interface(chip, chipnr,
+						     &chip->interface_config);
 	if (ret)
 		return ret;
 
@@ -1000,7 +1000,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	 * Fallback to mode 0 if the chip explicitly did not ack the chosen
 	 * timing mode.
 	 */
-	nand_reset_data_interface(chip, chipnr);
+	nand_reset_interface_config(chip, chipnr);
 	nand_select_target(chip, chipnr);
 	nand_reset_op(chip);
 	nand_deselect_target(chip);
@@ -1009,7 +1009,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 }
 
 /**
- * nand_init_data_interface - find the best data interface and timings
+ * nand_init_interface_config - find the best data interface and timings
  * @chip: The NAND chip
  *
  * Find the best data interface and NAND timings supported by the chip
@@ -1017,12 +1017,12 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
  * First tries to retrieve supported timing modes from ONFI information,
  * and if the NAND chip does not support ONFI, relies on the
  * ->onfi_timing_mode_default specified in the nand_ids table. After this
- * function nand_chip->data_interface is initialized with the best timing mode
+ * function nand_chip->interface_config is initialized with the best timing mode
  * available.
  *
  * Returns 0 for success or negative error code otherwise.
  */
-static int nand_init_data_interface(struct nand_chip *chip)
+static int nand_init_interface_config(struct nand_chip *chip)
 {
 	int modes, mode, ret;
 
@@ -1044,7 +1044,7 @@ static int nand_init_data_interface(struct nand_chip *chip)
 	}
 
 	for (mode = fls(modes) - 1; mode >= 0; mode--) {
-		ret = onfi_fill_data_interface(chip, NAND_SDR_IFACE, mode);
+		ret = onfi_fill_interface_config(chip, NAND_SDR_IFACE, mode);
 		if (ret)
 			continue;
 
@@ -1052,9 +1052,9 @@ static int nand_init_data_interface(struct nand_chip *chip)
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
@@ -1124,7 +1124,7 @@ static int nand_sp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&chip->data_interface);
+		nand_get_sdr_timings(&chip->interface_config);
 	u8 addrs[4];
 	struct nand_op_instr instrs[] = {
 		NAND_OP_CMD(NAND_CMD_READ0, 0),
@@ -1166,7 +1166,7 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 				     unsigned int len)
 {
 	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&chip->data_interface);
+		nand_get_sdr_timings(&chip->interface_config);
 	u8 addrs[5];
 	struct nand_op_instr instrs[] = {
 		NAND_OP_CMD(NAND_CMD_READ0, 0),
@@ -1263,7 +1263,7 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_PARAM, 0),
 			NAND_OP_ADDR(1, &page, PSEC_TO_NSEC(sdr->tWB_max)),
@@ -1318,7 +1318,7 @@ int nand_change_read_column_op(struct nand_chip *chip,
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		u8 addrs[2] = {};
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_RNDOUT, 0),
@@ -1394,7 +1394,7 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&chip->data_interface);
+		nand_get_sdr_timings(&chip->interface_config);
 	u8 addrs[5] = {};
 	struct nand_op_instr instrs[] = {
 		/*
@@ -1517,7 +1517,7 @@ int nand_prog_page_end_op(struct nand_chip *chip)
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_PAGEPROG,
 				    PSEC_TO_NSEC(sdr->tWB_max)),
@@ -1624,7 +1624,7 @@ int nand_change_write_column_op(struct nand_chip *chip,
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		u8 addrs[2];
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_RNDIN, 0),
@@ -1679,7 +1679,7 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_READID, 0),
 			NAND_OP_ADDR(1, &addr, PSEC_TO_NSEC(sdr->tADL_min)),
@@ -1718,7 +1718,7 @@ int nand_status_op(struct nand_chip *chip, u8 *status)
 {
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_STATUS,
 				    PSEC_TO_NSEC(sdr->tADL_min)),
@@ -1787,7 +1787,7 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		u8 addrs[3] = {	page, page >> 8, page >> 16 };
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_ERASE1, 0),
@@ -1846,7 +1846,7 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_SET_FEATURES, 0),
 			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tADL_min)),
@@ -1893,7 +1893,7 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_GET_FEATURES, 0),
 			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tWB_max)),
@@ -1950,7 +1950,7 @@ int nand_reset_op(struct nand_chip *chip)
 {
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_RESET, PSEC_TO_NSEC(sdr->tWB_max)),
 			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tRST_max), 0),
@@ -2480,17 +2480,17 @@ EXPORT_SYMBOL_GPL(nand_subop_get_data_len);
  * @chipnr: Internal die id
  *
  * Save the timings data structure, then apply SDR timings mode 0 (see
- * nand_reset_data_interface for details), do the reset operation, and
+ * nand_reset_interface_config for details), do the reset operation, and
  * apply back the previous timings.
  *
  * Returns 0 on success, a negative error code otherwise.
  */
 int nand_reset(struct nand_chip *chip, int chipnr)
 {
-	struct nand_data_interface saved_data_intf = chip->data_interface;
+	struct nand_interface_config saved_data_intf = chip->interface_config;
 	int ret;
 
-	ret = nand_reset_data_interface(chip, chipnr);
+	ret = nand_reset_interface_config(chip, chipnr);
 	if (ret)
 		return ret;
 
@@ -2506,17 +2506,17 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 		return ret;
 
 	/*
-	 * A nand_reset_data_interface() put both the NAND chip and the NAND
+	 * A nand_reset_interface_config() put both the NAND chip and the NAND
 	 * controller in timings mode 0. If the default mode for this chip is
 	 * also 0, no need to proceed to the change again. Plus, at probe time,
-	 * nand_setup_data_interface() uses ->set/get_features() which would
+	 * nand_setup_interface() uses ->set/get_features() which would
 	 * fail anyway as the parameter page is not available yet.
 	 */
 	if (!chip->onfi_timing_mode_default)
 		return 0;
 
-	chip->data_interface = saved_data_intf;
-	ret = nand_setup_data_interface(chip, chipnr);
+	chip->interface_config = saved_data_intf;
+	ret = nand_setup_interface(chip, chipnr);
 	if (ret)
 		return ret;
 
@@ -3298,7 +3298,7 @@ static void nand_wait_readrdy(struct nand_chip *chip)
 	if (!(chip->options & NAND_NEED_READRDY))
 		return;
 
-	sdr = nand_get_sdr_timings(&chip->data_interface);
+	sdr = nand_get_sdr_timings(&chip->interface_config);
 	WARN_ON(nand_wait_rdy_op(chip, PSEC_TO_MSEC(sdr->tR_max), 0));
 }
 
@@ -5253,7 +5253,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	mutex_init(&chip->lock);
 
 	/* Enforce the right timings for reset/detection */
-	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
+	onfi_fill_interface_config(chip, NAND_SDR_IFACE, 0);
 
 	ret = nand_dt_init(chip);
 	if (ret)
@@ -6050,14 +6050,14 @@ static int nand_scan_tail(struct nand_chip *chip)
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
 
-	/* Initialize the ->data_interface field. */
-	ret = nand_init_data_interface(chip);
+	/* Initialize the ->interface_config field. */
+	ret = nand_init_interface_config(chip);
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
index d64791c06a97..a4fa9e2a74e2 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -366,7 +366,7 @@ static void nand_ccs_delay(struct nand_chip *chip)
 	 * (which should be safe for all NANDs).
 	 */
 	if (nand_has_setup_data_iface(chip))
-		ndelay(chip->data_interface.timings.sdr.tCCS_min / 1000);
+		ndelay(chip->interface_config.timings.sdr.tCCS_min / 1000);
 	else
 		ndelay(500);
 }
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 36d21be3dfe5..070bf6989b88 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -12,7 +12,7 @@
 
 #define ONFI_DYN_TIMING_MAX U16_MAX
 
-static const struct nand_data_interface onfi_sdr_timings[] = {
+static const struct nand_interface_config onfi_sdr_timings[] = {
 	/* Mode 0 */
 	{
 		.type = NAND_SDR_IFACE,
@@ -274,15 +274,15 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 };
 
 /**
- * onfi_fill_data_interface - [NAND Interface] Initialize a data interface from
- * given ONFI mode
+ * onfi_fill_interface_config - Initialize an interface config from the given
+ *				ONFI mode
  * @mode: The ONFI timing mode
  */
-int onfi_fill_data_interface(struct nand_chip *chip,
-			     enum nand_data_interface_type type,
+int onfi_fill_interface_config(struct nand_chip *chip,
+			     enum nand_interface_type type,
 			     int timing_mode)
 {
-	struct nand_data_interface *iface = &chip->data_interface;
+	struct nand_interface_config *iface = &chip->interface_config;
 	struct onfi_params *onfi = chip->parameters.onfi;
 
 	if (type != NAND_SDR_IFACE)
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index ae069905d7e4..f99c9cc5ffa5 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -33,7 +33,7 @@ static int toshiba_nand_benand_read_eccstatus_op(struct nand_chip *chip,
 
 	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+			nand_get_sdr_timings(&chip->interface_config);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(TOSHIBA_NAND_CMD_ECC_STATUS_READ,
 				    PSEC_TO_NSEC(sdr->tADL_min)),
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
index 65c9d17b25a3..749ac1044006 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1308,7 +1308,7 @@ static int stm32_fmc2_nfc_waitrdy(struct nand_chip *chip,
 		dev_warn(nfc->dev, "Waitrdy timeout\n");
 
 	/* Wait tWB before R/B# signal is low */
-	timings = nand_get_sdr_timings(&chip->data_interface);
+	timings = nand_get_sdr_timings(&chip->interface_config);
 	ndelay(PSEC_TO_NSEC(timings->tWB_max));
 
 	/* R/B# signal is low, clear high level flag */
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
index 2804c13e5662..58fcc882a8df 100644
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
@@ -1071,7 +1070,7 @@ struct nand_legacy {
  * @id:			[INTERN] holds NAND ID
  * @parameters:		[INTERN] holds generic parameters under an easily
  *			readable form.
- * @data_interface:	[INTERN] NAND interface timing information
+ * @interface_config:	NAND interface configuration
  * @cur_cs:		currently selected target. -1 means no target selected,
  *			otherwise we should always have cur_cs >= 0 &&
  *			cur_cs < nanddev_ntargets(). NAND Controller drivers
@@ -1130,7 +1129,7 @@ struct nand_chip {
 	struct nand_id id;
 	struct nand_parameters parameters;
 
-	struct nand_data_interface data_interface;
+	struct nand_interface_config interface_config;
 
 	int cur_cs;
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
