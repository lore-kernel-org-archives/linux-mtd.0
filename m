Received: from dsl-dt-207-34-112-i157-cgy.nucleus.com ([207.34.112.157] helo=mail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16hIlq-000512-00
	for <linux-mtd@lists.infradead.org>; Sat, 02 Mar 2002 23:18:30 +0000
Received: (from rayl@localhost)
	by mail.com (8.11.2/8.11.2) id g22NTmP19795
	for linux-mtd@lists.infradead.org; Sat, 2 Mar 2002 16:29:48 -0700
Date: Sat, 2 Mar 2002 16:29:48 -0700
From: Ray Lehtiniemi <rayl@otii.com>
To: linux-mtd@lists.infradead.org
Subject: patch and two questions
Message-ID: <20020302162948.A14453@otii.com>
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

hi all

i'm using the latest MTD CVS against arm linux-2.4.18-rmk1.


first a patch that seems to be needed:


Index: include/linux/mtd/compatmac.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/compatmac.h,v
retrieving revision 1.33
diff -u -r1.33 compatmac.h
--- include/linux/mtd/compatmac.h	2002/03/02 22:08:26	1.33
+++ include/linux/mtd/compatmac.h	2002/03/02 23:21:26
@@ -489,7 +489,7 @@
 {
 	recalc_sigpending(current);
 }
-#define recalc_sigpending() __recalc_sigpending ()
+#define recalc_sigpending(c) __recalc_sigpending ()
 #endif
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,5)




now, two questions:

i get the following compile warnings all over the place:

  /opt/dev/linux/src/linux/include/linux/mtd/compatmac.h:492: warning:
           `recalc_sigpending' redefined
  /opt/dev/linux/src/linux/include/linux/modules/signal.ver:24: warning:
           this is the location of the previous definition

should i be worried?



second, if i have a flash device which i want to partition, is it better
to use add_mtd_partitions() or use the approach taken by
mtd/drivers/mtd/maps/nora.c?  just looking at the code, they seem to
accomplish the same thing, correct?



thanks

-- 
---------------------------------------------------------------------------
    Ray Lehtiniemi <rayl@mail.com> <rayl@otii.com>
