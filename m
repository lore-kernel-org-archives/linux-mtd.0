Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwSt3-0005mP-M9
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 17:22:14 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Creech, Matthew" <MattCreech@eaton.com>
In-Reply-To: <F0A064EBC8C91C449244D108367426DC01E4AFEF@ra1ncsmb01.nasa.ad.etn.com>
References: <F0A064EBC8C91C449244D108367426DC01E4AFEF@ra1ncsmb01.nasa.ad.etn.com>
Content-Type: text/plain
Date: Wed, 02 Feb 2005 23:22:11 +0100
Message-Id: <1107382931.21196.620.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on dataflash problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-02-02 at 10:00 -0500, Creech, Matthew wrote:
> Hi,
> 
> makes the problem occur within 24 to 36 hours.  So something about
> copying one file over another one breaks things.  The "problem" here is
> that every I/O operation having to do with the JFFS2 partition blocks
> indefinitely.  For example, after running the test for 2 days, you can
> log into the device and try to "ls" the contents of /mnt/jffs2, and your
> shell will hang.  You can then login on another terminal, but you'll get
> another hang if you try to have any interaction with the JFFS2
> partition.  So everything else seems to function normally, but JFFS2
> just dies.  Also note that rebooting the device sometimes fixes things
> right up (JFFS2 mounts fine and works properly as if nothing happened at
> all), but sometimes the filesystem image is corrupt and refuses to
> mount.

Can you turn on JFFS2 debugging (level 1) in this case and log the debug
output over a serial console ?

tglx
