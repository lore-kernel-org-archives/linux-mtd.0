Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQjld-0000kg-Vl
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 06:27:43 -0400
Message-ID: <426F691D.50905@ipi.ac.ru>
Date: Wed, 27 Apr 2005 14:27:41 +0400
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <426F40A3.8010308@ipi.ac.ru>	
	<1114592403.879.175.camel@tglx.tec.linutronix.de>	
	<426F56C1.6020204@ipi.ac.ru>
	<1114598706.879.185.camel@tglx.tec.linutronix.de>
In-Reply-To: <1114598706.879.185.camel@tglx.tec.linutronix.de>
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
>>It would be nice to unlock the rw partitions only.
>>But it's weird a bit:
>>the mtd_partition may be incomplete before add_mtd_partitions() done.
>>After add_mtd_partitions() my startap code has no handle to actual 
>>partition info.
>>The mtd_partition.mtdp seems only choice, though it prevents partitions 
>>from registering...
>>So, could couple of lines in add_mtd_partitions() do that work?
> 
> 
> I'm not quite understanding, what your problem is.
> 
> Lock/unlock are general features and should be added to nand_base.c.
> I guess the chips which have those functions can be identified and an
> appropriate option flag set in the ID list, which then lets nand_scan
> decide whether to fill in the lock/unlock function pointers or not.

An easy problem: I'm looking for the simplest way to protect
read-only mtd partitions by hardware lock.
The current nand_base seems lack of this feature.
Should i hack the nand_base? Or is there a correct workaround?

>>I've already sent one as attacment, but that message gets bounced
>>"awaits moderator approval".
> 
> Thats list policy. Attachments have to be approved

It awaits since 18 Apr - longer than a week... is it ok?
Are there other ways to submit a patch? (a small bugfix to cmdlinepart).
AFAIK, placing diffs into message text is not welcomed too.

Thanks.
	Timofei.
