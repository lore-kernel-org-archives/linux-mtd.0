Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DFBtH-0007yk-D7
	for linux-mtd@lists.infradead.org; Sat, 26 Mar 2005 09:03:52 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Zeri Virgo <sillyzeri@gmail.com>
In-Reply-To: <a2cb6db60503260318343be275@mail.gmail.com>
References: <a2cb6db60503260318343be275@mail.gmail.com>
Content-Type: text/plain
Date: Sat, 26 Mar 2005 16:03:44 +0100
Message-Id: <1111849424.4522.0.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: boot from diskonchip with jffs2
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-03-26 at 11:18 +0000, Zeri Virgo wrote:
> Hi,
> I'm in search of an update to the issues discussed in this thread... 
> http://lists.infradead.org/pipermail/linux-mtd/2003-August/008327.html
> 
> I'm trying to determine the best method to boot and run from an old NAND 
> DiskOnChip (*not* TSOP). A while ago, I had success with the doc2000.c 
> driver...
> /dev/mtd0 -> /dev/nftla -> /dev/nftla1 -> ext2 -> /(root of 64MB)
> 
> Is it feasile to use jffs2 for the root filesystem?

The new DoC driver in drivers/mtd/nand supports JFFS2.

tglx
