Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjF2F-00031R-4P
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 06:24:47 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Brad Campbell <brad@wasp.net.au>
In-Reply-To: <40EFB906.7060701@wasp.net.au>
References: <200407091608.14442.philt@pioneer-pdt.com>
	<40EFB906.7060701@wasp.net.au>
Content-Type: text/plain
Message-Id: <1089454689.3106.3.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Sat, 10 Jul 2004 12:18:10 +0200
Content-Transfer-Encoding: 7bit
Cc: Patrick Hilt <philt@pioneer-pdt.com>, linux-mtd@lists.infradead.org
Subject: Re: JFFS 2 Question
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-07-10 at 11:38, Brad Campbell wrote:
> Patrick Hilt wrote:
> > Hi list!
> > Is there a way to make sure data is being written to physical flash when using 
> > JFFS2? In other words, After writing a file on a JFFS2 partition, is there 
> > anything that can be done to make sure that the data is getting written to 
> > the flash right away? Would "sync" or "fsync" have that effect?
> 
> I believe that jffs2 is a synchronous filesystem in any case. By the time your application has 
> returned from the write() call, the data is on flash.

You're right and wrong. :)

On standard NOR FLASH it is synchronous. On NAND/AND FLASH and some
strange NOR FLASH types we must write page aligned and therefor were use
a write buffer of page size, which is either flushed timed by kupdated
or by sync/fsync/ummount.

tglx
