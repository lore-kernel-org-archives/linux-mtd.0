Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WiQP3-00039V-8p
 for linux-mtd@lists.infradead.org; Thu, 08 May 2014 15:38:33 +0000
Received: by mail-pa0-f46.google.com with SMTP id kx10so2974007pab.19
 for <linux-mtd@lists.infradead.org>; Thu, 08 May 2014 08:38:10 -0700 (PDT)
Date: Thu, 8 May 2014 23:37:58 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Subject: Re: imx6 NAND chip selects
Message-ID: <20140508153756.GA2572@localhost.localdomain>
References: <536A5FEE.9090705@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536A5FEE.9090705@hugovil.com>
Cc: b32955@freescale.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 07, 2014 at 12:31:42PM -0400, Hugo Villeneuve wrote:
> Hi,
> I am trying to connect a NAND flash device (Micron MT29F8G08) to a
> Wandboard Dual.
> 
> Here is the pin mapping:
> 
> i.MX6             NAND flash
> ----------------------------
> NANDF_CS0    -->  CE#
> NANDF_RB0    -->  R/B#
> NANDF_WP_B   -->  WP#
> NANDF_CLE    -->  CLE
> NANDF_ALE    -->  ALE
> NANDF_WE     -->  WE#
> NANDF_RE     -->  RE#
> NANDF_D[0-7] -->  I/O[0-7]
> 
> This NAND flash has a single chip-select.
> 
> I'm testing it using Linux kernel 3.15.0-rc3.
> 
> In the wandboard device tree file, I have added all the above gpmi
> pins as GPMI pins.
> 
> I am still booting from the SD card, so at this point I am only
> trying to detect the NAND device. Unfortunately, when the kernel
> boots, the GPMI driver fails to register (error -19).
> 
> If I monitor the NANDF_CS0 line, I can see that it is pulsed low,
> but I am not seing any activity on the NANDF_WE line.
> 
> However, If I monitor the NANDF_CS1 line, I can see that it is
> pulsed low, and during the time it is low the NANDF_WE line is also
> going low.
> 
> I then made sure to reconfigure the unused pins NANDF_CS[1-3] as
> GPIOs (ALT5 function) in my device tree file. I have confirmed with
> kernel debug traces that the iomux register for NANDF_CS1 have the
> value 0x05, which means ALT5 function (GPIO). But I am still seeing
> the same behavior as before on the oscilloscope.
> 
> So how can I configure the GPMI driver to only use NANDF_CS0 and not
> NANDF_CS1?
> 
> And is it normal that NANDF_CS1 is still used by the GPMI driver
> when configured as GPIO?
It is not normal at all.

Please disable the GPIO pinctrl, and only enable the pinctrl for gpmi
and try again.

I am sure that you did not configure the PADs correctly.

thanks
Huang Shijie
