Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CkgqI-0007vF-Er
	for linux-mtd@lists.infradead.org; Sat, 01 Jan 2005 05:50:44 -0500
Message-ID: <41D6806C.8030409@setabox.com>
Date: Sat, 01 Jan 2005 18:50:20 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41C1896F.9000107@setabox.com>	
	<1103530184.27708.102.camel@tglx.tec.linutronix.de>	
	<41C7F8C7.8050607@setabox.com>	
	<1103642836.27708.234.camel@tglx.tec.linutronix.de>	
	<41D4D228.7060903@setabox.com>
	<1104484693.4258.14.camel@tglx.tec.linutronix.de>
In-Reply-To: <1104484693.4258.14.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] command function for nand flash through IDE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>Can you please provide patches for Makefile and
>KConfig too ?
>  
>
Sure, no problem.

>I still have a question. Did you modify nand_base.c ? 
>
No, I only add a compile time switch as you recommended because I want 
to use outb/inb.

>What ARCH/Platform
>are you using ?
>  
>
i386
-- 
William
