Received: from pd9eb8a1c.dip.t-dialin.net ([217.235.138.28] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dgqg-0002in-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 00:12:34 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Adam Wozniak <adam.wozniak@comdev.cc>
Subject: Re: JFFS2 list_dirty corruption
Date: Thu, 21 Feb 2002 01:26:34 +0100
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
   jffs-dev@axis.com
References: <02022020414807.18560@thomas> <02022021101508.18560@thomas> <3C74383D.EC664E52@comdev.cc>
In-Reply-To: <3C74383D.EC664E52@comdev.cc>
MIME-Version: 1.0
Message-Id: <0202210126340B.18560@thomas>
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

On Thursday, 21. February 2002 00:58, Adam Wozniak wrote:
> Ok, maybe this is a problem:
>
Sorry, you're right. I should send such mails better in the morning.
It happened on the transcript from my NAND modified stuff.
Here is the correct patch:

--- mtd/fs/jffs2/scan.c	2002/01/09 13:25:58	1.57
+++ mtd/fs/jffs2/scan.c	2002/02/21 00:17:19
@@ -127,10 +127,17 @@
                         if (jeb->free_size > 2*sizeof(struct 
jffs2_raw_inode) &&
                                 (!c->nextblock || c->nextblock->free_size < 
jeb->free_size)) {
                                 /* Better candidate for the next writes to 
go to */
-                                if (c->nextblock)
+                                if (c->nextblock) {
+					/* We must delete, because mark_node_obsolete
+					   could have added this block to dirty_list already */
+                                        list_del(&c->nextblock->list);
                                         list_add(&c->nextblock->list, 
&c->dirty_list);
+				}
                                 c->nextblock = jeb;
                         } else {
+				/* We must delete, because mark_node_obsolete
+				   could have added this block to dirty_list already */
+				list_del(&jeb->list);
                                 list_add(&jeb->list, &c->dirty_list);
                         }
 		} else {
-- 
Thomas
P.S. David: The jffs2-nand-version is correct.
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
