Return-Path: <SRS0=8YuD=3E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906D3C33CB1
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 07:46:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62A2A24655
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 07:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GuNO1TKr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62A2A24655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+Tnw3R7eR8FYNA18R+k6lkwVtrM21CXv2q7F5131L8=; b=GuNO1TKrYW7gYf
	DJKy62ySxhYXwpJY3Muu0zBIRF35w/Nb4F0eP7aLgn2pMv/KbL8q09TjBKkYJ548FktUoQtlM741U
	j9h/EfoFIodxhwrwD4T9qrZJVbaJJ7hpItTAf98dAKrO1/f3Drf7dNbNSix7OqmI7eNUch9Y7oFGw
	9UdJ086pcf4wD1wgD5vFQdtcS9UZlqvQP4WHw64eCFSKkXeN26XkpjSY1WO8cIGnY1nzJtsMaESeH
	gHqGGk5zgEHmS5fdXlsV4fhKrSSrTGmm2+BsLYm2Vkqnjl8SK5W3XXdUebNp5/AA36KHpMpp1/Glx
	jc03NMUyqD4KB4fKniUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irdNo-0002z5-Np; Wed, 15 Jan 2020 07:46:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irdNi-0002yl-Cf
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2020 07:46:30 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1irdNg-00075U-Nd; Wed, 15 Jan 2020 08:46:24 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1irdNe-0006Nu-SE; Wed, 15 Jan 2020 08:46:22 +0100
Date: Wed, 15 Jan 2020 08:46:22 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Esben Haabendal <esben@geanix.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
Message-ID: <20200115074622.cn7eh6k3mtn6tze3@pengutronix.de>
References: <20200102130826.170647-1-esben@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102130826.170647-1-esben@geanix.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:43:41 up 191 days, 13:53, 85 users,  load average: 0.35, 0.34,
 0.27
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_234626_430032_553BB7DC 
X-CRM114-Status: GOOD (  17.78  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 sean@geanix.com, martin@geanix.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Esben,

On Thu, Jan 02, 2020 at 02:08:25PM +0100, Esben Haabendal wrote:
> On system resume, the gpmi clock must be enabled before accessing gpmi
> block.  Without this, resume causes something like
> 
> [  661.348790] gpmi_reset_block(5cbb0f7e): module reset timeout
> [  661.348889] gpmi-nand 1806000.gpmi-nand: Error setting GPMI : -110
> [  661.348928] PM: dpm_run_callback(): platform_pm_resume+0x0/0x44 returns -110
> [  661.348961] PM: Device 1806000.gpmi-nand failed to resume: error -110
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 334fe3130285..7ac8c8b95afc 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -148,6 +148,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
>  	struct resources *r = &this->resources;
>  	int ret;
>  
> +	ret = pm_runtime_get_sync(this->dev);
> +	if (ret < 0)
> +		return ret;

This increases the devices usage counter...

> +
>  	ret = gpmi_reset_block(r->gpmi_regs, false);
>  	if (ret)
>  		goto err_out;
> @@ -181,6 +185,8 @@ static int gpmi_init(struct gpmi_nand_data *this)
>  
>  	return 0;

... but doesn't decrease it in the success case. This means this patch
effectively disables runtime pm. You should fall through here as fixed
in Han Xus patch.

>  err_out:
> +	pm_runtime_mark_last_busy(this->dev);
> +	pm_runtime_put_autosuspend(this->dev);
>  	return ret;

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
