Received: from pd9eb8a25.dip.t-dialin.net ([217.235.138.37] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dcqS-0002Pm-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 19:56:04 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 list_dirty corruption
Date: Wed, 20 Feb 2002 21:10:15 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <02022020414807.18560@thomas>
In-Reply-To: <02022020414807.18560@thomas>
MIME-Version: 1.0
Message-Id: <02022021101508.18560@thomas>
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

On Wednesday, 20. February 2002 20:41, Thomas Gleixner wrote:
> While hacking on JFFS2 for NAND I found a possibility, where scan_medium
> corrupts list_dirty.
This patch resolves the problem:

--- org/fs/jffs2/scan.c
+++ work/fs/jffs2/scan.c
@@ -128,9 +128,15 @@
                                 (!c->nextblock || c->nextblock->free_size < 
jeb->free_size)) {
                                 /* Better candidate for the next writes to 
go to */
                                 if (c->nextblock)
+					/* We must delete, because mark_node_obsolete
+					   could have added this block to dirty_list already */
+                                        list_del(&c->nextblock->list);
                                         list_add(&c->nextblock->list, 
&c->dirty_list);
                                 c->nextblock = jeb;
                         } else {
+				/* We must delete, because mark_node_obsolete
+				   could have added this block to dirty_list already */
+				list_del(&jeb->list); 
                                 list_add(&jeb->list, &c->dirty_list);
                         }
 		} else {

I put it into CVS too
-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
