Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CX012-0006Su-23
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2004 11:29:13 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Stephan Linke <Stephan.Linke@epygi.de>
In-Reply-To: <NGENJJFPMHGLPILEKKAMMEAECFAA.Stephan.Linke@epygi.de>
References: <NGENJJFPMHGLPILEKKAMMEAECFAA.Stephan.Linke@epygi.de>
Content-Type: text/plain
Date: Wed, 24 Nov 2004 17:29:06 +0100
Message-Id: <1101313746.9481.8.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-Mtd <linux-mtd@lists.infradead.org>
Subject: Re: using multile partitions on one NAND chip
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-11-24 at 15:40 +0100, Stephan Linke wrote:
> Hi,

Please fix your mail client, to 80 characters per line.
Read http://david.woodhou.se/email.html

> anyone tried using multiple partitions on a NAND flash?

Ever looked into the various drivers in drivers/mtd/nand ?

> I can't find the protection mechanism that protects lets
> say an erase on one block against a read command on the
> other block.

nand_get_chip() contains the protection.

> efficient protection for this. It looks like nand_chip->chip_lock 
> should do this job but it only protects

chip_lock is only for SMP and the lock/unlock macros contain the
preemption control if CONFIG_PREEMPT=y. The lock itself is a NOOP on UP
systems

tglx
