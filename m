Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12AyQS-0003dd-00
	for mtd-list@infradead.org; Wed, 19 Jan 2000 16:57:44 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12AyQQ-0003dX-00
	for mtd@infradead.org; Wed, 19 Jan 2000 16:57:42 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: linux-kernel@vger.rutgers.edu, torvalds@transmeta.com,
    fare@tunes.com
Cc: alan@lxorguk.ukuu.org.uk, mtd@infradead.org
Subject: Constant byteorder macros.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 19 Jan 2000 17:07:01 +0000
Message-Id: <E12AyZR-0002gU-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


In order to use cpu_to_le16() et al. in case statements, for example:

 switch (status) {
	case cpu_to_le16(CONSTANT_XYZ):


... I need to define new macros __constant_cpu_to_le16(), etc.

Ideally, gcc would be able to tell that it's constant, and I would be able to 
use the 'normal' cpu_to_le16 macro. But as someone's evidently already given 
up on that with __constant_htonl() etc., I'm going to assume that it's not 
currently possible.

So here's a patch which adds the extra constant versions of the other 
byteorder macros. It's made against 2.2.14, but should apply to 2.3 too.



Index: big_endian.h
===================================================================
RCS file: /cvs/linux/include/linux/byteorder/big_endian.h,v
retrieving revision 1.1.1.1
diff -u -w -r1.1.1.1 big_endian.h
--- big_endian.h	1998/10/28 21:23:47	1.1.1.1
+++ big_endian.h	2000/01/19 17:01:40
@@ -14,6 +14,18 @@
 #define __constant_ntohl(x) ((__u32)(x))
 #define __constant_htons(x) ((__u16)(x))
 #define __constant_ntohs(x) ((__u16)(x))
+#define __constant_cpu_to_le64(x) ___swab64((x))
+#define __constant_le64_to_cpu(x) ___swab64((x))
+#define __constant_cpu_to_le32(x) ___swab32((x))
+#define __constant_le32_to_cpu(x) ___swab32((x))
+#define __constant_cpu_to_le16(x) ___swab16((x))
+#define __constant_le16_to_cpu(x) ___swab16((x))
+#define __constant_cpu_to_be64(x) ((__u64)(x))
+#define __constant_be64_to_cpu(x) ((__u64)(x))
+#define __constant_cpu_to_be32(x) ((__u32)(x))
+#define __constant_be32_to_cpu(x) ((__u32)(x))
+#define __constant_cpu_to_be16(x) ((__u16)(x))
+#define __constant_be16_to_cpu(x) ((__u16)(x))
 #define __cpu_to_le64(x) __swab64((x))
 #define __le64_to_cpu(x) __swab64((x))
 #define __cpu_to_le32(x) __swab32((x))
Index: little_endian.h
===================================================================
RCS file: /cvs/linux/include/linux/byteorder/little_endian.h,v
retrieving revision 1.1.1.1
diff -u -w -r1.1.1.1 little_endian.h
--- little_endian.h	1998/10/28 21:23:47	1.1.1.1
+++ little_endian.h	2000/01/19 17:01:40
@@ -14,6 +14,18 @@
 #define __constant_ntohl(x) ___swab32((x))
 #define __constant_htons(x) ___swab16((x))
 #define __constant_ntohs(x) ___swab16((x))
+#define __constant_cpu_to_le64(x) ((__u64)(x))
+#define __constant_le64_to_cpu(x) ((__u64)(x))
+#define __constant_cpu_to_le32(x) ((__u32)(x))
+#define __constant_le32_to_cpu(x) ((__u32)(x))
+#define __constant_cpu_to_le16(x) ((__u16)(x))
+#define __constant_le16_to_cpu(x) ((__u16)(x))
+#define __constant_cpu_to_be64(x) ___swab64((x))
+#define __constant_be64_to_cpu(x) ___swab64((x))
+#define __constant_cpu_to_be32(x) ___swab32((x))
+#define __constant_be32_to_cpu(x) ___swab32((x))
+#define __constant_cpu_to_be16(x) ___swab16((x))
+#define __constant_be16_to_cpu(x) ___swab16((x))
 #define __cpu_to_le64(x) ((__u64)(x))
 #define __le64_to_cpu(x) ((__u64)(x))
 #define __cpu_to_le32(x) ((__u32)(x))
Index: pdp_endian.h
===================================================================
RCS file: /cvs/linux/include/linux/byteorder/pdp_endian.h,v
retrieving revision 1.1.1.1
diff -u -w -r1.1.1.1 pdp_endian.h
--- pdp_endian.h	1998/10/28 21:23:47	1.1.1.1
+++ pdp_endian.h	2000/01/19 17:01:40
@@ -34,6 +34,18 @@
 #define __constant_ntohl(x) ___swahb32((x))
 #define __constant_htons(x) ___swab16((x))
 #define __constant_ntohs(x) ___swab16((x))
+#define __constant_cpu_to_le64(x) I DON'T KNOW
+#define __constant_le64_to_cpu(x) I DON'T KNOW
+#define __constant_cpu_to_le32(x) ___swahw32((x))
+#define __constant_le32_to_cpu(x) ___swahw32((x))
+#define __constant_cpu_to_le16(x) ((__u16)(x)
+#define __constant_le16_to_cpu(x) ((__u16)(x)
+#define __constant_cpu_to_be64(x) I DON'T KNOW
+#define __constant_be64_to_cpu(x) I DON'T KNOW
+#define __constant_cpu_to_be32(x) ___swahb32((x))
+#define __constant_be32_to_cpu(x) ___swahb32((x))
+#define __constant_cpu_to_be16(x) ___swab16((x))
+#define __constant_be16_to_cpu(x) ___swab16((x))
 #define __cpu_to_le64(x) I DON'T KNOW
 #define __le64_to_cpu(x) I DON'T KNOW
 #define __cpu_to_le32(x) ___swahw32((x))


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
