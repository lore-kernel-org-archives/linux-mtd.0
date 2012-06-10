Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdcGc-0003yi-GY
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2012 07:08:55 +0000
Received: by lbbgg6 with SMTP id gg6so2525088lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 00:08:51 -0700 (PDT)
Date: Sun, 10 Jun 2012 10:08:39 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
Message-ID: <20120610100839.1f0ff1fe@pixies.home.jungo.com>
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
Cc: artem.bityutskiy@linux.intel.com, Ivan Djelic <ivan.djelic@parrot.com>,
 dwmw2@infradead.org,
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

Hi,

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

While I'm trying to figure out the issue this patch adresses, I found
out we have an inconsistent API, WRT reporting -EUCLEAN.

The 'mtd_read()' API is currently responsible for returning EUCLEAN,
after examining return value of the 'mtd->_read()' method, quote:

	ret_code = mtd->_read(mtd, from, len, retlen, buf);
	if (unlikely(ret_code < 0))
		return ret_code;
	if (mtd->ecc_strength == 0)
		return 0;	/* device lacks ecc */
	return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;

However, 'mtd_read_oob()' does NOT have the 'ret_code >= bitflip_threshold'
comparison, quote:

static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
			       struct mtd_oob_ops *ops)
{
	ops->retlen = ops->oobretlen = 0;
	if (!mtd->_read_oob)
		return -EOPNOTSUPP;
	return mtd->_read_oob(mtd, from, ops);
}

Meaning, 'mtd_read_oob()' returns the direct result of the '_read_oob'
call to the MTD user.

Now let's examine what '_read_oob' returns in the nand case, implemented
in 'nand_read_oob'; There are 2 possible uses of 'mtd_read_oob':

1. Supplying NULL 'ops->datbuf', to indicate only the OOB needs to be
   read.
   Execution goes into 'nand_do_read_oob()', which may return EUCLEAN
   (independently of the bitflip_threshold).
   OK. This was discussed in [1].

2. Supplying a non-null 'ops->datbuf', to indicate read the page content
   along with its OOB.
   Execution goes into 'nand_do_read_ops', which returns max_bitflips.
   Not OK.

To summarize, return value of the 'mtd_read_oob()' API is
inconsistent (sometimes max_bitflips, other times EUCLEAN), and does not
adhere to return code policy of 'mtd_read()' - return EUCLEAN to the users,
they're not interested with internals such as max_bitflips.

This might affect users of 'mtd_read_oob()' which might falsely think
the OOB read has failed.

Mike, care to take a look and amend if necessary?
I think this needs to be fixed pre v3.5 as well.

Regards,
Shmulik

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-May/041407.html
