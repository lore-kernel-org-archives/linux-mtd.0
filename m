Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0c4P-0006eY-PL
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 03:59:07 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <0IBW007DE84BOU@mmp1.samsung.com>
References: <0IBW007DE84BOU@mmp1.samsung.com>
Content-Type: text/plain
Date: Mon, 14 Feb 2005 11:58:33 +0300
Message-Id: <1108371513.26412.7.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'Thomas Gleixner' <tglx@linutronix.de>,
	'David Woodhouse' <dwmw2@infradead.org>
Subject: Re: [RFC] adding support for OneNAND flash memory
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I wonder is the bad block handling the same in case of OneNAND?


On Mon, 2005-02-14 at 17:40 +0900, kyungmin park wrote:
> Dear,
> 
> I'm working on a MTD driver-level support for OneNAND flash memory.
> OneNAND is a new type of fusion flash memory which has a small control logic inside.
> It is connected to the CPU via NOR flash interface, but acts like NAND device.
> 
> At first, I've tried using the existing nand framework and extending it. However, due to the difference in the interfacing scheme, the existing nand framework needs to be modified heavily. 
> This is due to the fact that every NAND command is directly written to the OneNAND controller register accessed via address bus, while the data is read through specific buffer accessed via address bus and read via data bus.
> 
> E.g., write operation
> In NAND nature, basic operations are based on address/command latch enable.
> 
> 1. send start address (ALE)
> 2. send write command (CLE)
> 3. write data
> 4. send write command (CLE)
> 5. send status command (CLE)
> 6. check status
> 
> But OneNAND operations are different from NAND flash.
> The OneNAND uses register based access
> 
> 1. select DataRAM* (REG)
> 2. write data into DataRAM
> 3. write block and page to Start Address Register (REG)
> 4. write Start Buffer Register (REG)
> 5. write 0 to interrupt register (REG)
> 6. write program command to command register (REG)
> 7. wait for write completed
> 8. read controller status register (REG)
> 9. check status
> Note: (1) must happen before data input
> 
> So it's hard to apply OneNAND access method to current nand directory
> 
> Moreover,
> 
> To identify the OneNAND scheme is changed. There's no read id command.
> Just it reads from device id register (read-only).
> Also the device ids can be conflicted between NAND and OneNAND.
> 
> or this reason, I'd like to suggest adding another directory (ex. drivers/mtd/onenand) to mtd source tree for supporting OneNAND flash memory instead of modifying/extending existing nand framework.
May be it makes sense to put it to drivers/mtd/nand/onenand if some
parts of the existing code (like BBT, etc) may be reused? Possibly,
you'll need to split the existing code on what is NAND-specific and what
is OK for both OneNAND and NAND.

And one more offer: the AG-AND support has been added directly to the
nand, but seems it would be nice to separate it and put to
drivers/mtd/nand/ag-and/ stuff - because ASFAICS, some of AG-AND code
doesn't fit nicely to NAND stuff.

> 
> Comments are always welcome.
> 
> Regards,
> 
> ps. for detailed info about OneNAND, please visit the following link http://www.samsung.com/Products/Semiconductor/Flash/OneNAND_TM/512Mbit/KFG1216Q2M/KFG1216Q2M.htm
> 
> --
>  
> Kyungmin Park
> Embedded Linux Group, System Lab.
> Samsung Electronics Co., Ltd.
> E-mail: kyungmin.park@samsung.com
> Office: +82-31-200-3109
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
