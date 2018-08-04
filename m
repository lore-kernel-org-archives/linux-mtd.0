Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fltI9-0002sr-R8
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 09:56:11 +0000
Date: Sat, 4 Aug 2018 11:55:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Raphael Pereira <raphaelpereira@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Suport for gf_len 14 in gpmi-nand for i.MX23 using Software BCH
 ECC
Message-ID: <20180804115555.667b3fb8@xps13>
In-Reply-To: <CAAN9NvdvscL1MOKTXuH=Esf0NjC__QVH745n-h3R_hFfeqT9jw@mail.gmail.com>
References: <CAAN9NvdvscL1MOKTXuH=Esf0NjC__QVH745n-h3R_hFfeqT9jw@mail.gmail.com>
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

Hi Raphael,

Raphael Pereira <raphaelpereira@gmail.com> wrote on Wed, 1 Aug 2018
18:29:32 -0300:

> Hi,
>=20
> I would like to know if it is possible to use the Software BCH ECC
> implementation to support a GF14 (ECC size =3D=3D 1024) 40 bit ECC strengh
> flash (MT29F32G08CBADA) on a GF13 (ECC size =3D=3D 512) 20 bit ECC strengh
> only i.MX23 processor.

I am not sure to understand correctly your request. What do you mean
by "GF13 only i.MX23 processor"? I suppose you refer to the raw NAND
controller abilities? If yes, then why do you care if you use soft
BCH?

And the ECC requirements is just an indication in terms of
correctability, how is 40 bits per 1024 bytes different than 20 bits
per 512?

>=20
> I know this processor uses gpmi-nand driver and it seems this driver
> doesn't support software ECC implementation.

Maybe I'm missing something but as the driver supports raw
reads/writes, I don't see why it would not support soft ECC. Boris,
Richard, any thoughts about that?

> What I want to know is if
> it is possible to change the driver to use the current Software BCH
> ECC implementation available on Linux when it detects the
> configuration above which is not hardware supported and switch it to a
> software implementation.

You can use DT properties for that (nand-ecc-mode =3D "soft";). Otherwise
if the driver effectively does not support the proposed layout at all,
it should just fail to probe.

> Considering most flashes has a 1-bit ECC on
> block 0 that would allow me to boot then switch to software ECC after
> kernel load.
>=20
> Best Regards,

Thanks,
Miqu=C3=A8l
