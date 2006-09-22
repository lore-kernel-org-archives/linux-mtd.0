Received: from mx1.myoutlookonline.com ([69.25.74.59])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GQn83-000068-6q
	for linux-mtd@lists.infradead.org; Fri, 22 Sep 2006 16:39:51 +0100
From: "Ajay Jain" <ajain@neomagic.com>
To: <linux-mtd@lists.infradead.org>
Subject: Nand Flash write fails
Date: Fri, 22 Sep 2006 21:09:20 +0530
Message-ID: <04c001c6de5d$46f73a10$561fa8c0@pcajain>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Reply-To: ajain@neomagic.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

I have set up a JFFS2 partition on my NAND flash. The board driver in
question is my own. I can successfully 'mkfs' & 'mount' that partition.
However when I start copying any file to it, it gives the following
error.

nand_write_ecc: vectored attempt to write not page aligned data: to =
20b9e4, total_len =       44
Write of 68 bytes at 0x0000b9e4 failed. returned -22, retlen 0
Not marking the space at 0x0000b9e4 as dirty because the flash driver
returned retlen zero

I was looking up the code of the mtd nand layer. I see that in case the
data is not alligned on the page boundary, it returns back giving this
error. Therefore my question is that is it the responsibility of the
"jffs2 layer" or "mtd" layer to issue writes that are aligned to page
boundary. 
ANY suggestions are welcome.

Thanks.
