Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17L0Hg-0007n2-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 12:39:28 +0100
Subject: Re: Updating the root partition
From: cfowler <cfowler@outpostsentinel.com>
To: Stefan Thomasson <stefan.thomasson@possio.com>
Cc: Russ Dill <Russ.Dill@asu.edu>,
   =?ISO-8859-1?Q?J=F6rn?= Engel
	 <joern@wohnheim.fh-wedel.de>,
   Chris AtLee <catlee@canada.com>,
   Linux MTD
	 <linux-mtd@lists.infradead.org>
In-Reply-To: <3D11AAC9.11F76543@possio.com>
References: <1024499892.9366.31.camel@geb>
	<20020620002303.A21586@wohnheim.fh-wedel.de> <1024526655.441.5.camel@timmy>
	<1024528965.13219.12.camel@devel> <1024529392.1205.9.camel@timmy>
	<1024531003.13219.15.camel@devel> <1024537429.1088.17.camel@timmy>
	<3D11AAC9.11F76543@possio.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 20 Jun 2002 07:47:11 -0400
Message-Id: <1024573632.10863.8.camel@moses.outpostsentinel.com>
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

On Thu, 2002-06-20 at 06:13, Stefan Thomasson wrote:
> Hi, I'm trying to this whith a jffs2 partition and
> have some questions regarding this.
> 
> 
> Russ Dill wrote:
> > 
> > 
> > The ftpd daemon then sends a HUP signal to init
> 
> Doesn't init only reread the inittab on a HUP?

Not mine.  Busybox and SysV does.  but I wrote my own.
> 
> > 
> > because inittab contains the line: ::restart:/linuxex, init kills all
> > running processes and exec's /linuxex
> 
> Its not like going to runlevel 1, is it?

pseudo like.  I guess.  There are no runlevels in my machine
> 
> restart, is this a special function in BB init? Could not find any info
> on this one,
> is it like a reboot? Or does it get executed everytime I starts?

I wrote my own restart.  You see when I want to restart, I tell the
kernel to toggle the line that restarts the CPU.  I do not want to
shutdown.  I do not care about data in memory.


         // Tell every USER_PROCESS we are restarting.
         wall_all();

        printf("Restarting System...\n");

        log_info("system restarting");
        /* Sleep 1 second to give the message time */

        /* Flush any Buffers */

        // This is here to flush output on tty lines.  No disk
        // is concerened.
        sync();
        /* Take the system down */
        reboot(0x01234567);


Russ and My desgins are differernt.  He may give you some comments too.


> 
> > 
> > linuxex now runs, and is the only running process on the system, linuxex
> > is a shell script:
> > 
> > /bin/umount /tmp
> > /bin/umount /etc
> > /bin/umount /proc
> > /bin/cp /usr/sbin/flash /var
> > /bin/cp -a /dev/nftla /var/out
> > /bin/cp -a /dev/ttyS0 /var
> > cd /var
> > /bin/ln -s flash chroot
> > /bin/mkdir old
> > echo pivot root to var...
> > pivot_root . old
> > exec ./chroot . ./flash
> 
> Why are you running chroot symlinked to flash, unless its multi
> function...
> 
> > 
> > so now flash is the only program running, and its statiacally linked, so
> > there are no more references to the cramfs root, and it can be umounted
> > by flash. flash ten proceeds to flash the image, and reset the machine.
> > 
> > ------
> > 
> > so as you can see, there is no pseudo single user mode required, and the
> > flash image is received while the system is up and fully operational. As
> > soon as the image is received and verified, the system basically goes
> > down for a reboot, during which the new image is flashed.
> 
> Is this done for every reboot?
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
