Received: from web30208.mail.mud.yahoo.com ([209.191.69.55])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pou7i-0007SA-JV
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 08:49:35 +0000
Message-ID: <953130.73844.qm@web30208.mail.mud.yahoo.com>
Date: Mon, 14 Feb 2011 00:49:30 -0800 (PST)
From: Lars Michael <lh_post@yahoo.com>
Subject: mount ubi volume fails: No such device
To: linux-mtd@lists.infradead.org
In-Reply-To: <1297434507.2760.30.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Fri, 11/2/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:=0A> =0A>=
 > The oobtest and subpagetest found 3 errors, see below.=0A> Does it expla=
in=0A> > my initial problem?=0A> =0A> Yes. You cannot go forward with UBIFS=
 before you have fixed=0A> those.=0A> Esepcially subpage test is relevant t=
o you, you really have=0A> to have it=0A> fixed, or you can just ask UBIFS =
to not use sub-pages and=0A> see how it=0A> behaves, but this is less optim=
al.=0A> =0A=0AI am running on the TWR-MCF5441X eval. board, which has a 256=
MB NAND device: MT29F2G16AADWP. From the data sheet it should have no sub p=
ages, and this matches what UBI reports:=0A=0AUBI: physical eraseblock size=
:   131072 bytes (128 KiB)=0AUBI: logical eraseblock size:    126976 bytes=
=0AUBI: smallest flash I/O unit:    2048=0AUBI: VID header offset:         =
 2048 (aligned 2048)=0AUBI: data offset:                4096=0A=0A# cat pro=
c/mtd=0Adev:    size   erasesize  name=0Amtd0: 00100000 00020000 "u-boot"=
=0Amtd1: 0ff00000 00020000 "ubi"=0Amtd2: 00100000 00010000 "at26df081a"=0A=
=0AI used ubiformat without the -s or -O:=0Aubiformat /dev/mtd1 -f /root/ub=
i.img=0A=0AI tried with -O 2048, but still failed. I guess forcing the VID =
header to offset 2048 is anyway correct for this device? Are there another =
way to turn off sub-page in UBIFS? =0A=0AHere is how i made the UBI image:=
=0A./mkfs.ubifs -m 2048 -e 126976 -c 874 -v -Q -r ./rootfs rootfs.img=0A./m=
kfs.ubifs -m 2048 -e 126976 -c 36 -v -Q -r ./progfs progfs.img=0A./mkfs.ubi=
fs -m 2048 -e 126976 -c 49 -v -Q -r ./datafs datafs.img=0Aubinize -o ubi.im=
g -p 128KiB -m 2048 -v ubi-config.ini=0A=0ANow i rebuild the kernel with ad=
ditional debug options turned on. Will run subpage test again and submit re=
port on that.=0A=0AThanks and regards,=0A- Lars =0A=0A=0A=0A      
