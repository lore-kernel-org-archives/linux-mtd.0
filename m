Received: from mail-yh0-f53.google.com ([209.85.213.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0BDt-0005rk-Ug
 for linux-mtd@lists.infradead.org; Thu, 26 Jun 2014 15:04:29 +0000
Received: by mail-yh0-f53.google.com with SMTP id b6so2167818yha.40
 for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2014 08:04:02 -0700 (PDT)
Date: Thu, 26 Jun 2014 12:06:15 -0300
From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
To: Tony Lindgren <tony@atomide.com>, Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v1 1/3] ARM: dts: am335x-bone: add support for beaglebone
 NAND cape
Message-ID: <20140626150615.GA15648@fox>
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-2-git-send-email-pekon@ti.com>
 <20140626104044.GJ28884@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140626104044.GJ28884@atomide.com>
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

Hi Tony, Pekon

On Thu, Jun 26, 2014 at 03:40:44AM -0700, Tony Lindgren wrote:
> * Pekon Gupta <pekon@ti.com> [140624 05:26]:
> > +
> > +&gpmc {
> > +	ranges = <0 0 0 0x01000000>;	/* address range = 16MB (minimum GPMC partition) */
> > +	nand@0,0 {
> > +		status = "disabled";
> > +		reg = <0 0 4>;		/* device IO registers */
> 
> Hmm so what about other capes potentially also using GPMC CS0?
> 
> Can you please do a check with two .dtsi files trying to use
> GPMC CS0 and see what the produced .dtb file looks like after
> decompiling it with dtc?
> 
> I'd assume the 16MB GPMC partition will be just fine for many
> devices and can be also be larger if NOR needs it so maybe it
> can be handled for almost all the cases.
> 
> The names for devices must be unique though to avoid them
> getting merged. And I don't know if gpmc.c skips disabled devices
> properly.
It doesn't. I've just sent a patch for it.

http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/266966.html

Regards,
Guido

> 
> Regards,
> 
> Tony
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Guido Martínez, VanguardiaSur
www.vanguardiasur.com.ar
