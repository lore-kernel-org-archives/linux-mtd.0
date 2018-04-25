Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBK19-0004qB-Ae
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 12:59:37 +0000
Date: Wed, 25 Apr 2018 14:59:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 8/9] mtd: nand: qcom: helper function for raw read
Message-ID: <20180425145905.219b6faf@xps13>
In-Reply-To: <892130678772dca7116bd8dcdcb3cc44@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-9-git-send-email-absahu@codeaurora.org>
 <20180410114428.68d59c8d@xps13>
 <c3e32eb24408a973d0c89984a466d9da@codeaurora.org>
 <20180422181929.65d42ca8@xps13>
 <484485e160af41cf062549938c53d078@codeaurora.org>
 <20180423085817.74e56091@xps13>
 <892130678772dca7116bd8dcdcb3cc44@codeaurora.org>
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

Hi Abhishek,

On Wed, 25 Apr 2018 12:02:29 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-04-23 12:28, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > On Mon, 23 Apr 2018 11:58:42 +0530, Abhishek Sahu =20
> > <absahu@codeaurora.org> wrote: =20
> > >> On 2018-04-22 21:49, Miquel Raynal wrote:
> >> > Hi Abhishek, =20
> >> > > On Thu, 12 Apr 2018 12:36:42 +0530, Abhishek Sahu =20
> >> > <absahu@codeaurora.org> wrote: =20
> >> > >> On 2018-04-10 15:14, Miquel Raynal wrote:
> >> >> > Hi Abhishek, =20
> >> >> > > On Wed,  4 Apr 2018 18:12:24 +0530, Abhishek Sahu =20
> >> >> > <absahu@codeaurora.org> wrote: =20
> >> >> > >> This patch does minor code reorganization for raw reads. =20
> >> >> >> Currently the raw read is required for complete page but for
> >> >> >> subsequent patches related with erased codeword bit flips
> >> >> >> detection, only few CW should be read. So, this patch adds
> >> >> >> helper function and introduces the read CW bitmask which
> >> >> >> specifies which CW reads are required in complete page.
> >> >> > > I am not sure this is the right approach for subpage reads. If =
the =20
> >> >> > controller supports it, you should just enable it in chip->option=
s.
> >> >> > =20
> >> >>   Thanks Miquel. =20
> >> >> >>   It is internal to this file only. This patch makes one static =
helper =20
> >> >>   function which provides the support to read subpages.
> >> > > Drivers should expose raw helpers, why keeping this helper static =
then? =20
> >> > >> >> >> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org> =20
> >> >> >> ---
> >> >> >>  drivers/mtd/nand/qcom_nandc.c | 186 >> ++++++++++++++++++++++++=
+-----------------
> >> >> >>  1 file changed, 110 insertions(+), 76 deletions(-) =20
> >> >> >> >> diff --git a/drivers/mtd/nand/qcom_nandc.c >> b/drivers/mtd/n=
and/qcom_nandc.c =20
> >> >> >> index 40c790e..f5d1fa4 100644
> >> >> >> --- a/drivers/mtd/nand/qcom_nandc.c
> >> >> >> +++ b/drivers/mtd/nand/qcom_nandc.c
> >> >> >> @@ -1590,6 +1590,114 @@ static int check_flash_errors(struct >> =
qcom_nand_host *host, int cw_cnt)
> >> >> >>  } =20
> >> >> >> >>  /* =20
> >> >> >> + * Helper to perform the page raw read operation. The read_cw_m=
ask >> will be
> >> >> >> + * used to specify the codewords for which the data should be r=
ead. >> The
> >> >> >> + * single page contains multiple CW. Sometime, only few CW data=
 is >> required
> >> >> >> + * in complete page. Also, start address will be determined with
> >> >> >> + * this CW mask to skip unnecessary data copy from NAND flash d=
evice. >> Then,
> >> >> >> + * actual data copy from NAND controller to data buffer will be=
 done >> only
> >> >> >> + * for the CWs which have the mask set.
> >> >> >> + */
> >> >> >> +static int
> >> >> >> +nandc_read_page_raw(struct mtd_info *mtd, struct nand_chip *chi=
p,
> >> >> >> +		    u8 *data_buf, u8 *oob_buf,
> >> >> >> +		    int page, unsigned long read_cw_mask)
> >> >> >> +{ =20
>=20
>   <snip>
>=20
> >> >> >> -	free_descs(nandc);
> >> >> >> -
> >> >> >> -	if (!ret)
> >> >> >> -		ret =3D check_flash_errors(host, ecc->steps);
> >> >> >> -
> >> >> >> -	return 0;
> >> >> >> +	return nandc_read_page_raw(mtd, chip, buf, chip->oob_poi, page,
> >> >> >> +				   BIT(chip->ecc.steps) - 1);
> >> >> > > I don't understand this. chip->ecc.steps is constant, right? So=
 you =20
> >> >> > always ask for the same subpage? =20
> >> >> >>   We need to do raw read for subpages in which we got uncorrecta=
ble =20
> >> >>   error in next patch for erased page bitflip detection. This patch=
 >> does
> >> >>   reorganization of raw read and moves common code in helper functi=
on
> >> >>   nandc_read_page_raw. =20
> >> >> >>   For nomral raw read, all the subpages will be read so =20
> >> >>   BIT(chip->ecc.steps) - 1 is used for qcom_nandc_read_page_raw. =20
> >> >> >>   While for erased page raw read, only those sub pages will be =
=20
> >> >>   read for which the controller gives the uncorrectable error.
> >> > > Still not okay: the driver should expose a way to do raw reads no =
=20
> >> > matter the length and the start and you should use that in a generic
> >> > way.
> >> > =20
> >>   Thanks Miquel.
> >>   I will explore regarding that.
> >>   Looks like, we can some helper like read_subpage.
> > > Of course, when you implement raw accessors you can have static helpe=
rs =20
> > to clarify the code.
> >  =20
>   Hi Miquel,
>=20
>   I checked regarding generic function.
>=20
>   Normally the other NAND controller stores the data in main area
>   and ecc bytes in oob area. So if page size is 2048+64 then 2048
>   data bytes will go in main area followed by ECC bytes
>=20
>   Main                 |        OOB
>   ------------------------------------
>   D1 D2...........D2048|E1..........E64
>=20
>   The QCOM nand contoller follows different layout in which this
>   2048+64 is internally divided in 528 bytes codeword so it will
>   come to 4 codewords. Each codeword contains 516 bytes followed
>   by ECC parity bytes. Also in at 0x1f0 offset in each CW, the bad
>   block marker is stored. so each CW contains badblock marker also.
>   The avilable OOB bytes are 16 which is also protected by ECC.
>=20
>   516 * 4 =3D 2048 data bytes + 16 available oob bytes.
>=20
>   So for QCOM layout, it will be something lile
>=20
>=20
>   0       D1.........D495 B1 D496....D516 E1...E7  U1..U4
>   0x210   D517......D1012 B2 D1016..D1032 E8...E14 U5..U8
>   0x420   D1033.....D1528 B3 D1529..D1548 E15..E21 U9..U12
>   0x630   D1549.....D2044 B4 D2045..D2048 O1...O16 E22 E28 U13..U16
>=20
>   Where D - Data bytes
>         B - BBM bytes
>         E - ECC parity bytes
>         U - Unused bytes
>         O - Avilable OOB bytes
>=20
>   Now, the raw read expect data to be returned in buffer in the
>   form of
>=20
>   D1.....D2048 B1 E1...E7 U1..U4 B2 E8...E14 U5..U8 B3 E15..E21
>   U9..U12 B4 O1...O16 E22 E28 U13..U16
>=20
>   Now, the puporose of that helper function is read selected
>   codewords. This codeword is QCOM specific and other controller
>   normally doesn't follow this kind of layout.
>=20
>   Now If we make generic fuction for subpgage raw read with any
>   start and length then that function we can't use for erased page
>   bitflip detection.
>=20
>   If we give the start as 0 with length 528 then our requirement is
>   to get 516 data bytes in data buffer and 12 bytes in OOB buffer
>   but according to standard operations, it will be interpreted as
>   all data bytes from D1..D528
>=20
>   so that helper function is to read selected Codewords from
>   QCOM NAND controller. This Codeword is different from subpages

Thanks for the clarification, I understand now. Maybe you can add a
comment about this particular layout and why you need this helper to
check for erased pages.

BTW are these BBM preserved somehow?

Regards,
Miqu=C3=A8l

>=20
>   Regarding more info for layout, you can refer comment in
>   https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/qcom_na=
ndc.c#L2191
>=20
>   Thanks,
>   Abhishek



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
