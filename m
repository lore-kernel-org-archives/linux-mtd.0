Received: from f16.mail.ru ([194.67.57.46])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SxqK-0004f8-68
	for <linux-mtd@lists.infradead.org>; Thu, 19 Jun 2003 12:44:40 +0100
Received: from mail by f16.mail.ru with local
	id 19Sxql-000NOk-00
	for linux-mtd@lists.infradead.org; Thu, 19 Jun 2003 15:45:07 +0400
From: "=?koi8-r?Q?=F7=CC=C1=C4=C9=CD=C9=D2=20=F3=CF=D2=CF=CB=C9=CE?="
	<vavanchick38@mail.ru>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Date: Thu, 19 Jun 2003 15:45:07 +0400
Message-Id: <E19Sxql-000NOk-00.vavanchick38-mail-ru@f16.mail.ru>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
Subject: None
Reply-To: =?koi8-r?Q?=F7=CC=C1=C4=C9=CD=C9=D2=20=F3=CF=D2=CF=CB=C9=CE?=
	<vavanchick38@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi, all.

First of all, sorry for bad english (There is a first practice).

I have some problem with writing on DiskOnChip. 
I'll be grateful for your help.

The full story:
I use linux as embaded system on DiskOnChip. System must be reliable and 
therefore it has a WhatchDog timer, that reboots the system if was not 
refreshed in 1,6 sec.
At the begining I didn't know about MTD project, and
successfully used TrueFFS driver from M-System and minix fs. But now there is a task
to write on DiskOnChip some emergency protocol.
If I try to make mount or write operations on DiskOnChip,
the program which making refresh WatchDog is stops 
(I think that at this time TrueFFS driver working in kernel mode) 
and system is rebooting. 
This situation is take place only in case of large amount of logically 
filled sectors (amount of logically free sectors is near zero).

So I try to find some alternative driver to compare perfomance.
May you can tell me if there is the same problem with MTD driver?
If there is, just write here and do not read further.


I desided to make comparison of performance by myself but that is
not as easy as I thought. :)

Currently I use 2.2.11 kernel so I desided do not pass to 2.4.x and download 2.2.18
kernel and patch for it from ftp://ftp.infradead.org/pub/mtd/patches.

Firstly under new kernel, that correctly determine my DiskOnChip Millenium 8M, I try nftl.
But after nftl_format and rebooting DiskOnChip silently die and kernel don't 
determine this DiskOnChip at all. Utility from M-System (DFORMAT) didn't working to.

May be there is some way to bring this DoC back to life?

Secondly I take DiskOnChip 2000 4M and try jffs. 
All actions were done according to jffs-HOWTO.
Resoults of mounting are below:

jffs_scan_flash: Found a JFFS node with dsize (0x11c0) > max_chunk_size (0x1000)
jffs_scan_flash: Found a JFFS node with dsize (0x8000) > max_chunk_size (0x1000)
jffs_scan_flash: Found a JFFS node with dsize (0x41ec) > max_chunk_size (0x1000)
jffs_scan_flash: Found a JFFS node with dsize (0x4600) > max_chunk_size (0x1000)
jffs_scan_flash: Found a JFFS node with dsize (0x1230) > max_chunk_size (0x1000)
jffs_scan_flash: Found a JFFS node with dsize (0x2200) > max_chunk_size (0x1000)
jffs_scan_flash: Found a JFFS node with dsize (0x8000) > max_chunk_size (0x1000)
last message repeated 5 times
Kernel panic: Didn't read all bytes in flash_safe_read(). Returned 0 

Now DFORMAT didn'n correctly work with this DiskOnChip too.

What am I doing wrong?

How can I make whis two DiskOnChips work with M-System driver now? If it possible of course.

Sincerely yours,
Sorokin Vladimir
Programmer
NPF Krug
mail:Vavanchick38@mail.ru
