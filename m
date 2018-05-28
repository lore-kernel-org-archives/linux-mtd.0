Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNCHn-0007UH-Bz
 for linux-mtd@lists.infradead.org; Mon, 28 May 2018 07:10:12 +0000
Date: Mon, 28 May 2018 09:09:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross
 <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 13/16] mtd: rawnand: qcom: minor code reorganization
 for bad block check
Message-ID: <20180528090931.4a208c62@xps13>
In-Reply-To: <d48035002fc00f142edc8ed80309f8a7@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-14-git-send-email-absahu@codeaurora.org>
 <20180526104900.139dd19b@xps13>
 <d48035002fc00f142edc8ed80309f8a7@codeaurora.org>
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

On Mon, 28 May 2018 11:46:47 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-05-26 14:28, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > >> @@ -2141,12 +2127,10 @@ static int qcom_nandc_block_bad(struct >> =
mtd_info *mtd, loff_t ofs) =20
> >>  		goto err;
> >>  	} =20
> >> >> -	bbpos =3D mtd->writesize - host->cw_size * (ecc->steps - 1); =20
> >> -
> >> -	bad =3D nandc->data_buffer[bbpos] !=3D 0xff;
> >> +	bad =3D bbm_bytes_buf[0] !=3D 0xff;
> > > BTW, as there are host->bbm_size bytes that can inform on the block =
=20
> > state, don't we need to check all of them?
> >  =20
>   We are checking all of them.
>   host->bbm_size will be either 1 (for NAND_BUSWIDTH_8) or
>   2 (for NAND_BUSWIDTH_16).
>=20
>   https://elixir.bootlin.com/linux/v4.17-rc7/source/drivers/mtd/nand/raw/=
qcom_nandc.c#L2347
>=20
>   Thanks,
>   Abhishek
>=20
> >> >>  	if (chip->options & NAND_BUSWIDTH_16) =20
> >> -		bad =3D bad || (nandc->data_buffer[bbpos + 1] !=3D 0xff);
> >> +		bad =3D bad || (bbm_bytes_buf[1] !=3D 0xff);

As told in my previous reply, I missed the above line.

However, after checking the code of the core (nand_base.c) I wonder if
it is useful to check for the second byte.

And if you look at the core's implementation you'll see that the offset
is not always 0 in the OOB but maybe 5 for small page NAND chips.

Please have a look to the generic implementation and tell me why this
is really needed?

Thanks,
Miqu=C3=A8l
