Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QTYct-0003BL-Um
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 12:09:48 +0000
Message-ID: <4DECC41F.5060808@free-electrons.com>
Date: Mon, 06 Jun 2011 14:12:15 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: impact of 2X_PROGRAM on read operations
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have been trying to understand what does the 2X_PROGRAM configuration
(and the IS_2PLANE macro).
At first, I was confused to see that, in onenand_command(), when the
command is "READ", the IS_2PLANE macro modifies the block and page
address. I was expecting this option only to affect program operations.
Then, after seeing jffs2 not finding its magic bitmask after switching
the 2X_PROGRAM configuration off, I understood that, since the 2X
Program only programs one OOB for two blocks, the read operations had to
be impacted anyway.

So, is the following right/almost/wrong ?
Let the size of physical pages/block sizes be 2KiB/128KiB
A filesystem on top of a 2X_PROGRAM-enabled mtd layer sees 4KiB-big
pages. When this FS wants to read one 4KiB page, the mtd layer will read
2KiB pages, two times. The layout of the blocks and pages is:


       Even plane           Odd plane
+--------------------+--------------------+
|        page 0      |  page 1   (oob 0&1)| <---  one logical page
|        page 2      |  page 3   (oob 2&3)|    as seen by a filesystem
|        page 4      |  page 5   (oob 4&5)|
|          .         |          .         |
|          .         |          .         |
|          .         |          .         |
| (Block 0)          | (Block 1)          |
+--------------------+--------------------+
|       page 128     | page 129 (oob)     |
|          .         |          .         |
|          .         |          .         |
|          .         |          .         |
| (Block 2)          | (Block 3)          |
+--------------------+--------------------+

(the page number is not the one that would be computed within
onenand_command but indicates the order in which pages get read or
programmed.)



Is there a way to safely read without 2X_PROGRAM enabled once it has
been flashed with a 2X_PROGRAM-enabled flasher (e.g. patched u-boot).


Regards,
David Wagner.
-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
