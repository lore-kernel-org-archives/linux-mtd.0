Received: from av7-1-sn1.fre.skanova.net ([81.228.11.113])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRd2k-0000W1-92
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 15:56:48 -0500
Received: from smtp3-2-sn1.fre.skanova.net (smtp3-2-sn1.fre.skanova.net
	[81.228.11.164])
	by av7-1-sn1.fre.skanova.net (Postfix) with ESMTP id 1DBA537E46
	for <linux-mtd@lists.infradead.org>;
	Tue,  9 Nov 2004 21:56:45 +0100 (CET)
Received: from grey (h77n2fls34o815.telia.com [213.67.183.77])
	by smtp3-2-sn1.fre.skanova.net (Postfix) with ESMTP id E9EBA37E4D
	for <linux-mtd@lists.infradead.org>;
	Tue,  9 Nov 2004 21:56:44 +0100 (CET)
From: "Per Hedblom" <per.hedblom@abem.se>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 9 Nov 2004 21:56:41 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <20041109205644.E9EBA37E4D@smtp3-2-sn1.fre.skanova.net>
Subject: eCos gc.c BUG_ON(end > JFFS2_F_I_SIZE(f)) 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have a problem with the eCos version of jffs2 that I posted to the eCos
discuss list.
Ref: http://ecos.sourceware.org/ml/ecos-discuss/2004-10/msg00350.html and
got the recommendation to bring this up here instead.

I have found that jffs2 fails to garbage collect the inode that it currently
adds data to.
The result is that jffs2_garbage_collect_dnode ends with a BUG() call.
I have created a test case that I run on the ecos synt target.
My test stresses the jffs2 with a near to full file system.
I add files until I get ENOSPC and then remove an old file to make space for
a new one.

Here is what happens just before the BUG:
0) The flash is almost full but there should be enough dirty space available
for garbage collect.

1) User level code opens the file /small_files/127 for append (inode #186)

2) Then it request a write of 12000 bytes to file /small_files/127

3) JFFS2 then needs to do some garbage collect to make space for the new
data
jffs2_gc_fetch_inode #169 link=1
jffs2_gc_fetch_inode #167 link=1
jffs2_gc_fetch_inode #166 link=1
jffs2_gc_fetch_inode #172 link=1
jffs2_gc_fetch_inode #172 link=1
jffs2_gc_fetch_inode #178 link=1
jffs2_gc_fetch_inode #173 link=1

4) Then it can write 204 bytes
jffs2_write_inode_range:increasing writtenlen by 204 #186

5) and 84 bytes
jffs2_write_inode_range:increasing writtenlen by 84 #186

6) then it needs to do some more garbage collect and it selects the erase
block containing the #186
jffs2_gc_fetch_inode #186 link=1

7) and the fails in the BUG
BUG() at /home/perhedblom/redhat/ecos/packages/fs/jffs2/current/src/gc.c
1161
----------------------------

The test that fails is BUG_ON(end > JFFS2_F_I_SIZE(f)) in the function
jffs2_garbage_collect_dnode in gc.c.

The problem is that the 288(=204+84) bytes latest written are not added to
the inode->i_size yet but already available in the frag tree.


I can add code to update the inode->i_size in the jffs2_write_inode_range
after each successful write but I don't think this is correct to the jffs2
architecture but it makes the code run.

cvs diff -u -wb -U5 -p write.c (in directory C:\cvs\mtd\fs\jffs2\)
Index: write.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/write.c,v
retrieving revision 1.85
diff -u -w -b -U5 -p -r1.85 write.c
--- write.c	13 Jul 2004 08:58:25 -0000	1.85
+++ write.c	9 Nov 2004 20:28:02 -0000
@@ -436,10 +436,16 @@ int jffs2_write_inode_range(struct jffs2
 		D1(printk(KERN_DEBUG "increasing writtenlen by %d\n",
datalen));
 		writtenlen += datalen;
 		offset += datalen;
 		writelen -= datalen;
 		buf += datalen;
+		{ 
+		  struct _inode *inode =OFNI_EDONI_2SFFJ(f);
+		  if (offset > inode->i_size)
+		    inode->i_size = offset;
+		}
+
 	}
 	*retlen = writtenlen;
 	return ret;
 }

I guess that this problem is only related to ecos/jffs2 but I don't know.

Comments?

Per Hedblom
ABEM 
