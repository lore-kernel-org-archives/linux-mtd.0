Received: from mail.utfors.se ([195.58.103.125] helo=blooper.utfors.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Jt7j-0002L6-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 10:48:35 +0100
Received: from there ([212.105.56.242])
	by blooper.utfors.se (Utfors AB) with SMTP id g5H9m4JJ003622
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 11:48:05 +0200 (MEST)
Message-Id: <200206170948.g5H9m4JJ003622@blooper.utfors.se>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] scan.c 
Date: Mon, 17 Jun 2002 11:48:04 +0200
References: <0111121314140A.28381@jocke.lumentis.se> <02022614424803.15969@jocke.lumentis.se> 
MIME-Version: 1.0
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

Hi again 

I was sure that I sent this one long time ago, but my mind must play tricks on me.

Do not scan blocks which just contain a CLEANMARKER, it's a waste of CPU cycles.

        Jocke

Index: scan.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/scan.c,v
retrieving revision 1.76
diff -u -r1.76 scan.c
--- scan.c      20 May 2002 14:56:38 -0000      1.76
+++ scan.c      17 Jun 2002 09:42:13 -0000
@@ -364,6 +364,18 @@
                                jeb->first_node = jeb->last_node = marker_ref;

                                USED_SPACE(PAD(sizeof(struct jffs2_unknown_node)));
+
+                               err = c->mtd->read(c->mtd, ofs+sizeof(struct jffs2_unknown_node),
+                                                  sizeof(node), &retlen, (char*)&node);
+                               if (node_p->magic == JFFS2_EMPTY_BITMASK &&
+                                   node_p->nodetype == JFFS2_EMPTY_BITMASK) {
+                                       /* We need to check if the first bits
+                                           after the CLEANMARKER is empty since
+                                           older FSes does not obsolete dirty EB's
+                                       */
+                                       ofs += c->sector_size;
+                                       break;
+                               }
                        }
                        ofs += PAD(sizeof(struct jffs2_unknown_node));
                        break;
