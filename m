Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13oOUE-0004BW-00
	for mtd-list@infradead.org; Wed, 25 Oct 2000 12:12:50 +0100
Received: from cvsftp.cotw.com ([208.242.241.39] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13oOUB-0004BQ-00
	for mtd@infradead.org; Wed, 25 Oct 2000 12:12:48 +0100
Message-ID: <39F6C295.4F18B65D@cotw.com>
Date: Wed, 25 Oct 2000 06:23:01 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
MIME-Version: 1.0
To: Qiuyuan Liu <qliu@neontech.com>
CC: mtd@infradead.org
Subject: Re: What's NAND Flash? and What's NOR Flash?
References: <NEBBIEMEALBHLOIINDCNMEJNCAAA.qliu@neontech.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Qiuyuan Liu wrote:
> 
> Or could you tell me where to find the answers? I tried google.com and don't
> get satisfactory results.
> 
Flash, in general, is a high-speed EEPROM where you program and erase
BLOCKS of data at a time whereas with normal EEPROM you usually have
to erase the entire device all at once but you can program/write single
bytes at a time.

NOR flash is a linear addressed device with individual data and address
lines just like a DRAM chip would have. It can directly mapped into the
CPU's address space and accessed just like it was a ROM memory. It's
program and erase speeds are fairly quick with erases taking the longest.

NAND flash is a non-linear addressed device where the data and commands
are multiplexed onto 8 I/O lines into the flash chip. NAND has the
advantage of only requiring a few bytes of the CPU's memory map but at
the expense of more complicated device drivers.

NAND flash is an order of magnitude faster or more than NOR for erase
and program operations. However, NAND devices may ship with bad blocks
from the factory and over time blocks will fail. You must do some sort
of bad block management to handle this. NOR flash does not ship with
bad blocks and is simpler to utilize. The bit densities of NAND are also
greater than NOR flash.

Here are a couple of URLs:

Excellent explanation of NAND technology -
                 http://www.datalight.com/flashwp.htm

Great page for looking up technology definitions -
                 http://www.pcwebopedia.com/

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
