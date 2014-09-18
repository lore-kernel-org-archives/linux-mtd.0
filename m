Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUWgE-0006AN-HC
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 08:03:07 +0000
Date: Thu, 18 Sep 2014 10:02:35 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Robert Hurdle <RHurdle@Rugged.com>
Subject: Re: Question about adding a NAND device
In-Reply-To: <5498E86A4A68B14A8A06D0380640D04A01FA6854E73D@atca01em01.adsi.aitech.ent>
Message-ID: <alpine.DEB.2.02.1409180954450.15431@lnxricardw1.se.axis.com>
References: <5498E86A4A68B14A8A06D0380640D04A01FA6854E73D@atca01em01.adsi.aitech.ent>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 17 Sep 2014, Robert Hurdle wrote:

> Hello,
>
> 	I have ported some of u-boot to our board, and I am booting successfully from EEPROM.
> 	I am now in the process of adding the NAND and flash file system support for our non-standard
> 	flash interface (there's an FPGA interface between the software and the 1 giga-byte NAND) to
> 	u-boot and also to the Linux kernel.  In addition, it is our intention to support UBIFS on our board.
>
> 	It appears that I need to understand how the structures mtd_info and nand_chip (and whatever
> 	they point at) and code in nand_base.c work, in order to provide working routines at the NAND
> 	level.  I have looked at some of the files in u-boot/drivers/mtd/nand for other boards, and see
> 	a wide variety of models, no doubt based on the hardware differences.   Because of our FPGA
> 	interface, I need to have all commands to the NAND chip get re-packaged into commands that
> 	get passed to the FPGA.  Am I on the right path?
>
> 	My other question is how long would one guess that this task would take for someone fairly
> 	competent, but uninitiated in UBIFS, UBI, MTD, NAND, etc. ?

It's very hard to predict any form of time frame, especially when not 
knowing much about the hardware.

If your FPGA basically just passes data between the CPU and flash on a 
byte-by-byte level, then you can probably take some simple driver and 
rewrite that. If the FPGA contains a more advanced NAND flash controller, 
which performs ECC, or does something else on a higher level you need to 
study the way nand_base.c goes about things and also of course the 
controller implementation in the FPGA.

Basically, mtd was originally written with a byte-by-byte interface in 
mind. So that case is fairly easy to implement: your driver will just have 
to be able to send data to and read from the flash via FPGA (in this 
case), and also control the NAND flash CLE and ALE lines, as well as read 
the READY/BUSY line from the flash. All command sequencing, data transfer 
and ECC will be handled in software by the mtd layer.

For more advanced cases, there are numerous hooks which can be used where 
the NAND flash controller accelerate specific functions. In my experience 
though it requires a lot more understanding of exactly how nand_base.c 
goes about things, and there is often more than one way to implement the 
required functionality. Looking at driver code for other NAND flash 
controllers also helps.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
