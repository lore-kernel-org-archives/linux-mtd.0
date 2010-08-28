Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OpRjc-00031K-Qe
	for linux-mtd@lists.infradead.org; Sat, 28 Aug 2010 20:10:42 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Vimal Singh <vimal.newwork@gmail.com>, Cliff Brake <cliff.brake@gmail.com>
Date: Sun, 29 Aug 2010 01:39:55 +0530
Subject: RE: NAND ECC in linux-omap
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B031584E18C@dbde02.ent.ti.com>
References: <AANLkTimABq72N98Ca6yJ9FgYnyDpod3qRPoTypkDn-4A@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030E8188DB@dbde02.ent.ti.com>
	<AANLkTik4+gApkw5fQ561QnJPLX5ED7oN3oU0P6F0+Gsv@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030E9299EA@dbde02.ent.ti.com>
	<AANLkTinuR_g53r4Q6a3LCmy4LR9ox8j7uCOFVB4OmRz4@mail.gmail.com>
	<AANLkTi=br81XgtJWE52NpE_0Kdbbpe6OTSXVAnhXDj2+@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B031584E052@dbde02.ent.ti.com>
	<AANLkTi=n_ojiG=BY0AskW-AhTX1mt2hxauLxDSvyfh4b@mail.gmail.com>
	<AANLkTik3MADx8Vvp2z_KqqEG=oJEV8AQENMELCbAchBY@mail.gmail.com>
	<AANLkTinr_0iX9RyJ=S_0c7YL84LJX3q1anqWp16DMW_K@mail.gmail.com>
	<AANLkTinWS=bQ_LLrRsHsL9REvDUDkKX+=OWkjLQVq0BX@mail.gmail.com>
In-Reply-To: <AANLkTinWS=bQ_LLrRsHsL9REvDUDkKX+=OWkjLQVq0BX@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Kamat, Nishant" <nskamat@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vimal,

> -----Original Message-----
> From: Vimal Singh [mailto:vimal.newwork@gmail.com]
> Sent: Saturday, August 28, 2010 2:07 AM
> To: Cliff Brake
> Cc: Ghorai, Sukumar; Kamat, Nishant; linux-omap@vger.kernel.org; Linux MT=
D
> Subject: Re: NAND ECC in linux-omap
>=20
> Adding LO and MTD list too for more comments.
>=20
> On Sat, Aug 28, 2010 at 1:40 AM, Vimal Singh <vimal.newwork@gmail.com>
> wrote:
> > On Sat, Aug 28, 2010 at 12:00 AM, Cliff Brake <cliff.brake@gmail.com>
> wrote:
> >> On Fri, Aug 27, 2010 at 2:29 PM, Cliff Brake <cliff.brake@gmail.com>
> wrote:
> >>> On Fri, Aug 27, 2010 at 11:13 AM, Ghorai, Sukumar <s-ghorai@ti.com>
> wrote:
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Vimal Singh [mailto:vimal.newwork@gmail.com]
> >>>>> Sent: Tuesday, August 24, 2010 10:41 PM
> >>>>> To: Cliff Brake
> >>>>> Cc: Ghorai, Sukumar; Linux OMAP Users; Kamat, Nishant
> >>>>> Subject: Re: NAND ECC in linux-omap
> >>>>>
> >>>>> On Tue, Aug 24, 2010 at 8:04 PM, Cliff Brake <cliff.brake@gmail.com=
>
> >>>>> wrote:
> >>>>> >
> >>>>> > flash_erasall -j /dev/mtd4
> >>>>>
> >>>>> Give a try without using '-j' option... If ECC layout is the
> suspect..
> >>>>> this may help.
> >>>> [Ghorai]
> >>>> Cliff,
> >>>> I did not able to spend much time on it to get into the problem.
> >>>> But would you please try using these additional patch(4) that yet to
> upstream?
> >>>> https://patchwork.kernel.org/patch/116554/
> >>>> https://patchwork.kernel.org/patch/116553/
> >>>> https://patchwork.kernel.org/patch/116555/
> >>>> https://patchwork.kernel.org/patch/116556/
> >>>> And select/change the proper ECC in -
> >>>> arch/arm/mach-omap2/board-flash.c: line No.148;
> >>>> board_nand_data.ecc_opt =A0 =A0 =A0 =A0 =3D OMAP_ECC_HAMMING_CODE_HW=
;
> >>>
> >>> Thanks for the patches. =A0Now I get the following:
> >>>
> >>> root@ts3:~# flash_eraseall /dev/mtd1
> >>> Erasing 128 Kibyte @ 1c0000 -- 100 % complete.
> >>> root@ts3:~# nandwrite -p /dev/mtd1 /media/mmcblk0p1/u-boot.bin
> >>> Writing data to block 0 at offset 0x0
> >>>
> >>> And the operation hangs.
> >
> > Drop these patches. Please just give one more try after reverting last
> > 2 commits in omap2.c driver:
> > 1. omap3 nand: cleanup virtual address usages
> > and
> > 2. omap3 gpmc: functionality enhancement
> >
> > I suspect something wrong with patch '2'. I will look into it more.
>=20
> I can see the problem in '1' patch only. In this patch, see below change:
>=20
> ------------------------------------------
>=20
> static void omap_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int
> ctrl)
>  {
>         struct omap_nand_info *info =3D container_of(mtd,
>                                         struct omap_nand_info, mtd);
> -       switch (ctrl) {
> -       case NAND_CTRL_CHANGE | NAND_CTRL_CLE:
> -               info->nand.IO_ADDR_W =3D info->gpmc_cs_baseaddr +
> -                                               GPMC_CS_NAND_COMMAND;
> -               info->nand.IO_ADDR_R =3D info->gpmc_cs_baseaddr +
> -                                               GPMC_CS_NAND_DATA;
> -               break;
> -
> -       case NAND_CTRL_CHANGE | NAND_CTRL_ALE:
> -               info->nand.IO_ADDR_W =3D info->gpmc_cs_baseaddr +
> -                                               GPMC_CS_NAND_ADDRESS;
> -               info->nand.IO_ADDR_R =3D info->gpmc_cs_baseaddr +
> -                                               GPMC_CS_NAND_DATA;
> -               break;
> -
> -       case NAND_CTRL_CHANGE | NAND_NCE:
> -               info->nand.IO_ADDR_W =3D info->gpmc_cs_baseaddr +
> -                                               GPMC_CS_NAND_DATA;
> -               info->nand.IO_ADDR_R =3D info->gpmc_cs_baseaddr +
> -                                               GPMC_CS_NAND_DATA;
> -               break;
> -       }
>=20
> -       if (cmd !=3D NAND_CMD_NONE)
> -               __raw_writeb(cmd, info->nand.IO_ADDR_W);
> +       if (cmd !=3D NAND_CMD_NONE) {
> +               if (ctrl & NAND_CLE)
> +                       gpmc_nand_write(info->gpmc_cs, GPMC_NAND_COMMAND,
> cmd);
> +
> +               else if (ctrl & NAND_ALE)
> +                       gpmc_nand_write(info->gpmc_cs, GPMC_NAND_ADDRESS,
> cmd);
> +
> +               else /* NAND_NCE */
> +                       gpmc_nand_write(info->gpmc_cs, GPMC_NAND_DATA,
> cmd);
> +       }
>  }
>=20
> ---------------------------------------------
>=20
> The new (changed) hwcontrol routine still can latch command and
> address to correct gpmc nand registers. But it is failing to set '
> info->nand.IO_ADDR_W' and 'info->nand.IO_ADDR_R'.
> Which will be used by write/read routines to:  write to (IO_ADDR_W) or
> read from (IO_ADDR_R).
[Ghorai]
1. You mean revert the old code will solve the issue mentioned by Cliff?=20
2. Can you check if the problem already exists before applying these patch =
itself?
=20
>=20
>=20
> --
> Regards,
> Vimal Singh
