Received: from alln-iport-2.cisco.com ([173.37.142.89])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gILtZ-0007hg-JC
 for linux-mtd@lists.infradead.org; Thu, 01 Nov 2018 22:56:59 +0000
From: Nikunj Kela <nkela@cisco.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Nikunj Kela <nkela@cisco.com>, xe-linux-external@cisco.com,
 Rod Whitby <rod@whitby.id.au>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Make JFFS2 endianness configurable
Date: Thu,  1 Nov 2018 15:56:03 -0700
Message-Id: <20181101225603.17806-1-nkela@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch allows the endianness of the JFSS2 filesystem to be
specified by config options.

It defaults to native-endian (the previously hard-coded option).

Some architectures benefit from having a single known endianness
of JFFS2 filesystem (for data, not executables) independent of the
endianness of the processor (ARM processors can be switched to either
endianness at run-time).

This patch is taken from:
http://www.infradead.org/pipermail/linux-mtd/2006-January/014717.html

Cc: xe-linux-external@cisco.com
Signed-off-by: Rod Whitby <rod@whitby.id.au>
Signed-off-by: Nikunj Kela <nkela@cisco.com>
---
 fs/jffs2/Kconfig    | 25 +++++++++++++++++++++++++
 fs/jffs2/nodelist.h |  8 +++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/Kconfig b/fs/jffs2/Kconfig
index ad850c5bf2ca..86e93fbc9d74 100644
--- a/fs/jffs2/Kconfig
+++ b/fs/jffs2/Kconfig
@@ -182,3 +182,28 @@ config JFFS2_CMODE_FAVOURLZO
 	  decompression) at the expense of size.
 
 endchoice
+
+choice
+	prompt "JFFS2 endianness"
+	default JFFS2_NATIVE_ENDIAN
+	depends on JFFS2_FS
+	help
+	  You can set here the default endianness of JFFS2 from
+	  the available options. Do not touch if unsure.
+
+config JFFS2_NATIVE_ENDIAN
+	bool "native endian"
+	help
+	  Uses a native endian bytestream.
+
+config JFFS2_BIG_ENDIAN
+	bool "big endian"
+	help
+	  Uses a big endian bytestream.
+
+config JFFS2_LITTLE_ENDIAN
+	bool "little endian"
+	help
+	  Uses a little endian bytestream.
+
+endchoice
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 0637271f3770..a1ebf04f217c 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -27,12 +27,10 @@
 #include "os-linux.h"
 #endif
 
-#define JFFS2_NATIVE_ENDIAN
-
 /* Note we handle mode bits conversion from JFFS2 (i.e. Linux) to/from
    whatever OS we're actually running on here too. */
 
-#if defined(JFFS2_NATIVE_ENDIAN)
+#if defined(CONFIG_JFFS2_NATIVE_ENDIAN)
 #define cpu_to_je16(x) ((jint16_t){x})
 #define cpu_to_je32(x) ((jint32_t){x})
 #define cpu_to_jemode(x) ((jmode_t){os_to_jffs2_mode(x)})
@@ -43,7 +41,7 @@
 #define je16_to_cpu(x) ((x).v16)
 #define je32_to_cpu(x) ((x).v32)
 #define jemode_to_cpu(x) (jffs2_to_os_mode((x).m))
-#elif defined(JFFS2_BIG_ENDIAN)
+#elif defined(CONFIG_JFFS2_BIG_ENDIAN)
 #define cpu_to_je16(x) ((jint16_t){cpu_to_be16(x)})
 #define cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})
 #define cpu_to_jemode(x) ((jmode_t){cpu_to_be32(os_to_jffs2_mode(x))})
@@ -54,7 +52,7 @@
 #define je16_to_cpu(x) (be16_to_cpu(x.v16))
 #define je32_to_cpu(x) (be32_to_cpu(x.v32))
 #define jemode_to_cpu(x) (be32_to_cpu(jffs2_to_os_mode((x).m)))
-#elif defined(JFFS2_LITTLE_ENDIAN)
+#elif defined(CONFIG_JFFS2_LITTLE_ENDIAN)
 #define cpu_to_je16(x) ((jint16_t){cpu_to_le16(x)})
 #define cpu_to_je32(x) ((jint32_t){cpu_to_le32(x)})
 #define cpu_to_jemode(x) ((jmode_t){cpu_to_le32(os_to_jffs2_mode(x))})
-- 
2.19.1
