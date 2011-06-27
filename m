Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGXq-0003Dh-U6
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:28:33 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 03/10] mtd-utils: remove whitespace at end of lines
Date: Mon, 27 Jun 2011 11:27:20 -0700
Message-ID: <1309199247-19248-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 device_table.txt                         |    6 +++---
 include/linux/jffs2.h                    |    2 +-
 lib/libfec.c                             |   14 +++++++-------
 mcast_image.h                            |    4 ++--
 mkfs.jffs2.1                             |    6 +++---
 mkfs.jffs2.c                             |    6 +++---
 mkfs.ubifs/hashtable/hashtable.c         |   14 +++++++-------
 mkfs.ubifs/hashtable/hashtable.h         |   30 +++++++++++++++---------------
 mkfs.ubifs/hashtable/hashtable_itr.c     |   12 ++++++------
 mkfs.ubifs/hashtable/hashtable_itr.h     |   12 ++++++------
 mkfs.ubifs/hashtable/hashtable_private.h |   12 ++++++------
 nandtest.c                               |   16 ++++++++--------
 rbtree.c                                 |    6 +++---
 rbtree.h                                 |    4 ++--
 recv_image.c                             |   24 ++++++++++++------------
 serve_image.c                            |   30 +++++++++++++++---------------
 tests/checkfs/README                     |   26 +++++++++++++-------------
 tests/jittertest/README                  |   18 +++++++++---------
 tests/jittertest/filljffs2.sh            |    2 +-
 ubi-utils/dictionary.c                   |    6 +++---
 ubi-utils/libiniparser.c                 |    8 ++++----
 21 files changed, 129 insertions(+), 129 deletions(-)

diff --git a/device_table.txt b/device_table.txt
index 74fdc56..194fed6 100644
--- a/device_table.txt
+++ b/device_table.txt
@@ -5,10 +5,10 @@
 #   /sbin/foobar	f	2755	0	0	-	-	-	-	-
 # and (assuming the file /sbin/foobar exists) it will be made setuid
 # root (regardless of what its permissions are on the host filesystem.
-# 
+#
 # Device table entries take the form of:
 # <name>		<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
-# where name is the file name,  type can be one of: 
+# where name is the file name,  type can be one of:
 #	f	A regular file
 #	d	Directory
 #	c	Character special device file
@@ -19,7 +19,7 @@
 # file.
 
 # When building a target filesystem, it is desirable to not have to
-# become root and then run 'mknod' a thousand times.  Using a device 
+# become root and then run 'mknod' a thousand times.  Using a device
 # table you can create device nodes and directories "on the fly".
 # Furthermore, you can use a single table entry to create a many device
 # minors.  For example, if I wanted to create /dev/hda and /dev/hda[0-15]
diff --git a/include/linux/jffs2.h b/include/linux/jffs2.h
index c2f684a..7306f86 100644
--- a/include/linux/jffs2.h
+++ b/include/linux/jffs2.h
@@ -15,7 +15,7 @@
 #ifndef __LINUX_JFFS2_H__
 #define __LINUX_JFFS2_H__
 
-/* You must include something which defines the C99 uintXX_t types. 
+/* You must include something which defines the C99 uintXX_t types.
    We don't do it from here because this file is used in too many
    different environments. */
 
diff --git a/lib/libfec.c b/lib/libfec.c
index c89a180..ff5a127 100644
--- a/lib/libfec.c
+++ b/lib/libfec.c
@@ -79,7 +79,7 @@ typedef unsigned short u_short ;
 	  if (t1 < t) t = 256000000 + t1 - t ; \
 	  else t = t1 - t ; \
 	  if (t == 0) t = 1 ;}
-	
+
 u_long ticks[10];	/* vars for timekeeping */
 #else
 #define DEB(x)
@@ -200,7 +200,7 @@ static inline gf
 gf_mul(x,y)
 {
     if ( (x) == 0 || (y)==0 ) return 0;
-     
+
     return gf_exp[gf_log[x] + gf_log[y] ] ;
 }
 #define init_mul_table()
@@ -315,7 +315,7 @@ generate_gf(void)
  * unrolled 16 times, a good value for 486 and pentium-class machines.
  * The case c=0 is also optimized, whereas c=1 is not. These
  * calls are unfrequent in my typical apps so I did not bother.
- * 
+ *
  * Note that gcc on
  */
 #define addmul(dst, src, c, sz) \
@@ -452,7 +452,7 @@ invert_mat(gf *src, int k)
 			}
 		    } else if (ipiv[ix] > 1) {
 			fprintf(stderr, "singular matrix\n");
-			goto fail ; 
+			goto fail ;
 		    }
 		}
 	    }
@@ -562,7 +562,7 @@ invert_vdm(gf *src, int k)
     b = NEW_GF_MATRIX(1, k);
 
     p = NEW_GF_MATRIX(1, k);
-   
+
     for ( j=1, i = 0 ; i < k ; i++, j+=k ) {
 	c[i] = 0 ;
 	p[i] = src[j] ;    /* p[i] */
@@ -807,7 +807,7 @@ build_decode_matrix(struct fec_parms *code, int index[])
 	} else
 #endif
 	if (index[i] < code->n )
-	    memcpy(p,  &(code->enc_matrix[index[i]*k]), k*sizeof(gf) ); 
+	    memcpy(p,  &(code->enc_matrix[index[i]*k]), k*sizeof(gf) );
 	else {
 	    fprintf(stderr, "decode: invalid index %d (max %d)\n",
 		index[i], code->n - 1 );
@@ -838,7 +838,7 @@ build_decode_matrix(struct fec_parms *code, int index[])
 int
 fec_decode(struct fec_parms *code, gf *pkt[], int index[], int sz)
 {
-    gf *m_dec ; 
+    gf *m_dec ;
     gf **new_pkt ;
     int row, col , k = code->k ;
 
diff --git a/mcast_image.h b/mcast_image.h
index 07b6e31..8e94ffa 100644
--- a/mcast_image.h
+++ b/mcast_image.h
@@ -24,7 +24,7 @@ struct image_pkt {
 struct fec_parms;
 
 /* k - number of actual data packets
- * n - total number of packets including data and redundant packets 
+ * n - total number of packets including data and redundant packets
  *   (actual packet size isn't relevant here) */
 struct fec_parms *fec_new(int k, int n);
 void fec_free(struct fec_parms *p);
@@ -45,7 +45,7 @@ void fec_encode_linear(struct fec_parms *code, unsigned char *src,
 /* data  - array of (k) pointers to data packets, in arbitrary order (see i)
  * i     - indices of (data) packets
  * sz    - data packet size
- * 
+ *
  * Will never fail as long as you give it (k) individual data packets.
  * Will re-order the (data) pointers but not the indices -- data packets
  * are ordered on return.
diff --git a/mkfs.jffs2.1 b/mkfs.jffs2.1
index 1eefeda..9b0acc3 100644
--- a/mkfs.jffs2.1
+++ b/mkfs.jffs2.1
@@ -104,7 +104,7 @@ or the present directory, if the
 .B -r
 option is not specified.
 
-Each block of the files to be placed into the file system image 
+Each block of the files to be placed into the file system image
 are compressed using one of the avaiable compressors depending
 on the selected compression mode.
 
@@ -196,8 +196,8 @@ Enables xattr, stuff only SELinux Labels into jffs2 image file.
 Enable xattr, stuff only POSIX ACL entries into jffs2 image file.
 .TP
 .B -m, --compression-mode=MODE
-Set the default compression mode. The default mode is 
-.B priority 
+Set the default compression mode. The default mode is
+.B priority
 which tries the compressors in a predefinied order and chooses the first
 successful one. The alternatives are:
 .B none
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 7abaf50..ad88ac6 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -123,11 +123,11 @@ uint32_t find_hardlink(struct filesystem_entry *e)
 		f = rb_entry(parent, struct filesystem_entry, hardlink_rb);
 
 		if ((f->sb.st_dev < e->sb.st_dev) ||
-		    (f->sb.st_dev == e->sb.st_dev && 
+		    (f->sb.st_dev == e->sb.st_dev &&
 		     f->sb.st_ino < e->sb.st_ino))
 			n = &parent->rb_left;
 		else if ((f->sb.st_dev > e->sb.st_dev) ||
-			 (f->sb.st_dev == e->sb.st_dev && 
+			 (f->sb.st_dev == e->sb.st_dev &&
 			  f->sb.st_ino > e->sb.st_ino)) {
 			n = &parent->rb_right;
 		} else
@@ -264,7 +264,7 @@ static struct filesystem_entry *add_host_filesystem_entry(const char *name,
 	tmp = xstrdup(name);
 	entry->path = xstrdup(dirname(tmp));
 	free(tmp);
-	
+
 	entry->sb.st_ino = sb.st_ino;
 	entry->sb.st_dev = sb.st_dev;
 	entry->sb.st_nlink = sb.st_nlink;
diff --git a/mkfs.ubifs/hashtable/hashtable.c b/mkfs.ubifs/hashtable/hashtable.c
index 8aa273c..c1f99ed 100644
--- a/mkfs.ubifs/hashtable/hashtable.c
+++ b/mkfs.ubifs/hashtable/hashtable.c
@@ -100,7 +100,7 @@ hashtable_expand(struct hashtable *h)
         h->table = newtable;
     }
     /* Plan B: realloc instead */
-    else 
+    else
     {
         newtable = (struct entry **)
                    realloc(h->table, newsize * sizeof(struct entry *));
@@ -246,23 +246,23 @@ hashtable_destroy(struct hashtable *h, int free_values)
 /*
  * Copyright (c) 2002, Christopher Clark
  * All rights reserved.
- * 
+ *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions
  * are met:
- * 
+ *
  * * Redistributions of source code must retain the above copyright
  * notice, this list of conditions and the following disclaimer.
- * 
+ *
  * * Redistributions in binary form must reproduce the above copyright
  * notice, this list of conditions and the following disclaimer in the
  * documentation and/or other materials provided with the distribution.
- * 
+ *
  * * Neither the name of the original author; nor the names of any contributors
  * may be used to endorse or promote products derived from this software
  * without specific prior written permission.
- * 
- * 
+ *
+ *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
diff --git a/mkfs.ubifs/hashtable/hashtable.h b/mkfs.ubifs/hashtable/hashtable.h
index b90781a..c0b0acd 100644
--- a/mkfs.ubifs/hashtable/hashtable.h
+++ b/mkfs.ubifs/hashtable/hashtable.h
@@ -19,7 +19,7 @@ struct hashtable;
  *      v = (struct some_value *)   malloc(sizeof(struct some_value));
  *
  *      (initialise k and v to suitable values)
- * 
+ *
  *      if (! hashtable_insert(h,k,v) )
  *      {     exit(-1);               }
  *
@@ -33,7 +33,7 @@ struct hashtable;
 
 /* Macros may be used to define type-safe(r) hashtable access functions, with
  * methods specialized to take known key and value types as parameters.
- * 
+ *
  * Example:
  *
  * Insert this at the start of your file:
@@ -63,7 +63,7 @@ struct hashtable;
 
 /*****************************************************************************
  * create_hashtable
-   
+
  * @name                    create_hashtable
  * @param   minsize         minimum initial size of hashtable
  * @param   hashfunction    function for hashing keys
@@ -78,7 +78,7 @@ create_hashtable(unsigned int minsize,
 
 /*****************************************************************************
  * hashtable_insert
-   
+
  * @name        hashtable_insert
  * @param   h   the hashtable to insert into
  * @param   k   the key - hashtable claims ownership and will free on removal
@@ -95,7 +95,7 @@ create_hashtable(unsigned int minsize,
  * If in doubt, remove before insert.
  */
 
-int 
+int
 hashtable_insert(struct hashtable *h, void *k, void *v);
 
 #define DEFINE_HASHTABLE_INSERT(fnname, keytype, valuetype) \
@@ -106,7 +106,7 @@ int fnname (struct hashtable *h, keytype *k, valuetype *v) \
 
 /*****************************************************************************
  * hashtable_search
-   
+
  * @name        hashtable_search
  * @param   h   the hashtable to search
  * @param   k   the key to search for  - does not claim ownership
@@ -124,7 +124,7 @@ valuetype * fnname (struct hashtable *h, keytype *k) \
 
 /*****************************************************************************
  * hashtable_remove
-   
+
  * @name        hashtable_remove
  * @param   h   the hashtable to remove the item from
  * @param   k   the key to search for  - does not claim ownership
@@ -143,7 +143,7 @@ valuetype * fnname (struct hashtable *h, keytype *k) \
 
 /*****************************************************************************
  * hashtable_count
-   
+
  * @name        hashtable_count
  * @param   h   the hashtable
  * @return      the number of items stored in the hashtable
@@ -154,7 +154,7 @@ hashtable_count(struct hashtable *h);
 
 /*****************************************************************************
  * hashtable_destroy
-   
+
  * @name        hashtable_destroy
  * @param   h   the hashtable
  * @param       free_values     whether to call 'free' on the remaining values
@@ -168,23 +168,23 @@ hashtable_destroy(struct hashtable *h, int free_values);
 /*
  * Copyright (c) 2002, Christopher Clark
  * All rights reserved.
- * 
+ *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions
  * are met:
- * 
+ *
  * * Redistributions of source code must retain the above copyright
  * notice, this list of conditions and the following disclaimer.
- * 
+ *
  * * Redistributions in binary form must reproduce the above copyright
  * notice, this list of conditions and the following disclaimer in the
  * documentation and/or other materials provided with the distribution.
- * 
+ *
  * * Neither the name of the original author; nor the names of any contributors
  * may be used to endorse or promote products derived from this software
  * without specific prior written permission.
- * 
- * 
+ *
+ *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
diff --git a/mkfs.ubifs/hashtable/hashtable_itr.c b/mkfs.ubifs/hashtable/hashtable_itr.c
index 5dced84..24f4dde 100644
--- a/mkfs.ubifs/hashtable/hashtable_itr.c
+++ b/mkfs.ubifs/hashtable/hashtable_itr.c
@@ -157,23 +157,23 @@ hashtable_iterator_search(struct hashtable_itr *itr,
 /*
  * Copyright (c) 2002, 2004, Christopher Clark
  * All rights reserved.
- * 
+ *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions
  * are met:
- * 
+ *
  * * Redistributions of source code must retain the above copyright
  * notice, this list of conditions and the following disclaimer.
- * 
+ *
  * * Redistributions in binary form must reproduce the above copyright
  * notice, this list of conditions and the following disclaimer in the
  * documentation and/or other materials provided with the distribution.
- * 
+ *
  * * Neither the name of the original author; nor the names of any contributors
  * may be used to endorse or promote products derived from this software
  * without specific prior written permission.
- * 
- * 
+ *
+ *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
diff --git a/mkfs.ubifs/hashtable/hashtable_itr.h b/mkfs.ubifs/hashtable/hashtable_itr.h
index eea699a..87a97eb 100644
--- a/mkfs.ubifs/hashtable/hashtable_itr.h
+++ b/mkfs.ubifs/hashtable/hashtable_itr.h
@@ -81,23 +81,23 @@ int fnname (struct hashtable_itr *i, struct hashtable *h, keytype *k) \
 /*
  * Copyright (c) 2002, 2004, Christopher Clark
  * All rights reserved.
- * 
+ *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions
  * are met:
- * 
+ *
  * * Redistributions of source code must retain the above copyright
  * notice, this list of conditions and the following disclaimer.
- * 
+ *
  * * Redistributions in binary form must reproduce the above copyright
  * notice, this list of conditions and the following disclaimer in the
  * documentation and/or other materials provided with the distribution.
- * 
+ *
  * * Neither the name of the original author; nor the names of any contributors
  * may be used to endorse or promote products derived from this software
  * without specific prior written permission.
- * 
- * 
+ *
+ *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
diff --git a/mkfs.ubifs/hashtable/hashtable_private.h b/mkfs.ubifs/hashtable/hashtable_private.h
index 3e95f60..3a558e6 100644
--- a/mkfs.ubifs/hashtable/hashtable_private.h
+++ b/mkfs.ubifs/hashtable/hashtable_private.h
@@ -54,23 +54,23 @@ indexFor(unsigned int tablelength, unsigned int hashvalue)
 /*
  * Copyright (c) 2002, Christopher Clark
  * All rights reserved.
- * 
+ *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions
  * are met:
- * 
+ *
  * * Redistributions of source code must retain the above copyright
  * notice, this list of conditions and the following disclaimer.
- * 
+ *
  * * Redistributions in binary form must reproduce the above copyright
  * notice, this list of conditions and the following disclaimer in the
  * documentation and/or other materials provided with the distribution.
- * 
+ *
  * * Neither the name of the original author; nor the names of any contributors
  * may be used to endorse or promote products derived from this software
  * without specific prior written permission.
- * 
- * 
+ *
+ *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
diff --git a/nandtest.c b/nandtest.c
index 93f01ca..d03dc11 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -79,7 +79,7 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 
 	printf("\r%08x: reading...", (unsigned)ofs);
 	fflush(stdout);
-	
+
 	len = pread(fd, rbuf, meminfo.erasesize, ofs);
 	if (len < meminfo.erasesize) {
 		printf("\n");
@@ -89,7 +89,7 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 			perror("read");
 		exit(1);
 	}
-		
+
 	if (ioctl(fd, ECCGETSTATS, &newstats)) {
 		printf("\n");
 		perror("ECCGETSTATS");
@@ -184,7 +184,7 @@ int main(int argc, char **argv)
 		case 'l':
 			length = strtol(optarg, NULL, 0);
 			break;
-			
+
 		}
 	}
 	if (argc - optind != 1)
@@ -195,7 +195,7 @@ int main(int argc, char **argv)
 		perror("open");
 		exit(1);
 	}
-	
+
 	if (ioctl(fd, MEMGETINFO, &meminfo)) {
 		perror("MEMGETINFO");
 		close(fd);
@@ -206,20 +206,20 @@ int main(int argc, char **argv)
 		length = meminfo.size;
 
 	if (offset % meminfo.erasesize) {
-		fprintf(stderr, "Offset %x not multiple of erase size %x\n", 
+		fprintf(stderr, "Offset %x not multiple of erase size %x\n",
 			offset, meminfo.erasesize);
 		exit(1);
 	}
 	if (length % meminfo.erasesize) {
-		fprintf(stderr, "Length %x not multiple of erase size %x\n", 
+		fprintf(stderr, "Length %x not multiple of erase size %x\n",
 			length, meminfo.erasesize);
 		exit(1);
 	}
 	if (length + offset > meminfo.size) {
-		fprintf(stderr, "Length %x + offset %x exceeds device size %x\n", 
+		fprintf(stderr, "Length %x + offset %x exceeds device size %x\n",
 			length, offset, meminfo.size);
 		exit(1);
-	}		
+	}
 
 	wbuf = malloc(meminfo.erasesize * 3);
 	if (!wbuf) {
diff --git a/rbtree.c b/rbtree.c
index dd50134..329e098 100644
--- a/rbtree.c
+++ b/rbtree.c
@@ -2,7 +2,7 @@
   Red Black Trees
   (C) 1999  Andrea Arcangeli <andrea@suse.de>
   (C) 2002  David Woodhouse <dwmw2@infradead.org>
-  
+
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
@@ -324,7 +324,7 @@ struct rb_node *rb_next(struct rb_node *node)
 	/* If we have a right-hand child, go down and then left as far
 	   as we can. */
 	if (node->rb_right) {
-		node = node->rb_right; 
+		node = node->rb_right;
 		while (node->rb_left)
 			node=node->rb_left;
 		return node;
@@ -352,7 +352,7 @@ struct rb_node *rb_prev(struct rb_node *node)
 	/* If we have a left-hand child, go down and then right as far
 	   as we can. */
 	if (node->rb_left) {
-		node = node->rb_left; 
+		node = node->rb_left;
 		while (node->rb_right)
 			node=node->rb_right;
 		return node;
diff --git a/rbtree.h b/rbtree.h
index e64dc9a..0d77b65 100644
--- a/rbtree.h
+++ b/rbtree.h
@@ -1,7 +1,7 @@
 /*
   Red Black Trees
   (C) 1999  Andrea Arcangeli <andrea@suse.de>
-  
+
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
@@ -156,7 +156,7 @@ extern struct rb_node *rb_first(struct rb_root *);
 extern struct rb_node *rb_last(struct rb_root *);
 
 /* Fast replacement of a single node without remove/rebalance/add/rebalance */
-extern void rb_replace_node(struct rb_node *victim, struct rb_node *new, 
+extern void rb_replace_node(struct rb_node *victim, struct rb_node *new,
 			    struct rb_root *root);
 
 static inline void rb_link_node(struct rb_node * node, struct rb_node * parent,
diff --git a/recv_image.c b/recv_image.c
index a3c3fd5..26a8361 100644
--- a/recv_image.c
+++ b/recv_image.c
@@ -111,7 +111,7 @@ int main(int argc, char **argv)
 	memset(&hints, 0, sizeof(hints));
 	hints.ai_flags = AI_ADDRCONFIG;
 	hints.ai_socktype = SOCK_DGRAM;
-	
+
 	ret = getaddrinfo(argv[1], argv[2], &hints, &ai);
 	if (ret) {
 		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(ret));
@@ -131,18 +131,18 @@ int main(int argc, char **argv)
 			rq.imr_multiaddr = ((struct sockaddr_in *)runp->ai_addr)->sin_addr;
 			rq.imr_interface.s_addr = INADDR_ANY;
 			if (setsockopt(sock, IPPROTO_IP, IP_ADD_MEMBERSHIP, &rq, sizeof(rq))) {
-				perror("IP_ADD_MEMBERSHIP"); 
+				perror("IP_ADD_MEMBERSHIP");
 				close(sock);
 				continue;
 			}
-			
+
 		} else if (runp->ai_family == AF_INET6 &&
 			   ((struct sockaddr_in6 *)runp->ai_addr)->sin6_addr.s6_addr[0] == 0xff) {
 			struct ipv6_mreq rq;
 			rq.ipv6mr_multiaddr =  ((struct sockaddr_in6 *)runp->ai_addr)->sin6_addr;
 			rq.ipv6mr_interface = 0;
 			if (setsockopt(sock, IPPROTO_IPV6, IPV6_ADD_MEMBERSHIP, &rq, sizeof(rq))) {
-				perror("IPV6_ADD_MEMBERSHIP"); 
+				perror("IPV6_ADD_MEMBERSHIP");
 				close(sock);
 				continue;
 			}
@@ -254,7 +254,7 @@ int main(int argc, char **argv)
 			continue;
 		}
 	pkt_again:
-		eraseblocks[block_nr].pkt_indices[eraseblocks[block_nr].nr_pkts++] = 
+		eraseblocks[block_nr].pkt_indices[eraseblocks[block_nr].nr_pkts++] =
 			ntohs(thispkt.hdr.pkt_nr);
 		total_pkts++;
 		if (!(total_pkts % 50) || total_pkts == pkts_per_block * nr_blocks) {
@@ -290,7 +290,7 @@ int main(int argc, char **argv)
 			       thispkt.data, fits);
 			wrotelen = pwrite(flfd, eraseblocks[block_nr].wbuf, WBUF_SIZE,
 					  eraseblocks[block_nr].flash_offset);
-			
+
 			if (wrotelen < WBUF_SIZE || (block_nr == 5 && eraseblocks[block_nr].nr_pkts == 5 && !faked)) {
 				faked = 1;
 				if (wrotelen < 0)
@@ -308,7 +308,7 @@ int main(int argc, char **argv)
 						~(meminfo.erasesize - 1);
 					erase.length = meminfo.erasesize;
 
-					printf("Will erase at %08x len %08x (bad write was at %08x)\n", 
+					printf("Will erase at %08x len %08x (bad write was at %08x)\n",
 					       erase.start, erase.length, eraseblocks[block_nr].flash_offset);
 					if (ioctl(flfd, MEMERASE, &erase)) {
 						perror("MEMERASE");
@@ -342,7 +342,7 @@ int main(int argc, char **argv)
 			memcpy(eraseblocks[block_nr].wbuf, &thispkt.data[fits], PKT_SIZE - fits);
 			eraseblocks[block_nr].wbuf_ofs = PKT_SIZE - fits;
 		}
-		
+
 		if (eraseblocks[block_nr].nr_pkts == pkts_per_block) {
 			eraseblocks[block_nr].crc = ntohl(thispkt.hdr.block_crc);
 
@@ -388,7 +388,7 @@ int main(int argc, char **argv)
 		gettimeofday(&now, NULL);
 		fec_time += (now.tv_usec - start.tv_usec) / 1000;
 		fec_time += (now.tv_sec - start.tv_sec) * 1000;
-		
+
 		for (i=0; i < pkts_per_block; i++)
 			memcpy(&decode_buf[i*PKT_SIZE], src_pkts[i], PKT_SIZE);
 
@@ -396,7 +396,7 @@ int main(int argc, char **argv)
 		gettimeofday(&start, NULL);
 		if (mtd_crc32(-1, decode_buf, meminfo.erasesize) != eraseblocks[block_nr].crc) {
 			printf("\nCRC mismatch for block #%d: want %08x got %08x\n",
-			       block_nr, eraseblocks[block_nr].crc, 
+			       block_nr, eraseblocks[block_nr].crc,
 			       mtd_crc32(-1, decode_buf, meminfo.erasesize));
 			exit(1);
 		}
@@ -410,7 +410,7 @@ int main(int argc, char **argv)
 
 			erase.start = eraseblocks[block_nr].flash_offset;
 			erase.length = meminfo.erasesize;
-			
+
 			printf("\rErasing block at %08x...", erase.start);
 
 			if (ioctl(flfd, MEMERASE, &erase)) {
@@ -430,7 +430,7 @@ int main(int argc, char **argv)
 		if (rwlen < meminfo.erasesize) {
 			if (rwlen < 0) {
 				perror("\ndecoded data write");
-			} else 
+			} else
 				fprintf(stderr, "\nshort write of decoded data\n");
 
 			if (!file_mode) {
diff --git a/serve_image.c b/serve_image.c
index f7f6315..38549a1 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -2,13 +2,13 @@
 #define _POSIX_C_SOURCE 199309
 
 #include <time.h>
-#include <errno.h>  	
-#include <error.h> 	
-#include <netdb.h> 	
-#include <stdio.h> 	
-#include <stdlib.h> 	
+#include <errno.h>
+#include <error.h>
+#include <netdb.h>
+#include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
-#include <unistd.h> 	
+#include <unistd.h>
 #include <fcntl.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -83,7 +83,7 @@ int main(int argc, char **argv)
 		fprintf(stderr, "Failed to allocate last-block buffer\n");
 		exit(1);
 	}
-	
+
 	fec = fec_new(pkts_per_block, total_pkts_per_block);
 	if (!fec) {
 		fprintf(stderr, "Error initialising FEC\n");
@@ -93,7 +93,7 @@ int main(int argc, char **argv)
 	memset(&hints, 0, sizeof(hints));
 	hints.ai_flags = AI_ADDRCONFIG;
 	hints.ai_socktype = SOCK_DGRAM;
-	
+
 	ret = getaddrinfo(argv[1], argv[2], &hints, &ai);
 	if (ret) {
 		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(ret));
@@ -167,9 +167,9 @@ int main(int argc, char **argv)
 		fflush(stdout);
 		block_crcs[block_nr] = mtd_crc32(-1, image + (block_nr * erasesize), erasesize);
 	}
-		
+
 	printf("\nImage size %ld KiB (0x%08lx). %d blocks at %d pkts/block\n"
-	       "Estimated transmit time per cycle: %ds\n", 
+	       "Estimated transmit time per cycle: %ds\n",
 	       (long)st.st_size / 1024, (long) st.st_size,
 	       nr_blocks, pkts_per_block,
 	       nr_blocks * pkts_per_block * pkt_delay / 1000000);
@@ -202,11 +202,11 @@ int main(int argc, char **argv)
 			   the first $pkts_per_block are cheap enough though
 			   because they're just copies. So alternate between
 			   simple and complex stuff, so that we don't start
-			   to choke and fail to keep up with the expected 
+			   to choke and fail to keep up with the expected
 			   bitrate in the second half of the sequence */
 			if (block_nr & 1)
 				actualpkt = pkt_nr;
-			else 
+			else
 				actualpkt = total_pkts_per_block - 1 - pkt_nr;
 
 			blockptr = image + (erasesize * block_nr);
@@ -246,7 +246,7 @@ int main(int argc, char **argv)
 #endif
 			gettimeofday(&now, NULL);
 #if 1
-			tosleep = nextpkt.tv_usec - now.tv_usec + 
+			tosleep = nextpkt.tv_usec - now.tv_usec +
 				(1000000 * (nextpkt.tv_sec - now.tv_sec));
 
 			/* We need hrtimers for this to actually work */
@@ -276,7 +276,7 @@ int main(int argc, char **argv)
 			   Adjust our expected timings accordingly. If
 			   we're only a little way behind, don't slip yet */
 			if (now.tv_usec > (now.tv_usec + (5 * pkt_delay) +
-					   1000000 * (nextpkt.tv_sec - now.tv_sec))) { 
+					1000000 * (nextpkt.tv_sec - now.tv_sec))) {
 				nextpkt = now;
 			}
 
@@ -291,7 +291,7 @@ int main(int argc, char **argv)
 				writeerrors = 0;
 
 
-			
+
 		}
 	}
 	munmap(image, st.st_size);
diff --git a/tests/checkfs/README b/tests/checkfs/README
index d9966a5..6b72487 100644
--- a/tests/checkfs/README
+++ b/tests/checkfs/README
@@ -11,11 +11,11 @@ This is the README file for the "checkfs" power fail test program.
 By: Vipin Malik
 
 NOTE: This program requires an external "power cycling box"
-connected to one of the com ports of the system under test. 
-This power cycling box should wait for a random amount of time 
-after it receives a "ok to power me down" message over the 
+connected to one of the com ports of the system under test.
+This power cycling box should wait for a random amount of time
+after it receives a "ok to power me down" message over the
 serial port, and then yank power to the system under test.
-(The box that I rigged up tested with waits anywhere from 
+(The box that I rigged up tested with waits anywhere from
 0 to ~40 seconds).
 
 
@@ -75,7 +75,7 @@ some "sister" files on the root fs even though "checkfs" would
 run fine through all its own check files.
 
 (I found this out when one of the clobbered sister file happened
-to be /bin/bash. The system refused to run rc.local thus 
+to be /bin/bash. The system refused to run rc.local thus
 preventing my "checkfs" program from being launched :)
 
 "checkfs":
@@ -98,8 +98,8 @@ Each file has a random number of bytes in it (set by using the
 first "int" in it (note: 0 length files are not allowed). Each file
 is then filled with random data and a 16 bit CRC appended at the end.
 
-When "checkfs" is run, it runs through all files (with predetermined 
-file names)- one at a time- and checks for the number of "int's" 
+When "checkfs" is run, it runs through all files (with predetermined
+file names)- one at a time- and checks for the number of "int's"
 in it as well as the ending CRC.
 
 The program exits if the numbers of files that are corrupt are greater
@@ -116,10 +116,10 @@ the data reliability of "other" files present of the fs, use -e 1.
 "other" files are defined as sister files on the fs, not being written to
 by the "checkfs" test program.
 
-As mentioned, in this case you would set -e 1, or allow at most 1 file 
-to be corrupt each time after a power fail. This would be the file 
-that was probably being written to when power failed (and CRC was not 
-updated to reflect the  new data being written). You would check file 
+As mentioned, in this case you would set -e 1, or allow at most 1 file
+to be corrupt each time after a power fail. This would be the file
+that was probably being written to when power failed (and CRC was not
+updated to reflect the  new data being written). You would check file
 systems like ext2 etc. with such a configuration.
 (As you have no hope that these file systems provide for either your
 new data or old data to be present in the file if power failed during
@@ -137,13 +137,13 @@ In other words, JFFS2 will partially update a file on FLASH even before
 the write() command has completed, thus leaving part old data part new
 data in your file if power failed in the middle of a write().
 
-This is bad functionality if you are updating a binary structure or a 
+This is bad functionality if you are updating a binary structure or a
 CRC protected file (as in our case).
 
 
 If All Files Check Out OK:
 
-On the startup scan, if there are less errors than specified by the "-e flag" 
+On the startup scan, if there are less errors than specified by the "-e flag"
 a "ok to power me down message" is sent via the specified com port.
 
 The actual format of this message will depend on the format expected
diff --git a/tests/jittertest/README b/tests/jittertest/README
index f411a2c..b97a8b7 100644
--- a/tests/jittertest/README
+++ b/tests/jittertest/README
@@ -11,7 +11,7 @@ a real time task under Linux with background
 JFFS file system activity.
 
 The jitter is measured in milli seconds (ms) from
-the expected time of arrival of a signal from a 
+the expected time of arrival of a signal from a
 periodic timer (set by the task) to when the
 task actually gets the signal.
 
@@ -20,7 +20,7 @@ This jitter is then stored in a file specified
 
 The data  may also be sent out to the console by
 writing to /dev/console (See help options. This is
-highly desirable specially if you have redirected 
+highly desirable specially if you have redirected
 your console to the serial port and are storing it
 as a minicom log on another computer for later analysis
 using some tools provided here).
@@ -82,7 +82,7 @@ supports it).
   In this test you would generate some background
 write/erase type activity that would generate
 chip erases. Since this program is reading from
-the same file system, you contrast the latencies 
+the same file system, you contrast the latencies
 with those obtained with writes going to the same
 fs.
 
@@ -90,7 +90,7 @@ fs.
 file system:
 
   Here you would test for latencies experienced by
-a program if it were writing (and optionally also 
+a program if it were writing (and optionally also
 reading) from a JFFS fs.
 
 
@@ -99,7 +99,7 @@ reading) from a JFFS fs.
 Grabing a kernel profile:
 
 This program can also conditionally grab a kernel profile.
-Specify --grab_kprofile on the cmd line as well as 
+Specify --grab_kprofile on the cmd line as well as
 a "threshold" parameter (see help options by -?).
 
 Any jitter greater than this "threshold" will cause the
@@ -119,10 +119,10 @@ when you boot the kernel if you want to use this functionality.
 
 Signalling the JFFS[2] GC task:
 
-You can also force this program to send a SIGSTOP/SIGCONT to the 
+You can also force this program to send a SIGSTOP/SIGCONT to the
 JFFS (or JFFS2) gc task by specifing --siggc <pid> on the cmd line.
 
-This will let you investigate the effect of forcing the gc task to 
+This will let you investigate the effect of forcing the gc task to
 wake up and do its thing when you are not writing to the fs and to
 force it to sleep when you want to write to the fs.
 
@@ -130,7 +130,7 @@ These are just various tools to investigate the possibility of
 achieving minimal read/write latency when using JFFS[2].
 
 You need to manually do a "ps aux" and look up the PID of the gc
-thread and provide it to the program. 
+thread and provide it to the program.
 
 
 
@@ -156,7 +156,7 @@ console log or printk data).
 
 You can then run this saved console log through this program and it
 will output a very nice text file with the %fill in one col and
-corrosponding jitter values in the second. gnuplot then does a 
+corrosponding jitter values in the second. gnuplot then does a
 beautifull plot of this resulting file showing you graphically the
 jitters encountered at different fill % of your JFFS[2] fs.
 
diff --git a/tests/jittertest/filljffs2.sh b/tests/jittertest/filljffs2.sh
index 10651f4..d8c2a83 100644
--- a/tests/jittertest/filljffs2.sh
+++ b/tests/jittertest/filljffs2.sh
@@ -8,7 +8,7 @@
 while [ $(( 1 )) -gt $(( 0 )) ]
 do
    cp $1 $2
-   rm $2 
+   rm $2
    df |grep mtd > /dev/console
    echo "sleeping $3"
    sleep $3
diff --git a/ubi-utils/dictionary.c b/ubi-utils/dictionary.c
index b7c9ebf..f4b7468 100644
--- a/ubi-utils/dictionary.c
+++ b/ubi-utils/dictionary.c
@@ -44,7 +44,7 @@
 static void * mem_double(void * ptr, int size)
 {
     void * newptr ;
- 
+
     newptr = calloc(2*size, 1);
     if (newptr==NULL) {
         return NULL ;
@@ -230,7 +230,7 @@ int dictionary_set(dictionary * d, char * key, char * val)
 	unsigned	hash ;
 
 	if (d==NULL || key==NULL) return -1 ;
-	
+
 	/* Compute hash for this key */
 	hash = dictionary_hash(key) ;
 	/* Find if value is already in dictionary */
@@ -374,7 +374,7 @@ int main(int argc, char *argv[])
 	/* Allocate dictionary */
 	printf("allocating...\n");
 	d = dictionary_new(0);
-	
+
 	/* Set values in dictionary */
 	printf("setting %d values...\n", NVALS);
 	for (i=0 ; i<NVALS ; i++) {
diff --git a/ubi-utils/libiniparser.c b/ubi-utils/libiniparser.c
index 3bea51e..898f57f 100644
--- a/ubi-utils/libiniparser.c
+++ b/ubi-utils/libiniparser.c
@@ -82,9 +82,9 @@ static char * strstrip(char * s)
 {
     static char l[ASCIILINESZ+1];
 	char * last ;
-	
+
     if (s==NULL) return NULL ;
-    
+
 	while (isspace((int)*s) && *s) s++;
 	memset(l, 0, ASCIILINESZ+1);
 	strcpy(l, s);
@@ -457,7 +457,7 @@ static line_status iniparser_line(
     char * section,
     char * key,
     char * value)
-{   
+{
     line_status sta ;
     char        line[ASCIILINESZ+1];
     int         len ;
@@ -471,7 +471,7 @@ static line_status iniparser_line(
         sta = LINE_EMPTY ;
     } else if (line[0]=='#') {
         /* Comment line */
-        sta = LINE_COMMENT ; 
+        sta = LINE_COMMENT ;
     } else if (line[0]=='[' && line[len-1]==']') {
         /* Section name */
         sscanf(line, "[%[^]]", section);
-- 
1.7.0.4
