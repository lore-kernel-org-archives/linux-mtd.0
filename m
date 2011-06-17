Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXSVt-0001ih-DG
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 06:26:42 +0000
Received: by fxm14 with SMTP id 14so2055577fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Jun 2011 23:26:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <khpjv6l6bhe815s0rj9frue0l5qqpb8hfq@4ax.com>
References: <khpjv6l6bhe815s0rj9frue0l5qqpb8hfq@4ax.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 17 Jun 2011 02:26:15 -0400
Message-ID: <BANLkTi=fnNB2CXkbSGhrs91TLUB05KWwrQ@mail.gmail.com>
Subject: Re: [NAND] Are partitions persistent?
To: Gilles <gilles.ganault@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 16, 2011 at 07:23, Gilles wrote:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0I was wondering: Are partitions on NAND persis=
tent, or is it up to
> the developer to make sure the images used to populate the different
> partitions are small enough to fit the partitions set in the NAND
> driver?
>
> For instance, this found through Google:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> static struct mtd_partition bfin_spi_flash_partitions[ ] =3D {
> =C2=A0 =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D "bootloader(spi)",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D 0x00040000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D 0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.mask_flags =3D MTD_CAP_ROM
> =C2=A0 =C2=A0}, {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D "linux kernel(spi)",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D 0x180000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D MTDPART_OFS_APPEND,
> };
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Does it mean that, for instance, when using Uboot's nandwrite to
> update the bootloader above, it's up to me to make sure that the image
> is smaller than 0x40000 and Uboot will happily keep going and erase
> part of the linux kernel, or is the MTDPART_OFS_APPEND option
> precisely made to avoid this and trigger an error?

the kernel's concept of partitions really has nothing to do with
u-boot.  further, the layout you define in the kernel via platform
resources is static and always used exactly as declared regardless of
the content on there.

u-boot by default does not know any of partitions, only offsets and
lengths.  it is up to you to make sure the two concepts are kept in
line.
-mike
