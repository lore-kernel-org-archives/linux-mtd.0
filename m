Received: from mail3.bluewin.ch ([195.186.1.75])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dr8V-0006S9-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 12:16:11 +0000
Received: from [192.168.0.15] (62.203.30.62) by mail3.bluewin.ch (Bluewin AG 6.7.015)
        id 3E105C8100340F27 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2003 12:47:01 +0000
Subject: NFTL not recognizing disk on chip in some cases
From: Raphael Hertzog <eng@eipm.ch>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1043844420.555.111.camel@localhost>
Mime-Version: 1.0
Date: 29 Jan 2003 13:47:01 +0100
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

I followed the instructions given here :
http://lists.infradead.org/pipermail/linux-mtd/2002-October/006166.html

I used the second set of instructions (the one for 2.4.18) since I'm
running an unmodified 2.4.19 kernel.

After having successfully created the filesystem on the disk on chip (I
can mount it and work with it), I reboot and then the chip is no more
recognized. The error happens in the NFTL module, it displays :

NFTL Driver: nftlcore.c $Revision: 1.85$ nftlmount.c $Revision: 1.25$
NFTL Media Headers at 0x18000 and 0x6cc000 disagree
Could not find valid boot record
Could not mount NFTL device

Now if I relaunch nftl_format a second time it may find "bad blocks"
which didn't exist the first time. After that the chip is usually again
recognized ... I can reproduce that with different disk on chip (this
does probably mean that it's not the disk on chip that is on fault).

After more tries, it appears that the disk on chip is recognized after
partitioning and formating ... but the problems appears once I copy a
specific set of files on the disk on chip (it's not reproducible with
any set of files) and umount the DOC (and try to reload the nftl
module).

Any idea of what can go wrong ?

Regards,
-- 
Raphaël Hertzog - EIPM SA
