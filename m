Received: from ns1.ixmail.hkcix.com ([202.181.230.228] helo=ixmail.hkcix.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wO9U-0003h6-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 14:33:01 +0100
Message-ID: <3BD6C5DA.200C3EA9@uniquemodem.com>
Date: Wed, 24 Oct 2001 21:44:58 +0800
From: data <data@uniquemodem.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Compilation problem on linux-2.4.6 with patch 2.4.6pre3
References: <3BCD84E1.4DD484A6@uniquemodem.com> <25716.1003325012@redhat.com>
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

Hi David,

Due to the fact that our application is working on kernel 2.4.5 or
2.4.6, I need to re-compile the kernel on these version. I have chosen
to start with 2.4.6 and understood that I need to include 2.4.6pre3
patch. After I have completed that patch and start to compile the
kernel, I encountered the following errors and hope you can help me to
fix it.

During the compilation for jffs_fm, I encountered the error with
completion.h missing and gc_thread_comp with incomplete type. I hope you
can give me a hand to fix my problem.

Thank you very much in deed. I am looking forward to hear from you soon.

Best regards,

Jimmy

 
Build log:

.o inode.o ioctl.o namei.o super.o symlink.o
make[3]: Leaving directory `/home/root/linux-2.4.6/fs/ext2'
make[2]: Leaving directory `/home/root/linux-2.4.6/fs/ext2'
make -C jffs
make[2]: Entering directory `/home/root/linux-2.4.6/fs/jffs'
make all_targets
make[3]: Entering directory `/home/root/linux-2.4.6/fs/jffs'
gcc -D__KERNEL__ -I/home/root/linux-2.4.6/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
-fno-strict-aliasing -pipe -mpreferred-stack-boundary=2 -march=i486   
-c -o jffs_fm.o jffs_fm.c
In file included from jffs_fm.c:22:
/home/root/linux-2.4.6/include/linux/jffs.h:24:30: linux/completion.h:
No such file or directory
In file included from jffs_fm.c:22:
/home/root/linux-2.4.6/include/linux/jffs.h:191: field `gc_thread_comp'
has incomplete type
make[3]: *** [jffs_fm.o] Error 1
make[3]: Leaving directory `/home/root/linux-2.4.6/fs/jffs'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/home/root/linux-2.4.6/fs/jffs'
make[1]: *** [_subdir_jffs] Error 2
make[1]: Leaving directory `/home/root/linux-2.4.6/fs'
make: *** [_dir_fs] Error 2
[root@localhost linux]#
