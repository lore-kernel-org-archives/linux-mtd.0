Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9819-0006m0-76
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 06:23:43 +0000
Message-ID: <5209D0C6.5070307@freescale.com>
Date: Tue, 13 Aug 2013 14:23:02 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: nand: silence some shift wrap warnings
References: <20130809094904.GC29282@elgon.mountain>
In-Reply-To: <20130809094904.GC29282@elgon.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Matthieu CASTET <matthieu.castet@parrot.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8809=E6=97=A5 17:49, Dan Carpenter =E5=86=
=99=E9=81=93:
> There are static checkers which complain when we declare variables as

could you tell me which "checker" and how do you test it?

you'd better post the warning message here.

thanks
Huang Shijie
> 64 bit bitfields but only use the lower 32 bits because of shift
> wrapping.  In this case "len" is declared as u64 as opposed to unsigned
> long or something which might be 32 bits.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
> index 9a48758..3eddd04 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -108,13 +108,13 @@ static int check_offs_len(struct mtd_info *mtd,
>   	int ret =3D 0;
>
>   	/* Start address must align on block boundary */
> -	if (ofs&  ((1<<  chip->phys_erase_shift) - 1)) {
> +	if (ofs&  ((1ULL<<  chip->phys_erase_shift) - 1)) {
>   		pr_debug("%s: unaligned address\n", __func__);
>   		ret =3D -EINVAL;
>   	}
>
>   	/* Length must align on block boundary */
> -	if (len&  ((1<<  chip->phys_erase_shift) - 1)) {
> +	if (len&  ((1ULL<<  chip->phys_erase_shift) - 1)) {
>   		pr_debug("%s: length not block aligned\n", __func__);
>   		ret =3D -EINVAL;
>   	}
> @@ -394,7 +394,7 @@ static int nand_block_markbad_lowlevel(struct mtd_i=
nfo *mtd, loff_t ofs)
>   		memset(&einfo, 0, sizeof(einfo));
>   		einfo.mtd =3D mtd;
>   		einfo.addr =3D ofs;
> -		einfo.len =3D 1<<  chip->phys_erase_shift;
> +		einfo.len =3D 1ULL<<  chip->phys_erase_shift;
>   		nand_erase_nand(mtd,&einfo, 0);
>
>   		/* Write bad block marker to OOB */
> @@ -2630,7 +2630,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct =
erase_info *instr,
>   		}
>
>   		/* Increment page address and decrement length */
> -		len -=3D (1<<  chip->phys_erase_shift);
> +		len -=3D (1ULL<<  chip->phys_erase_shift);
>   		page +=3D pages_per_block;
>
>   		/* Check, if we cross a chip boundary */
>
