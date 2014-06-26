Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0774-0002xY-UE
 for linux-mtd@lists.infradead.org; Thu, 26 Jun 2014 10:41:08 +0000
Date: Thu, 26 Jun 2014 03:40:44 -0700
From: Tony Lindgren <tony@atomide.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v1 1/3] ARM: dts: am335x-bone: add support for beaglebone
 NAND cape
Message-ID: <20140626104044.GJ28884@atomide.com>
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-2-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403612666-31197-2-git-send-email-pekon@ti.com>
Cc: Jason Kridner <jkridner@gmail.com>, Robert Nelson <robertcnelson@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Pekon Gupta <pekon@ti.com> [140624 05:26]:
> +
> +&gpmc {
> +	ranges = <0 0 0 0x01000000>;	/* address range = 16MB (minimum GPMC partition) */
> +	nand@0,0 {
> +		status = "disabled";
> +		reg = <0 0 4>;		/* device IO registers */

Hmm so what about other capes potentially also using GPMC CS0?

Can you please do a check with two .dtsi files trying to use
GPMC CS0 and see what the produced .dtb file looks like after
decompiling it with dtc?

I'd assume the 16MB GPMC partition will be just fine for many
devices and can be also be larger if NOR needs it so maybe it
can be handled for almost all the cases.

The names for devices must be unique though to avoid them
getting merged. And I don't know if gpmc.c skips disabled devices
properly.

Regards,

Tony
