Received: from mailb.telia.com ([194.22.194.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18AtWj-00075H-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 14:57:29 +0000
Message-ID: <002301c288cd$c11a6180$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <jffs-dev@axis.com>, <linux-mtd@lists.infradead.org>
References: <F122OgRGkQ6mBySsxVY00000854@hotmail.com>  <24987.1036797874@passion.cambridge.redhat.com>
Subject: crc32() optimization
Date: Sun, 10 Nov 2002 16:28:00 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi David

This patch improves my scan time with 22%( from 2.39 to 1.86 seconds).
Maybe you want to include it in the 2.4 branch.

I will put this in my next backport of the crc32 stuff from 2.5.

          Jocke

Index: fs/jffs2/crc32.h
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/crc32.h,v
retrieving revision 1.3
diff -u -b -r1.3 crc32.h
--- fs/jffs2/crc32.h    26 Feb 2001 14:44:37 -0000      1.3
+++ fs/jffs2/crc32.h    10 Nov 2002 15:25:11 -0000
@@ -13,7 +13,16 @@
 crc32(__u32 val, const void *ss, int len)
 {
        const unsigned char *s = ss;
-        while (--len >= 0)
+        while (len >= 6){
+         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
+         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
+         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
+         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
+         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
+         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
+         len -= 6;
+        }
+        while (len--)
                 val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
         return val;
 }
