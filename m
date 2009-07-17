Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRttB-0001dT-Tv
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 20:18:46 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: David Brownell <david-b@pacbell.net>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>
Date: Fri, 17 Jul 2009 15:18:14 -0500
Subject: RE: [PATCH v3 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for
	large page NAND chips
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C011E717E14@dlee02.ent.ti.com>
References: <1247781590-11323-1-git-send-email-nsnehaprabha@ti.com>
	<200907171232.53725.david-b@pacbell.net>
In-Reply-To: <200907171232.53725.david-b@pacbell.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dave,

> -----Original Message-----
> From: David Brownell [mailto:david-b@pacbell.net]
> Sent: Friday, July 17, 2009 3:33 PM
> To: davinci-linux-open-source@linux.davincidsp.com
> Cc: Narnakaje, Snehaprabha; linux-mtd@lists.infradead.org;
> dwmw2@infradead.org; tglx@linutronix.de; akpm@linux-foundation.org
> Subject: Re: [PATCH v3 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for
> large page NAND chips
>=20
> On Thursday 16 July 2009, nsnehaprabha@ti.com wrote:
> > 	It also fixes a bug in the ECC correction handler.
> > When we introduce 5 bit-errors in chunk, error correction stops working=
.
> When
> > errors are detected the 4BITECC_START bit was left high, which should b=
e
> > cleared.
>=20
> Agreed that needs to be fixed, but there should be a comment
> about this being an *undocumented* behavior in the hardware.
>=20
> The reason that the bug exists at all is because this step
> has never been documented.  So, please roll in this update.

How about, we get the documents updated for this missing step.

Thanks
Sneha

>=20
> - Dave
>=20
> ---
>  drivers/mtd/nand/davinci_nand.c |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -350,13 +350,16 @@ compare:
>=20
>  	/*
>  	 * Clear any previous address calculation by doing a dummy read of
> an
> -	 * error address register.
> +	 * error address register.  UNDOCUMENTED that the ECC engine won't
> +	 * recover after 5-bit ECC errors without this step.
>  	 */
>  	davinci_nand_readl(info, NAND_ERR_ADD1_OFFSET);
>=20
>  	/* Start address calculation, and wait for it to complete.
>  	 * We _could_ start reading more data while this is working,
> -	 * to speed up the overall page read.
> +	 * to speed up the overall page read.  UNDOCUMENTED that
> +	 * reading some ERRVAL register is needed in all cases, not
> +	 * just when an error must be corrected.
>  	 */
>  	davinci_nand_writel(info, NANDFCR_OFFSET,
>  			davinci_nand_readl(info, NANDFCR_OFFSET) | BIT(13));
