Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flue1-0007C8-3Q
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 11:22:50 +0000
Received: by mail-oi0-x241.google.com with SMTP id j205-v6so14380851oib.4
 for <linux-mtd@lists.infradead.org>; Sat, 04 Aug 2018 04:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAAN9NvdvscL1MOKTXuH=Esf0NjC__QVH745n-h3R_hFfeqT9jw@mail.gmail.com>
 <20180804115555.667b3fb8@xps13>
In-Reply-To: <20180804115555.667b3fb8@xps13>
From: Raphael Pereira <raphaelpereira@gmail.com>
Date: Sat, 4 Aug 2018 08:22:24 -0300
Message-ID: <CAAN9Nvcuz_KydZW0GHPHdz0j27rS=9onMxZ_3zpG-ELCTc7jKg@mail.gmail.com>
Subject: Re: Suport for gf_len 14 in gpmi-nand for i.MX23 using Software BCH
 ECC
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miqu=C3=A8l,

First thanks for the response. Second, I apologize for the ignorance
on the matter, I should have studied a little more before asking for
help. I am not fully aware on how these works but I will try to
express myself better. I might still say incorrect things (:

I have a custom board with a i.MX23 processor. My board uses a 4Gb
(512Mx8) flash which has an ECC requirement that is supported by the
hardware and by the gpmi-nand driver. The gpmi-nand driver reports it
as stated below:

nand: 512 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224

In a more recent production we chose a 64Gb (4Gx8) flash and it is reported=
 as:

nand: 4096 MiB, MLC, erase size: 2048 KiB, page size: 8192, OOB size: 744
gpmi-nand 8000c000.gpmi-nand: ecc strength: 52 cannot be supported by
the controller (20)
gpmi-nand 8000c000.gpmi-nand: failed gpmi_check_ecc. ecc bits: 40, ecc
size: 1024
gpmi-nand 8000c000.gpmi-nand: Error setting BCH geometry : 1

And it fails to probe. I looked at the code and found the following:

gpmi-nand.c

/*
 * If we can get the ECC information from the nand chip, we do not
 * need to calculate them ourselves.
 *
 * We may have available oob space in this case.
 */
static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
{
        struct bch_geometry *geo =3D &this->bch_geometry;
        struct nand_chip *chip =3D &this->nand;
        struct mtd_info *mtd =3D nand_to_mtd(chip);
        unsigned int block_mark_bit_offset;

        if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
                return -EINVAL;

        switch (chip->ecc_step_ds) {
        case SZ_512:
                geo->gf_len =3D 13;
                break;
        case SZ_1K:
                geo->gf_len =3D 14;
                break;
        default:
                dev_err(this->dev,
                        "unsupported nand chip. ecc bits : %d, ecc size : %=
d\n",
                        chip->ecc_strength_ds, chip->ecc_step_ds);
                return -EINVAL;
        }
        geo->ecc_chunk_size =3D chip->ecc_step_ds;
        geo->ecc_strength =3D round_up(chip->ecc_strength_ds, 2);
        if (!gpmi_check_ecc(this))
                return -EINVAL;
...

and a little bit before that:

static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
{
        struct bch_geometry *geo =3D &this->bch_geometry;

        /* Do the sanity check. */
        if (GPMI_IS_MX23(this) || GPMI_IS_MX28(this)) {
                /* The mx23/mx28 only support the GF13. */
                if (geo->gf_len =3D=3D 14)
                        return false;
        }
        return geo->ecc_strength <=3D this->devdata->bch_max_ecc_strength;
}

That is where it is falling.

My questions are:

1. Is there any possibility to use a lower ECC strength on this flash
that is supported by the hardware (at the expense of getting a lower
device lifetime as I understand)?
2. If positive, what changes (and literature) do you recommend me to implem=
ent?
3. If positive, will I be able to boot using this flash (will ROM boot
code be able to load data from this part)?
4. If negative, can I implement support for the software BCH stack in
this driver? And will I be able to boot using this approach?
5. In both cases, do I need to change kobs-ng in order to implement
the same approach?

Again, sorry if I say nonsense, I am still getting the knowledge!

Thanks in advance!

Em s=C3=A1b, 4 de ago de 2018 =C3=A0s 06:55, Miquel Raynal
<miquel.raynal@bootlin.com> escreveu:
>
> Hi Raphael,
>
> Raphael Pereira <raphaelpereira@gmail.com> wrote on Wed, 1 Aug 2018
> 18:29:32 -0300:
>
> > Hi,
> >
> > I would like to know if it is possible to use the Software BCH ECC
> > implementation to support a GF14 (ECC size =3D=3D 1024) 40 bit ECC stre=
ngh
> > flash (MT29F32G08CBADA) on a GF13 (ECC size =3D=3D 512) 20 bit ECC stre=
ngh
> > only i.MX23 processor.
>
> I am not sure to understand correctly your request. What do you mean
> by "GF13 only i.MX23 processor"? I suppose you refer to the raw NAND
> controller abilities? If yes, then why do you care if you use soft
> BCH?
>
> And the ECC requirements is just an indication in terms of
> correctability, how is 40 bits per 1024 bytes different than 20 bits
> per 512?
>
> >
> > I know this processor uses gpmi-nand driver and it seems this driver
> > doesn't support software ECC implementation.
>
> Maybe I'm missing something but as the driver supports raw
> reads/writes, I don't see why it would not support soft ECC. Boris,
> Richard, any thoughts about that?
>
> > What I want to know is if
> > it is possible to change the driver to use the current Software BCH
> > ECC implementation available on Linux when it detects the
> > configuration above which is not hardware supported and switch it to a
> > software implementation.
>
> You can use DT properties for that (nand-ecc-mode =3D "soft";). Otherwise
> if the driver effectively does not support the proposed layout at all,
> it should just fail to probe.
>
> > Considering most flashes has a 1-bit ECC on
> > block 0 that would allow me to boot then switch to software ECC after
> > kernel load.
> >
> > Best Regards,
>
> Thanks,
> Miqu=C3=A8l



--=20
Raphael Derosso Pereira
