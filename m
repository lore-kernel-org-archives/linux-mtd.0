From: David Woodhouse <dwmw2@infradead.org>
To: Ian Campbell <icampbell@arcom.com>
In-Reply-To: <1101120637.2922.283.camel@icampbell-debian>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
	<20041120145020.GA15782@synertronixx3>
	<1100962661.8600.41.camel@localhost.localdomain>
	<20041120163510.GD7984@ku-gbr.de>
	<1100968467.7949.8.camel@localhost.localdomain>
	<1101119250.2922.276.camel@icampbell-debian>
	<1101120637.2922.283.camel@icampbell-debian>
Content-Type: text/plain
Message-Id: <1101121532.8191.7437.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 22 Nov 2004 11:05:32 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-22 at 10:50 +0000, Ian Campbell wrote:
> Gah! Looks like I spoke to soon. Even with both of these patches I still
> see the BUG_ON, I've turned off pre-empt as well.

Quick fix... I suspect the real answer is a pass after the mount has
completed which merges all already-adjacent obsolete nodes, and
disassociates them from their inode.

Index: nodemgmt.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodemgmt.c,v
retrieving revision 1.114
diff -u -p -r1.114 nodemgmt.c
--- nodemgmt.c	20 Nov 2004 16:39:59 -0000	1.114
+++ nodemgmt.c	22 Nov 2004 11:03:49 -0000
@@ -601,8 +601,9 @@ void jffs2_mark_node_obsolete(struct jff
 
 
 	/* Merge with the next node in the physical list, if there is one
-	   and if it's also obsolete. */
-	if (ref->next_phys && ref_obsolete(ref->next_phys) ) {
+	   and if it's also obsolete and if it doesn't belong to any inode */
+	if (ref->next_phys && ref_obsolete(ref->next_phys) &&
+	    !ref->next_phys->next_in_ino) {
 		struct jffs2_raw_node_ref *n = ref->next_phys;
 		
 		spin_lock(&c->erase_completion_lock);


-- 
dwmw2
