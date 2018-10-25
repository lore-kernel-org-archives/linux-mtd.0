Received: from mail1.bemta24.messagelabs.com ([67.219.250.115])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFibi-0006xM-CR
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2018 16:37:38 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: Fabio Bettoni <fbettoni@gmail.com>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2 05/10] mtd: cfi_cmdset_0002: Split do_write_oneword()
 to reduce function size
Date: Thu, 25 Oct 2018 16:35:17 +0000
Message-ID: <TYAPR01MB21758DC32A309C52A7A7DFFEDCF70@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
 <20181019165526.11159-6-ikegami@allied-telesis.co.jp>
 <5d77ea55e2504e5ca7e22e21fc8b7358@svr-chch-ex1.atlnz.lc>
In-Reply-To: <5d77ea55e2504e5ca7e22e21fc8b7358@svr-chch-ex1.atlnz.lc>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
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

Hi Chris-san,

Thank you so much for your reviewing and comments.

Regards,
Ikegami

> -----Original Message-----
> From: Chris Packham [mailto:Chris.Packham@alliedtelesis.co.nz]
> Sent: Thursday, October 25, 2018 6:11 AM
> To: IKEGAMI Tokunori; boris.brezillon@free-electrons.com
> Cc: Fabio Bettoni; Joakim Tjernlund; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH v2 05/10] mtd: cfi_cmdset_0002: Split
> do_write_oneword() to reduce function size
>=20
> Hi Ikegami-san,
>=20
> On 20/10/18 5:55 AM, Tokunori Ikegami wrote:
> > The function is longer so add do_write_oneword_once() to split.
> > This is also for to reduce goto statement by additional patch.
>=20
> I think the following would be easier to understand.
>=20
> "Reduce the size of do_write_oneword() by extracting a helper function
> for the hardware access."

[Ikegami] Just fixed as this.

>=20
> With that change
>=20
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

[Ikegami] Added the Reviewed-by tag.

>=20
> >
> > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > Cc: Fabio Bettoni <fbettoni@gmail.com>
> > Co: Hauke Mehrtens <hauke@hauke-m.de>
> > Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: linux-mtd@lists.infradead.org
> > ---
> > Changes since v1:
> > - Add the patch.
> >
> >   drivers/mtd/chips/cfi_cmdset_0002.c | 89
> ++++++++++++++++-------------
> >   1 file changed, 50 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index a3fa2d7b1ba0..ae2d8bd7154e 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1547,11 +1547,10 @@ static int cfi_amdstd_lock_user_prot_reg(struct
> mtd_info *mtd, loff_t from,
> >   				   do_otp_lock, 1);
> >   }
> >
> > -static int __xipram do_write_oneword(struct map_info *map, struct flch=
ip
> *chip,
> > -				     unsigned long adr, map_word datum,
> > -				     int mode)
> > +static int __xipram do_write_oneword_once(struct map_info *map, struct
> flchip *chip,
> > +					  unsigned long adr, map_word
> datum,
> > +					  int mode, struct cfi_private
> *cfi)
>=20
> No particular objections to the name (i.e. don't change it unless the
> maintainer insists) but often these kinds of helpers are just prefixed
> with '_' (e.g. _do_write_oneword).

[Ikegami] I see about this.

>=20
> >   {
> > -	struct cfi_private *cfi =3D map->fldrv_priv;
> >   	unsigned long timeo =3D jiffies + HZ;
> >   	/*
> >   	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
> > @@ -1564,42 +1563,7 @@ static int __xipram do_write_oneword(struct
> map_info *map, struct flchip *chip,
> >   	 */
> >   	unsigned long uWriteTimeout =3D (HZ / 1000) + 1;
> >   	int ret =3D 0;
> > -	map_word oldd;
> > -	int retry_cnt =3D 0;
> > -
> > -	adr +=3D chip->start;
> > -
> > -	mutex_lock(&chip->mutex);
> > -	ret =3D get_chip(map, chip, adr, mode);
> > -	if (ret) {
> > -		mutex_unlock(&chip->mutex);
> > -		return ret;
> > -	}
> >
> > -	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
> > -		 __func__, adr, datum.x[0]);
> > -
> > -	if (mode =3D=3D FL_OTP_WRITE)
> > -		otp_enter(map, chip, adr, map_bankwidth(map));
> > -
> > -	/*
> > -	 * Check for a NOP for the case when the datum to write is already
> > -	 * present - it saves time and works around buggy chips that corrupt
> > -	 * data at other locations when 0xff is written to a location that
> > -	 * already contains 0xff.
> > -	 */
> > -	oldd =3D map_read(map, adr);
> > -	if (map_word_equal(map, oldd, datum)) {
> > -		pr_debug("MTD %s(): NOP\n",
> > -		       __func__);
> > -		goto op_done;
> > -	}
> > -
> > -	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
> > -	ENABLE_VPP(map);
> > -	xip_disable(map, chip, adr);
> > -
> > - retry:
> >   	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> cfi->device_type, NULL);
> >   	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> cfi->device_type, NULL);
> >   	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi,
> cfi->device_type, NULL);
> > @@ -1642,6 +1606,53 @@ static int __xipram do_write_oneword(struct
> map_info *map, struct flchip *chip,
> >   		UDELAY(map, chip, adr, 1);
> >   	}
> >
> > +	return ret;
> > +}
> > +
> > +static int __xipram do_write_oneword(struct map_info *map, struct flch=
ip
> *chip,
> > +				     unsigned long adr, map_word datum,
> > +				     int mode)
> > +{
> > +	struct cfi_private *cfi =3D map->fldrv_priv;
> > +	int ret =3D 0;
> > +	map_word oldd;
> > +	int retry_cnt =3D 0;
> > +
> > +	adr +=3D chip->start;
> > +
> > +	mutex_lock(&chip->mutex);
> > +	ret =3D get_chip(map, chip, adr, mode);
> > +	if (ret) {
> > +		mutex_unlock(&chip->mutex);
> > +		return ret;
> > +	}
> > +
> > +	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
> > +		 __func__, adr, datum.x[0]);
> > +
> > +	if (mode =3D=3D FL_OTP_WRITE)
> > +		otp_enter(map, chip, adr, map_bankwidth(map));
> > +
> > +	/*
> > +	 * Check for a NOP for the case when the datum to write is already
> > +	 * present - it saves time and works around buggy chips that corrupt
> > +	 * data at other locations when 0xff is written to a location that
> > +	 * already contains 0xff.
> > +	 */
> > +	oldd =3D map_read(map, adr);
> > +	if (map_word_equal(map, oldd, datum)) {
> > +		pr_debug("MTD %s(): NOP\n",
> > +		       __func__);
> > +		goto op_done;
> > +	}
> > +
> > +	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
> > +	ENABLE_VPP(map);
> > +	xip_disable(map, chip, adr);
> > +
> > + retry:
> > +	ret =3D do_write_oneword_once(map, chip, adr, datum, mode, cfi);
> > +
> >   	/* Did we succeed? */
> >   	if (ret) {
> >   		/* reset on all failures. */
> >
