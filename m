Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQiXw-0008Sq-2G
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 05:09:29 -0400
Message-ID: <426F56C1.6020204@ipi.ac.ru>
Date: Wed, 27 Apr 2005 13:09:21 +0400
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <426F40A3.8010308@ipi.ac.ru>
	<1114592403.879.175.camel@tglx.tec.linutronix.de>
In-Reply-To: <1114592403.879.175.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand locking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> On Wed, 2005-04-27 at 11:34 +0400, Timofei V. Bondarenko wrote:
> 
>>Is there a straight way to lock/unlock nand pages?
>>
> 
> You talk about "the nand chip". Which chip is it exactly and what makes
> you believe that it has a per page locking feature ?

Samsung k9f5608u0c-d

http://www.samsung.com/Products/Semiconductor/Flash/NAND/256Mbit/K9F5608U0C/K9F5608U0C.htm

http://www.samsung.com/Products/Semiconductor/Flash/NAND/256Mbit/K9F5608U0C/ds_k9f5608u0c_rev32.pdf

See the 'Block Lock Mode' chapter.

Lock block: 2Ah
Unlock Block: 23h - start block - 24h - end block
Lock tight: 2Ch
Block Lock Status Read: 7Ah - block address

I'm really using that chip and could provide some code.
The chip is locked at power on.
So i'm checking the locking status at startup and then unlocking it
(using range of pages).

It would be nice to unlock the rw partitions only.
But it's weird a bit:
the mtd_partition may be incomplete before add_mtd_partitions() done.
After add_mtd_partitions() my startap code has no handle to actual 
partition info.
The mtd_partition.mtdp seems only choice, though it prevents partitions 
from registering...
So, could couple of lines in add_mtd_partitions() do that work?

BTW. Can I post patches to this list?
I've already sent one as attacment, but that message gets bounced
"awaits moderator approval".

Regards.
	Timofei.
