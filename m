Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fm0Ql-0002SF-NX
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 17:33:33 +0000
Date: Sat, 4 Aug 2018 19:33:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Raphael Pereira <raphaelpereira@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Suport for gf_len 14 in gpmi-nand for i.MX23 using Software BCH
 ECC
Message-ID: <20180804193307.0ca82318@xps13>
In-Reply-To: <CAAN9Nvcuz_KydZW0GHPHdz0j27rS=9onMxZ_3zpG-ELCTc7jKg@mail.gmail.com>
References: <CAAN9NvdvscL1MOKTXuH=Esf0NjC__QVH745n-h3R_hFfeqT9jw@mail.gmail.com>
 <20180804115555.667b3fb8@xps13>
 <CAAN9Nvcuz_KydZW0GHPHdz0j27rS=9onMxZ_3zpG-ELCTc7jKg@mail.gmail.com>
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

Raphael Pereira <raphaelpereira@gmail.com> wrote on Sat, 4 Aug 2018
08:22:24 -0300:

> Hi Miqu=C3=A8l,
>=20
> First thanks for the response. Second, I apologize for the ignorance
> on the matter, I should have studied a little more before asking for
> help. I am not fully aware on how these works but I will try to
> express myself better. I might still say incorrect things (:

No problem!

>=20
> I have a custom board with a i.MX23 processor. My board uses a 4Gb
> (512Mx8) flash which has an ECC requirement that is supported by the
> hardware and by the gpmi-nand driver. The gpmi-nand driver reports it
> as stated below:
>=20
> nand: 512 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224

Ok.

>=20
> In a more recent production we chose a 64Gb (4Gx8) flash and it is report=
ed as:
>=20
> nand: 4096 MiB, MLC, erase size: 2048 KiB, page size: 8192, OOB size: 744

                  ^

You have to know that Linux does not support MLC. While the controller
driver should work, there is no support *at all* with UBI/UBIFS.

> gpmi-nand 8000c000.gpmi-nand: ecc strength: 52 cannot be supported by
> the controller (20)
> gpmi-nand 8000c000.gpmi-nand: failed gpmi_check_ecc. ecc bits: 40, ecc
> size: 1024
> gpmi-nand 8000c000.gpmi-nand: Error setting BCH geometry : 1
>=20
> And it fails to probe. I looked at the code and found the following:
>=20
> gpmi-nand.c
>=20
> /*
>  * If we can get the ECC information from the nand chip, we do not
>  * need to calculate them ourselves.
>  *
>  * We may have available oob space in this case.
>  */
> static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
> {
>         struct bch_geometry *geo =3D &this->bch_geometry;
>         struct nand_chip *chip =3D &this->nand;
>         struct mtd_info *mtd =3D nand_to_mtd(chip);
>         unsigned int block_mark_bit_offset;
>=20
>         if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
>                 return -EINVAL;
>=20
>         switch (chip->ecc_step_ds) {
>         case SZ_512:
>                 geo->gf_len =3D 13;
>                 break;
>         case SZ_1K:
>                 geo->gf_len =3D 14;
>                 break;
>         default:
>                 dev_err(this->dev,
>                         "unsupported nand chip. ecc bits : %d, ecc size :=
 %d\n",
>                         chip->ecc_strength_ds, chip->ecc_step_ds);
>                 return -EINVAL;
>         }
>         geo->ecc_chunk_size =3D chip->ecc_step_ds;
>         geo->ecc_strength =3D round_up(chip->ecc_strength_ds, 2);
>         if (!gpmi_check_ecc(this))
>                 return -EINVAL;
> ...
>=20
> and a little bit before that:
>=20
> static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
> {
>         struct bch_geometry *geo =3D &this->bch_geometry;
>=20
>         /* Do the sanity check. */
>         if (GPMI_IS_MX23(this) || GPMI_IS_MX28(this)) {
>                 /* The mx23/mx28 only support the GF13. */
>                 if (geo->gf_len =3D=3D 14)
>                         return false;
>         }
>         return geo->ecc_strength <=3D this->devdata->bch_max_ecc_strength;
> }
>=20
> That is where it is falling.
>=20
> My questions are:
>=20
> 1. Is there any possibility to use a lower ECC strength on this flash
> that is supported by the hardware (at the expense of getting a lower
> device lifetime as I understand)?

For SLC, yes. For MLC, I'm not sure it is wise to do it as the number
of expected bitlips is much more higher.

Does your NAND chip supports SLC mode?
=20
> 2. If positive, what changes (and literature) do you recommend me to impl=
ement?
> 3. If positive, will I be able to boot using this flash (will ROM boot
> code be able to load data from this part)?

Only if your Boot ROM supports it, which is very likely not to be the
case with an iMX23.

> 4. If negative, can I implement support for the software BCH stack in
> this driver? And will I be able to boot using this approach?

If your Boot ROM does not support this kind of flash, then no, you
won't boot from it. However if you manage to boot, Linux can interact
with the chip with soft ECC if you can setup the chip to use SLC
mode (half of the capacity).=20

> 5. In both cases, do I need to change kobs-ng in order to implement
> the same approach?

I didn't know about kobs-ng. We usually use the mtd-utils userspace
package for NAND testing.

Thanks,
Miqu=C3=A8l
