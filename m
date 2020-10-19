Return-Path: <SRS0=sICc=D2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF46CC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 09:14:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4552422200
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 09:14:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HOoPFNJX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4552422200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z2EfrT1gOSlhcu7kATV1k1lFhFbCeKkNuBok+6Jgzq0=; b=HOoPFNJX6UUDwmseuaP9oyVDR
	CtvFnZQGx0i9DJF0pLcS9Ju322LTh0QBOvQFmHC67opU5opgBHlVn81xr1LOM+r4DXBSXLslsOT4p
	Hd50ACqqUzVOd89ZtHbrTZyocjHG1/WYsVdf2EetQjy5lG9kjR4IVAyuLsnMjc4NunLDQemVn6rt+
	35ANdIwqyOiFIXCHGXpa8Ji73cJzWldHqVPrknYhOXHi43pFLwOEjVzJXzz2lqvOaCd4VaO66DY99
	7Ob5yOsSwwDX8k324tnf6yuf3J7TcDlvuBoJvXR+zdmMd246qihjuPU92yY2G9jS9xZ5fSPDWHClG
	xJmHPRY6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUREL-00045S-0q; Mon, 19 Oct 2020 09:13:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUREH-000454-P6
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2020 09:13:22 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kUREA-0007Vr-SC; Mon, 19 Oct 2020 11:13:14 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kURE8-0007un-QB; Mon, 19 Oct 2020 11:13:12 +0200
Date: Mon, 19 Oct 2020 11:13:12 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: mxc: Move the ECC engine initialization
 to the right place
Message-ID: <20201019091312.GR13710@pengutronix.de>
References: <20201016213613.1450-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016213613.1450-1-festevam@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:12:01 up 242 days, 16:42, 147 users,  load average: 0.31, 0.27,
 0.25
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_051322_080527_F4C4244E 
X-CRM114-Status: GOOD (  24.56  )
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
Cc: vigneshr@ti.com, richard@nod.at, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 miquel.raynal@bootlin.com, han.xu@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 06:36:13PM -0300, Fabio Estevam wrote:
> No ECC initialization should happen during the host controller probe.
> 
> In fact, we need the probe function to call nand_scan() in order to:
> 
> - identify the device, its capabilities and constraints (nand_scan_ident())
> - configure the ECC engine accordingly (->attach_chip())
> - scan its content and prepare the core (nand_scan_tail())
> 
> Moving these lines to mxcnd_attach_chip() fixes a regression caused by
> a previous commit supposed to clarify these steps.
> 
> When moving the ECC initialization from probe() to attach(), get rid
> of the pdata usage to determine the engine type and let the core decide
> instead.
> 
> Tested on a imx27-pdk board.
> 
> Reported-by: Fabio Estevam <festevam@gmail.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

I gave it a test on a Phytec phyCARD board, this fixes it.

Tested-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
> Changes since v2:
> - Remove pdata check in attach() and let the core determine the engine type
> 
>  drivers/mtd/nand/raw/mxc_nand.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
> index d4200eb2ad32..684c51e5e60d 100644
> --- a/drivers/mtd/nand/raw/mxc_nand.c
> +++ b/drivers/mtd/nand/raw/mxc_nand.c
> @@ -1681,6 +1681,11 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
>  	struct mxc_nand_host *host = nand_get_controller_data(chip);
>  	struct device *dev = mtd->dev.parent;
>  
> +	chip->ecc.bytes = host->devtype_data->eccbytes;
> +	host->eccsize = host->devtype_data->eccsize;
> +	chip->ecc.size = 512;
> +	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
> +
>  	switch (chip->ecc.engine_type) {
>  	case NAND_ECC_ENGINE_TYPE_ON_HOST:
>  		chip->ecc.read_page = mxc_nand_read_page;
> @@ -1836,19 +1841,7 @@ static int mxcnd_probe(struct platform_device *pdev)
>  	if (host->devtype_data->axi_offset)
>  		host->regs_axi = host->base + host->devtype_data->axi_offset;
>  
> -	this->ecc.bytes = host->devtype_data->eccbytes;
> -	host->eccsize = host->devtype_data->eccsize;
> -
>  	this->legacy.select_chip = host->devtype_data->select_chip;
> -	this->ecc.size = 512;
> -	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
> -
> -	if (host->pdata.hw_ecc) {
> -		this->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
> -	} else {
> -		this->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
> -		this->ecc.algo = NAND_ECC_ALGO_HAMMING;
> -	}
>  
>  	/* NAND bus width determines access functions used by upper layer */
>  	if (host->pdata.width == 2)
> -- 
> 2.17.1
> 
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
