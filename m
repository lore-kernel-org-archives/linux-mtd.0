Received: from dsl-64-129-131-125.telocity.com ([64.129.131.125] helo=cfowler.linuxiceberg.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Kogd-0006vL-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 00:16:27 +0100
Subject: Re: Updating the root partition
From: Christopher Fowler <cfowler@outpostsentinel.com>
To: Russ Dill <Russ.Dill@asu.edu>
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
   Chris AtLee
	 <catlee@canada.com>,
   Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <1024526655.441.5.camel@timmy>
References: <1024499892.9366.31.camel@geb>
	<20020620002303.A21586@wohnheim.fh-wedel.de>  <1024526655.441.5.camel@timmy>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
Date: 19 Jun 2002 19:22:43 -0400
Message-Id: <1024528965.13219.12.camel@devel>
Mime-Version: 1.0
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

Going into a pseudo single user mode to flash is not acceptable.  You
need to be able to flash from any tty.  From any web interface.  From
any command.  My unit will flash with a simple flash command while the
system is running.

Chris

On Wed, 2002-06-19 at 18:44, Russ Dill wrote:
> On Wed, 2002-06-19 at 15:23, J=F6rn Engel wrote:
> > On Wed, 19 June 2002 11:18:12 -0400, Chris AtLee wrote:
> > > I've got linux booting off of a cramfs partition sitting on mtdblock1=
.=20
> > > Is it possible to overwrite the mtdblock1 partition while linux is
> > > running?  The kernel itself isn't located on the root partition.  I'v=
e
> > > tried just copying a new cramfs image to /dev/mtd1 but I get errors o=
n
> > > decompressing next time I try and boot.
> >=20
> > - Use /dev/mtdblock1. The char device does not erase any blocks, so
> >   you end up ||ing the old and new data.
> > - Do the flashing soon after reboot and make sure, all necessary
> >   binaries are in RAM. Power-cycle afterwards, as you sure don't want
> >   to load good-as-random code and execute it, albeit it is only the
> >   userspace.
>=20
> if you are using busybox init, you can signal it to kill everything, and
> exec run the respawn entry in inittab. Your respawn entry can copy a
> statiacly linked copy of whatever you are using to flash to a ramfs,
> chroot/piviot_root to the ramfs and exec the program. once there, umount
> the cramfs, and you can safely do whatever you want.
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
>=20
