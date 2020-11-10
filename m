Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED7DC388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 08:02:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A731D2080A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 08:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rfGwObUe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A731D2080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=//blsXEmQkZYUjw1JoqgfKidE5P1HRyMvkn42jMMePI=; b=rfGwObUe70N2AiULTM94rAPsF
	g0wYUU8dnJP0+/hzf9Cqc5nxyJV84EMzVrzaKuh0nhOVSXdja5okbIR1NF/xdnUkp+v6jW+gWImhP
	CXioHUBiLzqDBLxQkxxxuxB+71TFwz+ufHmQDLrd7uIpK4U7zK+rF+ULqG2Nxx47mQ3Y/8vz1Cx1x
	iir0PxDdDV7AeB8CLthunt6ArY9+Y6RKiseIcqBVuPkOGAyGAnDY4ajxNTFjgSLToi4RB9g1s/O9h
	V/xsYONQWZim9qKVUaRd4KmnQ7elDbY8lrohJxmutYQBQBSBgTjfxPgcopHbQil6Z0OhyggI/21jA
	Ewx3SQtvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcOaH-0001A2-Hq; Tue, 10 Nov 2020 08:00:57 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcOaF-00019J-3T
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 08:00:56 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kcOaD-0007Tj-AI; Tue, 10 Nov 2020 09:00:53 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kcOaC-0007mb-L3; Tue, 10 Nov 2020 09:00:52 +0100
Date: Tue, 10 Nov 2020 09:00:52 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Remove platform data support
Message-ID: <20201110080052.GN29830@pengutronix.de>
References: <20201110002807.7072-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110002807.7072-1-festevam@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:53:45 up 264 days, 15:24, 76 users,  load average: 0.01, 0.10,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_030055_206293_99C0C535 
X-CRM114-Status: GOOD (  25.01  )
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
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Fabio,

On Mon, Nov 09, 2020 at 09:28:07PM -0300, Fabio Estevam wrote:
> i.MX is a devicetree-only platform now and the existing platform data
> support in this driver was only useful for old non-devicetree platforms.
> 
> Get rid of the platform data support since it is no longer used.

What about

static const struct platform_device_id mxcnd_devtype[] = {
	...
};

This is unused now as well.

Also the #ifdef CONFIG_OF seem unnecessary now when it's the only way to
probe this driver.

> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/mtd/nand/raw/mxc_nand.c            | 25 +---------------------
>  include/linux/platform_data/mtd-mxc_nand.h | 19 ----------------
>  2 files changed, 1 insertion(+), 43 deletions(-)
>  delete mode 100644 include/linux/platform_data/mtd-mxc_nand.h
> 
> diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
> index 684c51e5e60d..e38c84e1c76d 100644
> --- a/drivers/mtd/nand/raw/mxc_nand.c
> +++ b/drivers/mtd/nand/raw/mxc_nand.c
> @@ -21,7 +21,6 @@
>  #include <linux/completion.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> -#include <linux/platform_data/mtd-mxc_nand.h>
>  
>  #define DRIVER_NAME "mxc_nand"
>  
> @@ -184,7 +183,6 @@ struct mxc_nand_host {
>  	unsigned int		buf_start;
>  
>  	const struct mxc_nand_devtype_data *devtype_data;
> -	struct mxc_nand_platform_data pdata;
>  };
>  
>  static const char * const part_probes[] = {
> @@ -1801,17 +1799,6 @@ static int mxcnd_probe(struct platform_device *pdev)
>  		return PTR_ERR(host->clk);
>  
>  	err = mxcnd_probe_dt(host);
> -	if (err > 0) {
> -		struct mxc_nand_platform_data *pdata =
> -					dev_get_platdata(&pdev->dev);
> -		if (pdata) {
> -			host->pdata = *pdata;
> -			host->devtype_data = (struct mxc_nand_devtype_data *)
> -						pdev->id_entry->driver_data;
> -		} else {
> -			err = -ENODEV;
> -		}
> -	}
>  	if (err < 0)
>  		return err;

mxcnd_probe_dt() can still return values > 0 in which case you should
return an error from probe. I think this code path should be cleaned up
a bit. Maybe you can inline mxcnd_probe_dt() here.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
