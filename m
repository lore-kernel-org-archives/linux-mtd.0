Received: from gorilla.mchh.siemens.de ([194.138.158.18])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19E6yn-0003U8-7F
	for <linux-mtd@lists.infradead.org>; Fri, 09 May 2003 13:28:01 +0100
Received: from moody.mchh.siemens.de ([139.21.205.85])
	by gorilla.mchh.siemens.de (8.9.3/8.9.3) with ESMTP id OAA18071
	for <linux-mtd@lists.infradead.org>;
	Fri, 9 May 2003 14:28:15 +0200 (MET DST)
Received: from demchh2msx.icn.siemens.de (ss-aladin.mchh.siemens.de
	[139.21.149.125])
	by moody.mchh.siemens.de (8.9.3/8.9.1) with ESMTP id OAA13041
	for <linux-mtd@lists.infradead.org>;
	Fri, 9 May 2003 14:28:16 +0200 (MET DST)
Sender: uhx27328@ss-aladin.mchh.siemens.de
Message-ID: <3EBB9EDF.A1DE0AE9@icn.siemens.de>
Date: Fri, 09 May 2003 14:28:15 +0200
From: Hans_Peter Urbanek <Hans-Peter.Urbanek.extern@icn.siemens.de>
MIME-Version: 1.0
To: Linux-MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: JFFS2 and kupdated
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have the following situation: we use JFFS2 in a 5MB RAM partition
(on top of the SLRAM driver). The file system is used for extensive
logging; precautions are taken for the RAM content to be still
available after a reboot caused by a system crash.

Now, as new logs are being written (and older ones are deleted), JFFS2
at some point has to reuse blocks. I observe occasional delays in
write system calls which appear to come from waiting for the completion
of an erase operation. The completion of the erase operation is done
through the `kupdated', which then wakes the `write' task.

In order not to wait up to five seconds for `kupdated' to become
active again, I made a change in `jffs2_do_reserve_space'
fs/jffs2/nodemgmt.c that wakes `kupdated' immediately and saves these
seconds. For me this change seems to work. A patch against version
`$Id: nodemgmt.c,v 1.94 2003/02/19 17:50:26 gleixner Exp $'
is attached below.

My question simply is: as I'm only slowly getting familiar with the
JFFS2 code, I wonder if my approch is the way an expert would solve
the problem. And: could my patch damage anything in the case where
JFFS2 is used in flash?

I also see that JFFS2 is not designed for a RAM based filesystem in the
first place; yet we like it because of its journaling qualities. But
if someone has suggestions for other solutions, I'd be thankful for any
hints.


Thanks and have a nice weekend
Hans-Peter


vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv


--- fs/jffs2/nodemgmt.c.orig    Thu Feb 20 00:00:07 2003
+++ fs/jffs2/nodemgmt.c Fri May  9 14:09:40 2003
@@ -149,6 +149,30 @@
        return ret;
 }
 
+struct task_struct * find_kupdated(void)
+{
+       static struct task_struct *p = NULL;
+
+       if (NULL != p &&
+           0 == strcmp(p->comm, "kupdated") &&
+           NULL == p->mm)
+       {
+               return p;
+       }
+
+       for_each_task(p)
+       {
+               if (0 == strcmp(p->comm, "kupdated"))
+               {
+                       printk(KERN_DEBUG "found kupdated, mm: %x\n",
p->mm);
+                       return p;
+               }
+       }
+
+       p = NULL;
+       return p;
+}
+
 /* Called with alloc sem _and_ erase_completion_lock */
 static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t
minsize, uint32_t *ofs, uint32_t *len)
 {
@@ -250,6 +274,20 @@
                                jffs2_erase_pending_trigger(c);
                        }
                        spin_unlock(&c->erase_completion_lock);
+ 
+                       /* Wake up the kupdated immediately to be freed
+                          from the erase_wait queue as soon as
+                          possible.
+                       */
+                       {
+                               struct task_struct * kupdated_task =
+                                       find_kupdated();
+                               if (NULL != kupdated_task)
+                               {
+                                       wake_up_process(kupdated_task);
+                               }
+                       }
+ 
                        schedule();
                        remove_wait_queue(&c->erase_wait, &wait);
                        spin_lock(&c->erase_completion_lock);
