Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CyYbg-0007sm-3C
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2005 11:52:57 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Rudi Engelbertink <rudi@unsec.nl>
In-Reply-To: <20050204112622.M33820@unsec.nl>
References: <20050204112622.M33820@unsec.nl>
Content-Type: text/plain
Date: Tue, 08 Feb 2005 17:51:47 +0100
Message-Id: <1107881508.17747.2.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: unable to get NAND oobinfo
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-02-04 at 12:43 +0100, Rudi Engelbertink wrote:
> Hi,
> 
> trying to get my nand driver (for compulab 586core board) on kernel 2.4.27
> working, i ran into the following problem:
> The driver is recognised and appears to work. That means I can read the mtdchar
> device but whin I'm trying to format the device, I recieve the message
> 'flash_eraseall: /dev/mtd3: unable to get NAND oobinfo'
> An strace replies with:
> open("/dev/mtd3", O_RDWR)               = 3
> ioctl(3, 0x80204d01, 0xbffffdf0)        = 0
> ioctl(3, 0x80c84d0a, 0xbffffd20)        = -1 ENOTTY (Inappropriate ioctl for
> device)

I guess you are using vanilla 2.4.27 without mtd patches. So the ioctl
is not implemented. The NAND stuff in MTD/JFFS2 on vanilla 2.4.xx is not
really fully functional. 

tglx
