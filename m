Received: from wall.comdev.cc ([63.150.62.162] helo=rangers.comdev.cc)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Jjti-00015c-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Dec 2001 23:25:15 +0000
Message-ID: <3C2BAF52.F0535E2E@comdev.cc>
Date: Thu, 27 Dec 2001 15:31:30 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: patch for 64 bit wide flash
References: <3C1FD0DD.9A4F2CC8@comdev.cc> <3698.1008926053@redhat.com>
Content-Type: multipart/mixed;
 boundary="------------36F220033D000594137F90EE"
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

This is a multi-part message in MIME format.
--------------36F220033D000594137F90EE
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

David Woodhouse wrote:
> 
> adam.wozniak@comdev.cc said:
> > I've got a 64 bit wide flash consisting of eight 8bit wide chips.
> > Here's a patch against the 2.4.16 kernel
> 
> I'm a little concerned about the following bit - gcc is fairly crap at
> dealing with 64-bit datatypes. I'd prefer to do that only if it's
> necessary. Can we define a cfi_busword type which is only as big as we need
> - so it's only a __u64 if CONFIG_MTD_CFI_B8 is set?

Here's a new patch.

cfi.h has the following in it (paraphrased and indented for readablity):

#ifndef CONFIG_MTD_CFI_GEOMETRY
 
/* we don't know what we'll get, so we pick the largest possible here */
typedef __u64 cfi_word;
 
#else

/* pick the largest necessary */
#ifdef CONFIG_MTD_CFI_B8
typedef __u64 cfi_word;
#else  /* CONFIG_MTD_CFI_B8 */
   #ifdef CONFIG_MTD_CFI_B4
   typedef __u32 cfi_word;
   #else  /* CONFIG_MTD_CFI_B4 */
      #ifdef CONFIG_MTD_CFI_B2
      typedef __u16 cfi_word;
      #else  /* CONFIG_MTD_CFI_B2 */
         #ifdef CONFIG_MTD_CFI_B1
         typedef __u8 cfi_word;
         #else  /* CONFIG_MTD_CFI_B1 */
            #error You must specify a bus width
         #endif /* CONFIG_MTD_CFI_B1 */
      #endif /* CONFIG_MTD_CFI_B2 */
   #endif /* CONFIG_MTD_CFI_B4 */
#endif /* CONFIG_MTD_CFI_B8 */
 
#endif

-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
--------------36F220033D000594137F90EE
Content-Type: text/plain; charset=us-ascii;
 name="mtd_delta"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd_delta"

diff -urbBN --exclude=autoconf.h --exclude=compile.h --exclude=version.h --exclude=config --exclude=asm --exclude=asm-ppc --exclude=.*depend --exclude=*.flags --exclude=*.o linux-original/include/linux/mtd/cfi.h linux/include/linux/mtd/cfi.h
--- linux-original/include/linux/mtd/cfi.h	Thu Oct  4 15:13:18 2001
+++ linux/include/linux/mtd/cfi.h	Thu Dec 27 15:21:09 2001
@@ -28,10 +28,15 @@
 #define CFIDEV_INTERLEAVE_1 (1)
 #define CFIDEV_INTERLEAVE_2 (2)
 #define CFIDEV_INTERLEAVE_4 (4)
+#define CFIDEV_INTERLEAVE_8 (8)
 
 #define CFIDEV_BUSWIDTH_1 (1)
 #define CFIDEV_BUSWIDTH_2 (2)
 #define CFIDEV_BUSWIDTH_4 (4)
+#define CFIDEV_BUSWIDTH_8 (8)
+
+/* we don't know what we'll get, so we pick the largest possible here */
+typedef __u64 cfi_word;
 
 #else
 
@@ -44,6 +49,9 @@
 #ifdef CONFIG_MTD_CFI_I4
 #define CFIDEV_INTERLEAVE_4 (4)
 #endif
+#ifdef CONFIG_MTD_CFI_I8
+#define CFIDEV_INTERLEAVE_8 (8)
+#endif
 
 #ifdef CONFIG_MTD_CFI_B1
 #define CFIDEV_BUSWIDTH_1 (1)
@@ -54,6 +62,28 @@
 #ifdef CONFIG_MTD_CFI_B4
 #define CFIDEV_BUSWIDTH_4 (4)
 #endif
+#ifdef CONFIG_MTD_CFI_B8
+#define CFIDEV_BUSWIDTH_8 (8)
+#endif
+
+/* pick the largest necessary */
+#ifdef CONFIG_MTD_CFI_B8
+typedef __u64 cfi_word;
+#else  /* CONFIG_MTD_CFI_B8 */
+#ifdef CONFIG_MTD_CFI_B4
+typedef __u32 cfi_word;
+#else  /* CONFIG_MTD_CFI_B4 */
+#ifdef CONFIG_MTD_CFI_B2
+typedef __u16 cfi_word;
+#else  /* CONFIG_MTD_CFI_B2 */
+#ifdef CONFIG_MTD_CFI_B1
+typedef __u8 cfi_word;
+#else  /* CONFIG_MTD_CFI_B1 */
+#error You must specify a bus width
+#endif /* CONFIG_MTD_CFI_B1 */
+#endif /* CONFIG_MTD_CFI_B2 */
+#endif /* CONFIG_MTD_CFI_B4 */
+#endif /* CONFIG_MTD_CFI_B8 */
 
 #endif
 
@@ -61,7 +91,7 @@
  * The following macros are used to select the code to execute:
  *   cfi_buswidth_is_*()
  *   cfi_interleave_is_*()
- *   [where * is either 1, 2 or 4]
+ *   [where * is either 1, 2, 4, or 8]
  * Those macros should be used with 'if' statements.  If only one of few
  * geometry arrangements are selected, they expand to constants thus allowing
  * the compiler (most of them being 0) to optimize away all the unneeded code,
@@ -105,6 +135,18 @@
 # define cfi_interleave_is_4() (0)
 #endif
 
+#ifdef CFIDEV_INTERLEAVE_8
+# ifdef CFIDEV_INTERLEAVE
+#  undef CFIDEV_INTERLEAVE
+#  define CFIDEV_INTERLEAVE (cfi->interleave)
+# else
+#  define CFIDEV_INTERLEAVE CFIDEV_INTERLEAVE_8
+# endif
+# define cfi_interleave_is_8() (CFIDEV_INTERLEAVE == CFIDEV_INTERLEAVE_8)
+#else
+# define cfi_interleave_is_8() (0)
+#endif
+
 #ifndef CFIDEV_INTERLEAVE
 #error You must define at least one interleave to support!
 #endif
@@ -145,6 +187,18 @@
 # define cfi_buswidth_is_4() (0)
 #endif
 
+#ifdef CFIDEV_BUSWIDTH_8
+# ifdef CFIDEV_BUSWIDTH
+#  undef CFIDEV_BUSWIDTH
+#  define CFIDEV_BUSWIDTH (map->buswidth)
+# else
+#  define CFIDEV_BUSWIDTH CFIDEV_BUSWIDTH_8
+# endif
+# define cfi_buswidth_is_8() (CFIDEV_BUSWIDTH == CFIDEV_BUSWIDTH_8)
+#else
+# define cfi_buswidth_is_8() (0)
+#endif
+
 #ifndef CFIDEV_BUSWIDTH
 #error You must define at least one bus width to support!
 #endif
@@ -156,6 +210,7 @@
 #define CFI_DEVICETYPE_X8  (8 / 8)
 #define CFI_DEVICETYPE_X16 (16 / 8)
 #define CFI_DEVICETYPE_X32 (32 / 8)
+#define CFI_DEVICETYPE_X64 (64 / 8)
 
 /* NB: We keep these structures in memory in HOST byteorder, except
  * where individually noted.
@@ -264,9 +319,9 @@
 /*
  * Transforms the CFI command for the given geometry (bus width & interleave.
  */
-static inline __u32 cfi_build_cmd(u_char cmd, struct map_info *map, struct cfi_private *cfi)
+static inline cfi_word cfi_build_cmd(u_char cmd, struct map_info *map, struct cfi_private *cfi)
 {
-	__u32 val = 0;
+	cfi_word val = 0;
 
 	if (cfi_buswidth_is_1()) {
 		/* 1 x8 device */
@@ -291,6 +346,25 @@
 			val = (cmd << 16) | cmd;
 			val = cpu_to_cfi32((val << 8) | val);
 		}
+	} else if (cfi_buswidth_is_8()) {
+		if (cfi_interleave_is_1()) {
+			/* 1 x64 device in x64 mode */
+			val = cpu_to_cfi64(cmd);
+		} else if (cfi_interleave_is_2()) {
+			/* 2 x32 device in x32 mode */
+			val = cmd;
+			val = cpu_to_cfi64((val << 32) | val);
+		} else if (cfi_interleave_is_4()) {
+			/* 4 (x16, x32 or x64) devices in x16 mode */
+			val = (cmd << 16) | cmd;
+			val = cpu_to_cfi64((val << 32) | val);
+		} else if (cfi_interleave_is_8()) {
+			/* 8 (x8, x16 or x32) devices in x8 mode */
+			val = (cmd << 8) | cmd;
+			val = (val << 16) | val;
+			val = (val << 32) | val;
+			val = cpu_to_cfi64(val);
+		}
 	}
 	return val;
 }
@@ -300,7 +374,7 @@
  * Read a value according to the bus width.
  */
 
-static inline __u32 cfi_read(struct map_info *map, __u32 addr)
+static inline cfi_word cfi_read(struct map_info *map, __u32 addr)
 {
 	if (cfi_buswidth_is_1()) {
 		return map->read8(map, addr);
@@ -308,6 +382,8 @@
 		return map->read16(map, addr);
 	} else if (cfi_buswidth_is_4()) {
 		return map->read32(map, addr);
+	} else if (cfi_buswidth_is_8()) {
+		return map->read64(map, addr);
 	} else {
 		return 0;
 	}
@@ -317,7 +393,7 @@
  * Write a value according to the bus width.
  */
 
-static inline void cfi_write(struct map_info *map, __u32 val, __u32 addr)
+static inline void cfi_write(struct map_info *map, cfi_word val, __u32 addr)
 {
 	if (cfi_buswidth_is_1()) {
 		map->write8(map, val, addr);
@@ -325,6 +401,8 @@
 		map->write16(map, val, addr);
 	} else if (cfi_buswidth_is_4()) {
 		map->write32(map, val, addr);
+	} else if (cfi_buswidth_is_8()) {
+		map->write64(map, val, addr);
 	}
 }
 
@@ -337,9 +415,9 @@
  */
 static inline __u32 cfi_send_gen_cmd(u_char cmd, __u32 cmd_addr, __u32 base,
 				struct map_info *map, struct cfi_private *cfi,
-				int type, __u32 *prev_val)
+				int type, cfi_word *prev_val)
 {
-	__u32 val;
+	cfi_word val;
 	__u32 addr = base + cfi_build_cmd_addr(cmd_addr, CFIDEV_INTERLEAVE, type);
 
 	val = cfi_build_cmd(cmd, map, cfi);
@@ -360,6 +438,8 @@
 		return cfi16_to_cpu(map->read16(map, addr));
 	} else if (cfi_buswidth_is_4()) {
 		return cfi32_to_cpu(map->read32(map, addr));
+	} else if (cfi_buswidth_is_8()) {
+		return cfi64_to_cpu(map->read64(map, addr));
 	} else {
 		return 0;
 	}
diff -urbBN --exclude=autoconf.h --exclude=compile.h --exclude=version.h --exclude=config --exclude=asm --exclude=asm-ppc --exclude=.*depend --exclude=*.flags --exclude=*.o linux-original/include/linux/mtd/cfi_endian.h linux/include/linux/mtd/cfi_endian.h
--- linux-original/include/linux/mtd/cfi_endian.h	Thu Oct  4 15:13:18 2001
+++ linux/include/linux/mtd/cfi_endian.h	Wed Dec 19 11:52:03 2001
@@ -30,22 +30,28 @@
 #define cfi8_to_cpu(x) (x)
 #define cpu_to_cfi16(x) cpu_to_le16(x)
 #define cpu_to_cfi32(x) cpu_to_le32(x)
+#define cpu_to_cfi64(x) cpu_to_le64(x)
 #define cfi16_to_cpu(x) le16_to_cpu(x)
 #define cfi32_to_cpu(x) le32_to_cpu(x)
+#define cfi64_to_cpu(x) le64_to_cpu(x)
 #elif defined (CFI_BIG_ENDIAN)
 #define cpu_to_cfi8(x) (x)
 #define cfi8_to_cpu(x) (x)
 #define cpu_to_cfi16(x) cpu_to_be16(x)
 #define cpu_to_cfi32(x) cpu_to_be32(x)
+#define cpu_to_cfi64(x) cpu_to_be64(x)
 #define cfi16_to_cpu(x) be16_to_cpu(x)
 #define cfi32_to_cpu(x) be32_to_cpu(x)
+#define cfi64_to_cpu(x) be64_to_cpu(x)
 #elif defined (CFI_HOST_ENDIAN)
 #define cpu_to_cfi8(x) (x)
 #define cfi8_to_cpu(x) (x)
 #define cpu_to_cfi16(x) (x)
 #define cpu_to_cfi32(x) (x)
+#define cpu_to_cfi64(x) (x)
 #define cfi16_to_cpu(x) (x)
 #define cfi32_to_cpu(x) (x)
+#define cfi64_to_cpu(x) (x)
 #else
 #error No CFI endianness defined
 #endif
diff -urbBN --exclude=autoconf.h --exclude=compile.h --exclude=version.h --exclude=config --exclude=asm --exclude=asm-ppc --exclude=.*depend --exclude=*.flags --exclude=*.o linux-original/include/linux/mtd/map.h linux/include/linux/mtd/map.h
--- linux-original/include/linux/mtd/map.h	Thu Oct  4 15:13:18 2001
+++ linux/include/linux/mtd/map.h	Wed Dec 19 11:52:03 2001
@@ -33,6 +33,7 @@
 	__u8 (*read8)(struct map_info *, unsigned long);
 	__u16 (*read16)(struct map_info *, unsigned long);
 	__u32 (*read32)(struct map_info *, unsigned long);  
+	__u64 (*read64)(struct map_info *, unsigned long);  
 	/* If it returned a 'long' I'd call it readl.
 	 * It doesn't.
 	 * I won't.
@@ -42,6 +43,7 @@
 	void (*write8)(struct map_info *, __u8, unsigned long);
 	void (*write16)(struct map_info *, __u16, unsigned long);
 	void (*write32)(struct map_info *, __u32, unsigned long);
+	void (*write64)(struct map_info *, __u64, unsigned long);
 	void (*copy_to)(struct map_info *, unsigned long, const void *, ssize_t);
 
 	void (*set_vpp)(struct map_info *, int);

--------------36F220033D000594137F90EE--
