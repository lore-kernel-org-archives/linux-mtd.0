Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwhFc-0006FP-HD
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2004 09:10:14 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Ian Molton <spyro@f2s.com>
In-Reply-To: <20040816013933.163a101d.spyro@f2s.com>
References: <20040816013933.163a101d.spyro@f2s.com>
Content-Type: text/plain
Message-Id: <1092661877.4354.10.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Mon, 16 Aug 2004 15:11:17 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Support of stupid devices
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-08-16 at 02:39, Ian Molton wrote:
> Hi.
> 
> Im porting linux to the toshiba e7xx and 8xx PDAs
> which contain a nand flash controller.
> Im not certain, but it appears the controllerhas an
> odd quirk meaning byte-reads of the data register
> dont work as the linux mtd code expects.
> 
> AFAICT if I read a word (after issuing a chipid command) I get:
> 
> 0xYYZZ75ec   -- this is good - Samsung, 32MB device.
> 
> if I do two byte reads I get 0xec 0xec.
> 
> a halfword access gets me 0xYYZZ.
> a misaligned (by one byte) word access gives me 0xecYYZZ75, 

Sounds really stupid :)

> but this fails to work for byte accesses. halfword misaligned
> accesses are just weird.
> so basically, the only way to read the chipid is to do:
> a word access to the data reg and then shift the data out
> or
> a word access (and mask off the high 3 bytes followed by a
> misaligned word access and mask off the upper 3 bytes.
> clearly the former solution is the better one, but this 
> doesnt fit in the nand driver model very well 
> (read_byte() et.al.)

You can provide your own read_byte() et. al. functions which do all the
magic. Look into the other Toshiba nand driver implementations. They do
the same. I don't have the header files which implement the real access
but Alice should be a source of help.

> the chip is a TC6393XB (system on chip) and the flash 
> is a samsung K9F5608UOC YCBO

tglx


> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
