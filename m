Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQhSv-00082q-HQ
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 04:00:14 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
In-Reply-To: <426F40A3.8010308@ipi.ac.ru>
References: <426F40A3.8010308@ipi.ac.ru>
Content-Type: text/plain
Date: Wed, 27 Apr 2005 11:00:03 +0200
Message-Id: <1114592403.879.175.camel@tglx.tec.linutronix.de>
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

On Wed, 2005-04-27 at 11:34 +0400, Timofei V. Bondarenko wrote:
>
> Is there a straight way to lock/unlock nand pages?
> 
> The nand_scan() does "mtd_info->lock = NULL;" unconditionally,
> though the nand chip is capable of locking.

I'm not aware of page locking features in NAND chips. The only locking
I'm aware of is the write protection pin, which protects the whole chip.

You talk about "the nand chip". Which chip is it exactly and what makes
you believe that it has a per page locking feature ?

tglx
