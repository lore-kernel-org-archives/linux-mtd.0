Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D2Ah2-0000zZ-2G
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 11:09:24 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050218154853.GB5926@synertronixx3>
References: <20050218154216.GA5926@synertronixx3>
	<20050218154853.GB5926@synertronixx3>
Content-Type: text/plain
Date: Fri, 18 Feb 2005 17:09:18 +0100
Message-Id: <1108742958.24721.295.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: freeze when mounting fs
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-02-18 at 16:48 +0100, Konstantin Kletschke wrote:

> CONFIG_JFFS2_FS_DEBUG=2

Please use level 1

> And when mounting functional rootfs it speaks a lot, but:

What happens when you mount the non-functional one ? Can you please
provide logs via serial console. klogd does not work for logging of that
stuff.

> Rootfs is at http://ludenkalle.de/mtd/52

The image is clean. There is no problem to see.

It would be interesting to have a binary image after you programmed it
to FLASH. cat /dev/mtdX >flash.img

tglx
