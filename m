Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRf80-00018C-Ck
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 18:10:21 -0500
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id PAA16863
	for <linux-mtd@lists.infradead.org>; Tue, 9 Nov 2004 15:10:16 -0800
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	iA9NAGLV016231
	for <linux-mtd@lists.infradead.org>; Tue, 9 Nov 2004 15:10:16 -0800
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id iA9NAGb7016229
	for linux-mtd@lists.infradead.org; Tue, 9 Nov 2004 15:10:16 -0800
Date: Tue, 9 Nov 2004 15:10:16 -0800
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20041109231016.GA16039@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Fix mkfs.jffs endian macros
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Any objection to committing a patch for mkfs.jffs to get rid of the use of
no-longer-userspace-safe kernel macros for endian conversions? -- Todd

Index: mkfs.jffs.c
===================================================================
RCS file: /home/cvs/mtd/util/mkfs.jffs.c,v
retrieving revision 1.12
diff -u -r1.12 mkfs.jffs.c
--- mkfs.jffs.c	5 May 2004 18:33:33 -0000	1.12
+++ mkfs.jffs.c	9 Nov 2004 22:56:02 -0000
@@ -20,6 +20,31 @@
 #include <asm/byteorder.h>
 #include <ctype.h>
 
+#define swab16(x) \
+        ((__u16)( \
+                (((__u16)(x) & (__u16)0x00ffU) << 8) | \
+                (((__u16)(x) & (__u16)0xff00U) >> 8) ))
+#define swab32(x) \
+        ((__u32)( \
+                (((__u32)(x) & (__u32)0x000000ffUL) << 24) | \
+                (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) | \
+                (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) | \
+                (((__u32)(x) & (__u32)0xff000000UL) >> 24) ))
+
+#if __BYTE_ORDER == __BIG_ENDIAN
+#define cpu_to_le16(x) ({ __u16 _x = x; swab16(_x); })
+#define cpu_to_le32(x) ({ __u32 _x = x; swab32(_x); })
+#define cpu_to_be16(x) (x)
+#define cpu_to_be32(x) (x)
+#else
+#define cpu_to_le16(x) (x)
+#define cpu_to_le32(x) (x)
+#define cpu_to_be16(x) ({ __u16 _x = x; swab16(_x); })
+#define cpu_to_be32(x) ({ __u32 _x = x; swab32(_x); })
+#endif
+#define le32_to_cpu(x) cpu_to_le32(x)
+#define be32_to_cpu(x) cpu_to_be32(x)
+
 #define BLOCK_SIZE 1024
 #define JFFS_MAGIC 0x34383931 /* "1984" */
 #define JFFS_MAX_NAME_LEN 256
@@ -184,10 +209,10 @@
     *adr = val;
     break;
   case ENDIAN_LITTLE:
-    *adr = __cpu_to_le32(val);
+    *adr = cpu_to_le32(val);
     break;
   case ENDIAN_BIG:
-    *adr = __cpu_to_be32(val);
+    *adr = cpu_to_be32(val);
     break;
   }
 }
@@ -199,10 +224,10 @@
     *adr = val;
     break;
   case ENDIAN_LITTLE:
-    *adr = __cpu_to_le16(val);
+    *adr = cpu_to_le16(val);
     break;
   case ENDIAN_BIG:
-    *adr = __cpu_to_be16(val);
+    *adr = cpu_to_be16(val);
     break;
   }
 }
@@ -216,10 +241,10 @@
     val = *adr;
     break;
   case ENDIAN_LITTLE:
-    val = __le32_to_cpu(*adr);
+    val = le32_to_cpu(*adr);
     break;
   case ENDIAN_BIG:
-    val = __be32_to_cpu(*adr);
+    val = be32_to_cpu(*adr);
     break;
   }
   return val;
@@ -322,10 +347,10 @@
           tmp = st.st_rdev;
           break;
         case ENDIAN_LITTLE:
-          tmp = __cpu_to_le16(st.st_rdev);
+          tmp = cpu_to_le16(st.st_rdev);
           break;
         case ENDIAN_BIG:
-          tmp = __cpu_to_be16(st.st_rdev);
+          tmp = cpu_to_be16(st.st_rdev);
           break;
       }
       fwrite((char *)&tmp, sizeof(st.st_rdev) / 4, 1, fs);
