Received: from [203.63.104.245] (helo=cobalttech.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6Ka6-0001Lh-L2
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 02:54:39 +0100
Date: Mon, 6 Oct 2003 11:52:57 +1000 (EST)
From: Michael McLellan <mikey@bur.st>
To: Ingo Flaschberger <if@sil.at>
In-Reply-To: <Pine.GSO.4.56.0310050802220.3023@ikarus.sil.at>
Message-ID: <Pine.LNX.4.53.0310061146570.12632@slop.cobalttech.com>
References: <Pine.GSO.4.56.0310050802220.3023@ikarus.sil.at>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: NFTL / FTL DoC booting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been trying to get this to work for ages and havn't gotten very far.
So I hope you guys can help me out.

I can install grub on my DoC but when it boots it goes to the grub shell.
The only devices which show up are (hd0) and (fd0) no (dc0). When I boot
my kernel from hd0 I get this:

$Id: ftl.c,v 1.52 2003/08/11 09:00:44 dwmw2 Exp $
NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34 $
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba:NAND 32MiB 3,3V)
3 flash chips found. Total DiskOnChip size: 96 MiB
mtd: Giving out device 0 to DiskOnChip 2000
Could not find valid boot record
NFTL: could not mount device
 ftla: ftla1

I can mount the device as /dev/ftla1 OK, but not nftla.

My questions are:
	What is nftla and ftla?
	Which one should I use?
	Can grub only see nftl devices?
	Is my chip stuffed?
	Do I need to compile nftl_format?
	What other header file do I need to include which has all the semaphore types defined correctly so it will compile?

Thanks heaps,
Mikey.
