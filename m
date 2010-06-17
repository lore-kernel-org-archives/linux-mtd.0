Received: from bld-mail12.adl6.internode.on.net ([150.101.137.97]
	helo=mail.internode.on.net)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OP6xn-0006AO-9q
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2010 04:44:28 +0000
Received: from [192.168.1.8] (unverified [118.209.113.54])
	by mail.internode.on.net (SurgeMail 3.8f2) with ESMTP id
	28232051-1927428 for <linux-mtd@lists.infradead.org>;
	Thu, 17 Jun 2010 14:14:20 +0930 (CST)
Message-ID: <4C19A823.4080804@elphinstone.net>
Date: Thu, 17 Jun 2010 14:44:19 +1000
From: Mark Ware <mware@elphinstone.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH] doc2000: Fix uninitialized variable in
	doc_ecc_decode()
References: <4BFDCEC3.7070601@elphinstone.net>
In-Reply-To: <4BFDCEC3.7070601@elphinstone.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No comments?
I know DOC2000 is pretty old now, but somebody must remember them!

Regards,
Mark

Mark Ware wrote:
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
>  	/* Call the decoder library */
