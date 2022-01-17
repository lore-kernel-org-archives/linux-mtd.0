Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B56C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 13:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zgyWtXKBOf8kUv9p4bdcz//4eLxjsz+tjts9GWILhHo=; b=2q/QFrIQ73cwDOfV1wNqajpOny
	rfB9AzuS/SdUYpmH26ecOTMMNGpsZFPnygKduu75g3XUtJQnU3QUOgH8QQtSStv29DrEam0R3YKfk
	NN8BcSPcUdk0TD75YKqu7ciT/R4y2+GwbGBWQ8L2k0SZ9U8CHinndiJZZj/tMOEx1J3X02bRxY2yK
	/ku6Ma7cGVutlyBC7ugg8w8+oXoQaQYuU4IwwQDnRADUpZg6wFh1sltbmXezI9H7c+nlQixi8t3at
	fNa30v5bRLs9Y8OWQaVqWnmOuKF0RFKSH6MB7ZlY6d7F3fDIJuVwWHrDvOj3NhpYtm9mgZTl1kdzU
	S00GPdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Ru4-00F2F5-Q1; Mon, 17 Jan 2022 13:18:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Ru1-00F2EW-SO
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 13:18:31 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1n9Rtu-0004nS-9h; Mon, 17 Jan 2022 14:18:22 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1n9Rtt-00APAa-61; Mon, 17 Jan 2022 14:18:21 +0100
Date: Mon, 17 Jan 2022 14:18:21 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v2 3/5] mtd: rawnand: gpmi: use a table to get EDO
 mode setup
Message-ID: <YeVsnQpOkyXaBk0+@pengutronix.de>
References: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
 <20220117111829.1811997-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117111829.1811997-4-dario.binacchi@amarulasolutions.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:56:46 up 110 days, 1:53, 80 users, load average: 20.96, 15.71, 
 15.82
From: Sascha Hauer <sha@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_051829_943230_D7DBEBC0 
X-CRM114-Status: GOOD (  28.19  )
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

Hi Dario,

On Mon, Jan 17, 2022 at 12:18:27PM +0100, Dario Binacchi wrote:
> +struct edo_mode {
> +	u32 tRC_min;
> +	long clk_rate;
> +	u8 wrn_dly_sel;
> +};
> +
> +static const struct edo_mode edo_modes[] = {
> +	{.tRC_min = 30000, .clk_rate = 22000000,
> +	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> +	{.tRC_min = 30000, .clk_rate = 22000000,
> +	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> +	{.tRC_min = 30000, .clk_rate = 22000000,
> +	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> +	{.tRC_min = 30000, .clk_rate = 22000000,
> +	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> +	{.tRC_min = 25000, .clk_rate = 80000000,
> +	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY},
> +	{.tRC_min = 20000, .clk_rate = 100000000,
> +	 .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY},
> +};
> +
>  /*
>   * <1> Firstly, we should know what's the GPMI-clock means.
>   *     The GPMI-clock is the internal clock in the gpmi nand controller.
> @@ -657,22 +678,18 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
>  	int sample_delay_ps, sample_delay_factor;
>  	u16 busy_timeout_cycles;
>  	u8 wrn_dly_sel;
> +	int i, emode = ARRAY_SIZE(edo_modes) - 1;
>  
> -	if (sdr->tRC_min >= 30000) {
> -		/* ONFI non-EDO modes [0-3] */
> -		hw->clk_rate = 22000000;
> -		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
> -	} else if (sdr->tRC_min >= 25000) {
> -		/* ONFI EDO mode 4 */
> -		hw->clk_rate = 80000000;
> -		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> -	} else {
> -		/* ONFI EDO mode 5 */
> -		hw->clk_rate = 100000000;
> -		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> +	/* Search the required EDO mode */
> +	for (i = 0; i < ARRAY_SIZE(edo_modes); i++) {
> +		if (sdr->tRC_min >= edo_modes[i].tRC_min) {
> +			emode = i;
> +			break;
> +		}

The first four entries of edo_modes[] all have the same value, so this loop
will never end on the second, third or fourth element. These elements are just
there to match 'emode' with the existing ONFI mode numbers, but then 'emode' is
never used as an ONFI mode number, instead it's only used as an index to the
array. You could equally well remove the second till fourth array entries.

Then with only three entries left in the array I wonder if you're not better
off with the original code and change it to something like:

	if (sdr->tRC_min >= 30000) {
		/* ONFI non-EDO modes [0-3] */
		hw->clk_rate = 22000000;
		min_rate = 0;
		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
	} else if (sdr->tRC_min >= 25000) {
		/* ONFI EDO mode 4 */
		hw->clk_rate = 80000000;
		min_rate = 22000000;
		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
	} else {
		/* ONFI EDO mode 5 */
		hw->clk_rate = 100000000;
		min_rate = 80000000;
		wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
	}

	hw->clk_rate = clk_round_rate(r->clock[0], hw->clk_rate);
	if (hw->clk_rate < min_rate)
		return -EINVAL;

I think this would be easier to follow.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
