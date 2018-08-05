Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmL3f-0002Vl-VL
 for linux-mtd@lists.infradead.org; Sun, 05 Aug 2018 15:35:05 +0000
Received: by mail-oi0-x22f.google.com with SMTP id 13-v6so18020977ois.1
 for <linux-mtd@lists.infradead.org>; Sun, 05 Aug 2018 08:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAAN9NvdvscL1MOKTXuH=Esf0NjC__QVH745n-h3R_hFfeqT9jw@mail.gmail.com>
 <20180804115555.667b3fb8@xps13>
 <CAAN9Nvcuz_KydZW0GHPHdz0j27rS=9onMxZ_3zpG-ELCTc7jKg@mail.gmail.com>
 <20180805111323.51f0a4a7@bbrezillon>
In-Reply-To: <20180805111323.51f0a4a7@bbrezillon>
From: Raphael Pereira <raphaelpereira@gmail.com>
Date: Sun, 5 Aug 2018 12:34:39 -0300
Message-ID: <CAAN9NvdkWhv=8GNtciGnJDiScFHei0uGiAnh6SVJuo26sNaBbA@mail.gmail.com>
Subject: Re: Suport for gf_len 14 in gpmi-nand for i.MX23 using Software BCH
 ECC
To: boris.brezillon@bootlin.com
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
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

Hi Boris,

Thanks for the enlightenment! It seems I made a very bad choice. I
will probably switch the part as it seems all the effort (that I
understand is quite large) can take me to a dead end (no possible
boot).

Best Regards,
Em dom, 5 de ago de 2018 =C3=A0s 06:13, Boris Brezillon
<boris.brezillon@bootlin.com> escreveu:
>
> Hi Raphael,
>
> On Sat, 4 Aug 2018 08:22:24 -0300
> Raphael Pereira <raphaelpereira@gmail.com> wrote:
>
> > Hi Miqu=C3=A8l,
> >
> > First thanks for the response. Second, I apologize for the ignorance
> > on the matter, I should have studied a little more before asking for
> > help. I am not fully aware on how these works but I will try to
> > express myself better. I might still say incorrect things (:
> >
> > I have a custom board with a i.MX23 processor. My board uses a 4Gb
> > (512Mx8) flash which has an ECC requirement that is supported by the
> > hardware and by the gpmi-nand driver. The gpmi-nand driver reports it
> > as stated below:
> >
> > nand: 512 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224
> >
> > In a more recent production we chose a 64Gb (4Gx8) flash and it is repo=
rted as:
> >
> > nand: 4096 MiB, MLC, erase size: 2048 KiB, page size: 8192, OOB size: 7=
44
> > gpmi-nand 8000c000.gpmi-nand: ecc strength: 52 cannot be supported by
> > the controller (20)
>
> Don't know where the 52bits/1024bytes ECC requirement is extracted
> from, but assuming you're using BCH it would not even fit in the
> provided OOB area (would require 784 bytes + 2 bytes for the the BBM
> marker). So I guess there's something wrong in the ID/ONFI param page
> decoding.
>
> > gpmi-nand 8000c000.gpmi-nand: failed gpmi_check_ecc. ecc bits: 40, ecc
> > size: 1024
> > gpmi-nand 8000c000.gpmi-nand: Error setting BCH geometry : 1
> >
> > And it fails to probe. I looked at the code and found the following:
> >
> > gpmi-nand.c
> >
> > /*
> >  * If we can get the ECC information from the nand chip, we do not
> >  * need to calculate them ourselves.
> >  *
> >  * We may have available oob space in this case.
> >  */
> > static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
> > {
> >         struct bch_geometry *geo =3D &this->bch_geometry;
> >         struct nand_chip *chip =3D &this->nand;
> >         struct mtd_info *mtd =3D nand_to_mtd(chip);
> >         unsigned int block_mark_bit_offset;
> >
> >         if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
> >                 return -EINVAL;
> >
> >         switch (chip->ecc_step_ds) {
> >         case SZ_512:
> >                 geo->gf_len =3D 13;
> >                 break;
> >         case SZ_1K:
> >                 geo->gf_len =3D 14;
> >                 break;
> >         default:
> >                 dev_err(this->dev,
> >                         "unsupported nand chip. ecc bits : %d, ecc size=
 : %d\n",
> >                         chip->ecc_strength_ds, chip->ecc_step_ds);
> >                 return -EINVAL;
> >         }
> >         geo->ecc_chunk_size =3D chip->ecc_step_ds;
> >         geo->ecc_strength =3D round_up(chip->ecc_strength_ds, 2);
> >         if (!gpmi_check_ecc(this))
> >                 return -EINVAL;
> > ...
> >
> > and a little bit before that:
> >
> > static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
> > {
> >         struct bch_geometry *geo =3D &this->bch_geometry;
> >
> >         /* Do the sanity check. */
> >         if (GPMI_IS_MX23(this) || GPMI_IS_MX28(this)) {
> >                 /* The mx23/mx28 only support the GF13. */
> >                 if (geo->gf_len =3D=3D 14)
> >                         return false;
> >         }
> >         return geo->ecc_strength <=3D this->devdata->bch_max_ecc_streng=
th;
> > }
> >
> > That is where it is falling.
> >
> > My questions are:
> >
> > 1. Is there any possibility to use a lower ECC strength on this flash
> > that is supported by the hardware (at the expense of getting a lower
> > device lifetime as I understand)?
>
> We're talking about MLC NANDs, don't even think about doing that. The
> ECC requirements is the least you should do, and I'd even recommend
> choosing stronger ECC if you have space left in the OOB area.
>
> > 2. If positive, what changes (and literature) do you recommend me to im=
plement?
> > 3. If positive, will I be able to boot using this flash (will ROM boot
> > code be able to load data from this part)?
> > 4. If negative, can I implement support for the software BCH stack in
> > this driver? And will I be able to boot using this approach?
>
> I think you'll regret that. The CPU consumption is already quite high
> for weaker ECC configs (4bit/512bytes), and we're talking about
> 52bits/1024bytes here?!
>
> > 5. In both cases, do I need to change kobs-ng in order to implement
> > the same approach?
>
> kobs-ng is the least of your problems. Before even considering all of
> this you should be aware that MLC NAND is not reliably supported in
> Linux. So, unless you're willing to fix that, I'd recommend
> reconsidering you HW choices and choosing an SLC NAND.
>
> If you don't have a choice, you might want to have a look at this
> ubi-mlc branch [1] and finish the work Richard and I started 3 years
> ago.
>
> Regards,
>
> Boris
>
> [1]https://github.com/bbrezillon/linux/commits/nand/mlc



--=20
Raphael Derosso Pereira
