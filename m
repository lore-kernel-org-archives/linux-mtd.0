Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgIbz-0005Ly-2a
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 03:09:50 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: William J Beksi <wjbeksi@setabox.com>
In-Reply-To: <41C1896F.9000107@setabox.com>
References: <41C1896F.9000107@setabox.com>
Content-Type: text/plain
Date: Mon, 20 Dec 2004 09:09:44 +0100
Message-Id: <1103530184.27708.102.camel@tglx.tec.linutronix.de>
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

On Thu, 2004-12-16 at 21:11 +0800, William J Beksi wrote:
> Hi,
> This driver includes command and select chip functions specifically for  
> accessing nand flash through an IDE port. Should be useful for anyone 
> developing and testing on a PC. It works with the latest MTD snapshot.

Works == compiles ?

Do you expect, that the read/write/verify functions in nand_base.c will
work? Your IO_ADDR_R/W values are representing an I/O port address so
the readb/writeb macros in the generic read/write/verify functions will
just oops.

It's definitely not necessary to copy the command function. Please read
the NAND API documentation and use an appropriate hw_control function
(See the address lines based example). 

tglx
