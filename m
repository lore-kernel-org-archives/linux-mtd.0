Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ckgyl-00085E-G1
	for linux-mtd@lists.infradead.org; Sat, 01 Jan 2005 05:59:28 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: William J Beksi <wjbeksi@setabox.com>
In-Reply-To: <41D6806C.8030409@setabox.com>
References: <41C1896F.9000107@setabox.com>
	<1103530184.27708.102.camel@tglx.tec.linutronix.de>
	<41C7F8C7.8050607@setabox.com>
	<1103642836.27708.234.camel@tglx.tec.linutronix.de>
	<41D4D228.7060903@setabox.com>
	<1104484693.4258.14.camel@tglx.tec.linutronix.de>
	<41D6806C.8030409@setabox.com>
Content-Type: text/plain
Date: Sat, 01 Jan 2005 11:59:21 +0100
Message-Id: <1104577162.4258.23.camel@tglx.tec.linutronix.de>
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

On Sat, 2005-01-01 at 18:50 +0800, William J Beksi wrote:

> >I still have a question. Did you modify nand_base.c ? 
> >
> No, I only add a compile time switch as you recommended because I want 
> to use outb/inb.

Can you please provide a patch for this too ?

tglx
