From: "Xu, Hong" <Hong.Xu@atmel.com>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: RE: [PATCH v4 2/2] MTD: AT91: Update atmel_nand_data to support PMECC
Date: Fri, 20 Apr 2012 09:24:27 +0000
Message-ID: <A92DB5DF46DBC241980A99BFD8A00AEE0F62D6EE@penmbx01>
References: <1334906788-18704-1-git-send-email-hong.xu@atmel.com>
 <1334906788-18704-2-git-send-email-hong.xu@atmel.com>
 <20120420082729.GY16641@game.jcrosoft.org>
In-Reply-To: <20120420082729.GY16641@game.jcrosoft.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Jean-Christophe PLAGNIOL-VILLARD [mailto:plagnioj@jcrosoft.com]
> Sent: Friday, April 20, 2012 4:27 PM
> To: Xu, Hong
> Cc: linux-mtd@lists.infradead.org; linux-arm-kernel@lists.infradead.org;
> dedekind1@gmail.com; Ferre, Nicolas
> Subject: Re: [PATCH v4 2/2] MTD: AT91: Update atmel_nand_data to support =
PMECC
>=20
> On 15:26 Fri 20 Apr     , Hong Xu wrote:
> > Added two items,
> > * correction_cap: PMECC correction capability
> > * sector_size:    Sector size for PMECC
> >
> > Signed-off-by: Hong Xu <hong.xu@atmel.com>
> > ---
> >  include/linux/platform_data/atmel.h |    2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/linux/platform_data/atmel.h
> b/include/linux/platform_data/atmel.h
> > index b0f2c56..4d9bfd5 100644
> > --- a/include/linux/platform_data/atmel.h
> > +++ b/include/linux/platform_data/atmel.h
> > @@ -20,6 +20,8 @@ struct atmel_nand_data {
> >  	u8		bus_width_16;		/* buswidth is 16 bit */
> >  	u8		ecc_mode;		/* ecc mode */
> >  	u8		on_flash_bbt;		/* bbt on flash */
> > +	u8		correction_cap;		/* PMECC capability */
> > +	u16		sector_size;		/* Sector size for PMECC */
> as this only used by DT
> no need to expose it
>=20

OK, we could put those into struct Atmel_nand_host. But this means PMECC wi=
ll totally rely on DT.

BR,
Eric

> Best Regards,
> J.
