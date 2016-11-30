Received: from mail-db5eur01on0112.outbound.protection.outlook.com
 ([104.47.2.112] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cC80R-0005Yt-JF
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 16:45:18 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: RE: [PATCH 2/3] mtd: spi-nor: Implement die erase command logic
Date: Wed, 30 Nov 2016 16:44:40 +0000
Message-ID: <AM4PR0701MB2130740455BE1618C36E5020FE8C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
 <1477314214-17718-3-git-send-email-marcin.krzeminski@nokia.com>
 <7e94d439-114a-8827-9667-1472d3e4323a@atmel.com>
In-Reply-To: <7e94d439-114a-8827-9667-1472d3e4323a@atmel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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



> -----Original Message-----
> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> Sent: Tuesday, November 29, 2016 5:47 PM
> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
> Cc: rfsw-patches@mlist.nokia.com; dwmw2@infradead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com
> Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement die erase command logic
>=20
> Hi Marcin,
>=20
> I know you have already answered some of my questions of IRC but I ask
> them again here on the mailing list so everybody can benefit from your
> answers.
>=20
> Le 24/10/2016 =E0 15:03, marcin.krzeminski@nokia.com a =E9crit :
> > From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> >
> > This commit implements die erase logic.
> > Sector at a time procedure is moved to function, then erase algorithm
> > will try to use die erase cmd if size and address cover one or more
> > dies.
> >
>=20
> I'm reading your v2 series but indeed I try to understand the purpose of =
the
> series simply because I don't know what does die erase do as compared to
> chip erase of sector erase.
> Is you series a bug fix or an optmization, maybe both?

In current spi-nor framework when user want to erase whole flash
(eg. mtd_debug erase /dev/mtdX 0 0x8000000) framework issue chip erase cmd.
N25Q00 does not support chip erase, instead there was introduced
die erase command that can erase whole die (N25Q00 is a mulit-die NOR chip)=
.
So for this case this patch is a bug fix.
Since I have die erase command implemented it was tempting to use die erase
also in case where erase area cover one or more dies to speed up erase proc=
ess,
especially when user has enabled 4KiB sector. That is a small optimization.

I will rewrite commit message and add those informations.

Thanks,
Marcin

>=20
> Best regards,
>=20
> Cyrille
>=20
> > Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 90
> > +++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 78 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > b/drivers/mtd/spi-nor/spi-nor.c index 3afe207..17bbec0 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -360,6 +360,29 @@ static int spi_nor_erase_sector(struct spi_nor
> *nor, u32 addr)
> >  	return nor->write_reg(nor, nor->erase_opcode, buf, nor-
> >addr_width);
> > }
> >
> > +static inline int spi_nor_sector_at_time_erase(struct mtd_info *mtd,
> > +u32 addr, u32 len) {
> > +	struct spi_nor *nor =3D mtd_to_spi_nor(mtd);
> > +	int ret =3D 0;
> > +
> > +	while (len) {
> > +		write_enable(nor);
> > +
> > +		ret =3D spi_nor_erase_sector(nor, addr);
> > +		if (ret)
> > +			return ret;
> > +
> > +		addr +=3D mtd->erasesize;
> > +		len -=3D mtd->erasesize;
> > +
> > +		ret =3D spi_nor_wait_till_ready(nor);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  /*
> >   * Erase an address range on the nor chip.  The address range may exte=
nd
> >   * one or more erase sectors.  Return an error is there is a problem e=
rasing.
> > @@ -367,9 +390,11 @@ static int spi_nor_erase_sector(struct spi_nor
> > *nor, u32 addr)  static int spi_nor_erase(struct mtd_info *mtd, struct
> > erase_info *instr)  {
> >  	struct spi_nor *nor =3D mtd_to_spi_nor(mtd);
> > -	u32 addr, len;
> > +	u32 addr, len, die_no, die_size;
> >  	uint32_t rem;
> >  	int ret;
> > +	unsigned long timeout;
> > +	u8 die_erase =3D nor->die_cnt && SNOR_F_DIE_ERASE;
> >
> >  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
> >  			(long long)instr->len);
> > @@ -386,7 +411,7 @@ static int spi_nor_erase(struct mtd_info *mtd,
> struct erase_info *instr)
> >  		return ret;
> >
> >  	/* whole-chip erase? */
> > -	if (len =3D=3D mtd->size) {
> > +	if (len =3D=3D mtd->size && !die_erase) {
> >  		unsigned long timeout;
> >
> >  		write_enable(nor);
> > @@ -416,17 +441,58 @@ static int spi_nor_erase(struct mtd_info *mtd,
> > struct erase_info *instr)
> >
> >  	/* "sector"-at-a-time erase */
> >  	} else {
> > -		while (len) {
> > -			write_enable(nor);
> > -
> > -			ret =3D spi_nor_erase_sector(nor, addr);
> > -			if (ret)
> > +		if (die_erase) {
> > +			die_size =3D div_u64_rem(mtd->size, nor->die_cnt,
> &rem);
> > +			if (rem) {
> > +				ret =3D -EINVAL;
> >  				goto erase_err;
> > -
> > -			addr +=3D mtd->erasesize;
> > -			len -=3D mtd->erasesize;
> > -
> > -			ret =3D spi_nor_wait_till_ready(nor);
> > +			}
> > +			while (len) {
> > +				die_no =3D div_u64_rem(addr, die_size,
> &rem);
> > +
> > +				/* Check if address is aligned to die begin*/
> > +				if (!rem) {
> > +					/* die erase? */
> > +					if (len >=3D die_size) {
> > +						ret =3D spi_nor_die_erase(nor,
> addr);
> > +						if (ret)
> > +							goto erase_err;
> > +
> > +						len -=3D die_size;
> > +						addr +=3D die_size;
> > +
> > +						timeout =3D
> max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
> > +
> 	CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
> > +								(unsigned
> long)(die_size / SZ_2M));
> > +						ret =3D
> spi_nor_wait_till_ready_with_timeout(nor, timeout);
> > +						if (ret)
> > +							goto erase_err;
> > +					} else {
> > +						ret =3D
> spi_nor_sector_at_time_erase(mtd, addr, len);
> > +						if (ret)
> > +							goto erase_err;
> > +						len =3D 0;
> > +					}
> > +				} else {
> > +					/* check if end address cover at least
> one die */
> > +					if (div64_ul(addr + len, die_size) >
> ++die_no) {
> > +						/* align to next die */
> > +						rem =3D die_size - rem;
> > +						ret =3D
> spi_nor_sector_at_time_erase(mtd, addr, rem);
> > +						if (ret)
> > +							goto erase_err;
> > +						len -=3D rem;
> > +						addr +=3D rem;
> > +					} else {
> > +						ret =3D
> spi_nor_sector_at_time_erase(mtd, addr, len);
> > +						if (ret)
> > +							goto erase_err;
> > +						len =3D 0;
> > +					}
> > +				}
> > +			}
> > +		} else {
> > +			ret =3D spi_nor_sector_at_time_erase(mtd, addr, len);
> >  			if (ret)
> >  				goto erase_err;
> >  		}
> >
