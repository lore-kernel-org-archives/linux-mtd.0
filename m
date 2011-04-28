Received: from p02c12o142.mxlogic.net ([208.65.145.75])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFIu6-0003Lr-90
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 04:32:39 +0000
From: Iwo Mergler <IwoM@netcomm.com.au>
To: <linux-mtd@lists.infradead.org>
Subject: Re: Discovering current MTD partition
Date: Thu, 28 Apr 2011 14:27:52 +1000
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<4DB7C9F9.9000609@free-electrons.com>
	<d7bb9e8d1c11cece8092e2f4c40436e2.squirrel@emailmg.startlogic.com>
In-Reply-To: <d7bb9e8d1c11cece8092e2f4c40436e2.squirrel@emailmg.startlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201104281427.52402.IwoM@netcomm.com.au>
Cc: David Wagner <david.wagner@free-electrons.com>,
	"umar@janteq.com" <umar@janteq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 28 Apr 2011 03:14:36 umar@janteq.com wrote:
> > On 04/27/2011 09:25 AM, umar@janteq.com wrote:
> >> Hi,
> >> [...]
> >> What I'd like is to detect from userspace is which /dev/mtdX partition
> >> is
> >> the currently executing program running on because that is the partiti=
on
> >> that has been obviously booted.
> >=20
> > I think you might want to take a look at getmntent (3) : it is a libc
> > function for getting the /etc/mtab entries. It also seems to be portabl=
e.
> >=20
> > Cheers,
> > David.
> >=20
> > --
> > David Wagner, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
>=20
> This will give me the same info as /proc/mtab.  I cannot figure out how I
> can infer which /dev/mtdXX was booted from with this information.
>=20

Here is an example from the embedded system I have on my desk
right now:

root:/proc# cat /proc/mounts
rootfs / rootfs rw 0 0
mtd:rfs / jffs2 rw,relatime 0 0
proc /proc proc rw,relatime 0 0
devpts /dev/pts devpts rw,relatime,mode=3D600 0 0
etc.

=46rom this we can see that the current root file system is
mtd:rfs

root:/proc# cat mtd
dev:    size   erasesize  name
mtd0: 00100000 00020000 "S1S2EN"
mtd1: 00400000 00020000 "rkern"
mtd2: 00b00000 00020000 "rfs"
mtd3: 00400000 00020000 "kernel"
mtd4: 02000000 00020000 "root"
etc.

This tells us that mtd:rfs corresponds to mtd2, which
should be accessible under /dev/mtd2, /dev/mtdblock2, etc.


Best regards,

Iwo



This communication contains information which may be confidential or privil=
eged.
The information is intended solely for the use of the individual or entity =
named
above. If you are not the intended recipient, be aware that any disclosure,
copying, distribution or use of the contents of this information is prohibi=
ted.=20
If you have received this communication in error, please notify me by telep=
hone
immediately.
