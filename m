Received: from web30204.mail.mud.yahoo.com ([209.191.69.51])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Poxq6-0001AY-0U
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 12:47:38 +0000
Message-ID: <269683.2447.qm@web30204.mail.mud.yahoo.com>
Date: Mon, 14 Feb 2011 04:47:36 -0800 (PST)
From: Lars Michael <lh_post@yahoo.com>
Subject: mount ubi volume fails: No such device
To: dedekind1@gmail.com
In-Reply-To: <1297681309.2854.16.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

=0A=0A--- On Mon, 14/2/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:=0A=
=0A> From: Artem Bityutskiy <dedekind1@gmail.com>=0A> Subject: Re: mount ub=
i volume fails: No such device=0A> To: "Lars Michael" <lh_post@yahoo.com>=
=0A> Cc: linux-mtd@lists.infradead.org=0A> Date: Monday, 14 February, 2011,=
 12:01=0A> On Mon, 2011-02-14 at 00:49 -0800,=0A> Lars Michael wrote:=0A> >=
 Here is how i made the UBI image:=0A> > ./mkfs.ubifs -m 2048 -e 126976 -c =
874 -v -Q -r=0A> ./rootfs rootfs.img=0A> > ./mkfs.ubifs -m 2048 -e 126976 -=
c 36 -v -Q -r ./progfs=0A> progfs.img=0A> > ./mkfs.ubifs -m 2048 -e 126976 =
-c 49 -v -Q -r ./datafs=0A> datafs.img=0A> > ubinize -o ubi.img -p 128KiB -=
m 2048 -v=0A> ubi-config.ini=0A> =0A> You also need to give this parameter =
to UBI: =0A> vid_hdr_offs=3D2048=0A> =0A> I.e., modprobe ubi mtd=3D1 vid_hd=
r_offs=3D2048=0A> =0A> Or if UBI is compiled-in, boot with the following ke=
rnel=0A> argument:=0A> =0A> ubi.vid_hdr_offs=3D2048=0A> =0A> With this opti=
on UBI will not use sub-pages at all. I think=0A> it makes=0A> sense for=A0=
 you to try how it works this way.=0A> =0A=0AI believe this is the correct =
syntax:=0A=0A[root@M54418TWR /]# insmod ubi mtd=3D1,2048=0AUBI error: ubi_i=
nit: UBI error: cannot initialize UBI, error -19=0Ainsmod: cannot insert '/=
lib/modules/2.6.29/kernel/drivers/mtd/ubi/ubi.ko': No such device=0A=0AUnfo=
rtunately, booting Linux the NAND flash is now detected bad, so I do not ha=
ve an mtd1! what is the best way to try to recover? I do not understand how=
 the flash can suddenly become bad!=0A=0ANAND device: Manufacturer ID: 0x2c=
, Chip ID: 0xca (Micron NAND 256MiB 3,3V 16-bit)=0ABad block table not foun=
d for chip 0=0ABad block table not found for chip 0=0AScanning device for b=
ad blocks=0ABad eraseblock 0 at 0x000000000000=0ABad eraseblock 1 at 0x0000=
00020000=0ABad eraseblock 2 at 0x000000040000=0ABad eraseblock 3 at 0x00000=
0060000=0ABad eraseblock 4 at 0x000000080000=0ABad eraseblock 5 at 0x000000=
0a0000=0ABad eraseblock 6 at 0x0000000c0000=0A<cut>=0ABad eraseblock 2046 a=
t 0x00000ffc0000=0ABad eraseblock 2047 at 0x00000ffe0000=0ANo space left to=
 write bad block table=0Afsl_nfc: NAND Flash not found !=0Am25p80 spi1.1: a=
t26df081a (1024 Kbytes)=0ACreating 1 MTD partitions on "Atmel at26df081a SP=
I Flash chip":=0A0x000000000000-0x000000100000 : "at26df081a"=0ADSPI: Coldf=
ire master initialized=0Aehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI=
) Driver=0A=0AThanks and regards,=0A- Lars =0A=0A=0A      
