Received: from fed1mtao01.cox.net ([68.6.19.244])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Kr3W-00075Z-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 02:48:14 +0100
Subject: Re: Updating the root partition
From: Russ Dill <Russ.Dill@asu.edu>
To: Christopher Fowler <cfowler@outpostsentinel.com>
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>, Chris AtLee
	 <catlee@canada.com>, Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <1024531003.13219.15.camel@devel>
References: <1024499892.9366.31.camel@geb>
	<20020620002303.A21586@wohnheim.fh-wedel.de> <1024526655.441.5.camel@timmy>
	<1024528965.13219.12.camel@devel> <1024529392.1205.9.camel@timmy>
	<1024531003.13219.15.camel@devel>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 19 Jun 2002 18:43:48 -0700
Message-Id: <1024537429.1088.17.camel@timmy>
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

On Wed, 2002-06-19 at 16:56, Christopher Fowler wrote:
> In a way.  On my system you have to restart to run on the new software. 
> I have implemented a pseudo single user mode in init that will umount
> the rootfs and then dump the new software into memory.  Ths keeps you
> from having to do a restart.  However, this is not possible from remote
> locations.  You must be on serial console to do this.  That is why
> single user mode is not acceptable.

I think you are a little confused on what is going on here, so I'll
explain in detail.

on my system, when it is normally up and running, an ftpd daemon is
running

when the ftpd daemon receives an upload, it verifies the integrity, and
saves it in /var

The ftpd daemon then sends a HUP signal to init

because inittab contains the line: ::restart:/linuxex, init kills all
running processes and exec's /linuxex

linuxex now runs, and is the only running process on the system, linuxex
is a shell script:

/bin/umount /tmp 
/bin/umount /etc
/bin/umount /proc
/bin/cp /usr/sbin/flash /var
/bin/cp -a /dev/nftla /var/out
/bin/cp -a /dev/ttyS0 /var
cd /var
/bin/ln -s flash chroot
/bin/mkdir old
echo pivot root to var... 
pivot_root . old 
exec ./chroot . ./flash

so now flash is the only program running, and its statiacally linked, so
there are no more references to the cramfs root, and it can be umounted
by flash. flash ten proceeds to flash the image, and reset the machine.

------

so as you can see, there is no pseudo single user mode required, and the
flash image is received while the system is up and fully operational. As
soon as the image is received and verified, the system basically goes
down for a reboot, during which the new image is flashed.
