Received: from web58901.mail.re1.yahoo.com ([66.196.100.230])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L7Yxt-0002iJ-5d
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 17:23:13 +0000
Date: Tue, 2 Dec 2008 09:23:05 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: setting PAD parameter with JFFS2 and NAND -- what is correct thing to
	do ?
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <461019.6371.qm@web58901.mail.re1.yahoo.com>
Reply-To: Philip Rakity <prakity@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I am trying to understand what value to set the pad parameter to when making a JFFS2 image (including using sumtool) for NAND flash.

The NAND flash has 2KiB sectors, 256KiB erase size, and is 2GB.  

I use flase_eraseall -j when erasing the flash and the flash HAS bad blocks.  

The image size is less than the 2GB size of the flash.

I have tried both specifying pad (rounded up) to the erase block size and omitting pad.  When I write to the NAND there are recovered CRC errors from time to time as well as the other "errors" indicated in the FAQ.

If could set pad to the SIZE of the NAND flash, but because of bad blocks I am not sure this is correct...

Guidance Please.

Philip


      
