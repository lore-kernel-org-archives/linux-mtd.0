Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Xm2q-0001jH-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 18:04:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020725141838.53920.qmail@mail.com> 
References: <20020725141838.53920.qmail@mail.com> 
To: "Mike Schumi" <schumi@techie.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_do_reserve_space 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jul 2002 18:04:41 +0100
Message-ID: <20696.1027616681@redhat.com>
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

Can you try this?

Index: fs/jffs2/scan.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/scan.c,v
retrieving revision 1.78
diff -u -p -r1.78 scan.c
--- fs/jffs2/scan.c	2 Jul 2002 22:48:24 -0000	1.78
+++ fs/jffs2/scan.c	25 Jul 2002 17:04:28 -0000
@@ -322,6 +322,16 @@ static int jffs2_scan_eraseblock (struct
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
 		if (!(node.nodetype & JFFS2_NODE_ACCURATE)) {
 			/* Wheee. This is an obsoleted node */
 			D2(printk(KERN_DEBUG "Node at 0x%08x is obsolete. Skipping\n", ofs));


--
dwmw2
