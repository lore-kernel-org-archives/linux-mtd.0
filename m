Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CGIWs-00052Q-OT
	for linux-mtd@lists.infradead.org; Sat, 09 Oct 2004 10:49:04 -0400
Message-ID: <4167FA3E.60609@yandex.ru>
Date: Sat, 09 Oct 2004 18:48:30 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <416122A1.4060302@oktetlabs.ru>		<1096885344.30942.559.camel@hades.cambridge.redhat.com>		<416127B7.3070505@yandex.ru>		<1096893242.22034.5.camel@weaponx.rchland.ibm.com>		<41614B2F.8060901@yandex.ru>		<1096895892.30942.614.camel@hades.cambridge.redhat.com>		<41615BA7.60801@yandex.ru>		<1096899817.30942.618.camel@hades.cambridge.redhat.com>		<4162AABC.9060809@yandex.ru>		<1096994744.30942.905.camel@hades.cambridge.redhat.com>	<1096996838.24013.3.camel@weaponx.rchland.ibm.com>	<4167CF42.3030506@yandex.ru>
	<4167E11C.1020202@mail.ru>
In-Reply-To: <4167E11C.1020202@mail.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Moreover, there is the 'ofs' field in the jffs2_full_dnode which isn't 
> really needed since the sabe information is in the raw->flash_offset 
> field. So, we can for example add 'version' and remove 'ofs' field. The 
> size won't change, the JFFS2 will be a bit simpler. Only small overhead 
> (need to dereference pointer to get the ofs) will be introduced.
> 
Sorry again (:-)), this is false. 'ofs' field is another offset and is 
needed.
I was just confused by the comment "/* Don't really need this, but 
optimisation */"...

Here is the patch (just for demonstration) to move the version field 
from tmp_dnode_info to full_dnode structure. It is quite simple. But it 
would be very useful fir checkpoints. It works at least with my simple 
JFFS2 test.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.



diff -auNr mtd-snapshot-20041008/fs/jffs2/nodelist.c 
mtd-version-move/fs/jffs2/nodelist.c
--- mtd-snapshot-20041008/fs/jffs2/nodelist.c	2003-11-01 
02:00:35.000000000 +0300
+++ mtd-version-move/fs/jffs2/nodelist.c	2004-10-09 17:50:43.325035342 +0400
@@ -62,7 +62,7 @@
  {
  	struct jffs2_tmp_dnode_info **prev = list;
  	
-	while ((*prev) && (*prev)->version < tn->version) {
+	while ((*prev) && (*prev)->fn->version < tn->fn->version) {
  		prev = &((*prev)->next);
  	}
  	tn->next = (*prev);
@@ -363,7 +363,7 @@
  				jffs2_free_tmp_dnode_info(tn);
  				goto free_out;
  			}
-			tn->version = je32_to_cpu(node.i.version);
+			tn->fn->version = je32_to_cpu(node.i.version);
  			tn->fn->ofs = je32_to_cpu(node.i.offset);
  			/* There was a bug where we wrote hole nodes out with
  			   csize/dsize swapped. Deal with it */
diff -auNr mtd-snapshot-20041008/fs/jffs2/nodelist.h 
mtd-version-move/fs/jffs2/nodelist.h
--- mtd-snapshot-20041008/fs/jffs2/nodelist.h	2004-10-08 
02:00:14.000000000 +0400
+++ mtd-version-move/fs/jffs2/nodelist.h	2004-10-09 17:54:20.785755572 +0400
@@ -167,8 +167,8 @@
  	uint32_t size;
  	uint32_t frags; /* Number of fragments which currently refer
  			to this node. When this reaches zero,
-			the node is obsolete.
-		     */
+			the node is obsolete.  */
+	uint32_t version;
  };

  /*
@@ -180,7 +180,6 @@
  {
  	struct jffs2_tmp_dnode_info *next;
  	struct jffs2_full_dnode *fn;
-	uint32_t version;
  };

  struct jffs2_full_dirent
diff -auNr mtd-snapshot-20041008/fs/jffs2/readinode.c 
mtd-version-move/fs/jffs2/readinode.c
--- mtd-snapshot-20041008/fs/jffs2/readinode.c	2003-11-04 
02:00:36.000000000 +0300
+++ mtd-version-move/fs/jffs2/readinode.c	2004-10-09 17:48:25.354322429 
+0400
@@ -526,7 +526,7 @@
  		fn = tn->fn;

  		if (f->metadata) {
-			if (likely(tn->version >= mdata_ver)) {
+			if (likely(tn->fn->version >= mdata_ver)) {
  				D1(printk(KERN_DEBUG "Obsoleting old metadata at 0x%08x\n", 
ref_offset(f->metadata->raw)));
  				jffs2_mark_node_obsolete(c, f->metadata->raw);
  				jffs2_free_full_dnode(f->metadata);
@@ -536,7 +536,7 @@
  			} else {
  				/* This should never happen. */
  				printk(KERN_WARNING "Er. New metadata at 0x%08x with ver %d is 
actually older than previous ver %d at 0x%08x\n",
-					  ref_offset(fn->raw), tn->version, mdata_ver, 
ref_offset(f->metadata->raw));
+					  ref_offset(fn->raw), tn->fn->version, mdata_ver, 
ref_offset(f->metadata->raw));
  				jffs2_mark_node_obsolete(c, fn->raw);
  				jffs2_free_full_dnode(fn);
  				/* Fill in latest_node from the metadata, not this one we're about 
to free... */
@@ -549,9 +549,9 @@
  			jffs2_add_full_dnode_to_inode(c, f, fn);
  		} else {
  			/* Zero-sized node at end of version list. Just a metadata update */
-			D1(printk(KERN_DEBUG "metadata @%08x: ver %d\n", 
ref_offset(fn->raw), tn->version));
+			D1(printk(KERN_DEBUG "metadata @%08x: ver %d\n", 
ref_offset(fn->raw), tn->fn->version));
  			f->metadata = fn;
-			mdata_ver = tn->version;
+			mdata_ver = tn->fn->version;
  		}
  	next_tn:
  		tn_list = tn->next;


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
