Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JVLf-0007Ga-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 08:57:39 +0000
Received: from localhost (saturn@localhost)
	by structure.biochem.nchu.edu.tw (8.11.6/8.11.6) with ESMTP id gB3LgC204915
	for <linux-mtd@lists.infradead.org>; Wed, 4 Dec 2002 05:42:12 +0800
Date: Wed, 4 Dec 2002 05:42:12 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: linux-mtd@lists.infradead.org
Subject: IF eraseall will destryed(phys) the nand flash ?
Message-ID: <Pine.LNX.4.44.0212030354100.2327-100000@structure.biochem.nchu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi all,
I got an Input/Output error when I erase the nand flash. It printed these 
messages.
-------------------------
Erasinand_erase: attempt to erase a bad block at page 0x00000020
ng 8 Kibyte @ 4000 --  0 % complete.
eraseall: /dev/mtd/6: Mnand_erase: attempt to erase a bad block at page 
0x00000030
TD Erase failure: Input/output error
Erasing 8 Kibyte @ 6000 --  1 % complete.
eraseall: /dev/mtd/6: Mnand_erase: attempt to erase a bad block at page 
0x00000040
TD Erase failure: Input/output error
Erasing 8 Kibyte @ 8000 --  1 % complete.
eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
Erased 2048 Kibyte @ 0 -- 100% complete. 
-----------------------------

I found the Input/output error always occurred at the same page even if it 
is a new SMC. But I have a question, the block_size is larger than 
page_size, isn't it ? IF larger why nand driver attempt to erase a bad 
block at page 0x00000020. In my mind, I think one block includes many 
      ^^
pages. Another problem is why the new SMC has some bad blocks and occurred 
at the same page with using eraseall program erase it. Then I put this SMC 
that has bad blocks into Digital Camera that can erase data on the SMC. 
The DC Can't format it, what's up ? eraseall destroyed it ?

IF the SMC has some bad blocks, then how to correct it ?

thanks in advance,

Brian

      
