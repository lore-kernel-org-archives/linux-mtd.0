Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12spQN-0002FC-00
	for mtd-list@infradead.org; Fri, 19 May 2000 17:14:55 +0100
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12spQM-0002F5-00
	for mtd@infradead.org; Fri, 19 May 2000 17:14:54 +0100
Date: Fri, 19 May 2000 18:14:52 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: mtd@infradead.org, jffs-dev@axis.com
Subject: jffs almost working
Message-ID: <Pine.LNX.4.10.10005191807430.2025-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Jffs and MTD should be mostly working now. I need to upgrade my kernel
from 2.3.99-pre3 to one where try_inc_mod_count() is exported.
Undoubtedly some vfs changes since pre3 requires some minor
modifications, but it should basically work.

If you want to try it out without doing any changes, run 2.3.99-pre3, and
the lates MTD cvs tree with the following small (temporary) patch:
Index: include/linux/mtd/mtd.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/mtd.h,v
retrieving revision 1.11
diff -u -r1.11 mtd.h
--- include/linux/mtd/mtd.h     2000/05/03 18:50:01     1.11
+++ include/linux/mtd/mtd.h     2000/05/19 16:12:14
@@ -21,6 +21,11 @@
 }
 #endif
 
+static inline int try_inc_mod_count(struct module *mod)
+{
+     __MOD_INC_USE_COUNT(mod);
+     return 0;
+}
 
 #endif
 
Now I need to do more stress-testing and check all the corner cases. I
don't know if stuff is SMP safe, have to do more reading and thinking.

/ Alex







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
