Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170RjS-0006x5-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 19:43:10 +0100
Received: from diva.localdomain (in-addr.btopenworld.com [62.6.96.4] (may be forged))
	by sparta.scl.co.uk (8.9.3/8.9.3) with ESMTP id TAA20141
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 19:43:09 +0100
Received: from diva.localdomain (IDENT:root@diva.localdomain [192.168.1.1])
	by diva.localdomain (8.12.2/8.12.2) with SMTP id g3OIi0Y1017873
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 19:44:00 +0100
From: John Sutton <john@scl.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Re: Booting from a DiskOnChip2000
Date: Wed, 24 Apr 2002 19:18:13 +0100
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <02042419440000.17852@diva.localdomain>
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi there

I'm thrashing about also trying to boot from DoC.  I'm tempted to think t=
hat
I've nearly got there *without* having to go understand things like
GRUB/LinuxBIOS etc.  But *maybe* I'm completely deluding myself!  Perhaps
somebody can advise me...

Here's what I've got:

Two partitions on a 16Mb DoC:

Command (m for help): u
Changing display/entry units to sectors

Command (m for help): p

Disk /dev/nftla: 16 heads, 2 sectors, 998 cylinders
Units =3D sectors of 1 * 512 bytes

     Device Boot    Start       End    Blocks   Id  System
/dev/nftla1             2     23999     11999   83  Linux
/dev/nftla2         24000     31935      3968   83  Linux

I'm trying to boot a kernel held on partition 1 (I need partition 2 later=
 on
but not for booting) so I've put the usual stuff on there - vmlinuz and b=
oot.b.=20
Then I mount /dev/nftla1 on /mnt and run LILO with this config:

---------------------------
boot=3D/dev/nftla
map=3D/mnt/boot/map
backup=3D/mnt/boot/boot.5D00
install=3D/mnt/boot/boot.b
prompt
timeout=3D20

disk=3D/dev/nftla
        bios=3D0x80
        sectors=3D2
        heads=3D16
        cylinders=3D998
        partition=3D/dev/nftla1
                start=3D2

image=3D/mnt/boot/vmlinuz
        label=3Dlinux
        append=3D"no-hlt"
        read-only
        root=3D/dev/md2
---------------------------

And that "works" i.e. I've gotten rid of the "Sorry don't know how to han=
dle
device 0x5d01" message and lilo -v says it has done the trick.  Sadly, ho=
wever,
on booting all I get is a solitary "L" ;-(  Or, 2 L's on *seperate* lines
(weird, huh?) if I also use linear...

According to the lilo docs, this solitary L means there is some kind of
"geometry mismatch"...

If I mess about long enough with the lilo config, am I going to win?  Hav=
e
other people done this kind of thing?  Or am I completely misunderstandin=
g what
is at stake and really *have to* look into GRUB/LinuxBIOS to have any cha=
nce of
booting a linux kernel off a DoC?

TIA
John

> Thomas,
>=20
> I believe lilo can talk to devices by means of BIOS calls.  If I
> understand correctly, the M-Systems patch to lilo adds the mapping of t=
he
> /dev/ftla (?) root device name to the appropriate BIOS disk number.
>=20
> I infer from your description that you haven't made a complete choice
> between using the M-System's Linux driver and the MTD doc2000.c driver.
>=20
> If you are going for M-System's driver, I think you may need to specify
> the correct device name (/dev/ftla ?) as a root device (and optionally =
as
> a boot device) in /etc/lilo.conf.
>=20
> Then the lilo command should be able to write down the block numbers of
> the kernel image it needs to load at system startup.
>=20
> If you are going for the MTD doc2000.c driver which doesn't attempt to
> emulate age old real mode BIOS API, then the bootloader will have to
> access the content of the NFTL layer by using a bootstrap driver simila=
r
> to the kernel doc2000.c module. =20
>=20
> The MTD CVS repository contains the patch to the GRUB bootloader which
> performs the above bootstrap access.  As a bonus, the GRUB bootloader
> doesn't require any block numbers list to find the kernel image as it h=
as
> the bootstrap drivers for the most of filesystems as well.
>=20
> The latest DOC 2000 / Millennium patch is in CVS directory
>=20
>         mtd/patches/grub-2002-02-19-doc.patch
>=20
> You may need to download the source code of GRUB off its own CVS
> repository at
>=20
>         http://savannah.gnu.org/projects/grub/
>=20
> The copy of the DOC 2000 / Millennium patch can also be found in the Pa=
tch
> Area of the GRUB project.
>=20
> Ilguiz
>=20
> On Wed, 24 Apr 2002, Thomas Preisig wrote:
>=20
> > I used a patched lilo version 21 from M-System. If I run lilo I get t=
he
> > message: Sorry don't know how to handle device 0x5d01.


***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************
