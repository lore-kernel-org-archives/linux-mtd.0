Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnBYz-00051M-8M
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2004 03:30:58 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Moreshwar Salpekar <moreshwars@hotmail.com>
In-Reply-To: <BAY18-DAV3K2kXqbpZd000480c0@hotmail.com>
References: <BAY18-DAV3K2kXqbpZd000480c0@hotmail.com>
Content-Type: text/plain
Message-Id: <1090395097.6864.22.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Wed, 21 Jul 2004 09:31:37 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Regarding NAND MTD Driver Help Required
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-20 at 08:00, Moreshwar Salpekar wrote:
> Dear All,
> I am new to this list. I have just gone through the latest code and
> documentation of NAND Flash MTD Driver. I am facing certain problems in
> understanding this code as I need to modify this code for my board. I would
> like somebody to help me understand this code. The problems are as follows:
> 1. The code on this site and documentation is different from source code of
> mtd in drivers/mtd/nand even in kernel version 2.6.7. The following files
> are specifically different:
> The code in Linux source includes nand.c here I think it is nand_base.c,
> there is no file nand_ids.c in Linux source.
> 
> 2. Which version of kernel is this code applicable to ?

linux-2.6.8-rc2

> 3. What is the latest stable version of this code? What about snapshots in
> this code

mtd-cvs

http://linux-mtd.infraded.org

> 4. What are the bus widths of NAND flash supported (code in kernel supports
> 8-bit but your version lists a constant BUSWIDTH_16 which I think implies
> that 16-bit bus width is supported)? I need to support 8 and 16 bit right
> now. What are the bus other options that may be set in the nand_flash_dev
> structure
> 5. Does the code support GPIO mode of addressing or Address lines? The code
> uses register to control ALE, CLE and nCE signals and uses another register
> (IO_ADDR) to driver date lines. I think this implies that GPIO or some other
> IO pins are being used to drive ALE, CLE and nCE rather than
> microprocessor/microcontroller driving these signals. I think that this
> could slower down the operation of NAND Flash if software drives the
> operation.
> 6. What is SPIA board as mentioned in codes? I want to check how is the NAND
> flash connected to microprocessor/ microcontroller as I may need to modify
> the code to suit my requirements (addressing mode).
> 7. If anybody has whole code that is based on addressing lines please give
> me the same.
> 

READ the DOCUMENTATION, which is clear enough to answer the questions.
I'm not going to rephrase whats in there.

The source code of the various board support drivers in drivers/mtd/nand
gives you enough examples how to use that code.

tglx
