Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQuBK-0007aE-7y
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 12:38:31 +0000
Date: Thu, 7 Jun 2018 14:37:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross
 <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>, Masahiro
 Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 01/16] mtd: rawnand: helper function for setting up
 ECC configuration
Message-ID: <20180607143759.361edb3f@xps13>
In-Reply-To: <44d4939cf8411a0dc693b8dd11fb57c7@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-2-git-send-email-absahu@codeaurora.org>
 <20180526095807.5caf5800@xps13>
 <44d4939cf8411a0dc693b8dd11fb57c7@codeaurora.org>
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

On Mon, 28 May 2018 11:16:29 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-05-26 14:12, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > On Fri, 25 May 2018 17:51:29 +0530, Abhishek Sahu =20
> > <absahu@codeaurora.org> wrote: =20
> > >> commit 2c8f8afa7f92 ("mtd: nand: add generic helpers to check, =20
> >> match, maximize ECC settings") provides generic helpers which
> >> drivers can use for setting up ECC parameters. =20
> >> >> Since same board can have different ECC strength nand chips so =20
> >> following is the logic for setting up ECC strength and ECC step
> >> size, which can be used by most of the drivers. =20
> >> >> 1. If both ECC step size and ECC strength are already set =20
> >>    (usually by DT) then just check whether this setting
> >>    is supported by NAND controller.
> >> 2. If NAND_ECC_MAXIMIZE is set, then select maximum ECC strength
> >>    supported by NAND controller.
> >> 3. Otherwise, try to match the ECC step size and ECC strength closest
> >>    to the chip's requirement. If available OOB size can't fit the chip
> >>    requirement then select maximum ECC strength which can be fit with
> >>    available OOB size. =20
> >> >> This patch introduces nand_ecc_choose_conf function which calls the=
 =20
> >> required helper functions for the above logic. The drivers can use
> >> this single function instead of calling the 3 helper functions
> >> individually. =20
> >> >> CC: Masahiro Yamada <yamada.masahiro@socionext.com> =20
> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> >> ---
> >> * Changes from v2: =20
> >> >>   1. Renamed function to nand_ecc_choose_conf. =20
> >>   2. Minor code reorganization to remove warning and 2 function calls
> >>      for nand_maximize_ecc. =20
> >> >> * Changes from v1: =20
> >>   NEW PATCH =20
> >> >>  drivers/mtd/nand/raw/nand_base.c | 42 >> +++++++++++++++++++++++++=
+++++++++++++++ =20
> >>  drivers/mtd/nand/raw/nand_base.c | 31 +++++++++++++++++++++++++++++++
> >>  include/linux/mtd/rawnand.h      |  3 +++
> >>  2 files changed, 34 insertions(+) =20
> >> >> diff --git a/drivers/mtd/nand/raw/nand_base.c >> b/drivers/mtd/nand=
/raw/nand_base.c =20
> >> index 72f3a89..e52019d 100644
> >> --- a/drivers/mtd/nand/raw/nand_base.c
> >> +++ b/drivers/mtd/nand/raw/nand_base.c
> >> @@ -6249,6 +6249,37 @@ int nand_maximize_ecc(struct nand_chip *chip,
> >>  }
> >>  EXPORT_SYMBOL_GPL(nand_maximize_ecc); =20
> >> >> +/** =20
> >> + * nand_ecc_choose_conf - Set the ECC strength and ECC step size
> >> + * @chip: nand chip info structure
> >> + * @caps: ECC engine caps info structure
> >> + * @oobavail: OOB size that the ECC engine can use
> >> + *
> >> + * Choose the ECC configuration according to following logic
> >> + *
> >> + * 1. If both ECC step size and ECC strength are already set (usually=
 >> by DT)
> >> + *    then check if it is supported by this controller.
> >> + * 2. If NAND_ECC_MAXIMIZE is set, then select maximum ECC strength.
> >> + * 3. Otherwise, try to match the ECC step size and ECC strength >> c=
losest
> >> + *    to the chip's requirement. If available OOB size can't fit the =
>> chip
> >> + *    requirement then fallback to the maximum ECC step size and ECC =
>> strength.
> >> + *
> >> + * On success, the chosen ECC settings are set.
> >> + */
> >> +int nand_ecc_choose_conf(struct nand_chip *chip,
> >> +			 const struct nand_ecc_caps *caps, int oobavail)
> >> +{
> >> +	if (chip->ecc.size && chip->ecc.strength)
> >> +		return nand_check_ecc_caps(chip, caps, oobavail);
> >> +
> >> +	if (!(chip->ecc.options & NAND_ECC_MAXIMIZE) &&
> >> +	    !nand_match_ecc_req(chip, caps, oobavail))
> >> +		return 0;
> >> +
> >> +	return nand_maximize_ecc(chip, caps, oobavail);
> > > I personally don't mind if nand_maximize_ecc() is called twice in =20
> > the function if it clarifies the logic. Maybe the following will be
> > more clear for the user? =20
>=20
>   Thanks Miquel.
>   Both the implementations are fine.
>   The above implementation (which was in Denali NAND driver) code was also
>   clear. We can go for any of these implementation.
>=20
>   Shall I update this ?

Yes, please :)

>=20
> > > 	if (chip->ecc.size && chip->ecc.strength) =20
> > 		return nand_check_ecc_caps(chip, caps, oobavail); =20
> > > 	if (chip->ecc.options & NAND_ECC_MAXIMIZE) =20
> > 		return nand_maximize_ecc(chip, caps, oobavail); =20
> > > 	if (!nand_match_ecc_req(chip, caps, oobavail)) =20
> > 		return 0; =20
> > > 	return nand_maximize_ecc(chip, caps, oobavail);
> > > Also, I'm not sure we should just error out when nand_check_ecc_caps(=
) =20
> > fails. What about something more robust, like:
> >  =20
>   But again, It will lead in overriding the DT ECC strength parameter.
>   We started our discussion from that point. :-)

As Boris said, let's error out instead of overriding the DT ECC
parameters.


Thanks,
Miqu=C3=A8l
