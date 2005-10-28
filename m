Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVSG1-0003kF-LN
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 07:18:55 -0400
Message-ID: <4362097F.5080609@ru.mvista.com>
Date: Fri, 28 Oct 2005 15:20:31 +0400
From: Sergei Shtylylov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------010902060203060105030904"
Cc: Konstantin Baidarov <kbaidarov@ru.mvista.com>
Subject: [PATCH] JFFS: drop kernel lock on exit from garbage collecting
	thread
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010902060203060105030904
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

    JFFS forgets to drop a kernel lock it grabs in the garbage collecting 
thread when that thread is killed by jffs_put_user(). This causes a couple of 
BUG messages and a call trace to be printed out on unmounting JFFS with the 
alternate spinlock implemetation which checks for the kernel lock state 
consistency...

WBR, Sergei

--------------010902060203060105030904
Content-Type: text/plain;
 name="JFFS-GC-drop-kernel-lock.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="JFFS-GC-drop-kernel-lock.patch"

Signed-off-by: Konstantin Baidarov <kbaidarov@ru.mvista.com>
Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>

Index: fs/jffs/intrep.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/intrep.c,v
retrieving revision 1.105
diff -a -u -p -r1.105 intrep.c
--- fs/jffs/intrep.c	2 Jul 2003 20:39:55 -0000	1.105
+++ fs/jffs/intrep.c	28 Oct 2005 11:09:06 -0000
@@ -3442,6 +3442,7 @@ jffs_garbage_collect_thread(void *ptr)
 			case SIGKILL:
 				D1(printk("jffs_garbage_collect_thread(): SIGKILL received.\n"));
 				c->gc_task = NULL;
+				unlock_kernel();
 				complete_and_exit(&c->gc_thread_comp, 0);
 			}
 		}

--------------010902060203060105030904--
