Received: from fed1mtao02.cox.net ([68.6.19.243])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KoC5-0006sc-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 23:44:53 +0100
Subject: Re: Updating the root partition
From: Russ Dill <Russ.Dill@asu.edu>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: Chris AtLee <catlee@canada.com>, Linux MTD
	 <linux-mtd@lists.infradead.org>
In-Reply-To: <20020620002303.A21586@wohnheim.fh-wedel.de>
References: <1024499892.9366.31.camel@geb>
	<20020620002303.A21586@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: 19 Jun 2002 15:44:15 -0700
Message-Id: <1024526655.441.5.camel@timmy>
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

On Wed, 2002-06-19 at 15:23, J=F6rn Engel wrote:
> On Wed, 19 June 2002 11:18:12 -0400, Chris AtLee wrote:
> > I've got linux booting off of a cramfs partition sitting on mtdblock1.=20
> > Is it possible to overwrite the mtdblock1 partition while linux is
> > running?  The kernel itself isn't located on the root partition.  I've
> > tried just copying a new cramfs image to /dev/mtd1 but I get errors on
> > decompressing next time I try and boot.
>=20
> - Use /dev/mtdblock1. The char device does not erase any blocks, so
>   you end up ||ing the old and new data.
> - Do the flashing soon after reboot and make sure, all necessary
>   binaries are in RAM. Power-cycle afterwards, as you sure don't want
>   to load good-as-random code and execute it, albeit it is only the
>   userspace.

if you are using busybox init, you can signal it to kill everything, and
exec run the respawn entry in inittab. Your respawn entry can copy a
statiacly linked copy of whatever you are using to flash to a ramfs,
chroot/piviot_root to the ramfs and exec the program. once there, umount
the cramfs, and you can safely do whatever you want.
