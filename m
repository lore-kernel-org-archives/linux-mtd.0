Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fhi6-00050I-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 13:32:03 +0000
Received: from jocke.lumentis.se (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id OAA07957
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 14:42:48 +0100 (MET)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Subject: scan.c & ACCURATE
Date: Tue, 26 Feb 2002 14:42:48 +0100
References: <0111121314140A.28381@jocke.lumentis.se> <02010409585400.10979@jocke.lumentis.se> <02012911331100.15969@jocke.lumentis.se>
In-Reply-To: <02012911331100.15969@jocke.lumentis.se>
MIME-Version: 1.0
Message-Id: <02022614424803.15969@jocke.lumentis.se>
Content-Transfer-Encoding: 8bit
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

Hi 

Patch 1 skips scanning of inodes and dirents which are obsoleted.  Improves
scan speed. 

Patch 2 increases INOCACHE_HASHSIZE to 14 which also make scan alot
faster.

Tested in the stable branch, but these patches
is agains latest CVS. Please add to stable branch when you think it's stable.

       jocke 

Index: fs/jffs2/scan.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/scan.c,v
retrieving revision 1.61
diff -u -u -r1.61 scan.c
--- fs/jffs2/scan.c     2002/02/21 23:50:46     1.61
+++ fs/jffs2/scan.c     2002/02/26 13:37:27
@@ -509,7 +509,12 @@
                       retlen, *ofs, sizeof(ri));
                return -EIO;
        }
-
+       if (!(ri.nodetype & JFFS2_NODE_ACCURATE)) {
+               /* Wheee. This is an obsoleted node */
+               DIRTY_SPACE(PAD(ri.totlen));
+               *ofs += PAD(ri.totlen);
+               return 0;
+       }
        /* We sort of assume that the node was accurate when it was
           first written to the medium :) */
        oldnodetype = ri.nodetype;
@@ -685,7 +690,12 @@
                       retlen, *ofs, sizeof(rd));
                return -EIO;
        }
-
+       if (!(rd.nodetype & JFFS2_NODE_ACCURATE)) {
+               /* Wheee. This is an obsoleted node */
+               DIRTY_SPACE(PAD(rd.totlen));
+               *ofs += PAD(rd.totlen);
+               return 0;
+       }
        /* We sort of assume that the node was accurate when it was
           first written to the medium :) */
        oldnodetype = rd.nodetype;




Index: include/linux/jffs2_fs_sb.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/jffs2_fs_sb.h,v
retrieving revision 1.21
diff -u -u -r1.21 jffs2_fs_sb.h
--- include/linux/jffs2_fs_sb.h 2002/02/24 18:11:35     1.21
+++ include/linux/jffs2_fs_sb.h 2002/02/26 13:39:30
@@ -9,7 +9,7 @@
 #include <asm/semaphore.h>
 #include <linux/list.h>
 
-#define INOCACHE_HASHSIZE 1
+#define INOCACHE_HASHSIZE 14
 
 #define JFFS2_SB_FLAG_RO 1
 #define JFFS2_SB_FLAG_MOUNTING 2
