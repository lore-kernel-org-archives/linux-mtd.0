Received: from mail.brecis.com ([65.198.34.10] helo=brecis.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16idQ8-0003Vn-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 15:33:36 +0000
Received: from solar.brecis.com (solar [172.18.10.8])
	by brecis.com (8.9.3+Sun/8.9.3) with ESMTP id HAA09413
	for <linux-mtd@lists.infradead.org>; Wed, 6 Mar 2002 07:42:48 -0800 (PST)
Received: from andromeda.brecis.com (andromeda [172.18.10.32])
	by solar.brecis.com (8.9.1b+Sun/8.9.3) with ESMTP id HAA10838
	for <linux-mtd@lists.infradead.org>; Wed, 6 Mar 2002 07:45:01 -0800 (PST)
Received: (from swahl@localhost)
	by andromeda.brecis.com (8.9.1b+Sun/8.9.1) id HAA07843
	for linux-mtd@lists.infradead.org; Wed, 6 Mar 2002 07:45:30 -0800 (PST)
Date: Wed, 6 Mar 2002 09:44:31 -0600
From: Steve Wahl <swahl@brecis.COM>
To: linux-mtd@lists.infradead.org
Subject: Possible bug in /proc/mtd ?
Message-ID: <20020306094431.C15112@brecis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

I've just started to bring up MTD in a uC-linux derived system.

I've found what I believe is a problem in the code for /proc/mtd.

Does anyone else get some sort of strange behavior if they run:

	dd if=/proc/mtd of=/dev/tty bs=1

The strange behavior on my system is a hang; it may be an oops or
panic of some sort on a system with a mmu.

If you see this problem, I think it should go away with this patch:


------------------------------------------------------------
--- mtdcore.c	22 Nov 2001 05:29:30 -0000	1.2
+++ mtdcore.c	6 Mar 2002 15:40:55 -0000
@@ -289,21 +289,21 @@
         }
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
         *eof = 1;
 #endif
 
 done:
 	up(&mtd_table_mutex);
         if (off >= len+begin)
                 return 0;
-        *start = page + (begin-off);
+        *start = page + (off-begin);
         return ((count < begin+len-off) ? count : begin+len-off);
 }
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,2,0)
 struct proc_dir_entry mtd_proc_entry = {
         0,                 /* low_ino: the inode -- dynamic */
         3, "mtd",     /* len of name and name */
         S_IFREG | S_IRUGO, /* mode */
         1, 0, 0,           /* nlinks, owner, group */
         0, NULL,           /* size - unused; operations -- use default */
------------------------------------------------------------

Thanks for looking,

--> Steve Wahl
