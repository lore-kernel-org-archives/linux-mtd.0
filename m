Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IDwoQ-0007jy-TO
	for linux-mtd@lists.infradead.org; Thu, 26 Jul 2007 02:27:04 -0400
Subject: Re: [PATCH][MTD] CORE: sysfs support for mtd
From: Artem Bityutskiy <dedekind@infradead.org>
To: sid@ics.uci.edu
In-Reply-To: <1676.216.31.211.11.1185386926.squirrel@webmail.ics.uci.edu>
References: <1676.216.31.211.11.1185386926.squirrel@webmail.ics.uci.edu>
Content-Type: text/plain; charset=utf-8
Date: Thu, 26 Jul 2007 09:26:20 +0300
Message-Id: <1185431180.3364.5.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-07-25 at 11:08 -0700, sid@ics.uci.edu wrote:
> This patch adds sysfs support for mtd. It exports some of the members of =
the mtd_info structure
> into the user space via sysfs. The idea is to use sysfs as an alternative=
 to using mtd ioctl().=20
> The following information from mtd_info struct [mtd.h] is exported as fil=
es:
>=20
> - size              : Partition size
> - erasesize         : Size of erase block
> - writesize         : Page size
> - type              : On of the following -> Absent, RAM, ROM, NOR Flash,=
 NAND Flash, Data flash
> - bbt               : List of bad blocks from device specific block_isbad=
() function
> - numeraseregions   : Number of erase regions
>=20
> The master mtd partition appears as a directory under sysfs as /sys/devic=
es/mtd. For each mtd
> partition (i.e., for each slave mtd found in mtdpart.c), a file under /sy=
s/devices/mtd directory
> by name mtdN (N =3D partition number) is generated. A struct kobject kobj=
 is added as member of
> struct mtd_info mtd [mtd.h] to enable mtd_info to become part of the kobj=
ects hierarchy. The
> attributes to be exported are added as struct mtd_attr [mtdpart.c]. A sof=
t link from
> /sys/bus/platform/devices/mtd points to /sys/deevices/mtd. Additional att=
ributes can be added by
> adding an entry to the mtd_default_attrs[] structure [mtdpart.c]
>=20
> It would be nice if the patch could be tested. I have tested it on a MIPS=
 based board with NAND
> flash. (Please bear with me if the patch does not appear correctly. This =
is my first patch to the
> list and I have tested by sending the patch to myself as per the FAQs).
>=20

Hi, sounds nice although I doubt you'll get much feedback in this list.
I'd suggest you to re-send it with CC to LKML because this is not just
MTD-related. Also, do not forget to add diffstat just before the patch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
