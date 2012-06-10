Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sdgep-0003Uq-RR
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2012 11:50:12 +0000
Received: by lbbgg6 with SMTP id gg6so2588594lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 04:50:09 -0700 (PDT)
Date: Sun, 10 Jun 2012 14:50:04 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH] mtd: nand: ignore ecc errors during bbt reads
Message-ID: <20120610145004.702d24d7@pixies.home.jungo.com>
In-Reply-To: <1339093928-17545-1-git-send-email-mikedunn@newsguy.com>
References: <1339093928-17545-1-git-send-email-mikedunn@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Thu,  7 Jun 2012 11:32:08 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> Ignore ecc errors in the scan_read_raw_oob() function.  Also removed code that
> is now redundant.
> 
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
> ---
>  drivers/mtd/nand/nand_bbt.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 30d1319..585da44 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -319,7 +319,8 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
>  
>  		res = mtd_read_oob(mtd, offs, &ops);
>  
> -		if (res)
> +		/* Ignore ECC errors when checking for BBM */
> +		if (res && !mtd_is_bitflip_or_eccerr(res))
>  			return res;

IMO this is not necessary.
Note the 'ops.mode' is initialized to MTD_OPS_RAW;  meaning, no ECC is
performed during read ('ecc.read_page_raw' will be invoked).
Thus, EUCLEAN/EBADMSG should not be reported.
Am I missing something here?

> @@ -406,8 +407,7 @@ static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
>  	int ret, j;
>  
>  	ret = scan_read_raw_oob(mtd, buf, offs, readlen);
> -	/* Ignore ECC errors when checking for BBM */
> -	if (ret && !mtd_is_bitflip_or_eccerr(ret))
> +	if (ret)
>  		return ret;

Don't understand why 'mtd_is_bitflip_or_eccerr' is originally tested.
As noted above, 'scan_read_raw_oob' won't return EUCLEAN/EBADMSG, as it
uses MTD_OPS_RAW.

And what's even stranger is the code in 'scan_block_fast()', quote:

	ops.datbuf = NULL;
	ops.mode = MTD_OPS_PLACE_OOB;

	for (j = 0; j < len; j++) {
		ret = mtd_read_oob(mtd, offs, &ops);
		/* Ignore ECC errors when checking for BBM */
		if (ret && !mtd_is_bitflip_or_eccerr(ret))
			return ret;

Here, 'MTD_OPS_PLACE_OOB' is explicitly used - so *theoretically*
'mtd_read_oob' might return EUCLEAN/EBADMSG, see 'nand_do_read_oob',
(although NO driver YET reports maxbitflips from its 'chip->ecc.read_oob'
method).

Why not use 'MTD_OPS_RAW' in 'scan_block_fast()' as well (as done in
'scan_block_full')?

Regards,
Shmulik
