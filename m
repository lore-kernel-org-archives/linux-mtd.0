Received: from smtp-102.noc.nerim.net ([62.4.17.102] helo=mallaury.noc.nerim.net)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g3p6-000677-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 14:13:16 +0000
Received: from bandit.lilotux.net (lilotux.net [62.212.107.33])
	by mallaury.noc.nerim.net (Postfix) with ESMTP id B016662F00
	for <linux-mtd@lists.infradead.org>; Tue,  4 Feb 2003 15:13:13 +0100 (CET)
Received: from slist by bandit.lilotux.net with local (Exim 3.35 #1 (Debian))
	id 18g3p4-0008ON-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 15:13:14 +0100
Date: Tue, 4 Feb 2003 15:13:14 +0100
From: Stephane List <stephane.list@lilotux.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <20030204141314.GA32071@lilotux.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Bus error when erasing Intel Strataflash
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Hi,

When I want to erase my Intel Strataflash, I've got "BUS ERROR" on my
CPU. I use the command :

#erase /dev/mtd6 0 128
 
It erases the first sector but then it crashes.

This is an attempt to read at the physical address instead of the
ioremapped address !
The error is somewhere in physmap_read32, and the calling function is
"do_erase_oneblock" of the file drivers/mtd/chips/cfi_cmdset_0001.c

The 2 places where the software reads the flash are when it wants to
read the status, everything looks good in the code...

Any idea ?

Stéphane
-- 
Stephane List
http://slist.lilotux.net
