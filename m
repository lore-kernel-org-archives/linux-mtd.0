Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173Bki-0003Df-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 09:15:48 +0100
Received: from diva.localdomain (host213-122-25-29.in-addr.btopenworld.com [213.122.25.29])
	by sparta.scl.co.uk (8.9.3/8.9.3) with ESMTP id JAA06976
	for <linux-mtd@lists.infradead.org>; Thu, 2 May 2002 09:15:46 +0100
Received: from diva.localdomain (IDENT:root@diva.localdomain [192.168.1.1])
	by diva.localdomain (8.12.2/8.12.2) with SMTP id g428GsQ1008324
	for <linux-mtd@lists.infradead.org>; Thu, 2 May 2002 09:16:54 +0100
From: John Sutton <john@scl.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Re: Booting from DOC2000 with GRUB loader
Date: Thu, 2 May 2002 08:47:33 +0100
Content-Type: text/plain
References: <02050120383503.07252@diva.localdomain>
In-Reply-To: <02050120383503.07252@diva.localdomain>
MIME-Version: 1.0
Message-Id: <02050209075601.08259@diva.localdomain>
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

Hi again

Many thanks for all that feedback!  Definitely a positive consensus
about the units for start_offset ;-)

Jasmine suggests that I should leave some extra after the end of grub for
future expansion, which seems a good idea, but raises in my mind the
question as to how grub (or anything else) knows where the nftl partition
starts?  Does nftl_format also write a pointer to the start block
somewhere else?  Or does the format contain some kind of signature?

Re the suggestions as to how to recover from an unbootable system!  To
an old fool like me, the idea of pushing a chip into a live board makes m=
y
hair curl!  Anyways, I hope it doesn't come to that as it would in my cas=
e
be extremely difficult, if not impossible - I'm using an SBC plugged into
a passive backplane and the DoC socket is right at the bottom next to the
edge connector ;-(

Jasmine also comments that:

> > and cdrom.  So if I screw up this nftl_format and trash grub, I'm
> > going to end up with an unbootable system ;-(
>=20
> no you aren't.  If you tell grub:
>=20
> rootnoverify (fd0)
> chainloader +1
> boot
>=20
> it will boot off the floppy.

But this assumes that I *haven't* trashed grub?

> (If you totally trash grub, the BIOS won't load
> anything off the DoC in the first place.)

Can it take that to mean that the BIOS will do some kind of checksum on
the code it's going to pass control to (i.e., in this case, grub) and
*won't* jump to it if the checksum fails?  That would be nice but I fear
it's not the case given the advice from the other guys who have obviously
on occasion found themselves in exactly this kind of mess?

And finally, off-list (so to speak) I've had this email from Cfowler
<cfowler@outpostsentinel.com>:

> Do not use grub.  You have erased the badblock table on that DOC and it
> is no logner good for production.  I spent 2 days recovering from this
> mess.

What am I to make of that?

TIA
John

On Wed, 01 May 2002, you wrote:
> > or nftl_format /dev/mtd0 98304  (bytes)
>=20
> this one is correct
>=20
> > I'm nervous about messing this up because since I put grub on the DoC=
, the
> > machine only ever boots from the DoC - completely ignores floppy, scs=
i disks
> > and cdrom.  So if I screw up this nftl_format and trash grub, I'm goi=
ng to end
> > up with an unbootable system ;-(  (OK, I'll just have to pull the DoC=
 chip out
> > of the board *again*, but even this gives me the eebies, so tight is =
the damn
> > thing stuck in its socket!  And anyway, if the system is unbootable w=
ith the
> > DoC chip in there, how am I ever going to reprogram it?)
> >=20
> > Help much appreciated!
>=20
> *** WARNING *** WARNING *** WARNING *** WARNING ***
>=20
> THIS CAN DAMAGE YOUR HARDWARE AND BLOW YOU UP
> (but it seems to work for me)
>=20
> *** WARNING *** WARNING *** WARNING *** WARNING ***
>=20
> I have an ISA card for the DOC2000, I boot up my workstation, carefully
> plug in the isacard, modprobe doc2000, insmod docprobe insmod mtdchar
> (if necessary) insmod nftl (if necessary). Do whatever I need to do,
> rmmod nftl, rmmod docprobe, rmmod doc2000, and remove the card. On my
> machine, doing this using the devfsd nodes causes an oops after the
> first time, a simple workaround is using hand made device files.
>=20
> *** WARNING *** WARNING *** WARNING *** WARNING ***
>=20
> THIS CAN DAMAGE YOUR HARDWARE AND BLOW YOU UP
> (but it seems to work for me)
>=20
> *** WARNING *** WARNING *** WARNING *** WARNING ***
--=20

***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************
