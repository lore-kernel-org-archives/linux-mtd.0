Received: from [88.247.191.72] (helo=avrupayazilim.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hl4wD-00047B-BF
	for linux-mtd@lists.infradead.org; Mon, 07 May 2007 11:15:50 -0400
Message-ID: <463F41C2.6060108@avrupayazilim.com>
Date: Mon, 07 May 2007 18:12:02 +0300
From: Mete Kart <mete.kart@avrupayazilim.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: yaffs2 image
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a problem with creating YAFFS2 image on linux system.
On my debian-linux with kernel 2.6.11.7 I have the following tool: 
"mkyaffs2image"
I use this tool and create an image but this tool does not get any 
variable such as page size or erase size.
Anyway I have a large page size NAND flash and after creating the image, 
"nandwrite" gives an error: "wrong page size".
How can I create an YAFFS2 image according to my desired (large page) 
conditions?

Thanks.
 
Note: I have succesfully create and write JFFS2 file system to my large 
page NAND flash.
I create JFFS2 file system with mkfs.jffs2 command.
