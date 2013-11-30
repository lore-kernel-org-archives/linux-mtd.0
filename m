Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmiZz-0008Dj-Tq
 for linux-mtd@lists.infradead.org; Sat, 30 Nov 2013 11:19:20 +0000
Date: Sat, 30 Nov 2013 08:19:00 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20131130111859.GB2330@localhost>
References: <1365164021.28127.109.camel@i7.infradead.org>
 <1385500515-5376-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20131127073512.GB13929@norris.computersforpeace.net>
 <20131129122018.GB2815@localhost>
 <20131130060428.GA29397@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131130060428.GA29397@norris.computersforpeace.net>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, kernel@pengutronix.de,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 29, 2013 at 10:04:28PM -0800, Brian Norris wrote:
> Hi Ezequiel,
> 
> On Fri, Nov 29, 2013 at 09:20:19AM -0300, Ezequiel Garcia wrote:
> > On Tue, Nov 26, 2013 at 11:35:12PM -0800, Brian Norris wrote:
> > > + Pekon, Ezequiel
> > > 
> > > Can one of you see how this patch works with your BeagleBones w/ x16
> > > NAND?
> 
> I see that you are pushing to straighten out the auto-buswidth part of
> nand_base, and I think there may be good reasons to do so. But I think
> that part of your problem can be resolved by a patch like Uwe's, where
> rather than forcing the entire driver to be configured for x8 just to
> use ONFI, we can fix the ONFI operations to use the lower 8 bits.
> 
> IOW, I expect that a patch like Uwe's can shed some better light on the
> auto-buswidh situation. (This is why I CC'd you and Pekon.)
> 
> Unfortunately, I realized that Uwe's patch doesn't go far enough, I
> don't think. It looks like it needs something like the following diff
> (only compile-tested).
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index bd39f7b67906..1ab264457d94 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2933,7 +2933,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  					int *busw)
>  {
>  	struct nand_onfi_params *p = &chip->onfi_params;
> -	int i;
> +	int i, j;
>  	int val;
>  
>  	/* Try ONFI for unknown chip or LP */
> @@ -2942,18 +2942,10 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
>  		return 0;
>  
> -	/*
> -	 * ONFI must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
> -	 * with NAND_BUSWIDTH_16
> -	 */
> -	if (chip->options & NAND_BUSWIDTH_16) {
> -		pr_err("ONFI cannot be probed in 16-bit mode; aborting\n");
> -		return 0;
> -	}
> -
>  	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
>  	for (i = 0; i < 3; i++) {
> -		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> +		for (j = 0; j < sizeof(*p); j++)
> +			*(uint8_t *)p = chip->read_byte(mtd);
>  		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
>  				le16_to_cpu(p->crc)) {
>  			break;
> 
> What do you think? (And more importantly, how does this test out for
> you?)
> 

Let me try this out and let you know.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
