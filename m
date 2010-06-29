Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OTRmW-0006dj-1u
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 03:46:44 +0000
Received: by fxm20 with SMTP id 20so1323415fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Jun 2010 20:46:41 -0700 (PDT)
Subject: Re: [RFC/PATCH] doc2000: Fix uninitialized variable in
	doc_ecc_decode()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark Ware <mware@elphinstone.net>
In-Reply-To: <4BFDCEC3.7070601@elphinstone.net>
References: <4BFDCEC3.7070601@elphinstone.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Jun 2010 06:46:37 +0300
Message-Id: <1277783197.3599.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-27 at 11:45 +1000, Mark Ware wrote:
> The variable 'syn' was being used uninitialized.  Also
> fixed incorrect use of syn[] vs s[].
> 
> Tested on powerpc board with 64MB DOC2000.
> ---
> 
> I am porting from a 2.4.18 kernel to 2.6.32, and I saw random media header
> mismatches causing a failure to detect the DOC device partitions.  Tracing
> through, I saw this variable being used uninitialized and I suspect
> incorrectly also.
> 
> I do not really understand how the ecc/syndrome code works, so I do not
> know if this patch is the correct solution, but it did make my problem
> go away...
> 
> CC: Thomas Gleixner as I believe he may have written this function initially.
> 
>  drivers/mtd/nand/diskonchip.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
> index a5bf9ff..7da2321 100644
> --- a/drivers/mtd/nand/diskonchip.c
> +++ b/drivers/mtd/nand/diskonchip.c
> @@ -145,6 +145,7 @@ static int doc_ecc_decode(struct rs_control *rs, uint8_t *data, uint8_t *ecc)
>  	uint8_t parity;
>  	uint16_t ds[4], s[5], tmp, errval[8], syn[4];
>  
> +	memset(syn, 0, sizeof(syn));

I also do not know the math of this stuff, but this change is not
needed ...

>  	/* Convert the ecc bytes into words */
>  	ds[0] = ((ecc[4] & 0xff) >> 0) | ((ecc[5] & 0x03) << 8);
>  	ds[1] = ((ecc[5] & 0xfc) >> 2) | ((ecc[2] & 0x0f) << 6);
> @@ -168,9 +169,9 @@ static int doc_ecc_decode(struct rs_control *rs, uint8_t *data, uint8_t *ecc)
>  			s[i] ^= rs->alpha_to[rs_modnn(rs, tmp + (FCR + i) * j)];
>  	}
>  
> -	/* Calc s[i] = s[i] / alpha^(v + i) */
> +	/* Calc syn[i] = s[i] / alpha^(v + i) */
>  	for (i = 0; i < NROOTS; i++) {
> -		if (syn[i])
> +		if (s[i])
>  			syn[i] = rs_modnn(rs, rs->index_of[s[i]] + (NN - FCR - i));
>  	}

... after this change, right?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
