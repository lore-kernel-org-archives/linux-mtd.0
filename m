Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XmEb-0001kA-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 18:17:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20696.1027616681@redhat.com> 
References: <20696.1027616681@redhat.com>  <20020725141838.53920.qmail@mail.com> 
Cc: "Mike Schumi" <schumi@techie.com>, linux-mtd@lists.infradead.org
Subject: Re: jffs2_do_reserve_space 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jul 2002 18:16:50 +0100
Message-ID: <21835.1027617410@redhat.com>
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

dwmw2@infradead.org said:
>  Can you try this?

Or this version if you're using the stable branch...

As I said in private mail, I suspect you've written your jffs2 image to the 
flash 0x40 bytes out of place, and the printk in this sanity check isn't 
actually correct for you, although it will be for most people who trigger 
it.

Index: scan.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/scan.c,v
retrieving revision 1.51.2.2
diff -u -p -r1.51.2.2 scan.c
--- scan.c	23 Feb 2002 13:34:31 -0000	1.51.2.2
+++ scan.c	25 Jul 2002 17:15:16 -0000
@@ -261,6 +261,16 @@ static int jffs2_scan_eraseblock (struct
 			continue;
 		}
 
+		if (ofs + node.totlen > jeb->offset + c->sector_size) {
+			/* Eep. Node goes over the end of the erase block. */
+			printk(KERN_WARNING "Node at 0x%08x with length 0x%08x would run over the end of the erase block\n",
+			       ofs, node.totlen);
+			printk(KERN_WARNING "Perhaps the file system was created with the wrong erase size?");
+			DIRTY_SPACE(4);
+			ofs += 4;
+			continue;
+		}
+
 		switch(node.nodetype | JFFS2_NODE_ACCURATE) {
 		case JFFS2_NODETYPE_INODE:
 			err = jffs2_scan_inode_node(c, jeb, &ofs);


--
dwmw2
