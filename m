Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cw0cH-0007NV-6a
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 11:11:02 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Rudi Engelbertink <rudi@unsec.nl>
In-Reply-To: <20050201150810.M93647@unsec.nl>
References: <20050201150810.M93647@unsec.nl>
Content-Type: text/plain
Date: Tue, 01 Feb 2005 17:10:31 +0100
Message-Id: <1107274232.21196.433.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes() very very slow
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-01 at 16:32 +0100, Rudi Engelbertink wrote:
> Hello,
> 
> On a 64 MiB NAND Flash I created a jffs2 file system. After several tests
> especially power fail tests resulting in a lot off CRC and Data CRC errors.
> This appears not to be a problem except it takes a very long time to check
> the file system.
> The initial check (scanning for erased blocks) is done in aproximatly 10
> seconds, but after that the jffs2_get_inode_nodes check is running. 
> This process takes up to 8 minutes.
> During this time the file-system is inaccessible which in oure case a
> watchdog decides to reboot the system, making it even worse.
> It appears that the check is done with a stepsize of 16 bytes. On an 64MiB
> NAND flash it does this check +/- 4 million times.

Hmm, which kernel version ? 

Can you switch on JFFS2 debugging (debuglevel 1), log the output on a
serial line and send me the log, please ? 

tglx
