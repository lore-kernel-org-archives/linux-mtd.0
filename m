Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHPJO-0000SY-MD
 for linux-mtd@lists.infradead.org; Sat, 12 May 2018 07:51:29 +0000
Date: Sat, 12 May 2018 09:51:02 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Hauke Mehrtens <hauke@hauke-m.de>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: bcm47xxpart: improve handling TRX partition size
Message-ID: <20180512095102.58a053b9@bbrezillon>
In-Reply-To: <20180412052452.11498-1-zajec5@gmail.com>
References: <20180412052452.11498-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 12 Apr 2018 07:24:52 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> When bcm47xxpart finds a TRX partition (container) it's supposed to jump
> to the end of it and keep looking for more partitions. TRX and its
> subpartitions are handled be a separated parser.

			    ^ by a separate parser.

No need to send a new version, I'll fix it when applying.

>=20
> The problem with old code was relying on the length specified in a TRX
> header. That isn't reliable as TRX is commonly modified to have checksum
> cover only non-changing subpartitions. Otherwise modifying e.g. a rootfs
> would result in CRC32 mismatch and bootloader refusing to boot a
> firmware.
>=20
> Fix it by trying better to figure out a real TRX size. We can securely
> assume that TRX has to cover all subpartitions and the last one is at
> least of a block size in size. Then compare it with a length field.
>=20
> This makes code more optimal & reliable thanks to skipping data that
> shouldn't be parsed.

I didn't check the TRX parsing logic, so I'm assuming you know what you
do here and you've tested the modifications ;-).

>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  drivers/mtd/bcm47xxpart.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index fe2581d9d882..1f0239848ebe 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -186,6 +186,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>  		/* TRX */
>  		if (buf[0x000 / 4] =3D=3D TRX_MAGIC) {
>  			struct trx_header *trx;
> +			uint32_t last_subpart;
> +			uint32_t trx_size;
> =20
>  			if (trx_num >=3D ARRAY_SIZE(trx_parts))
>  				pr_warn("No enough space to store another TRX found at 0x%X\n",
> @@ -195,11 +197,23 @@ static int bcm47xxpart_parse(struct mtd_info *maste=
r,
>  			bcm47xxpart_add_part(&parts[curr_part++], "firmware",
>  					     offset, 0);
> =20
> -			/* Jump to the end of TRX */
> +			/*
> +			 * Try to find TRX size. The "length" field isn't fully
> +			 * reliable as it could be decreased to make CRC32 cover
> +			 * only part of TRX data. It's commonly used as checksum
> +			 * can't cover e.g. ever-changing rootfs partition.
> +			 * Use offsets as helpers for assuming min TRX size.
> +			 */
>  			trx =3D (struct trx_header *)buf;
> -			offset =3D roundup(offset + trx->length, blocksize);
> -			/* Next loop iteration will increase the offset */
> -			offset -=3D blocksize;
> +			last_subpart =3D max3(trx->offset[0], trx->offset[1],
> +					    trx->offset[2]);
> +			trx_size =3D max(trx->length, last_subpart + blocksize);
> +
> +			/*
> +			 * Skip the TRX data. Decrease offset by block size as
> +			 * the next loop iteration will increase it.
> +			 */
> +			offset +=3D roundup(trx_size, blocksize) - blocksize;
>  			continue;
>  		}
> =20
