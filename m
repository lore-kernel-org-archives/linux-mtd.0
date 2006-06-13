Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqAGO-0001kL-O3
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 15:53:07 +0100
Subject: Re: cat file > /dev/mtd0 works but after position 512
From: Thomas Gleixner <tglx@linutronix.de>
To: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
In-Reply-To: <448EC58D.8010608@artecdesign.ee>
References: <448EC58D.8010608@artecdesign.ee>
Content-Type: text/plain
Date: Tue, 13 Jun 2006 16:53:42 +0200
Message-Id: <1150210422.5257.333.camel@localhost.localdomain>
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

On Tue, 2006-06-13 at 17:02 +0300, Indrek Kruusa wrote:
> Hi!
> 
> I have Samsung 64 MB NAND behind cs553x flash controller - therefore 
> cs553x_nand driver.
> cat file > /dev/mtd0 works reportedly (with page aligned file). But 
> after board reboots the flash is empty.
> 
> dd ... bs=512 seek=1 of=/dev/mtd0  works and content stays in flash 
> after reboot too (it works I mean :) )
> 
> I am debugging my own changes in cs553x_nand driver so it is up to me of 
> course. But can this behavior be explained in other way than nand driver 
> bug? Broken BIOS/board?

http://www.linux-mtd.infradead.org/faq/nand.html

	tglx
