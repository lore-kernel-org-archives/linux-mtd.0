Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeEtr-0006Xl-AD
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 11:52:16 -0500
Message-ID: <4381FB55.5080001@mw-itcon.de>
Date: Mon, 21 Nov 2005 17:52:37 +0100
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: How to decrease the delay to flush write buffer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am using jffs2 on Atmel dataflash. I encounter sometimes errors like 
"Empty flash at 0x004a7814 ends at 0x004a79c0" and "read_dnode: header 
CRC failed on node at 0x63d670: read 0xffffffff, calculated 0x8f83d3bc".
My guess at the moment is, that this happens at unclean reboots (power 
off), where the write buffer is not flushed. For dataflash 
CONFIG_JFFS2_FS_WRITEBUFFER is mandatory.

For my purpose this would be avoided more or less completely, if the 
write buffer would be flushed after a delay of some 100 ms instead of 
some seconds. How can I reduce this timer?

Best regards
Peter



-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
