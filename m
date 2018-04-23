Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAVPH-0003Lt-6r
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 06:57:01 +0000
Date: Mon, 23 Apr 2018 08:56:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/9] mtd: nand: qcom: support for checking read errors
 for last codeword
Message-ID: <20180423085635.794037ef@xps13>
In-Reply-To: <10ef5f58aceed5bb5069dad6c1b1b0e3@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-7-git-send-email-absahu@codeaurora.org>
 <20180410120542.24ea9ddb@xps13>
 <d9f06fe59fa76d2dbf97cb0b5de75bc7@codeaurora.org>
 <20180422181530.63f39278@xps13>
 <10ef5f58aceed5bb5069dad6c1b1b0e3@codeaurora.org>
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

On Mon, 23 Apr 2018 11:38:27 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-04-22 21:45, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > On Thu, 12 Apr 2018 12:47:42 +0530, Abhishek Sahu =20
> > <absahu@codeaurora.org> wrote: =20
> > >> On 2018-04-10 15:35, Miquel Raynal wrote:
> >> > Hi Abhishek, =20
> >> > > On Wed,  4 Apr 2018 18:12:22 +0530, Abhishek Sahu =20
> >> > <absahu@codeaurora.org> wrote: =20
> >> > >> Add boolean function argument in parse_read_errors to identify =20
> >> >> whether the read error has been called for complete page read or
> >> >> only last codeword read. This will help in subsequent patches to
> >> >> detect ECC errors in case of last codeword read.
> >> > > Can you explain when this happen: "last codeword read"? I don't se=
e the =20
> >> > use case. =20
> >> >>   Hi Miquel,
> >> >>   This is happening inside qcom_nandc_write_oob where the last subp=
age =20
> >>   data is being copied first.
> > > I still don't understand the use case.
> > > What to you mean last 'subpage copied first'? =20
> >  =20
>   Hi Miquel,
>=20
>   According to current implementation
>=20
>   QCOM NAND layout protect 16 bytes of available oob with ECC also.
>   When ecc->write_oob (qcom_nandc_write_oob) is being called
>   then it can't update just OOB bytes.
>=20
>   It needs to first read the last subpage which includes old
>   OOB bytes. Then it updates the old OOB bytes with new one
>   and then again write the data back.
>=20
>   You can refer function comment of qcom_nandc_write_oob
>   for the same.

Oh well, I think I see where we misunderstood: ->write_oob only asks
you to write some data, that is all. The user is supposed to know
which type of flash he is handling. If he writes a section that
has already been written, well, bad for him. But you certainly don't
want to handle that in the controller driver directly.

>=20
>   But, to me, it looks like this read is unnecessary since
>   all the other bytes will be 0xff only. Require your help
>   in confirming the same and then I will remove that read
>   last subpage implementation.

I think you can drop it.

Thanks,
Miqu=C3=A8l

>=20
>   Thanks,
>   Abhishek
>=20
> >> >>     host->use_ecc =3D true;
> >> >>     clear_bam_transaction(nandc); =20
> >>     ret =3D copy_last_cw(host, page);
> >>     if (ret)
> >>         return ret; =20
> >> >>   you can refer function comment of qcom_nandc_write_oob  for more =
=20
> >>   detail. =20
> >> >>   Thanks, =20
> >>   Abhishek =20



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
