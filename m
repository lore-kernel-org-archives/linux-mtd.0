Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvl75-0007A4-AI
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 18:37:48 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Alex <pevnev@juno.com>
In-Reply-To: <20050131.152934.3938.46960@webmail21.lax.untd.com>
References: <20050131.152934.3938.46960@webmail21.lax.untd.com>
Content-Type: text/plain
Date: Tue, 01 Feb 2005 00:37:43 +0100
Message-Id: <1107214664.21196.362.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, bjorn.wesen@axis.com,
	linux-mtd@lists.infradead.org
Subject: Re: Question re initiliazation of MTD NAND flash
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-31 at 23:28 +0000, Alex wrote:
> Well..., it appears that I have put wrong value for CONFIG_MTD_PHYSMAP_LEN
>  ... but what should be done to indicate that 
> I want two banks (partitions) out of MTD flash each of 8Mb length ?
> - or should I at this point put there the total length,
> which is 16 MB ? ... deal with partioning later ?
> 
> Is there any documentation (or how to) on this?
>   (obviously I am doing it first time ... ;-) ).
> 

CONFIG_MTD_PHYSMAP_START is the physical address of your NOR FLASH
CONFIG_MTD_PHYSMAP_LEN is the size of your NOR FLASH in bytes

You can enable commandline partition parsing and provide the partition
info on the kernel commandline. There is some "documentation" in the
code. :)

Another option is to write our own board driver (by copying one which
fits your needs closely and tweaking it for your board)

NAND is a different beast. You will have to write a board driver (same
procedure as above), but there's some documentation available.
See http://www.linux-mtd.infradead.org/tech/mtdnand/index.html

tglx
