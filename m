Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FscLx-0001Uc-5W
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 10:16:58 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <4497BAE2.3010602@epico.si>
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
	<1150787336.6780.102.camel@localhost.localdomain>
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>
	<4497A723.2070006@epico.si>
	<1150790417.6780.107.camel@localhost.localdomain>
	<4497BAE2.3010602@epico.si>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 11:18:13 +0200
Message-Id: <1150795093.6780.117.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-20 at 11:07 +0200, Savin Zlobec wrote:
> I've put the kernel with latest mtd on my board and got the following:
> 
> Nand is recognized as 'NAND device: Manufacturer ID: 0x98, Chip ID: 0x75 
> (Toshiba NAND 32MiB 3,3V 8-bit)',
> should be 'NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung 
> NAND 32MiB 3,3V 8-bit)'.
> 
> No bad blocks are detected at initial nand scan, but when running 
> flash_eraseall all blocks are found bad.

Hmm. The interface has not changed, AFAICT. What version of
flash_eraseall are you using and which commandline options ?

Can you verify with the latest mtd-utils from 

http://git.infradead.org/?p=mtd-utils.git;a=summary

Thanks,

	tglx
