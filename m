Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lbs3-00058X-00
	for mtd-list@infradead.org; Tue, 17 Oct 2000 19:53:55 +0100
Subject: Re: typo in sbc_mediagx.c
In-Reply-To: <21339.971796709@redhat.com> from David Woodhouse at "Oct 17, 2000
 04:31:49 pm"
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 17 Oct 2000 14:53:48 -0400 (EDT)
CC: mtd@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-Id: <E13lbrw-0001b4-00@mokona.furryterror.org>
From: Amy Fong <afong@furryterror.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> 
> afong@furryterror.org said:
> >  Uh yeah. You're using the QUEUE_EMPTY macro which doesn't really
> > exist in 2.2 or at least exists as 
> 
> Hmmm. It doesn't work in 2.4 either. But I've illustrated how I think it 
> can be done with a kernel thread. If anyone disagrees with me sufficiently, 
> I'm quite happy to be proved wrong, as long as the proof is under GPL.
> 
> Of course, if you agree with my method in spite of my implementation, 
> you're welcome to fix that too :)
> 
> 
> --
> dwmw2

This seems to work so far... (I hope I got the kernel version correct)
(with 2.2.18pre11)

--- mtdblock.c  Tue Oct 17 14:29:10 2000
+++ mtdblock.c.tmp      Tue Oct 17 14:27:28 2000
@@ -298,7 +298,11 @@
        again:
                set_current_state(TASK_UNINTERRUPTIBLE);
                spin_lock_irq(&io_request_lock);
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,46)
                if (QUEUE_EMPTY) {
+#else
+               if (!CURRENT) {
+#endif
                        spin_unlock_irq(&io_request_lock);
                        schedule();
                        if (leaving)

Oh... while I'm at it, can we add this into the Config.in? (for
2.2.16 and the 2.4's)

--- /home/afong/mtd/mtd/patches/mtd-patch-2.2.16        Mon Jun 26 04:22:56 2000
+++ mtd-patch-2.2.16    Tue Oct 17 14:44:20 2000
@@ -212,6 +212,10 @@
      define_bool CONFIG_SGI_PARTITION y
    fi
 +  tristate 'Journalling Flash filesystem (JFFS) support
(experimental)' CONFIG_JFFS_FS
++ if [ "$CONFIG_JFFS_FS" = "y" -o "$CONFIG_JFFS_FS" = "m" ]; then
++     int 'JFFS verbose level 0 (quiet), 1, 2, or 3'
CONFIG_JFFS_FS_VERBOSE 0
++ fi
+
  fi
  
  if [ "$CONFIG_NET" = "y" ]; then



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
