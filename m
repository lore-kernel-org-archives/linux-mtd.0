Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB953C43334
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Jul 2022 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIfBryzoQ+HNhOJRLSQ380ryp4mrW9oeeGwvbrPykcg=; b=0kzJ6tIo55go12
	koD8lgAS3s2P98zGuon2WokHHDz2aJmPNcG3JKA0NKxmu2rfXHDMzIScvWP8x1zO1P7oiELT3gqVc
	lqer+JIs9Ye58P/ArhzOKLfsF9dJ0nyAEmNw5EwAydBvxuJUUvOZLyOzwsFlumQuO8WSdag0cK5EL
	LnIXseU78o/eZ+ekFjRQXjLrHz4AEGHKO/qSrzomfhdyT5b+dLmG3Rjr+zLOtoo2NxoVd4jklo/Lx
	d7jYBR73bWW3JognzeYB2xfxo/ipiQ+jlRf5NopwhrOR6bskt5tqsgI2aiKGEX0oE3sHO8XJtAN6c
	/8Np5W+sG3iGjK6VIKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Co5-003pYi-QI; Fri, 01 Jul 2022 09:19:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Co0-003pVs-PZ
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2022 09:19:19 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1o7Cnu-0004C7-88; Fri, 01 Jul 2022 11:19:10 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1o7Cnt-0002O8-KE; Fri, 01 Jul 2022 11:19:09 +0200
Date: Fri, 1 Jul 2022 11:19:09 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel@pengutronix.de, stable@vger.kernel.org
Subject: Re: [PATCH] [REALLY REALLY BROKEN] mtd: rawnand: gpmi: Fix setting
 busy timeout setting
Message-ID: <20220701091909.GE2387@pengutronix.de>
References: <20220614083138.3455683-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614083138.3455683-1-s.hauer@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:46:16 up 92 days, 21:15, 82 users,  load average: 0.07, 0.08,
 0.12
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_021916_884083_3DC1E505 
X-CRM114-Status: GOOD (  35.16  )
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

On Tue, Jun 14, 2022 at 10:31:38AM +0200, Sascha Hauer wrote:
> The DEVICE_BUSY_TIMEOUT value is described in the Reference Manual as:
> 
> | Timeout waiting for NAND Ready/Busy or ATA IRQ. Used in WAIT_FOR_READY
> | mode. This value is the number of GPMI_CLK cycles multiplied by 4096.
> 
> So instead of multiplying the value in cycles with 4096, we have to
> divide it by that value. Use DIV_ROUND_UP to make sure we are on the
> safe side, especially when the calculated value in cycles is smaller
> than 4096 as typically the case.
> 
> This bug likely never triggered because any timeout != 0 usually will
> do. In my case the busy timeout in cycles was originally calculated as
> 2408, which multiplied with 4096 is 0x968000. The lower 16 bits were
> taken for the 16 bit wide register field, so the register value was
> 0x8000. With 2970bf5a32f0 ("mtd: rawnand: gpmi: fix controller timings
> setting") however the value in cycles became 2384, which multiplied
> with 4096 is 0x950000. The lower 16 bit are 0x0 now resulting in an
> intermediate timeout when reading from NAND.
> 
> Fixes: b1206122069aa ("mtd: rawnand: gpmi: use core timings instead of an empirical derivation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Just a resend with +Cc: stable@vger.kernel.org
> 
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 0b68d05846e18..889e403299568 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -890,7 +890,7 @@ static int gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
>  	hw->timing0 = BF_GPMI_TIMING0_ADDRESS_SETUP(addr_setup_cycles) |
>  		      BF_GPMI_TIMING0_DATA_HOLD(data_hold_cycles) |
>  		      BF_GPMI_TIMING0_DATA_SETUP(data_setup_cycles);
> -	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(busy_timeout_cycles * 4096);
> +	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(DIV_ROUND_UP(busy_timeout_cycles, 4096));

This patch is broken. The change itself is fine, but busy_timeout_cycles
is calculated wrong.

busy_timeout_cycles is calculated based on sdr->tR_max which is the page
read time. This timeout is also used for the page program and block
erase operations which have orders of magnitude bigger timeouts. This
means with this patch the controller times out on pages programs and
block erase operations. With the current code this timeout will be
silent as the timeout interrupt is not active.

** THIS PATCH WILL CAUSE DATA LOSS ON YOUR NAND!! **

Fortunately this patch hasn't been included in any mainline release, but
unfortunately it showed up in several stable kernels. Don't use
v5.4.202, v5.10.127, v5.15.51 or v5.18.8 on i.MX[678] or i.MX28 boards
with NAND.

I am sorry for the trouble I have likely caused. I am working on a fix
and will post it later the day.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
