Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bRVV-0004b4-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 19:25:25 +0000
Received: from phobos.hpl.hp.com ([192.6.19.124])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 16bRgL-00070M-00
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2002 19:36:38 +0000
To: ch@murgatroid.com, dwmw2@readhat.com, linux-mtd@lists.infradead.org
Subject: patch for unlocking writeable partitions (against infradead cvs)
Message-Id: <20020214193633.5279A23DC12@friction.hpl.hp.com>
Date: Thu, 14 Feb 2002 11:36:33 -0800 (PST)
From: ch@friction.hpl.hp.com (Christopher Hoover)
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

Index: drivers/mtd/mtdpart.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdpart.c,v
retrieving revision 1.25
diff -a -u -r1.25 mtdpart.c
--- drivers/mtd/mtdpart.c	2001/11/27 14:55:11	1.25
+++ drivers/mtd/mtdpart.c	2002/02/14 02:04:03
@@ -291,6 +291,16 @@
 				parts[i].name);
 		}
 
+		if ((slave->mtd.flags & MTD_WRITEABLE) &&
+		    (slave->mtd.unlock)) {
+			int rv;
+			printk(KERN_DEBUG "mtd: unlocking partition \"%s\"\n",
+			       parts[i].name);
+			rv = part_unlock(&slave->mtd, 0, slave->mtd.size);
+			if (rv < 0)
+				printk(KERN_ERR "mtd: failed to unlock partition \"%s\": %d\n", parts[i].name, rv);
+		}
+
 		/* register our partition */
 		add_mtd_device(&slave->mtd);
 	}
