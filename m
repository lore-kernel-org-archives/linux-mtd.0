Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDJTd-0004G5-UO
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2004 09:41:05 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
 linux-mtd@lists.infradead.org
Date: Tue, 13 Apr 2004 10:36:43 +0200
References: <01139FC052A0D411900B00508B9535FC13AC402D@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC13AC402D@ZCH07EXM04.corp.mot.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404131036.43038.tglx@linutronix.de>
Subject: Re: Bad block check and ECC for NAND flash bootloader
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 13 April 2004 09:56, Shen Aaron-r62966 wrote:
> Hi friends,
>
>   Can anyone give me some advice on 8 bit NAND flash bootloader?
>
>   I'm going to add "bad block checking" and "ECC" for my current NAND flash
> bootloader. The current bootloader is divided into two parts: ipl is placed
> in the first 2k of NAND flash and spl is placed from 0x4000 to 0x100000.
> And there's no function to check bad block and do ECC now.
>
>   For ipl, my idea is to read OOB to check bad block per block before
> copying spl from NAND flash to SDRAM.
>
>   For spl, I'd like to add the same function to check bad block before
> erasing a block and also before copying kernel from NAND flash to SDRAM.
> And add ECC code after program data into the flash.
>
>   Is that enough? Is there anything missed or wrong? I'm eager to get such
> an existing solution for reference. Looking forward to your advice, and any
> information about bad block checking and ECC for NAND flash is welcome!

Bad block checking depends on the chip type you are using. 

The chips with small page size (256/512 byte) usually have the bad block 
marker at the first page of the block in the oob area at offset 5.
The chips with large page size (2048 byte) usually have the bad block marker 
at the first page of the block in the oob area at offset 0.
If this byte reads != 0xff then the block is marked bad.

Look at drivers/mtd/nand/nand_ecc.c

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
