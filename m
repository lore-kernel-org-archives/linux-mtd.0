Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhtNh-0000oa-J9
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 13:05:22 -0400
Received: from mailout1.echostar.com ([204.76.128.101])
	by pentafluge.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhrXK-0000RW-Fu
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 16:07:11 +0100
Message-ID: <C86A9402F6A07E47B2F50A302DFA9BAE044CBF@alm-exch.europe.echostar.com>
From: "Teuling, Sieme" <Sieme.Teuling@echostar.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 6 Jul 2004 09:06:25 -0600 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Kernel BUG
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi anyone,

I'm currently using the 2.4.21 kernel with mtd-snapshot-20040621 and a 2.4.
ilookup patch (included below) on an embedded conexant platform. I sometimes
run into the error below at the startup of the platform (a short time after
the mount). Does anybody know where this comes from and if it is possible to
fix it for the 2.4.21 kernel?

The error message:

kernel BUG at gc.c:139!

Unable to handle kernel NULL pointer dereference at virtual address 00000000

pgd = c0004000
[00000000] *pgd=00000000, *pmd = 00000000
Internal error: Oops: 807
CPU: 0
pc : [<c0045824>]    lr : [<c0045820>]    Tainted: P
sp : c33d9f10  ip : c33d9ee8  fp : 00000000
r10: 00000000  r9 : c023e178  r8 : c34d1cec
r7 : c34ec600  r6 : c34d1cbc  r5 : c343a000  r4 : 00000000
r3 : 00000000  r2 : 00000001  r1 : 00000001  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C000317F  Table: 03A34000  DAC: 00000015
Process jffs2_gcd_mtd0 (pid: 36, stack limit = 0xc33d8368)
Stack: (0xc33d9f10 to 0xc33da000)
9f00:                                     c34496b0 c00c4370 c36f2420
c33d8000
9f20: c33d8000 c348e000 c0236000 c0236000 c33d9f64 c0048678 c0238000
c33d8000
9f40: c343a000 c34d1cbc c34ec600 c33d8000 c343a000 c34d1cbc c34ec600
00000000
9f60: 0000000c c00c78ac c37fb200 c33d8000 00000000 c0040c64 c33d8000
d0dd0600
9f80: 00000000 c33d9f90 00000013 00000000 00000000 00000000 00000000
00000000
9fa0: 00000000 c33d9fb0 c0040b6c c0048340 00000000 00000000 00000600
c34d1cbc
9fc0: 00000003 c343a000 00000000 c34ec600 00000000 c023e178 0000000c
c343bec4
9fe0: c00c7740 bffffd20 00000000 c343a000 00000000 c0042234 00000000
00000000
Backtrace: no frame pointer
Code: 1b00179a e59f0014 eb001798 e3a03000 (e5833000)

The ilookup patch:

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2003/11/03 12:21:49-02:00 dwmw2@infradead.org 
#   [PATCH] ilookup() for 2.4.
#   
#   <viro> dwmw2: I really don't like the semantics of ilookup() - or
#   existing callers of that animal, for that matter.
#   <viro> dwmw2: the thing is, it's just begging to be abused
#   <viro> dwmw2: yes, in your case it is legitimate
#   <viro> dwmw2: all right, to hell with that.
#   <viro> dwmw2: <shrug> feel free to backport it...
#   
#   Marcelo, please apply. This is the simplest way to fix a race condition
#   in JFFS2, where we attempt to garbage-collect a physical node belonging
#   to an inode which is being deleted and is gone from the icache by the
#   time we look for it. Just using iget() and causing read_inode() to
#   happen again for the deleted inode is the wrong thing to do.
#   
#   This is just the 2.4 backport of ilookup(). The JFFS2 change itself will
#   be next.
#   
#   ===== fs/inode.c 1.40 vs edited =====
# 
# fs/inode.c
#   2003/11/02 10:41:42-02:00 dwmw2@infradead.org +31 -0
#   ilookup() for 2.4.
# 
# include/linux/fs.h
#   2003/11/02 10:32:38-02:00 dwmw2@infradead.org +1 -0
#   ilookup() for 2.4.
# 
# kernel/ksyms.c
#   2003/11/02 10:33:19-02:00 dwmw2@infradead.org +1 -0
#   ilookup() for 2.4.
# 
diff -Nru a/fs/inode.c b/fs/inode.c
--- a/fs/inode.c	2004-06-21 08:59:49 -07:00
+++ b/fs/inode.c	2004-06-21 08:59:49 -07:00
@@ -947,6 +947,37 @@
 	
 }
 
+/**
+ *	ilookup - search for an inode in the inode cache
+ *	@sb:         super block of file system to search
+ *	@ino:        inode number to search for
+ *
+ *	If the inode is in the cache, the inode is returned with an
+ *	incremented reference count.
+ *
+ *	Otherwise, %NULL is returned.
+ *
+ *	This is almost certainly not the function you are looking for.
+ *	If you think you need to use this, consult an expert first.
+ */
+struct inode *ilookup(struct super_block *sb, unsigned long ino)
+{
+	struct list_head * head = inode_hashtable + hash(sb,ino);
+	struct inode * inode;
+
+	spin_lock(&inode_lock);
+	inode = find_inode(sb, ino, head, NULL, NULL);
+	if (inode) {
+		__iget(inode);
+		spin_unlock(&inode_lock);
+		wait_on_inode(inode);
+		return inode;
+	}
+	spin_unlock(&inode_lock);
+
+	return inode;
+}
+
 struct inode *igrab(struct inode *inode)
 {
 	spin_lock(&inode_lock);
diff -Nru a/include/linux/fs.h b/include/linux/fs.h
--- a/include/linux/fs.h	2004-06-21 08:59:49 -07:00
+++ b/include/linux/fs.h	2004-06-21 08:59:49 -07:00
@@ -1395,6 +1395,7 @@
 extern void iput(struct inode *);
 extern void force_delete(struct inode *);
 extern struct inode * igrab(struct inode *);
+extern struct inode * ilookup(struct super_block *, unsigned long);
 extern ino_t iunique(struct super_block *, ino_t);
 
 typedef int (*find_inode_t)(struct inode *, unsigned long, void *);
diff -Nru a/kernel/ksyms.c b/kernel/ksyms.c
--- a/kernel/ksyms.c	2004-06-21 08:59:49 -07:00
+++ b/kernel/ksyms.c	2004-06-21 08:59:49 -07:00
@@ -143,6 +143,7 @@
 EXPORT_SYMBOL(fget);
 EXPORT_SYMBOL(igrab);
 EXPORT_SYMBOL(iunique);
+EXPORT_SYMBOL(ilookup);
 EXPORT_SYMBOL(iget4);
 EXPORT_SYMBOL(iput);
 EXPORT_SYMBOL(inode_init_once);
