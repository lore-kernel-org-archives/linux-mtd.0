Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172zvC-0002NG-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 May 2002 20:37:50 +0100
From: John Sutton <john@scl.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Booting from DOC2000 with GRUB loader
Date: Wed, 1 May 2002 20:17:18 +0100
Content-Type: text/plain
Cc: Russ.Dill@asu.edu
MIME-Version: 1.0
Message-Id: <02050120383503.07252@diva.localdomain>
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

Hi all (and Russ in particular)

I've got the same problem as previous post on this subject:

---------------------------------------
On Thu, 2002-04-25 at 19:19, Zhiwei Yu wrote:
> Hi,
>=20
> I am working on booting from DOC2000, LILO works on my
> box but GRUB doesn't.  After I patched the latest
> patch for GRUB, I got grub-fireware and sucessfully
> load the fireware in DOC.
>=20
> For now, everytime I boot up, I got grub prompt, but I
> failed to load kernel, the command I using is=20
> kernel (dc0,0)/boot/bzImage.
>=20
> This problem is not new to the list, I found several
> similar mails, All of them didn't have the answer.  DI
> u have any idea?  Thanks in advance.

probably because you overwrote some nftl stuff with grub. Erase the
whole thing (eraseall /dev/mtd0), put grub on it, find the next free
block directly past grub and nftl_format at that offset. fdisk your
nftla, mkfs the partition, add the kernel, and maybe a menu.lst.
----------------------------------------------

My question is: *how* do I "find the next free block directly past grub"?

When I put grub on there (not at that stage realising I was going to tras=
h my
existing nftl partitions and so I omitted to record the output), I *seem =
to*
recall that doc_loadbios reported needing 6 x 16k "blocks" to store the g=
rub
firmware - which fits, because the grub_firmware file is 87k.

So, in what units is the <start offset> argument to nftl_format?  i.e. do=
 I do :

   nftl_format /dev/mtd0 6   (16k blocks)

or nftl_format /dev/mtd0 96   (1k blocks)

or nftl_format /dev/mtd0 98304  (bytes)

etc...?

I'm nervous about messing this up because since I put grub on the DoC, th=
e
machine only ever boots from the DoC - completely ignores floppy, scsi di=
sks
and cdrom.  So if I screw up this nftl_format and trash grub, I'm going t=
o end
up with an unbootable system ;-(  (OK, I'll just have to pull the DoC chi=
p out
of the board *again*, but even this gives me the eebies, so tight is the =
damn
thing stuck in its socket!  And anyway, if the system is unbootable with =
the
DoC chip in there, how am I ever going to reprogram it?)

Help much appreciated!

TIA
John

***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************
