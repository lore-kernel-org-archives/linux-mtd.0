Received: from [80.120.128.82] (helo=hofr.at)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WfZx-0004hU-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2003 16:30:49 +0000
Received: (from root@localhost)
	by hofr.at (8.10.2/Hofrat's Mail Service V2.2.8bet6-test1) id h09H3Wo00632
	for linux-mtd@lists.infradead.org; Thu, 9 Jan 2003 18:03:32 +0100
From: Der Herr Hofrat <der.herr@mail.hofr.at>
Message-Id: <200301091703.h09H3Wo00632@hofr.at>
Subject: mtdram bug - module count incorect
To: linux-mtd@lists.infradead.org
Date: Thu, 9 Jan 2003 18:03:32 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi !

 here is how to reproduce the problem - It's due to a mistake I made, I 
 called mkfs.minix on the mounted filesystem - but mkfs.minix exits with
 the proper error still the usage count was increased...

Kernel is 2.4.19-rtl3.2-pre1

# lsmod
Module                  Size  Used by
de4x5                  41104   1  (autoclean)

# insmod mtdcore.o
# insmod mtdram.o total_size=4096 erase_size=128

# dmesg 
mtd: Giving out device 0 to mtdram test device

# lsmod
Module                  Size  Used by
mtdblock                4884   0  (unused)
mtdram                  2068   0  (unused)
mtdcore                 2052   1  [mtdblock mtdram]
de4x5                  41104   1  (autoclean)

# mkfs.minix /dev/mtdblock0
1376 inodes
4096 blocks
Firstdatazone=47 (47)
Zonesize=1024
Maxsize=268966912

# mount -t minix /dev/mtdblock0 /mnt
# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock0            4049         1      4048   0% /mnt

# lsmod
Module                  Size  Used by
mtdblock                4884   1
mtdram                  2068   1
mtdcore                 2052   1  [mtdblock mtdram]
de4x5                  41104   1  (autoclean)

   I found my mistake in the command history, and it is well reproducable.

# mkfs.minix /dev/mtdblock0
mkfs.minix: %s is mounted; will not make a filesystem here!

# lsmod
Module                  Size  Used by
mtdblock                4884   1 
mtdram                  2068   2   
                              ^^^^
                              wrong module usage count after mkfs.
mtdcore                 2052   1  [mtdblock mtdram]
de4x5                  41104   1  (autoclean)


   The problem is that mkfs.minix on the mounted filesystem increaesed 
   the modules usage count - so I guess this means the MOD_INC_.. is 
   somewhere in the wrong place as it is done in a failure path (or 
   the MOD_DEC is missing...)

   If this is not a known problem I'll give it a try to trak it down.

thx !
hofrat
