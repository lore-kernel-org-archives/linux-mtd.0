Received: from [64.244.22.242] (helo=mail.seranoa.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bp5j-00066U-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 20:36:23 +0000
Received: from seranoa.com (IDENT:andrew.dixon@[172.16.1.202])
	by mail.seranoa.com (8.11.0/8.11.0) with ESMTP id g1FKvSs11338
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 15:57:28 -0500
Message-ID: <3C6D72ED.F2FCC661@seranoa.com>
Date: Fri, 15 Feb 2002 15:43:25 -0500
From: Andrew Dixon <andrew.dixon@seranoa.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: spanning multiple chips with one mtd device
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi All,

I've got a board here with two strataflash chips that are contiguous in
memory.  I'd like linux to use as one mtd device.  I've kind of got it
to kind of work by faking out cfi_chip_setup in cfi_probe.c.  I just
increase cfi->cfiq->DevSize by one so that it thinks the device is twice
as big and then I add one to cfi->cfiq->NumEraseRegions so that it
thinks that there are two erase blocks (each one being one of my flash
chips).

This device is happily recognized and I can mount it as a jffs2 on
/mnt.  It even works as long as I don't write too much data to it.  When
I try to write enough data so that it should access the other flash chip
I run into problems.  The write seems to go OK and the data looks good
but if I unmount and remount the partition all of the data is lost and
I've got an empty filesystem.  If I've only written a few small files I
can unmount and remount without problem.

If anyone has any hints, tips or pointers for me I'd really appreciate
it.

Thanks,
Andy


--
Andrew Dixon
Software Engineer
Seranoa Networks
978.897.3434 x231
