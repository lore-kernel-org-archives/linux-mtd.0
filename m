Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DLAkF-0006lx-MP
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2005 03:03:33 +0100
Received: from il06exr01.mot.com (il06exr01.mot.com [129.188.137.131])
	by motgate8.mot.com (Motorola/Motgate8) with ESMTP id j3C25U24021099
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2005 19:05:31 -0700 (MST)
Received: from zch07exm05.corp.mot.com (ZCH07EXM05.corp.mot.com [200.3.1.211])
	by il06exr01.mot.com (8.13.1/8.13.0) with ESMTP id j3C25SPq014533
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2005 21:05:29 -0500 (CDT)
Message-ID: <3BCB5FB76AFFF646BCFBC02A889B64F3022870CA@ZCH07EXM05.corp.mot.com>
From: Jiang Jun-A21079 <A21079@motorola.com>
To: MTD List <linux-mtd@lists.infradead.org>
Date: Tue, 12 Apr 2005 10:03:03 +0800
MIME-Version: 1.0
Content-Type: text/plain
Cc: Gu Susan-w15879 <w15879@motorola.com>
Subject: two issues about summary patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our jffs2 is taken from MontaVista 3.1, and summary patch downloaded from website http://www.inf.u-szeged.hu/jffs2/mount.php

And we use NOR flash in our product.

First issue:

The scenario is:  write a lot of data into a newly create file in JFFS2, then suddenly power down the phone, at next time power on, during mounting of this JFFS2 filesystem, below info is printed out:

T[248]Eep. Child "download" (ino #3) of dir ino #1 doesn't exist!
T[249]Eep. Child "download_modules" (ino #19) of dir ino #1 doesn't exist! T[250]Eep. Child ".check" (ino #2) of dir ino #1 doesn't exist! 
T[250]Eep. Child "etc_files" (ino #20) of dir ino #1 doesn't exist! 
T[251]Eep. Child ".check_db" (ino #22) of dir ino #1 doesn't exist!
T[252]jffs2_do_read_inode() on nonexistent ino 22

         Function jffs2_sum_add_kvec() will be called by function jffs2_flash_direct_writev() in writev.c. It will add summary information into jeb->sum_collected before writing data into flash, But if we write data with function jffs2_flash_write(). It will bypass summary information. In our NOR flash case. Jffs2_flash_write() be defined with c->mtd->write().jffs2_flash_write() be called in gc.c and nodemgmt.c. in gc.c when we garbage collected pristine node, jffs2_flash_write() will be call without summary information handled. We will lose summary information of that pristine node at next power on. I think function jffs2_flash_write() in wbuf.c is better than c->mtd->write(). It will handle summary information through jffs2_flash_writev().
With jffs2_flash_write() in nodemgmt.c, if node has been obsolete, should we remove its summary information too?

Second issue:  
The scenario is: write a lot of data into a newly create file in JFFS2, when a eraseblock is full, then power down the phone. After system restarted we can't write anything to this partition. Any write will hang system.

        In our power failure test, a case is write data to flash until a erasebock is full, at this time last dnode has been wrote into this block, but summary information of this block has not been wrote. It would be write in next write requirement. In the function jffs2_write_inode_range, test case will stop system behind statement "jffs2_write_dnode()" if it found the space jffs2_reserve_space() reserved is less then variable datalen. 
We found jffs2 will call jffs2_do_reserve_space() before any writing action. In this function variable len is equal jeb->free_size reduce nofree_size.
But nofree_size is not on 4 bytes boundary, so the len is not on 4 bytes boundary too. 
When system restart and scanning this full block, any node scanned will call one of USED_SPACE , UNCHECKED_SPACE, DIRTY_SPACE and WASTED_SPACE

Four macro listed above will pad its parameter before handling. So, after last node be scanned and before actual space on flash remain for summary information. Jeb->free_size has been pad to 4 bytes boundary. The statement "if (jeb->sum_collected->sum_size + JFFS2_SUMMARY_FRAME_SIZE > jeb->free_size)" in function jffs2_scan_eraseblock() will be TRUE, then it clear members of ieb->sum_collected. Any write will call jffs2_sum_write_sumnode (c) in function jffs2_do_reserve_space. But members of jeb->sum_collected has been cleared. So system will hang up.
         We want to remove jeb->sum_collected check from jffs2_scan_eraseblock() or add statement "nofree_size = PAD(nofree_size)" behind statement "nofree_size = sumsize + jeb->sum_collected->sum_size + JFFS2_SUMMARY_FRAME_SIZE" in function jffs2_do_reserve_space().Macro JFFS2_SUMMARY_FRAME_SIZE need not plus 3 for 4 bytes boundary.

Best regards

kevin
