Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JVtp-0007MP-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 09:32:58 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6L00JCSAL1FA@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 04 Dec 2002 11:03:02 +0100 (MET)
Date: Wed, 04 Dec 2002 11:01:02 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: IF eraseall will destryed(phys) the nand flash ?
In-reply-to: 
 <Pine.LNX.4.44.0212030354100.2327-100000@structure.biochem.nchu.edu.tw>
To: shadow <saturn@structure.biochem.nchu.edu.tw>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200212041101.02598.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: 
 <Pine.LNX.4.44.0212030354100.2327-100000@structure.biochem.nchu.edu.tw>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tuesday 03 December 2002 22:42, shadow wrote:
> Hi all,
> I got an Input/Output error when I erase the nand flash. It printed these
> messages.
> -------------------------
> Erasinand_erase: attempt to erase a bad block at page 0x00000020
> ng 8 Kibyte @ 4000 --  0 % complete.
> eraseall: /dev/mtd/6: Mnand_erase: attempt to erase a bad block at page
> 0x00000030
> TD Erase failure: Input/output error
> Erasing 8 Kibyte @ 6000 --  1 % complete.
> eraseall: /dev/mtd/6: Mnand_erase: attempt to erase a bad block at page
> 0x00000040
> TD Erase failure: Input/output error
> Erasing 8 Kibyte @ 8000 --  1 % complete.
> eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
> Erased 2048 Kibyte @ 0 -- 100% complete.
> -----------------------------
>
> I found the Input/output error always occurred at the same page even if it
> is a new SMC. But I have a question, the block_size is larger than
> page_size, isn't it ? IF larger why nand driver attempt to erase a bad
> block at page 0x00000020. In my mind, I think one block includes many
>       ^^
> pages. 
512Bytes (Pagesize) * 16 (0x10) pages = 8192 Byte = Blocksize

NAND driver refuses to erase a bad blocks.
The attempt comes from eraseall, which does not know that the block is bad. 
And there is no need to know it, as the driver takes care.

So you have 3 bad blocks:
Block Nr. 2 at page 0x20 (32)
Block Nr. 3 at page 0x30 (48)
Block Nr. 4 at page 0x40 (64)

> Another problem is why the new SMC has some bad blocks and occurred
> at the same page with using eraseall program erase it. 
NAND FLASH can have factory marked bad blocks at shipping time. See datasheet.
Bad block is bad block and does not go away by erasing it. In fact you _MUST 
NOT_ erase it, as bad block information is lost and 

> Then I put this SMC  that has bad blocks into Digital Camera that can erase 
> data on the SMC. The DC Can't format it, what's up ? eraseall destroyed it 
Nope eraseall did not destroy anything. It just erased the card.
Your DC can probably use only preformatted SMC. The formatting is SmartMedia 
FAT Filesystem, which is not supported by MTD. By erasing the SMC you deleted 
the SMC FAT preformat.

> IF the SMC has some bad blocks, then how to correct it ?
Bad block is a bad block and will be a bad block all the time. NAND aware 
filesystems handle bad blocks correctly. Bad blocks just reduce the available 
storage size of your chip. Your 2MB partition has now 2MB - 3*8kB storage 
size. Don't worry about. Mount JFFS2 and see what happens.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
