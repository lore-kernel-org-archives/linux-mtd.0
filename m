Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6lh7-00055Z-S0
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 03:28:30 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Kevin Liao <kevinliao@wellsyn.com>
In-Reply-To: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
References: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 09:28:25 +0100
Message-Id: <1109838505.5398.3.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: compile error (undefined reference to jffs2_getlink) for
	kernel 2.4.26
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-03 at 12:52 +0800, Kevin Liao wrote:
> I use the snapshop 20050302 to patch kernel 2.4.26 for ARM. I get the 
> following
> error messages when I try to "make zImage":
> 
> fs/fs.o(.text+0x37944): In function `jffs2_readlink':
> : undefined reference to `jffs2_getlink'
> fs/fs.o(.text+0x3799c): In function `jffs2_follow_link':
> : undefined reference to `jffs2_getlink'
> drivers/mtd/mtdlink.o(.text+0x5f28): In function 
> `cfi_intelext_partition_fixup':
> : undefined reference to `__ffs'
> 
> I find this function "jffs2_getlink" should be in jffs2/read.c but it's does 
> not
> exist. Should I wait for later snapshop or I can fix it manuly? Thank a lot!

Read http://www.linux-mtd.infradead.org/#kernelversions 

tglx
