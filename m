Received: from web25006.mail.ukl.yahoo.com ([217.12.10.42])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRGvH-0005Db-12
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2004 16:19:36 -0500
Message-ID: <20041108211932.34600.qmail@web25006.mail.ukl.yahoo.com>
Date: Mon, 8 Nov 2004 21:19:32 +0000 (GMT)
From: Chan Siu Ming <namely_void@yahoo.co.uk>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Getting mtd to work with IBM Evaluation boards (Ebony/Walnut)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I'm trying to get mtd to work with IBM Walnut and
Ebony PPC evaluation boards. I tried with mtd CVS
from 2004.11.03 and Linux 2.6.9, but seem to have
some problems. Here's first what I did do with 
success:
* patched kernel with CVS mtd and compiled it, 
  everything into the kernel - no modules. I'm
  not quite sure what I should have enabled in
  the config, but I guess these boards have CFI
  AMD chips in them.
* populated /dev with the MAKEDEV in mtd tree
* compiled the mtd utils
My problems are:
* There doesn't seem to be a map for Walnut boards,
  anyone has got one?
* Ebony can read from the flash well, but cannot
write.
  Flash_info says: "0 erase regions". Flash_unlock and
  all write attemps fail, when trying to open the
  device in O_RDWR or O_WRONLY mode. What might be
  the problem?
Tested the physical ram test device on Walnut (mapped
to the boards SRAM at 0xFFF00000) and that worked
fine.

Thanks for any help.


  


	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun! http://uk.messenger.yahoo.com
