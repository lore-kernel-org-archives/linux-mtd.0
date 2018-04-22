Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAHoJ-0002US-12
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 16:25:56 +0000
Date: Sun, 22 Apr 2018 18:25:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 4/9] mtd: nand: qcom: fix null pointer access for erased
 buffer detection
Message-ID: <20180422182532.221747b6@xps13>
In-Reply-To: <d201308d57317ff7d37d7169d7985d76@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-5-git-send-email-absahu@codeaurora.org>
 <20180410111220.3873a24c@xps13>
 <d201308d57317ff7d37d7169d7985d76@codeaurora.org>
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

On Thu, 12 Apr 2018 12:24:16 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-04-10 14:42, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > On Wed,  4 Apr 2018 18:12:20 +0530, Abhishek Sahu =20
> > <absahu@codeaurora.org> wrote: =20
> > >> parse_read_errors can be called with only oob buf also in which =20
> >> case data_buf will be NULL.  If data_buf is NULL, then don=E2=80=99t
> >> treat this page as completely erased in case of ECC uncorrectable
> >> error. =20
> >> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org> =20
> >> ---
> >>  drivers/mtd/nand/qcom_nandc.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-) =20
> >> >> diff --git a/drivers/mtd/nand/qcom_nandc.c >> b/drivers/mtd/nand/qc=
om_nandc.c =20
> >> index 57c16a6..0ebcc55 100644
> >> --- a/drivers/mtd/nand/qcom_nandc.c
> >> +++ b/drivers/mtd/nand/qcom_nandc.c
> >> @@ -1607,9 +1607,11 @@ static int parse_read_errors(struct >> qcom_nan=
d_host *host, u8 *data_buf,
> >>  			if (host->bch_enabled) {
> >>  				erased =3D (erased_cw & ERASED_CW) =3D=3D ERASED_CW ?
> >>  					 true : false;
> > > Why the parse_read_errors() function could not be called without =20
> > data_buf when using BCH? Are you sure the situation can only happen
> > without it?
> >  =20
>    host->bch_enabled case is different where controller itself tells
>    regarding erased page in status register.
>=20
> > Would the following apply here too, with a:
> >  =20
>   erased_chunk_check_and_fixup will be used only for 4 bit RS ECC
>   code in which there is no support from HW for erased page detection
>   and we need to check few data bytes value.

So please explain this with a comment.

Thanks,
Miqu=C3=A8l
