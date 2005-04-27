Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQj6O-0000QH-Gf
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 05:45:05 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
In-Reply-To: <426F56C1.6020204@ipi.ac.ru>
References: <426F40A3.8010308@ipi.ac.ru>
	<1114592403.879.175.camel@tglx.tec.linutronix.de>
	<426F56C1.6020204@ipi.ac.ru>
Content-Type: text/plain
Date: Wed, 27 Apr 2005 12:45:06 +0200
Message-Id: <1114598706.879.185.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand locking
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-04-27 at 13:09 +0400, Timofei V. Bondarenko wrote:
> Thomas Gleixner wrote:
> See the 'Block Lock Mode' chapter.
> 
> Lock block: 2Ah
> Unlock Block: 23h - start block - 24h - end block
> Lock tight: 2Ch
> Block Lock Status Read: 7Ah - block address

Ah, I see. Yes I remember that I have seen that before, but I was
puzzled by your per page locking question :)

> It would be nice to unlock the rw partitions only.
> But it's weird a bit:
> the mtd_partition may be incomplete before add_mtd_partitions() done.
> After add_mtd_partitions() my startap code has no handle to actual 
> partition info.
> The mtd_partition.mtdp seems only choice, though it prevents partitions 
> from registering...
> So, could couple of lines in add_mtd_partitions() do that work?

I'm not quite understanding, what your problem is.

Lock/unlock are general features and should be added to nand_base.c.
I guess the chips which have those functions can be identified and an
appropriate option flag set in the ID list, which then lets nand_scan
decide whether to fill in the lock/unlock function pointers or not.

> BTW. Can I post patches to this list?

Yes

> I've already sent one as attacment, but that message gets bounced
> "awaits moderator approval".

Thats list policy. Attachments have to be approved

tglx
