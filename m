Return-Path: <SRS0=/vOe=RA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2D2C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 08:56:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8332087C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 08:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nNw4t3La"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8332087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KC+12y69DONe1YfHskgYUuJTTBbKeKfDRWESCl3FZp8=; b=nNw4t3LaQuavmt
	G4C9A2jBH8iKwCtDQarHqqvtb7JbLYbzYtsvj22OwGy1yEPtLKxDkjmYVqXkypRd3Kjis8Z56ugsl
	anrm3K6rvR7Edv7nsJrvWnnK7eqXjkl4f+n8wrwuU6S/LSRsUUKqrHwYAq0Qh6+SXLwrUsaymQuqb
	GOTKcrXH9I6YWkUAkF+HIlKVSySzIua+BoY/F1f3Dcf+CIPqJoOVEpRWZXeJuv9Dz/atpfKowW0aZ
	Ei7aBZ0lxtTk5FMkkUxcPV9+HNXM5WuxPOh/zuf7KuvrZSehcx5CkNxwivqGz+5/jMTTykCdK0tqN
	1YvF1vNjoyz2J8sS2adw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyC3w-00056Q-Ka; Mon, 25 Feb 2019 08:56:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyC3t-00055k-0n
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2019 08:56:35 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gyC3r-0007bx-Fg; Mon, 25 Feb 2019 09:56:31 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gyC3r-0000Sb-82; Mon, 25 Feb 2019 09:56:31 +0100
Date: Mon, 25 Feb 2019 09:56:31 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Prevent Nand page writes on Power failure
Message-ID: <20190225085631.ddsodh7x3kaofer5@pengutronix.de>
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:49:30 up 13 days, 17:15, 58 users,  load average: 0.00, 0.04, 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_005633_216023_10893027 
X-CRM114-Status: GOOD (  31.85  )
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 20, 2019 at 02:58:20PM +0100, Sascha Hauer wrote:
> 
> Hi All,
> 
> I have hardware here for which the normal way to turn off is just to cut
> the power. When the powercut happens during a NAND page write then we
> get more or less completely written pages during next boot. Very rarely
> it seems to happen that such a half written page with only very few
> flipped bits is erroneously detected as empty and written again which
> then results in ECC errors when reading the data.
> 
> The Nand in question is a Micron MT29F4G08ABADAH4 and in TN2917 Micron
> clearly states:
> 
> | Power loss during NAND array operations (especially Program/Erase) is a
> | violation of the NAND voltage specifications, which is not supported and
> | should be avoided
> 
> Micron suggests to make the capacitors on the Nand chips supply input
> big enough that every started operation will be finished before the
> power goes down. Now we don't have that situation here, what I have
> though is a power good status GPIO, so my job is to wire that up to the
> Nand write operations.
> 
> Now my question is how could that be done? I assume for some people a
> power good failure means that we should write all important data away,
> rather than preventing any Nand access. Given it's a policy decision I
> assume user space should be involved, right?  An option might be to
> introcude some sysfs entry to switch mtd devices to readonly mode. Would
> that be fine? Other suggestions?
> 

FYI the attached patch is what I have ended up with for now. Not
upstreamable of course, but works for me. I have the feeling that it's
not the last time I have this problem, so an upstreamable solution is
really desired.

Sascha

-----------------------------8<--------------------------------

From 04e76aaea00d2f92b51904e2b1611a3d64081e71 Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 21 Feb 2019 12:30:29 +0100
Subject: [PATCH] mtd: nand: raw: Allow to prevent write operations on power
 failures

When doing write operations the Nand chips supply must be within
specified ranges, otherwise written pages can be corrupted in various
ways, including cases where a page looks empty, but gets corrupted when
written to, or pages which first look good, but get corrupted over time.

This adds a power_good mutex to the nand chip which is acquired before
write/erase and released afterwards. Board code can acquire this mutex
on a power failure to prevent further write accesses to the Nand chip.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 50 ++++++++++++++++++++++
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  2 +
 drivers/mtd/nand/raw/nand_base.c           | 22 +++++++---
 include/linux/mtd/rawnand.h                |  2 +
 4 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 1c1ebbc82824..b13ddf7b7b75 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -13,6 +13,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/gpio/consumer.h>
 #include "gpmi-nand.h"
 #include "bch-regs.h"
 
@@ -628,6 +629,50 @@ err_clock:
 	return err;
 }
 
+static irqreturn_t gpmi_pwr_good_irq(int irq, void *dev_id)
+{
+	struct gpmi_nand_data *this = dev_id;
+	int level;
+
+	level = gpiod_get_value_cansleep(this->pwrgood_gpio);
+	if (level) {
+		mutex_lock(&this->nand.power_lock);
+	} else {
+		mutex_unlock(&this->nand.power_lock);
+		dev_info(this->dev, "Spurious Power Failure detected\n");
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int gpmi_get_pwrgood(struct gpmi_nand_data *this)
+{
+	struct gpio_desc *desc;
+	int irq, ret;
+
+	desc = devm_gpiod_get_index_optional(this->dev, "pwrgood", 0, GPIOD_IN);
+	if (!desc)
+		return 0;
+
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	irq = gpiod_to_irq(desc);
+
+	ret = devm_request_threaded_irq(this->dev, irq,
+			NULL, gpmi_pwr_good_irq,
+			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+			"pwrgood", this);
+	if (ret)
+		return ret;
+
+	this->pwrgood_gpio = desc;
+
+	dev_info(this->dev, "using irq %d as power good input\n", irq);
+
+	return 0;
+}
+
 static int acquire_resources(struct gpmi_nand_data *this)
 {
 	int ret;
@@ -651,6 +696,11 @@ static int acquire_resources(struct gpmi_nand_data *this)
 	ret = gpmi_get_clks(this);
 	if (ret)
 		goto exit_clock;
+
+	ret = gpmi_get_pwrgood(this);
+	if (ret)
+		goto exit_clock;
+
 	return 0;
 
 exit_clock:
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 69cd0cbde4f2..251e02bb4338 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -148,6 +148,8 @@ struct gpmi_nand_data {
 	void			*auxiliary_virt;
 	dma_addr_t		auxiliary_phys;
 
+	struct gpio_desc	*pwrgood_gpio;
+
 	void			*raw_buffer;
 
 	/* DMA channels */
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d527e448ce19..d9487503bec0 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2115,6 +2115,8 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 	int ret;
 	u8 status;
 
+	mutex_lock(&chip->power_lock);
+
 	if (chip->exec_op) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
@@ -2133,26 +2135,30 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 
 		ret = nand_exec_op(chip, &op);
 		if (ret)
-			return ret;
+			goto out;
 
 		ret = nand_status_op(chip, &status);
 		if (ret)
-			return ret;
+			goto out;
 	} else {
 		chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
 		chip->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
 
 		ret = chip->waitfunc(mtd, chip);
 		if (ret < 0)
-			return ret;
+			goto out;
 
 		status = ret;
 	}
 
 	if (status & NAND_STATUS_FAIL)
-		return -EIO;
+		ret = -EIO;
+	else
+		ret = 0;
+out:
+	mutex_unlock(&chip->power_lock);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(nand_erase_op);
 
@@ -4330,6 +4336,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	else
 		subpage = 0;
 
+	mutex_lock(&chip->power_lock);
+
 	if (unlikely(raw))
 		status = chip->ecc.write_page_raw(mtd, chip, buf,
 						  oob_required, page);
@@ -4340,6 +4348,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		status = chip->ecc.write_page(mtd, chip, buf, oob_required,
 					      page);
 
+	mutex_unlock(&chip->power_lock);
+
 	if (status < 0)
 		return status;
 
@@ -6786,6 +6796,8 @@ int nand_scan_with_ids(struct mtd_info *mtd, int maxchips,
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	int ret;
 
+	mutex_init(&chip->power_lock);
+
 	if (maxchips) {
 		ret = nand_scan_ident(mtd, maxchips, ids);
 		if (ret)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index efb2345359bb..638b187eb198 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1357,6 +1357,8 @@ struct nand_chip {
 
 	struct nand_bbt_descr *badblock_pattern;
 
+	struct mutex power_lock;
+
 	void *priv;
 
 	struct {
-- 
2.20.1


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
