Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUr2Q-0006PX-QG
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 10:05:41 +0000
Date: Mon, 18 Jun 2018 12:04:39 +0200
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
Message-ID: <20180618120439.09b41495@xps13>
In-Reply-To: <7cf002e3d7ebd46476554477dd92716f@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-2-git-send-email-absahu@codeaurora.org>
 <20180526095807.5caf5800@xps13>
 <44d4939cf8411a0dc693b8dd11fb57c7@codeaurora.org>
 <20180607143759.361edb3f@xps13>
 <7cf002e3d7ebd46476554477dd92716f@codeaurora.org>
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

On Mon, 11 Jun 2018 14:46:00 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-06-07 18:07, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > On Mon, 28 May 2018 11:16:29 +0530, Abhishek Sahu =20
> > <absahu@codeaurora.org> wrote: =20
> > >> On 2018-05-26 14:12, Miquel Raynal wrote:
> >> > Hi Abhishek, =20
> >> > > On Fri, 25 May 2018 17:51:29 +0530, Abhishek Sahu =20
> >> > <absahu@codeaurora.org> wrote: =20
> >> > >> commit 2c8f8afa7f92 ("mtd: nand: add generic helpers to check, =20
> >> >> match, maximize ECC settings") provides generic helpers which
> >> >> drivers can use for setting up ECC parameters. =20
> >> >> >> Since same board can have different ECC strength nand chips so =
=20
> >> >> following is the logic for setting up ECC strength and ECC step
> >> >> size, which can be used by most of the drivers. =20
> >> >> >> 1. If both ECC step size and ECC strength are already set =20
> >> >>    (usually by DT) then just check whether this setting
> >> >>    is supported by NAND controller.
> >> >> 2. If NAND_ECC_MAXIMIZE is set, then select maximum ECC strength
> >> >>    supported by NAND controller.
> >> >> 3. Otherwise, try to match the ECC step size and ECC strength close=
st
> >> >>    to the chip's requirement. If available OOB size can't fit the c=
hip
> >> >>    requirement then select maximum ECC strength which can be fit wi=
th
> >> >>    available OOB size. =20
> >> >> >> This patch introduces nand_ecc_choose_conf function which calls =
the =20
> >> >> required helper functions for the above logic. The drivers can use
> >> >> this single function instead of calling the 3 helper functions
> >> >> individually. =20
> >> >> >> CC: Masahiro Yamada <yamada.masahiro@socionext.com> =20
> >> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> >> >> ---
> >> >> * Changes from v2: =20
> >> >> >>   1. Renamed function to nand_ecc_choose_conf. =20
> >> >>   2. Minor code reorganization to remove warning and 2 function cal=
ls
> >> >>      for nand_maximize_ecc. =20
> >> >> >> * Changes from v1: =20
> >> >>   NEW PATCH =20
> >> >> >>  drivers/mtd/nand/raw/nand_base.c | 42 >> ++++++++++++++++++++++=
++++++++++++++++++ =20
> >> >>  drivers/mtd/nand/raw/nand_base.c | 31 ++++++++++++++++++++++++++++=
+++
> >> >>  include/linux/mtd/rawnand.h      |  3 +++
> >> >>  2 files changed, 34 insertions(+) =20
> >> >> >> diff --git a/drivers/mtd/nand/raw/nand_base.c >> b/drivers/mtd/n=
and/raw/nand_base.c =20
> >> >> index 72f3a89..e52019d 100644
> >> >> --- a/drivers/mtd/nand/raw/nand_base.c
> >> >> +++ b/drivers/mtd/nand/raw/nand_base.c
> >> >> @@ -6249,6 +6249,37 @@ int nand_maximize_ecc(struct nand_chip *chip,
> >> >>  }
> >> >>  EXPORT_SYMBOL_GPL(nand_maximize_ecc); =20
> >> >> >> +/** =20
> >> >> + * nand_ecc_choose_conf - Set the ECC strength and ECC step size
> >> >> + * @chip: nand chip info structure
> >> >> + * @caps: ECC engine caps info structure
> >> >> + * @oobavail: OOB size that the ECC engine can use
> >> >> + *
> >> >> + * Choose the ECC configuration according to following logic
> >> >> + *
> >> >> + * 1. If both ECC step size and ECC strength are already set (usua=
lly >> by DT)
> >> >> + *    then check if it is supported by this controller.
> >> >> + * 2. If NAND_ECC_MAXIMIZE is set, then select maximum ECC strengt=
h.
> >> >> + * 3. Otherwise, try to match the ECC step size and ECC strength >=
> closest
> >> >> + *    to the chip's requirement. If available OOB size can't fit t=
he >> chip
> >> >> + *    requirement then fallback to the maximum ECC step size and E=
CC >> strength.
> >> >> + *
> >> >> + * On success, the chosen ECC settings are set.
> >> >> + */
> >> >> +int nand_ecc_choose_conf(struct nand_chip *chip,
> >> >> +			 const struct nand_ecc_caps *caps, int oobavail)
> >> >> +{
> >> >> +	if (chip->ecc.size && chip->ecc.strength)
> >> >> +		return nand_check_ecc_caps(chip, caps, oobavail);
> >> >> +
> >> >> +	if (!(chip->ecc.options & NAND_ECC_MAXIMIZE) &&
> >> >> +	    !nand_match_ecc_req(chip, caps, oobavail))
> >> >> +		return 0;
> >> >> +
> >> >> +	return nand_maximize_ecc(chip, caps, oobavail);
> >> > > I personally don't mind if nand_maximize_ecc() is called twice in =
=20
> >> > the function if it clarifies the logic. Maybe the following will be
> >> > more clear for the user? =20
> >> >>   Thanks Miquel. =20
> >>   Both the implementations are fine.
> >>   The above implementation (which was in Denali NAND driver) code was =
>> also
> >>   clear. We can go for any of these implementation. =20
> >> >>   Shall I update this ? =20
> > > Yes, please :) =20
> >  =20
>   Thanks Miquel for confirming.
>   I will update accordingly.
>=20
>   Also, one more question.
>=20
>   Shall I make other functions (nand_check_ecc_caps, nand_maximize_ecc
>   and nand_match_ecc_req) static.  Since currently,
>   Denali NAND driver was only using these functions.
>=20
>   And Now, this nand_ecc_choose_conf will be help
>   in all the cases.
>=20
>   For nand_check_ecc_caps: call nand_ecc_choose_conf with
>                             chip->ecc.size && chip->ecc.strength
>=20
>   For nand_maximize_ecc: call nand_ecc_choose_conf with
>                          NAND_ECC_MAXIMIZE
>=20
>   For other cases, nand_match_ecc_req will be called.
>=20
>   So we will have one external function which will be
>   easy to maintain in future.

If nobody else uses these function outside of the core, then the
symbols should not be exported, their prototypes not in rawnand.h and
they should be declared static.


Regards,
Miqu=C3=A8l
