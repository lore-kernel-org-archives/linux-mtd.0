Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18bWio-00064t-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 02:04:02 +0000
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Frank Becker'" <fbecker@intrinsyc.com>
Cc: <linux-arm-kernel@lists.arm.linux.org.uk>,
	"'linux-mtd'" <linux-mtd@lists.infradead.org>
Subject: RE: 2.5.55-rmk1: user space lossage
Date: Wed, 22 Jan 2003 18:34:47 -0800
Message-ID: <000001c2c287$ffa8eef0$800b040f@bergamot>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3E2F2354.7060508@intrinsyc.com>
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

Aha!  This is the problem:

[ch@friction src]$ diff -B -w -Naurp linux-2.5.{52,53}/fs/jffs2 
diff -B -w -Naurp linux-2.5.52/fs/jffs2/file.c
linux-2.5.53/fs/jffs2/file.c
--- linux-2.5.52/fs/jffs2/file.c        2002-12-15 18:08:24.000000000
-0800
+++ linux-2.5.53/fs/jffs2/file.c        2002-12-23 21:21:34.000000000
-0800
@@ -58,7 +58,7 @@ struct file_operations jffs2_file_operat
        .read =         generic_file_read,
        .write =        generic_file_write,
        .ioctl =        jffs2_ioctl,
-       .mmap =         generic_file_mmap,
+       .mmap =         generic_file_readonly_mmap,
        .fsync =        jffs2_fsync,
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,29)
        .sendfile =     generic_file_sendfile
[ch@friction src]$ 

If you reverese this change, 2.5.55-rmk1 behaves.

-ch
