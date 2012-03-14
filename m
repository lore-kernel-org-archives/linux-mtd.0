Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7m1i-0001ME-Q4
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 11:05:55 +0000
Received: by wibhj13 with SMTP id hj13so1786638wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2012 04:05:52 -0700 (PDT)
Date: Wed, 14 Mar 2012 13:05:43 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
Message-ID: <20120314130543.3ceacacc@pixies.home.jungo.com>
In-Reply-To: <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 11 Mar 2012 14:21:13 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> -	return mtd->_read(mtd, from, len, retlen, buf);
> +
> +	/*
> +	 * In the absence of an error, drivers return a non-negative integer
> +	 * representing the maximum number of bitflips that were corrected on
> +	 * any one writesize region (typically a NAND page).
> +	 */
> +	ret_code =3D mtd->_read(mtd, from, len, retlen, buf);

Maybe better for the remark to reside in mtd.h near '_read' definition?

> +	if (unlikely(ret_code < 0))
> +		return ret_code;
> +
> +	return ret_code >=3D mtd->euclean_threshold ? -EUCLEAN : 0;

I'm a bit confused here.
=46rom former patches, you state:

> The element 'euclean_threshold' is added to struct mtd_info.  If the driv=
er
> leaves this uninitialized, mtd sets it to ecc_strength when the device or
> partition is registered.=20

and:

> Flash device drivers initialize 'ecc_strength' in struct mtd_info, which =
is the
> maximum number of bit errors that can be corrected in one writesize regio=
n.

So I conclude that by default 'euclean_threshold' is equivalent to
"maximum number of bit errors that can be corrected in one writesize".

Now, lets go back to the "ret_code >=3D mtd->euclean_threshold" condition.

I suspect that in the default case, we'll never reach that condition.

Suppose the read introduced 'euclean_threshold' (well, 'ecc_strength')
bit errors; according to defintion of 'ecc_strength', it actually means
an uncorrectable error.
And as such, it is reported by the driver by incrementing
'ecc_stats.failed', and by the nand infrastructure as -EBADMSG.
So we'll hit the "unlikely(ret_code < 0)" case, and not the
"ret_code >=3D mtd->euclean_threshold" condition.

Conclusion:
As long as 'euclean_threshold' is kept to its default and not tweaked by
the sysfs knob, MTD system no longer reports -EUCLEAN.

Was that the intention? Did I miss something here?

>  /*
>   * Method to access the protection register area, present in some flash
>   * devices. The user data is one time programmable but the factory data =
is read
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 9651c06..24022ce 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -67,12 +67,12 @@ static int part_read(struct mtd_info *mtd, loff_t fro=
m, size_t len,
>  	stats =3D part->master->ecc_stats;
>  	res =3D part->master->_read(part->master, from + part->offset, len,
>  				  retlen, buf);
> -	if (unlikely(res)) {
> -		if (mtd_is_bitflip(res))
> -			mtd->ecc_stats.corrected +=3D part->master->ecc_stats.corrected - sta=
ts.corrected;
> -		if (mtd_is_eccerr(res))
> -			mtd->ecc_stats.failed +=3D part->master->ecc_stats.failed - stats.fai=
led;
> -	}
> +	if (unlikely(mtd_is_eccerr(res)))
> +		mtd->ecc_stats.failed +=3D
> +			part->master->ecc_stats.failed - stats.failed;
> +	else
> +		mtd->ecc_stats.corrected +=3D
> +			part->master->ecc_stats.corrected - stats.corrected;

Is there a reason to execute the "else" part ('corrected' increment) in
case 'res' is negative?

> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8008853..e2bf003 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1594,7 +1600,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, l=
off_t from,
>  	if (mtd->ecc_stats.failed - stats.failed)
>  		return -EBADMSG;
> =20
> -	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
> +	return max_bitflips;
>  }

Two lines eralier we have:
	if (ret)
		return ret;

where 'ret' is assigned to the return value of
read_page/read_page_raw/read_subpage calls.
Meaning, your new code rely on these calls to never return a positive
value, otherwise the 'read' wrapper might mistakenly identify these
as max bitflips.
This is a reasonable assumption. Would be nice if it can be enforced.
(BTW I looked on many implementations, all return 0...)

Regards,
Shmulik
