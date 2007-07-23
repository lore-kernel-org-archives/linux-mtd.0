Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ICvzu-0006B3-EN
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 07:22:43 -0400
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext11.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l6NBMIZd020447
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2007 14:22:39 +0300
Subject: Re: [PATCH] [MTD] NAND: fix race in nand_base
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1185189446.25822.5.camel@sauron>
References: <1185189446.25822.5.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Mon, 23 Jul 2007 14:22:25 +0300
Message-Id: <1185189745.25822.8.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-07-23 at 14:17 +0300, Artem Bityutskiy wrote:
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 7e68203..3391b05 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -348,6 +348,8 @@ static int nand_default_block_markbad(struct mtd_info=
 *mtd, loff_t ofs)
>  	uint8_t buf[2] =3D { 0, 0 };
>  	int block, ret;
> =20
> +	nand_get_device(chip, mtd, FL_READING);
Err, this should be FL_WRITING I guess.

> +
>  	/* Get block number */
>  	block =3D (int)(ofs >> chip->bbt_erase_shift);
>  	if (chip->bbt)
> @@ -370,6 +372,8 @@ static int nand_default_block_markbad(struct mtd_info=
 *mtd, loff_t ofs)
>  	}
>  	if (!ret)
>  		mtd->ecc_stats.badblocks++;
> +
> +	nand_release_device(mtd);
>  	return ret;
>  }

There is still the problem with nand_update_bbt() which in turn calls
mtd->read() which will deadlock. I have not found how BBT is protected.
Any suggestions/pointers?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
