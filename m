Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97F6C25B75
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2024 08:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bnsZOBNzR4I2//+tkvCzHWp6WnWXFYzoaCChzozik4=; b=aPoEljgxLgivW5
	lOfIh9dibqF24KzSFwXBxqdfWSYiN2rQ9bz9sTuMlSPxudx48uk9sPrIT/NntcQ1lK3UX6ea9IfWp
	i8BfuLjamzwwNO7k5JoeD3yWF+VpMexeA+IGxa8LFYoVNnuaos3OcrEXKM11Nax8N5Qu/szd+799N
	+wVXP0sIdGqhNQnsljZNKDD5JwW3XBoTFLHroi6J9mzztMklZu8UMCZnX+MIGQ2zPNj/WpPKgiPGH
	QS8nZcVjF++zxeCsLC61I5Po/rJQ56l78sGRLW1Ns5l7rr5iC7uC45lljNxQL6tW1tJ4BWVTCV0jq
	mGGlMdLvEUZwbNdcgVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7A0b-00000000wgW-1l3b;
	Wed, 15 May 2024 08:29:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7A0X-00000000wft-3geW
	for linux-mtd@lists.infradead.org;
	Wed, 15 May 2024 08:29:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s7A0V-0004hv-TA; Wed, 15 May 2024 10:29:03 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s7A0T-001VCp-G5; Wed, 15 May 2024 10:29:01 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s7A0T-00D0m8-1I;
	Wed, 15 May 2024 10:29:01 +0200
Date: Wed, 15 May 2024 10:29:01 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: nand: mxc_nand: support software ECC
Message-ID: <ZkRyTT7FcDQ-5UeV@pengutronix.de>
References: <20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de>
 <20240514-mtd-nand-mxc-nand-exec-op-v3-3-3e6f45fd3d82@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514-mtd-nand-mxc-nand-exec-op-v3-3-3e6f45fd3d82@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_012906_191492_A45EBEF1 
X-CRM114-Status: GOOD (  44.06  )
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

On Tue, May 14, 2024 at 04:25:19PM +0200, Sascha Hauer wrote:
> With these changes the driver can be used with software BCH ECC which
> is useful for NAND chips that require a stronger ECC than the i.MX
> hardware supports.
> 
> The controller normally interleaves user data with OOB data when
> accessing the NAND chip. With Software BCH ECC we write the data
> to the NAND in a way that the raw data on the NAND chip matches the
> way the NAND layer sees it. This way commands like NAND_CMD_RNDOUT
> work as expected.
> 
> This was tested on i.MX27 but should work on the other SoCs supported
> by this driver as well.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/raw/mxc_nand.c | 73 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 68 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
> index 6f8b8f4b118ec..ae4cff2584a2d 100644
> --- a/drivers/mtd/nand/raw/mxc_nand.c
> +++ b/drivers/mtd/nand/raw/mxc_nand.c
> @@ -1404,10 +1404,10 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
>  	chip->ecc.bytes = host->devtype_data->eccbytes;
>  	host->eccsize = host->devtype_data->eccsize;
>  	chip->ecc.size = 512;
> -	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
>  
>  	switch (chip->ecc.engine_type) {
>  	case NAND_ECC_ENGINE_TYPE_ON_HOST:
> +		mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
>  		chip->ecc.read_page = mxc_nand_read_page;
>  		chip->ecc.read_page_raw = mxc_nand_read_page_raw;
>  		chip->ecc.read_oob = mxc_nand_read_oob;
> @@ -1417,6 +1417,8 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
>  		break;
>  
>  	case NAND_ECC_ENGINE_TYPE_SOFT:
> +		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
> +		chip->ecc.read_page_raw = nand_monolithic_read_page_raw;
>  		break;
>  
>  	default:
> @@ -1472,6 +1474,59 @@ static int mxcnd_setup_interface(struct nand_chip *chip, int chipnr,
>  	return host->devtype_data->setup_interface(chip, chipnr, conf);
>  }
>  
> +static void copy_page_to_sram(struct mtd_info *mtd, const void *buf, int buf_len)
> +{
> +	struct nand_chip *this = mtd_to_nand(mtd);
> +	struct mxc_nand_host *host = nand_get_controller_data(this);
> +	unsigned int no_subpages = mtd->writesize / 512;
> +	int oob_per_subpage, i;
> +
> +	oob_per_subpage = (mtd->oobsize / no_subpages) & ~1;
> +
> +	/*
> +	 * During a page write the i.MX NAND controller will read 512b from
> +	 * main_area0 SRAM, then oob_per_subpage bytes from spare0 SRAM, then
> +	 * 512b from main_area1 SRAM and so on until the full page is written.
> +	 * For software ECC we want to have a 1:1 mapping between the raw page
> +	 * data on the NAND chip and the view of the NAND core. This is
> +	 * necessary to make the NAND_CMD_RNDOUT read the data it expects.
> +	 * To accomplish this we have to write the data in the order the controller
> +	 * reads it. This is reversed in copy_page_from_sram() below.
> +	 */
> +	for (i = 0; i < no_subpages; i++) {
> +		memcpy16_toio(host->main_area0 + i * 512, buf, 512);
> +		buf += 512;
> +
> +		memcpy16_toio(host->spare0 + i * host->devtype_data->spare_len, buf,
> +			      oob_per_subpage);
> +		buf += oob_per_subpage;
> +	}
> +}

I noticed the nandbiterr test won't work with this. It needs the following
fixup. The problem is that the core wants to write only user data
without OOB, so we have to make sure the remaining SRAM is filled up
with 0xff.

I'll wait some time for other comments before sending a v4 with this
included.

Sascha

-----------------------------8<--------------------------------

From 8287fc3b44c22811350467f00b5652c94a816a36 Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 15 May 2024 10:25:29 +0200
Subject: [PATCH] fixup! mtd: nand: mxc_nand: support software ECC

---
 drivers/mtd/nand/raw/mxc_nand.c | 35 ++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index ae4cff2584a2d..9d50f41b3d5a1 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1474,6 +1474,15 @@ static int mxcnd_setup_interface(struct nand_chip *chip, int chipnr,
 	return host->devtype_data->setup_interface(chip, chipnr, conf);
 }
 
+static void memff16_toio(void *buf, int n)
+{
+	__iomem u16 *t = buf;
+	int i;
+
+	for (i = 0; i < (n >> 1); i++)
+		__raw_writew(0xffff, t++);
+}
+
 static void copy_page_to_sram(struct mtd_info *mtd, const void *buf, int buf_len)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
@@ -1492,14 +1501,34 @@ static void copy_page_to_sram(struct mtd_info *mtd, const void *buf, int buf_len
 	 * necessary to make the NAND_CMD_RNDOUT read the data it expects.
 	 * To accomplish this we have to write the data in the order the controller
 	 * reads it. This is reversed in copy_page_from_sram() below.
+	 *
+	 * buf_len can either be the full page including the OOB or user data only.
+	 * When it's user data only make sure that we fill up the rest of the
+	 * SRAM with 0xff.
 	 */
 	for (i = 0; i < no_subpages; i++) {
-		memcpy16_toio(host->main_area0 + i * 512, buf, 512);
+		int now = min(buf_len, 512);
+
+		if (now)
+			memcpy16_toio(host->main_area0 + i * 512, buf, now);
+
+		if (now < 512)
+			memff16_toio(host->main_area0 + i * 512 + now, 512 - now);
+
 		buf += 512;
+		buf_len -= now;
+
+		now = min(buf_len, oob_per_subpage);
+		if (now)
+			memcpy16_toio(host->spare0 + i * host->devtype_data->spare_len,
+				      buf, now);
+
+		if (now < oob_per_subpage)
+			memff16_toio(host->spare0 + i * host->devtype_data->spare_len + now,
+				     oob_per_subpage - now);
 
-		memcpy16_toio(host->spare0 + i * host->devtype_data->spare_len, buf,
-			      oob_per_subpage);
 		buf += oob_per_subpage;
+		buf_len -= now;
 	}
 }
 
-- 
2.39.2



-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
