Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScjwJ-0006ru-9c
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 21:08:19 +0000
Received: by eekd17 with SMTP id d17so636147eek.36
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2012 14:08:15 -0700 (PDT)
Date: Fri, 8 Jun 2012 00:07:54 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>, artem.bityutskiy@linux.intel.com
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
Message-ID: <20120608000754.6f364490@halley>
In-Reply-To: <4FD0E632.2080905@newsguy.com>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
 <1338997575.6875.72.camel@sauron.fi.intel.com>
 <20120606175507.GC17332@parrot.com>
 <1339054570.6875.84.camel@sauron.fi.intel.com>
 <4FD0E632.2080905@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Thu, 07 Jun 2012 10:34:42 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> I addition to the patch suggested by Shmulik, I would also suggest the
> following, in the interest of consistency with the bad block scanning code, and
> also thoroughness:
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 30d1319..ed59aa8 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -319,7 +319,7 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t
> *buf, loff_t offs,
> 
>                 res = mtd_read_oob(mtd, offs, &ops);
> 
> -               if (res)
> +               if (res && !mtd_is_bitflip_or_eccerr(res))
>                         return res;
> 
>                 buf += mtd->oobsize + mtd->writesize;

Saw you submitted it.

I'll review it thoroughly later on, didn't grasp it on first glance.

> Shmulik, please let me know if yuo'd like me to submit the patch you suggested,
> and I will do so promptly.  Otherwise, thanks again!

Thanks Mike.

I'll work on the patch, as I already digged further, and found two
more problematic spots where same "threshold initialization" is needed.
Obviously, your review would be much appreciated.
I'll probably submit during Friday or Sunday.

Artem, is the ETA ok with your merge plans?

Regards,
Shmulik
