Received: from mail.milliontech.com ([210.17.151.186])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATfwD-0003tp-A5
	for <linux-mtd@lists.infradead.org>; Tue, 09 Dec 2003 11:21:57 +0000
Received: from milliontech.com ([192.168.168.70])
	by mail.milliontech.com (8.11.6/8.11.6) with ESMTP id hB9BK7n22191
	for <linux-mtd@lists.infradead.org>; Tue, 9 Dec 2003 19:20:07 +0800
Message-ID: <3FD5B024.5050808@milliontech.com>
Date: Tue, 09 Dec 2003 19:21:08 +0800
From: Martin Chan <martinc@milliontech.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: IPL block is bad on DiskOnChip 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I have successfully DFORMATted my MD2202-D64 today, and try to install a
jffs2 file system to it.
I created a root.jffs2 using mkfs.jffs2 and tried both "cp root.jffs2
/dev/mtd0" and "dd if=root.jffs2 of=/dev/mtdblock0", but I still can't
"mount -t jffs2 /dev/mtdblock0 /mnt". (Yes, I know I missed the "erase"
command after I check the HowTo again.)

When I want to start again with dformat, I get "/ERROR - IPL block is bad."

I searched from google and I found Tim has the same problem but seems
has no solution.

Does anyone know a solution to this?
/
Thanks,
Martin

Message posted by Tim:
http://lists.infradead.org/pipermail/linux-mtd/2003-August/008476.html
>/ >When I use the DOC5.1.4 DOS utilities' /
>/ >DFORMAT /WIN:DC00 /S:DOC514.EXB /FIRST /
>/ > /
>/ >ERRORS
/>/ >
/>/ >DiskOnChip 2000 found in 0xdc000. /
>/ >64M media, 16K unit
/>/ >Virgin card rebuilding unit map.
/>/ >Media has been scanned /
>/ >ERROR - IPL block is bad.
/>/ >Error formatting DiskOnChip.
/>/ >Status code is 119 (flUnknow status) received from /
>/ >flFormatPhysicalDrive. Format failed. /
>/ >
/>/ >What's the matter with it? /
