Received: from [67.15.60.3] (helo=mail.aftek.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E2kJj-0006X2-BX
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 02:44:05 -0400
Message-ID: <42F9A319.2050802@aftek.com>
Date: Wed, 10 Aug 2005 12:17:53 +0530
From: Mohan V <mohanv@aftek.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Query regarding FS on iDOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

I am using a DiskOnChip IDE Pro for an embedded project and linux-2.4.31 
kernel. I came to know from the 
http://www.m-sys.com/site/en-US/Products/DiskOnChip/DiskOnChip/Products/Modular/iDiskOnChip.htm 
that "iDiskOnChip or "DiskOnChip IDE Pro" offers built-in block device 
emulation without any software drivers".
I wanted to use JFFS2 on "DiskOnChip IDE Pro", while JFFS2 is used only 
for MTD. How can the kernel read "DiskOnChip IDE Pro" as an MTD device?
Also, can I know which Filesystem is recommended to be used with the 
DiskOnChip IDE Pro? How efficient is EXT2 filesystem on DiskOnChip IDE 
Pro in terms of speed, size, reliability and maintainance?

Thanks in advance.

Mohan V.
