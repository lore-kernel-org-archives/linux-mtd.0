Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBb4e-0005F3-9r
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 07:12:15 +0000
Date: Thu, 26 Apr 2018 09:11:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 8/9] mtd: nand: qcom: helper function for raw read
Message-ID: <20180426091149.10cee27c@xps13>
In-Reply-To: <798994bd2cf24e919403f568cb1ff3ea@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-9-git-send-email-absahu@codeaurora.org>
 <20180410114428.68d59c8d@xps13>
 <c3e32eb24408a973d0c89984a466d9da@codeaurora.org>
 <20180422181929.65d42ca8@xps13>
 <484485e160af41cf062549938c53d078@codeaurora.org>
 <20180423085817.74e56091@xps13>
 <892130678772dca7116bd8dcdcb3cc44@codeaurora.org>
 <20180425145905.219b6faf@xps13>
 <798994bd2cf24e919403f568cb1ff3ea@codeaurora.org>
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

On Thu, 26 Apr 2018 11:23:19 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-04-25 18:29, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > On Wed, 25 Apr 2018 12:02:29 +0530, Abhishek Sahu =20
> > <absahu@codeaurora.org> wrote: =20
> > >> On 2018-04-23 12:28, Miquel Raynal wrote:
> >> > Hi Abhishek, =20
> >> > > On Mon, 23 Apr 2018 11:58:42 +0530, Abhishek Sahu =20
> >> > <absahu@codeaurora.org> wrote: =20
> >> > >> On 2018-04-22 21:49, Miquel Raynal wrote:
> >> >> > Hi Abhishek, =20
> >> >> > > On Thu, 12 Apr 2018 12:36:42 +0530, Abhishek Sahu =20
> >> >> > <absahu@codeaurora.org> wrote: =20
> >> >> > >> On 2018-04-10 15:14, Miquel Raynal wrote:
> >> >> >> > Hi Abhishek, =20
> >> >> >> > > On Wed,  4 Apr 2018 18:12:24 +0530, Abhishek Sahu =20
> >> >> >> > <absahu@codeaurora.org> wrote: =20
> >> >> >> > >> This patch does minor code reorganization for raw reads. =20
> >> >> >> >> Currently the raw read is required for complete page but for
> >> >> >> >> subsequent patches related with erased codeword bit flips
> >> >> >> >> detection, only few CW should be read. So, this patch adds
> >> >> >> >> helper function and introduces the read CW bitmask which
> >> >> >> >> specifies which CW reads are required in complete page.
> >> >> >> > > I am not sure this is the right approach for subpage reads. =
If the =20
> >> >> >> > controller supports it, you should just enable it in chip->opt=
ions.
> >> >> >> > =20
> >> >> >>   Thanks Miquel. =20
> >> >> >> >>   It is internal to this file only. This patch makes one stat=
ic helper =20
> >> >> >>   function which provides the support to read subpages.
> >> >> > > Drivers should expose raw helpers, why keeping this helper stat=
ic then? =20
> >> >> > >> >> >> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org> =
=20
> >> >> >> >> ---
> >> >> >> >>  drivers/mtd/nand/qcom_nandc.c | 186 >> +++++++++++++++++++++=
++++-----------------
> >> >> >> >>  1 file changed, 110 insertions(+), 76 deletions(-) =20
> >> >> >> >> >> diff --git a/drivers/mtd/nand/qcom_nandc.c >> b/drivers/mt=
d/nand/qcom_nandc.c =20
> >> >> >> >> index 40c790e..f5d1fa4 100644
> >> >> >> >> --- a/drivers/mtd/nand/qcom_nandc.c
> >> >> >> >> +++ b/drivers/mtd/nand/qcom_nandc.c
> >> >> >> >> @@ -1590,6 +1590,114 @@ static int check_flash_errors(struct =
>> qcom_nand_host *host, int cw_cnt)
> >> >> >> >>  } =20
> >> >> >> >> >>  /* =20
> >> >> >> >> + * Helper to perform the page raw read operation. The read_c=
w_mask >> will be
> >> >> >> >> + * used to specify the codewords for which the data should b=
e read. >> The
> >> >> >> >> + * single page contains multiple CW. Sometime, only few CW d=
ata is >> required
> >> >> >> >> + * in complete page. Also, start address will be determined =
with
> >> >> >> >> + * this CW mask to skip unnecessary data copy from NAND flas=
h device. >> Then,
> >> >> >> >> + * actual data copy from NAND controller to data buffer will=
 be done >> only
> >> >> >> >> + * for the CWs which have the mask set.
> >> >> >> >> + */
> >> >> >> >> +static int
> >> >> >> >> +nandc_read_page_raw(struct mtd_info *mtd, struct nand_chip *=
chip,
> >> >> >> >> +		    u8 *data_buf, u8 *oob_buf,
> >> >> >> >> +		    int page, unsigned long read_cw_mask)
> >> >> >> >> +{ =20
> >> >>   <snip> =20
> >> >> >> >> >> -	free_descs(nandc); =20
> >> >> >> >> -
> >> >> >> >> -	if (!ret)
> >> >> >> >> -		ret =3D check_flash_errors(host, ecc->steps);
> >> >> >> >> -
> >> >> >> >> -	return 0;
> >> >> >> >> +	return nandc_read_page_raw(mtd, chip, buf, chip->oob_poi, p=
age,
> >> >> >> >> +				   BIT(chip->ecc.steps) - 1);
> >> >> >> > > I don't understand this. chip->ecc.steps is constant, right?=
 So you =20
> >> >> >> > always ask for the same subpage? =20
> >> >> >> >>   We need to do raw read for subpages in which we got uncorre=
ctable =20
> >> >> >>   error in next patch for erased page bitflip detection. This pa=
tch >> does
> >> >> >>   reorganization of raw read and moves common code in helper fun=
ction
> >> >> >>   nandc_read_page_raw. =20
> >> >> >> >>   For nomral raw read, all the subpages will be read so =20
> >> >> >>   BIT(chip->ecc.steps) - 1 is used for qcom_nandc_read_page_raw.=
 =20
> >> >> >> >>   While for erased page raw read, only those sub pages will b=
e =20
> >> >> >>   read for which the controller gives the uncorrectable error.
> >> >> > > Still not okay: the driver should expose a way to do raw reads =
no =20
> >> >> > matter the length and the start and you should use that in a gene=
ric
> >> >> > way.
> >> >> > =20
> >> >>   Thanks Miquel.
> >> >>   I will explore regarding that.
> >> >>   Looks like, we can some helper like read_subpage.
> >> > > Of course, when you implement raw accessors you can have static he=
lpers =20
> >> > to clarify the code.
> >> > =20
> >>   Hi Miquel, =20
> >> >>   I checked regarding generic function.
> >> >>   Normally the other NAND controller stores the data in main area =
=20
> >>   and ecc bytes in oob area. So if page size is 2048+64 then 2048
> >>   data bytes will go in main area followed by ECC bytes =20
> >> >>   Main                 |        OOB =20
> >>   ------------------------------------
> >>   D1 D2...........D2048|E1..........E64 =20
> >> >>   The QCOM nand contoller follows different layout in which this =20
> >>   2048+64 is internally divided in 528 bytes codeword so it will
> >>   come to 4 codewords. Each codeword contains 516 bytes followed
> >>   by ECC parity bytes. Also in at 0x1f0 offset in each CW, the bad =20
>=20
>   Sorry Miquel.
>   Its 0x1d0 instead of 0x1f0.
>=20
> >>   block marker is stored. so each CW contains badblock marker also.
> >>   The avilable OOB bytes are 16 which is also protected by ECC. =20
> >> >>   516 * 4 =3D 2048 data bytes + 16 available oob bytes.
> >> >>   So for QCOM layout, it will be something lile =20
> >> >> >>   0       D1.........D495 B1 D496....D516 E1...E7  U1..U4 =20
> >>   0x210   D517......D1012 B2 D1016..D1032 E8...E14 U5..U8
> >>   0x420   D1033.....D1528 B3 D1529..D1548 E15..E21 U9..U12
> >>   0x630   D1549.....D2044 B4 D2045..D2048 O1...O16 E22 E28 U13..U16 =20
> >> >>   Where D - Data bytes =20
> >>         B - BBM bytes
> >>         E - ECC parity bytes
> >>         U - Unused bytes
> >>         O - Avilable OOB bytes =20
> >> >>   Now, the raw read expect data to be returned in buffer in the =20
> >>   form of =20
> >> >>   D1.....D2048 B1 E1...E7 U1..U4 B2 E8...E14 U5..U8 B3 E15..E21 =20
> >>   U9..U12 B4 O1...O16 E22 E28 U13..U16 =20
> >> >>   Now, the puporose of that helper function is read selected =20
> >>   codewords. This codeword is QCOM specific and other controller
> >>   normally doesn't follow this kind of layout. =20
> >> >>   Now If we make generic fuction for subpgage raw read with any =20
> >>   start and length then that function we can't use for erased page
> >>   bitflip detection. =20
> >> >>   If we give the start as 0 with length 528 then our requirement is=
 =20
> >>   to get 516 data bytes in data buffer and 12 bytes in OOB buffer
> >>   but according to standard operations, it will be interpreted as
> >>   all data bytes from D1..D528 =20
> >> >>   so that helper function is to read selected Codewords from =20
> >>   QCOM NAND controller. This Codeword is different from subpages
> > > Thanks for the clarification, I understand now. Maybe you can add a =
=20
> > comment about this particular layout and why you need this helper to
> > check for erased pages.
> >  =20
>   Sure Miquel. Will add the same in comment.
>=20
> > BTW are these BBM preserved somehow? =20
>=20
>   The QCOM nand layout is such that, the bad block byte for last codeowrd
>   will come to first byte in spare area. If we have 2048+64 bytes device,
>   then it will have 4 codewords of size 528. For the last codeword, the
>   B4 will come at
>=20
>   528 * 3 + 0x1d0 =3D 0x800 which is first byte in OOB area.

Great, so maybe that's why the kernel don't mess up with bad blocks. As
long as this byte is !0xff it should not be touched.

For good pages however, I guess you just don't care about the fact that
three bytes are supposedly "markers" and use them as data? They won't
be checked by the kernel anyway.

>=20
>   Normally vendor make this byte as non 0xff for factory bad block.
>   For bad blocks created after that this byte will be marked
>   as non 0xff in
>   https://elixir.bootlin.com/linux/v4.16/source/drivers/mtd/nand/qcom_nan=
dc.c#L2657
>=20
>   This bad block byte won't be touched during read/write with ECC.
>=20
>   Thanks,
>   Abhishek
>=20

Thanks for the clarification,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
