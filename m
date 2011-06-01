Received: from na3sys009aog111.obsmtp.com ([74.125.149.205])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRli7-0004Ks-59
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 13:43:48 +0000
Received: by mail-vw0-f42.google.com with SMTP id 1so9844159vwl.1
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 06:43:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306929375.4405.116.camel@localhost>
References: <891190.21758.qm@web30201.mail.mud.yahoo.com>
	<1306929375.4405.116.camel@localhost>
Date: Wed, 1 Jun 2011 09:41:19 -0400
Message-ID: <BANLkTimKSzpAqZ2e7TFgFwp3Cx=v==wq-Q@mail.gmail.com>
Subject: Re: U-Boot: using nand write to flash an ubi image, ubi part fails
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Lars Michael <lh_post@yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lars

On Wed, Jun 1, 2011 at 3:57 AM, Lars Michael <lh_post@yahoo.com> wrote:
> Hello,
>
> Using mkfs.ubifs and ubinize I have created an image with 5 volumes. In L=
inux I could flash it using "ubiformat /dev/mtd1 -f /root/ubi.img" and atta=
ch it using "ubiattach /dev/ubi_ctrl -m 1". It worked.
>
> In production I would prefer to write the image from U-Boot. So in U-Boot=
 I used "nand erase" then "nand write" to flash the image. Then I want to a=
ttach by "ubi part" command - but this fails: "UBI error: ubi_init: UBI err=
or: cannot initialize UBI, error -17"
> [...]
> I realize that the U-Boot 'nand erase' does not preserve the erase counte=
rs. So what would be the correct way to erase and write in U-Boot? And why =
is the ubiformat not able to correct the problems?

It's true that the ECs are not preserved. But it's also true that
trailing pages of 0xff are not trimmed either. You definitely need to
drop trailing 0xff pages when writing ubinized images containing UBIFS
volumes. To do this you can use either the new 'nand write' variant,
.trimffs [1] which is currently patches that have been Acked. Or you
can use the free-space-fixup feature which is available in the
ubifs-2.6 tree and requires that you use a mkfs.ubifs built from the
the mtd-utils tree.

I've never seen the particular error "ubi_init: UBI error: cannot
initialize UBI, error -17" when I have erroneously written a ubinized
image with nand write. But maybe that is due to the paritculars of my
platform drivers or it may be due to the version of u-boot you are
running there -- see below.

I reccomend giving both the 'nand write.trimffs' patches and the
free-space-fixup feature a try (indivually) and reporting back with
your success. After you update u-boot, see below:

> My kernel is 2.6.29 patched with 165 patched from the ubi back port tree.
> U-Boot is 2009.08 with ubifs support, but I am not sure if there are rele=
vant patches. The CPU is a v4 ColdFire and 256MB Micron NAND.

2009.08 is maybe too old. There have been several fixes to both ubi
and ubis in u-boot since then:

$git log --oneline v2009.08..u-boot/master  -- fs/ubifs/ drivers/mtd/ubi/
c7b7d45 UBIFS: Fix dereferencing type-punned pointer compiler warning
64b6817 ubifs.c: BUG: Error following links
b1a14f8 UBIFS: Change ubifsload to not read beyond the requested size
cb9c09d UBIFS: Add ubifsumount command to unmount an active volume
6d8962e Switch from archive libraries to partial linking
2e5167c Replace CONFIG_RELOC_FIXUP_WORKS by CONFIG_NEEDS_MANUAL_RELOC
86af10c Fix "ubi part" cmd re-entrancy
ceeba00 UBI: initialise update marker
1b1f9a9 UBI: Ensure that "background thread" operations are really executed
6865168 ubifsmount fails due to not initialized list
87d93a1 move prototypes for gunzip() and zunzip() to common.h
4b142fe common: delete CONFIG_SYS_64BIT_VSPRINTF and CONFIG_SYS_64BIT_STRTO=
UL
521af04 Conditionally perform common relocation fixups
ef37c68 ubifs: Correct dereferencing of files-after-symlinks
9d7952e ubifs: Add support for looking up directory and relative symlinks
02f9990 Move __set/clear_bit from ubifs.h to bitops.h


Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
