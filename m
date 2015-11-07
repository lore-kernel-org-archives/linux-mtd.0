Received: from mail-bn1on0063.outbound.protection.outlook.com ([157.56.110.63]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zv0Tw-0004do-FT
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2015 10:12:25 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "markmarshall14@gmail.com" <markmarshall14@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: Add locking to
 cfi_cmdset_001:do_getlockstatus_oneblock
Date: Sat, 7 Nov 2015 10:11:39 +0000
Message-ID: <1446891117.21216.223.camel@infinera.com>
References: <563CAFD7.7060803@gmail.com>
In-Reply-To: <563CAFD7.7060803@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <2B47CBCDD8B6B64CA42F816EEFA2438C@infinera.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-11-06 at 14:49 +0100, Mark Marshall wrote:
> The function (do_getlockstatus_oneblock) switches the flash out of
> array-read mode and into query mode.  It should not run in parallel to
> another function that uses array-read mode.  We therefore need to
> acquire the chip mutex and call get_chip(..., FL_JEDEC_QUERY).
>=20
Hmm, this mail has NL breaks in it for long lines and won't apply.
Is it on my end or yours?

>  drivers/mtd/chips/cfi_cmdset_0001.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c
> b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 286b97a..d675efb 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -2051,13 +2051,32 @@ static int __xipram
> do_getlockstatus_oneblock(struct map_info *map,
>  {
>  > 	> struct cfi_private *cfi =3D map->fldrv_priv;
>  > 	> int status, ofs_factor =3D cfi->interleave * cfi->device_type;
> +> 	> int ret;
>=20
>  > 	> adr +=3D chip->start;
> +
> +> 	> mutex_lock(&chip->mutex);
> +> 	> ret =3D get_chip(map, chip, adr, FL_JEDEC_QUERY);
> +> 	> if (ret) {
> +> 	> 	> mutex_unlock(&chip->mutex);
> +> 	> 	> return ret;
> +> 	> }
> +
> +> 	> /* let's ensure we're not reading back cached data from array mode =
*/
> +> 	> INVALIDATE_CACHED_RANGE(map, adr+(2*ofs_factor), 1);
> +
>  > 	> xip_disable(map, chip, adr+(2*ofs_factor));
>  > 	> map_write(map, CMD(0x90), adr+(2*ofs_factor));
>  > 	> chip->state =3D FL_JEDEC_QUERY;
>  > 	> status =3D cfi_read_query(map, adr+(2*ofs_factor));
>  > 	> xip_enable(map, chip, 0);
> +
> +> 	> /* then ensure we don't keep query data in the cache */
> +> 	> INVALIDATE_CACHED_RANGE(map, adr+(2*ofs_factor), 1);
> +
> +> 	> put_chip(map, chip, adr);
> +> 	> mutex_unlock(&chip->mutex);
> +
>  > 	> return status;
>  }
>=20
