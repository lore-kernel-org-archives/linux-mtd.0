Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WmxO-0007tQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 23:18:58 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C5B2246.2ABBCEFD@comdev.cc> 
References: <3C5B2246.2ABBCEFD@comdev.cc>  <3C5B0B3A.374C46F@comdev.cc> <3C5AD150.1A3B9AAE@comdev.cc> <20020201142405.79130.qmail@web20309.mail.yahoo.com> <9323.1012576311@redhat.com> <30239.1012586688@redhat.com> <3C5ADFC8.BD97CFFF@comdev.cc> <3C5AF025.F61F91F6@comdev.cc> <4597.1012605105@redhat.com> 
To: Adam Wozniak <adam.wozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: debugging strategies for jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Feb 2002 23:30:03 +0000
Message-ID: <4997.1012606203@redhat.com>
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

adam.wozniak@comdev.cc said:
>  Here's the workaround I came up with: in scan.c:

Yeah - with a couple more elsewhere too...

Index: nodelist.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodelist.c,v
retrieving revision 1.36
diff -u -r1.36 nodelist.c
--- nodelist.c	2002/01/09 16:52:59	1.36
+++ nodelist.c	2002/02/01 23:29:35
@@ -240,7 +240,12 @@
 			}
 			tn->version = node.i.version;
 			tn->fn->ofs = node.i.offset;
-			tn->fn->size = node.i.dsize;
+			/* There was a bug where we wrote hole nodes out with
+			   csize/dsize swapped. Deal with it */
+			if (node.i.compr == JFFS2_COMPR_ZERO && !node.i.dsize && node.i.csize)
+				tn->fn->size = node.i.csize;
+			else // normal case...
+				tn->fn->size = node.i.dsize;
 			tn->fn->raw = ref;
 			D1(printk(KERN_DEBUG "dnode @%08x: ver %u, offset %04x, dsize %04x\n", ref->flash_offset &~3, node.i.version, node.i.offset, node.i.dsize));
 			jffs2_add_tn_to_list(tn, &ret_tn);
Index: read.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/read.c,v
retrieving revision 1.19
diff -u -r1.19 read.c
--- read.c	2002/01/14 23:30:26	1.19
+++ read.c	2002/02/01 23:29:35
@@ -74,6 +74,12 @@
 		ret = -EIO;
 		goto out_ri;
 	}
+	/* There was a bug where we wrote hole nodes out with csize/dsize
+	   swapped. Deal with it */
+	if (ri->compr == JFFS2_COMPR_ZERO && !ri->dsize && ri->csize) {
+		ri->dsize = ri->csize;
+		ri->csize = 0;
+	}
 
 	D1(if(ofs + len > ri->dsize) {
 		printk(KERN_WARNING "jffs2_read_dnode() asked for %d bytes at %d from %d-byte node\n", len, ofs, ri->dsize);
Index: scan.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/scan.c,v
retrieving revision 1.57
diff -u -r1.57 scan.c
--- scan.c	2002/01/09 13:25:58	1.57
+++ scan.c	2002/02/01 23:29:35
@@ -443,6 +443,12 @@
 		*ofs += 4;
 		return 0;
 	}
+	/* There was a bug where we wrote hole nodes out with csize/dsize
+	   swapped. Deal with it */
+	if (ri.compr == JFFS2_COMPR_ZERO && !ri.dsize && ri.csize) {
+		ri.dsize = ri.csize;
+		ri.csize = 0;
+	}
 
 	if (ri.csize) {
 		/* Check data CRC too */
@@ -473,7 +479,7 @@
 			       *ofs, ri.data_crc, crc);
 			DIRTY_SPACE(PAD(ri.totlen));
 			*ofs += PAD(ri.totlen);
-			return -0;
+			return 0;
 		}
 	}
 

--
dwmw2
