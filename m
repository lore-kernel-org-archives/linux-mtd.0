Received: from wa-out-1112.google.com ([209.85.146.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lnbj7-00008b-7c
	for linux-mtd@lists.infradead.org; Sat, 28 Mar 2009 16:49:56 +0000
Received: by wa-out-1112.google.com with SMTP id j5so891721wah.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 28 Mar 2009 09:49:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8c7950360903271847o33b6d088id49c8d1d07154f6d@mail.gmail.com>
References: <8c7950360903271847o33b6d088id49c8d1d07154f6d@mail.gmail.com>
Date: Sat, 28 Mar 2009 12:49:27 -0400
Message-ID: <8c7950360903280949vc7cb82dg1570b09a5a9aa2b8@mail.gmail.com>
Subject: Re: UBI error: vtbl_check: volume table check failed
From: Shane Volpe <shanevolpe@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After reading the UBI FAQ I was able to fix all of my UBI/UBIFS
issues.  I had originally read the UBIFS FAQ but had not realized,
until now, that there was also a UBI FAQ.
Regards,
Shane

On Fri, Mar 27, 2009 at 9:47 PM, Shane Volpe <shanevolpe@gmail.com> wrote:
> I'm running kernel version 2.6.28 and I have both UBI and UBIFS
> compiled into the kernel. =A0I'm using an AT91SAM9260 with 512MiB of
> NAND flash. =A0Here is what I ran to generate my ubifs image:
>
> mkfs.ubifs -r rootfs -m 2048 -e 129024 -c 2047 -o ubifs.img
> ubinize -o ubi.img -m 2048 -p 128KiB -s 512 ubinize.cfg
>
> Here is my ubinize.cfg:
> ---START CONFIG
> [ubifs]
> mode=3Dubi
> image=3Dubifs.img
> vol_id=3D0
> vol_size=3D500MiB
> vol_type=3Ddynamic
> vol_name=3Drootfs
> vol_flags=3Dautoresize
> ----END CONFIG
>
> Here is my Kernel command line:
> mem=3D32M console=3DttyS0,115200 ubi.mtd=3D1 root=3Dubi0:rootfs rootfstyp=
e=3Dubifs
>
> I erased the entire NAND flash and flashed the ubinized UBIFS image to
> address 0x00a00000 which is mtd1. =A0I then boot my system and received
> the error message(s) below (end of email). =A0I'm assuming, based on the
> error, that the problem is the ubi driver can not find the header
> information for the ubi partition however I'm not sure what I have
> done wrong as I believe all of the settings were correct. =A0I would
> appreciate any feedback as to what I might be doing wrong or other
> things I may do to debug this issue.
> Regards,
> Shane
>
>
> ---ERROR message during kernel boot:
>
> Creating 2 MTD partitions on "NAND 512MiB 3,3V 8-bit":
> 0x00000000-0x00a00000 : "Bootloader Area"
> 0x00a00000-0x20000000 : "User Area"
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size: =A0 131072 bytes (128 KiB)
> UBI: logical eraseblock size: =A0 =A0129024 bytes
> UBI: smallest flash I/O unit: =A0 =A02048
> UBI: sub-page size: =A0 =A0 =A0 =A0 =A0 =A0 =A0512
> UBI: VID header offset: =A0 =A0 =A0 =A0 =A0512 (aligned 512)
> UBI: data offset: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02048
> UBI error: vtbl_check: volume table check failed: record 0, error 9
> UBI error: ubi_init: cannot attach mtd1
> UBI error: ubi_init: UBI error: cannot initialize UBI, error -22
>
