Received: from mail.broadpark.no ([217.13.4.2])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkO6s-0003Qt-Gw
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 10:18:19 -0400
Received: from famine (217-13-20-38.dd.nextgentel.com [217.13.20.38])
	by mail.broadpark.no (Postfix) with ESMTP id BA10B2DE0
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jul 2004 16:18:47 +0200 (MEST)
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-63Mnx2Wo239bx8Gnce67"
Message-Id: <1089728296.6288.19.camel@famine>
Mime-Version: 1.0
Date: Tue, 13 Jul 2004 16:18:16 +0200
Subject: Prune obsolete raw_node_ref's from RAM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-63Mnx2Wo239bx8Gnce67
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

This patch prunes raw_node_ref's from RAM so as to achieve a fixed
steady state RAM memory footprint when the number of files is constant. 

The diff is against the eCos repository since thats where all this
started:

http://ecos.sourceware.org/ml/ecos-discuss/2004-07/msg00158.html



Remaining issues to be checked:

- Is the code correct? 
- What performance impact does it have? 

-- 
Øyvind Harboe
http://www.zylin.com


--=-63Mnx2Wo239bx8Gnce67
Content-Disposition: attachment; filename=memleakfix.txt
Content-Type: text/x-patch; name=memleakfix.txt; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Index: nodemgmt.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/nodemgmt.c,v
retrieving revision 1.6
diff -w -u -r1.6 nodemgmt.c
--- nodemgmt.c	11 Dec 2003 23:33:54 -0000	1.6
+++ nodemgmt.c	13 Jul 2004 13:35:44 -0000
@@ -549,6 +549,60 @@
 		printk(KERN_WARNING "Short write in obliterating obsoleted node at 0x%08x: %zd\n", ref_offset(ref), retlen);
 		return;
 	}
+
+	// Merge obsolete nodes into its previous node, i.e. always leave
+	// one node behind so as not to screw up ref_totlen()
+	if (ref->next_in_ino!=NULL)
+	  {	
+	    bool moreToDo;
+	    do {
+	      moreToDo=false;	      
+	      struct jffs2_inode_cache *ic;
+	      ic = jffs2_raw_ref_to_ic(ref);
+
+	      // unlink the node and 
+	      struct jffs2_raw_node_ref *raw;
+	      struct jffs2_raw_node_ref *prev=NULL;
+	      raw = ic->nodes;
+	      for (raw = ic->nodes; raw != (void *)ic; raw = raw->next_in_ino) {
+		// if this node *and* the previous *physical node* are obsolete, combine them.
+		if ((prev!=NULL)&&ref_obsolete(raw)) {
+		  // now take take it off the physcial list, unless it is the 
+		  // first node.
+		  struct jffs2_raw_node_ref *t;
+		  struct jffs2_raw_node_ref *phys_prev=NULL;
+		  t=jeb->first_node;
+		  while (t!=NULL) {
+		    if ((phys_prev!=NULL)&&(t==raw)&&ref_obsolete(prev)) {
+		      // take it off the inode list.
+		      prev->next_in_ino=t->next_in_ino;
+		      
+		      // take it off the physical list
+		      phys_prev->next_phys=t->next_phys;
+		      // update last physical entry pointer...
+		      if (jeb->last_node==t) {
+			jeb->last_node=t->next_phys;
+		      }
+		      
+		      // update physical __totlen field.
+		      phys_prev->__totlen+=t->__totlen;
+	      
+	  
+		      jffs2_free_raw_node_ref(raw);
+		      moreToDo=true;
+
+		      break;
+		    }
+		    phys_prev=t;
+		    t=t->next_phys;
+		  }
+		  break;
+		}
+		prev=raw;
+	      }
+	    } while (moreToDo);
+	      }
+	
 }
 
 #if CONFIG_JFFS2_FS_DEBUG > 0

--=-63Mnx2Wo239bx8Gnce67--
