Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeBjy-0005kA-U7
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 22:38:24 +0000
Date: Wed, 6 Nov 2013 19:38:02 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 0/1] Fix OMAP2 NAND ONFI device detection
Message-ID: <20131106223801.GA20184@localhost>
References: <1383126788-27426-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131030191414.GA16668@norris.computersforpeace.net>
 <20980858CB6D3A4BAE95CA194937D5E73EA2D41D@DBDE04.ent.ti.com>
 <20131030231956.GA2489@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA31B19@DBDE04.ent.ti.com>
 <20131106211833.GB12624@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA31BB3@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA31BB3@DBDE04.ent.ti.com>
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 06, 2013 at 10:00:09PM +0000, Gupta, Pekon wrote:
> > From: Ezequiel Garcia
> [...]
> 
> > But: on the other hand, I'd really like you to convince me as to
> > why is it so bad to require the DTB to have the proper GPMC bus width.
> > 
> No its not at all bad, all I want is either of the one way (not mixture of both).
> - Either depend on DT completely (which is current case for all drivers)
> - OR depend on ONFI and nand_flash_id[] for bus-width detection.
> 
> 
> > Once again:
> > 1. the NAND devices aren't hot-pluggable
> > 2. the "user" (who is actually an engineer, not some regular dummy user)
> > knows perfectly well the width of the device.
> > 
> > What's the problem with describing the hardware in the DT and saving us
> > lots of runtime re-configuration trouble?
> 
> I agree with both your arguments above.
> So shouldn't we kill NAND_BUSWIDTH_AUTO ?
> And probably therefore  NAND_BUSWIDTH_AUTO isn't that popular.
> 
> Now what remains is ONFI probe, which should always happen in x8 mode.
> So for that below patch should be sufficient ..
> 

Hm.. that might work. Maybe you should submit this as RFC/PATCH to catch
the attention of some more people. And we can keep discussing on this
new idea...

I should get an 8-bit module for the BBB, so this means I'll be able
to run 8-bit and 16-bit tests.

> ----------------------
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ec1db1e..d1220fb 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2942,14 +2942,8 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>                 chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
>                 return 0;
> 
> -       /*
> -        * ONFI must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
> -        * with NAND_BUSWIDTH_16
> -        */
> -       if (chip->options & NAND_BUSWIDTH_16) {
> -               pr_err("ONFI cannot be probed in 16-bit mode; aborting\n");
> -               return 0;
> -       }
> +       /* ONFI must be probed in 8-bit mode only */
> +       nand_set_defaults(chip, 0);
> 
>         chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
>         for (i = 0; i < 3; i++) {
> @@ -2962,7 +2956,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> 
>         if (i == 3) {
>                 pr_err("Could not find valid ONFI parameter page; aborting\n");
> -               return 0;
> +               goto return_error;
>         }
> 
>         /* Check version */
> @@ -2980,7 +2974,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> 
>         if (!chip->onfi_version) {
>                 pr_info("%s: unsupported ONFI version: %d\n", __func__, val);
> -               return 0;
> +               goto return_error;
>         }
> 
>         sanitize_string(p->manufacturer, sizeof(p->manufacturer));
> @@ -3033,6 +3027,12 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>         }
> 
>         return 1;
> +
> +return_error:
> +       /* revert original bus-width */
> +       nand_set_defaults( chip->options & NAND_BUSWIDTH_16);
> +       return 0;
> +
>  }
> 
>  /*
> ------------------------- 
> 
> 
> with regards, pekon

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
