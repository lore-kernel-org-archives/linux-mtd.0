Received: from host-84-9-202-240.bulldogdsl.com ([84.9.202.240]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FP15u-0006hT-6d
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 12:38:09 -0500
Received: from ben by aeryn.fluff.org.uk with local (Exim 3.36 #1 (Debian))
	id 1FP0ki-0007z1-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2006 18:16:08 +0100
Date: Thu, 30 Mar 2006 18:16:08 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060330171608.GA30647@home.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org.uk>
Subject: compile fix for drivers/mtd/redboot.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From the current kernel build, the following errors are 
comming from drivers/mtd/redboot.c:

In function 'parse_redboot_partitions':
107: warning: passing argument 1 of '__swab32s' from incompatible pointer type
108: warning: passing argument 1 of '__swab32s' from incompatible pointer type
109: warning: passing argument 1 of '__swab32s' from incompatible pointer type
110: warning: passing argument 1 of '__swab32s' from incompatible pointer type
111: warning: passing argument 1 of '__swab32s' from incompatible pointer type
112: warning: passing argument 1 of '__swab32s' from incompatible pointer type
113: warning: passing argument 1 of '__swab32s' from incompatible pointer type

I belive the best way to fix this is to change the
`unsigned long` declerations in `struct fis_image_desc`
to __u32, which is what swab32s() expects to see, and
is more specific that `unsigned long`.

Should I commit the following patch to the CVS? 

Index: drivers/mtd/redboot.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/redboot.c,v
retrieving revision 1.20
diff -u -r1.20 redboot.c
--- drivers/mtd/redboot.c	29 Mar 2006 08:43:21 -0000	1.20
+++ drivers/mtd/redboot.c	30 Mar 2006 17:15:03 -0000
@@ -15,14 +15,14 @@
 
 struct fis_image_desc {
     unsigned char name[16];      // Null terminated name
-    unsigned long flash_base;    // Address within FLASH of image
-    unsigned long mem_base;      // Address in memory where it executes
-    unsigned long size;          // Length of image
-    unsigned long entry_point;   // Execution entry point
-    unsigned long data_length;   // Length of actual data
-    unsigned char _pad[256-(16+7*sizeof(unsigned long))];
-    unsigned long desc_cksum;    // Checksum over image descriptor
-    unsigned long file_cksum;    // Checksum over image data
+    __u32	  flash_base;    // Address within FLASH of image
+    __u32	  mem_base;      // Address in memory where it executes
+    __u32	  size;          // Length of image
+    __u32	  entry_point;   // Execution entry point
+    __u32	  data_length;   // Length of actual data
+    __u32	  _pad[256-(16+7*sizeof(__u32))];
+    __u32	  desc_cksum;    // Checksum over image descriptor
+    __u32	  file_cksum;    // Checksum over image data
 };
 
 struct fis_list {


-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
