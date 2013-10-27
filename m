Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaV75-0003VD-R3
 for linux-mtd@lists.infradead.org; Sun, 27 Oct 2013 18:31:01 +0000
From: Marek Vasut <marex@denx.de>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
Date: Sun, 27 Oct 2013 19:30:34 +0100
References: <1382693145-15750-1-git-send-email-sourav.poddar@ti.com>
 <201310271745.17152.marex@denx.de> <526D5AC8.2020703@ti.com>
In-Reply-To: <526D5AC8.2020703@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310271930.34528.marex@denx.de>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Sourav Poddar,

> Dear Marek,
> 
> On Sunday 27 October 2013 10:15 PM, Marek Vasut wrote:
> > Dear Sourav Poddar,
> > 
> > [...]

[...]

> >> @@ -774,7 +906,7 @@ static const struct spi_device_id m25p_ids[] = {
> >> 
> >>   	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> >>   	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
> >>   	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> >> 
> >> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, 0) },
> >> +	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, M25P80_QUAD_READ)
> >> },
> > 
> > I'm not convinced enabling 4-bit mode should be hard-coded in the MTD
> > driver. There might be a board which uses this chip in 1-bit mode.
> > 
> > We have a setup with Spansion chip here which uses 1-bit addressing in
> > U-Boot, but uses 4-bit addressing in Linux. We use a DT property to
> > configure the SPI bus width for that and I think that's a way to go.
> > Note that there also are chips which use 2-bit wide SPI communication.
> 
> Yes, but if you trace down the patch below, you will see its not hard
> coded. Enabling quad read mode depends on the following:
> 
> 1. Whether flash chip supports it.
>          This information comes from the flash which we are setting above.
> 
> 2. Whether SPI controller supports it.
>              This information is the check down below in the
> patch(spi->mode & SPI_RX_QUAD).
>              spi->mode is set to "SINGLE/DUAL/QUAD" in the SPI framework
> based on the
>             dt property "spi-tx/rx-bus-width".
> So, unless you set spi->mode to SPI_RX_QUAD by setting
> "spi-rx-bus-width" to 4 in dt, default
> will be 1 bit mode only.

So this M25P80_QUAD_READ flag tells us "this chip supports quad read", not 
"force enable quad read" . All right, thanks for clearing this up. I hope it's 
documented somewhere elsewhere than in this email ;-)

Best regards,
Marek Vasut
