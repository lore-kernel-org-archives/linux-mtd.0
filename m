Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cglv1-0004Oo-3F
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 10:27:28 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: William J Beksi <wjbeksi@setabox.com>
In-Reply-To: <41C7F8C7.8050607@setabox.com>
References: <41C1896F.9000107@setabox.com>
	<1103530184.27708.102.camel@tglx.tec.linutronix.de>
	<41C7F8C7.8050607@setabox.com>
Content-Type: text/plain
Date: Tue, 21 Dec 2004 16:27:16 +0100
Message-Id: <1103642836.27708.234.camel@tglx.tec.linutronix.de>
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

Hi William,

can we keep this on the list please, as others are interested and we
have it in the archive so people encountering similar problems can find
it ?

On Tue, 2004-12-21 at 18:19 +0800, William J Beksi wrote:
> I can load the module, read and write images to the flash.

Strange. Did you change anything in nand_base.c ?

> >Do you expect, that the read/write/verify functions in nand_base.c will
> >work? Your IO_ADDR_R/W values are representing an I/O port address so
> >the readb/writeb macros in the generic read/write/verify functions will
> >just oops.
> >
> Sorry for the confusion. My hardware does not have any address lines. I 
> just access the ide interface directly by defining the ide1 address:
> #define IDE_IO_BASE 0x1F0
> I then use IDE_IO_BASE+1 for the write command and IDE_IO_BASE+2 for the 
> write address command.

It has addresslines :) 

You write to 0x1f0, 0x1f1 and 0x1f2. 

The CLE line of the NAND is connected to A0 (Address line 0) and the ALE
line is connected to A1 (Address line 1) of the IDE interface.

If you don't believe me, ask your hardware guy. 

> That's why I rewrote the nand_command function, leaving out the 
> hwcontrol function, and using outb directly. Is their another way to do 
> this so that it conforms with the nand api?

Implement hwcontrol function

case CLE: this->io_addr_w = IDE_IO_BASE+1; break;
case nCLE: this->io_addr_w = IDE_IO_BASE; break;
case ALE: this->io_addr_w = IDE_IO_BASE+2; break;
case nALE: this->io_addr_w = IDE_IO_BASE; break;

There is also an example in the NAND API documentation.

> Also, why do you use the writeb and readb macros instead of using 
> outb/inb directly?

Because all of the drivers in MTD/NAND use memory mapped devices, which
cannot be accessed with outb/inb. 

But, this can be implemented simply in nand_base.c with a config_switch
NAND_USE_IO_INSTR, so you can select it during compile time. I will do
that, because it makes sense.

tglx
