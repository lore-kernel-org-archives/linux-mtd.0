Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CkIvM-00052n-4E
	for linux-mtd@lists.infradead.org; Fri, 31 Dec 2004 04:18:21 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: William J Beksi <wjbeksi@setabox.com>
In-Reply-To: <41D4D228.7060903@setabox.com>
References: <41C1896F.9000107@setabox.com>
	<1103530184.27708.102.camel@tglx.tec.linutronix.de>
	<41C7F8C7.8050607@setabox.com>
	<1103642836.27708.234.camel@tglx.tec.linutronix.de>
	<41D4D228.7060903@setabox.com>
Content-Type: text/plain
Date: Fri, 31 Dec 2004 10:18:13 +0100
Message-Id: <1104484693.4258.14.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] command function for nand flash through IDE
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-12-31 at 12:14 +0800, William J Beksi wrote:
> Thomas Gleixner wrote:
> 
> > Implement hwcontrol function
> >
> >case CLE: this->io_addr_w = IDE_IO_BASE+1; break;
> >case nCLE: this->io_addr_w = IDE_IO_BASE; break;
> >case ALE: this->io_addr_w = IDE_IO_BASE+2; break;
> >case nALE: this->io_addr_w = IDE_IO_BASE; break;
> >
> >There is also an example in the NAND API documentation.
> >  
> >
> Hi Thomas,
> I've implemented the hwcontrol function as per the NAND API 
> documentation. I did not use the ioremap because the i/o port addresses 
> 170-17F and 1F0-1FF are reserved for the IDE controller. I've spent the 
> last week testing this driver and I hope it can be commited to the cvs 
> if you find it useful.
> 

Hi William,

looks better now. Can you please provide patches for Makefile and
KConfig too ?

I still have a question. Did you modify nand_base.c ? What ARCH/Platform
are you using ?

tglx
