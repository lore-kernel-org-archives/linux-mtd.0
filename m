Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC62C4361B
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 09:47:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627CF235F7
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 09:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 627CF235F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=39ycigmp3qcnrfWghdGhpw8XsGi5jWh7FSVkyjxYzE0=; b=sowIKhUsmSbFzuhcAhAaNavBE
	o+0INwWL90MQPXVQI3y/8fAn3xpztEnuKr1KdvQh6ffCcPLq2+FHjANsi7TPb5wbl3CIZcbiHVmZ0
	zalaoQNNd71CL5ermGvoURX+wh2b7KNZxYYZ0cRUN+yEf/Up8JcKAFSqB2QwQbIymhS41/4bbsdRv
	ZMqjirBVuvU/m33Aseq7KJzq5zVONulsmaj6zxnQ1HZOtIVfHzDKEFbagCI6NjhRyQpWORmchXYfQ
	7ZIEjLtllz3h0nOGEzQnFhME/CBK8Kz7Ly+XqbQkmr0VlpassRh/smTu+goko2YDSE6MQEs+zDJEI
	eG8e3iKdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knIWR-0001DH-96; Thu, 10 Dec 2020 09:46:03 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knIWO-0001CH-94
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 09:46:01 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1knIWM-0008Q9-Af; Thu, 10 Dec 2020 10:45:58 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1knIWL-00014C-Q8; Thu, 10 Dec 2020 10:45:57 +0100
Date: Thu, 10 Dec 2020 10:45:57 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: gpmi: Fix the driver only sense CS0
 R/B issue
Message-ID: <20201210094557.GT3977@pengutronix.de>
References: <20201209035104.22679-1-han.xu@nxp.com>
 <20201209035104.22679-2-han.xu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209035104.22679-2-han.xu@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:45:37 up 7 days, 22:12, 76 users, load average: 0.31, 0.23, 0.20
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_044600_399066_89186171 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Dec 08, 2020 at 09:51:03PM -0600, Han Xu wrote:
> set the GPMI CTRL1 GANGED_RDYBUSY bit so dirver can sense the R/B signal
> from all CS.
> 
> For the NAND chip MT29F64G08AFAAAWP, only the first chip detected
> without the patch.
> 
> [    3.764118] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> [    3.770613] nand: Micron MT29F64G08AFAAAWP
> [    3.774752] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
> [    3.786421] Bad block table found at page 524160, version 0x01
> [    3.792730] Bad block table found at page 524032, version 0x01
> 
> After applying the patch
> 
> [    3.764445] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> [    3.770941] nand: Micron MT29F64G08AFAAAWP
> [    3.775080] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
> [    3.784390] nand: 2 chips detected
> [    3.790900] Bad block table found at page 524160, version 0x01
> [    3.796776] Bad block table found at page 1048448, version 0x01
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 ++++--
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 0d30f3fbb045..b06e202cdd0d 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -181,9 +181,11 @@ static int gpmi_init(struct gpmi_nand_data *this)
>  
>  	/*
>  	 * Decouple the chip select from dma channel. We use dma0 for all
> -	 * the chips.
> +	 * the chips, force all NAND RDY_BUSY inputs to be sourced from
> +	 * RDY_BUSY0.
>  	 */
> -	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
> +	writel(BM_GPMI_CTRL1_DECOUPLE_CS | BM_GPMI_CTRL1_GANGED_RDYBUSY,
> +	       r->gpmi_regs + HW_GPMI_CTRL1_SET);
>  
>  err_out:
>  	pm_runtime_mark_last_busy(this->dev);
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
> index f5e4f26c34da..fc31fd084dcf 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
> @@ -107,6 +107,7 @@
>  #define BV_GPMI_CTRL1_WRN_DLY_SEL_7_TO_12NS		0x2
>  #define BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY		0x3
>  
> +#define BM_GPMI_CTRL1_GANGED_RDYBUSY			(1 << 19)
>  #define BM_GPMI_CTRL1_BCH_MODE				(1 << 18)
>  
>  #define BP_GPMI_CTRL1_DLL_ENABLE			17
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
