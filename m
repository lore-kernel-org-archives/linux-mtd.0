Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a77iH-0007X1-Ay
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 20:21:18 +0000
Received: by pfbg73 with SMTP id g73so54389094pfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2015 12:20:56 -0800 (PST)
Date: Thu, 10 Dec 2015 12:20:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: support JEDEC additional redundant parameter
 pages
Message-ID: <20151210202052.GJ144338@google.com>
References: <1449268528-18154-1-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449268528-18154-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 04, 2015 at 11:35:28PM +0100, Antoine Tenart wrote:
> The JEDEC standard defines the JEDEC parameter page data structure.
> One page plus two redundant pages are always there, in bits 0-1535.
> Additionnal redundant parameter pages can be stored at bits 1536+.
> Add support to read these pages.
> 
> The first 3 JEDEC parameter pages are always checked, and if none
> is valid we try to read additional redundant pages following the
> standard definition: we continue while at least two of the four bytes
> of the parameter page signature match (stored in the first dword).
> 
> There is no limit to the number of additional redundant parameter
> page.

Hmm, do we really want this to be unbounded? What if (for example) a
driver is buggy and has some kind of wraparound, so that it keeps
returning the same parameter page (or a sequence of a few pages)?

Also, is this actually solving any real problem? Have you seen flash
that have more than the first 3 parameter pages? Have you tested
this beyond the first 3?

> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 44 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index cc74142938b0..31f4a6585703 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3392,6 +3392,32 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  	return 1;
>  }
>  
> +static int nand_flash_jedec_read_param(struct mtd_info *mtd,
> +				       struct nand_chip *chip,
> +				       struct nand_jedec_params *p)
> +{
> +	int i, match = 0;
> +	char sig[4] = "JESD";

sparse likes to complain about this:

drivers/mtd/nand/nand_base.c:3400:23: warning: too long initializer-string for array of char(no space for nul char) [sparse]

I'm not sure it has a real effect (though I haven't checked the C spec
for what happens here), because we're not really using it like a
0-terminated string, but perhaps we can do something small to squash it?
e.g., don't specify the [4], and just do this?

	char sig[] = "JESD";

> +
> +	for (i = 0; i < sizeof(*p); i++)
> +		((uint8_t *)p)[i] = chip->read_byte(mtd);
> +
> +	for (i = 0; i < 4; i++)

Maybe s/4/ARRAY_SIZE(p->sig)/ ?

Also could use a comment either here or above
nand_flash_jedec_read_param() as to what the match criteria are.

> +		if (p->sig[i] == sig[i])
> +			match++;
> +
> +	if (match < 2) {
> +		pr_warn("Invalid JEDEC page\n");
> +		return -EINVAL;
> +	}
> +
> +	if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
> +			le16_to_cpu(p->crc))
> +		return 0;
> +
> +	return -EAGAIN;
> +}
> +
>  /*
>   * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
>   */
> @@ -3400,8 +3426,7 @@ static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
>  {
>  	struct nand_jedec_params *p = &chip->jedec_params;
>  	struct jedec_ecc_info *ecc;
> -	int val;
> -	int i, j;
> +	int val, i, ret = 0;
>  
>  	/* Try JEDEC for unknown chip or LP */
>  	chip->cmdfunc(mtd, NAND_CMD_READID, 0x40, -1);
> @@ -3411,16 +3436,15 @@ static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
>  		return 0;
>  
>  	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0x40, -1);
> -	for (i = 0; i < 3; i++) {
> -		for (j = 0; j < sizeof(*p); j++)
> -			((uint8_t *)p)[j] = chip->read_byte(mtd);
> -
> -		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
> -				le16_to_cpu(p->crc))
> +	for (i = 0; i < 3; i++)
> +		if (!nand_flash_jedec_read_param(mtd, chip, p))
>  			break;
> -	}
>  
> -	if (i == 3) {
> +	/* Try reading additional parameter pages */
> +	if (i == 3)
> +		while ((ret = nand_flash_jedec_read_param(mtd, chip, p)) ==
> +				-EAGAIN);

This loop has a few problems aesthetically and functionally. As
mentioned before, the unbounded loop is not very nice. I would suggest
at least putting some kind of bound to it. Also, it's probably best not
to try so hard to cram everything into one "line". And for a rare
change, I agree with checkpatch.pl:

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#89: FILE: drivers/mtd/nand/nand_base.c:3445:
+               while ((ret = nand_flash_jedec_read_param(mtd, chip, p)) ==
+                               -EAGAIN);

In this case, I think it's saying the empty statement (;) should be on a new
line.

So, it could more clearly be something like:

	if (i == 3) {
		do {
			ret = nand_flash_jedec_read_param(mtd, chip, p);
		} while (ret == -EAGAIN);
	}

Or even better, convert to a for loop with a max # of iterations.

> +	if (ret) {
>  		pr_err("Could not find valid JEDEC parameter page; aborting\n");
>  		return 0;
>  	}

Brian
