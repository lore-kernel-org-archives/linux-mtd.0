Received: from maild.telia.com ([194.22.190.101])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18IGRf-0005YC-00
	for <linux-mtd@lists.infradead.org>; Sat, 30 Nov 2002 22:50:43 +0000
Message-ID: <002f01c298c7$16887270$0300a8c0@jockeXP>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Steven Scholz" <steven.scholz@imc-berlin.de>,
   <linux-mtd@lists.infradead.org>
Cc: "David Woodhouse" <dwmw2@infradead.org>
References: <3DE7CB23.5535F5E6@imc-berlin.de> <002301c298c1$e6f10360$0300a8c0@jockeXP>
Subject: Re: undefined reference to 'crc32' ?
Date: Sun, 1 Dec 2002 00:20:36 +0100
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

> CVS JFFS2 assumes that  crc32()  is avialable as a generic function. You need my crc32 backport from 2.5 to 2.4. It's somewhere
> in the MTD archives(I think). I don't have it handy ATM.

Oops, don't think I ever sent it to this list. I grabbed it again from my CVS. I hope it still applies.

    Jocke


Index: kernel/linuxppc/drivers/net/Makefile.lib
diff -u /dev/null kernel/linuxppc/drivers/net/Makefile.lib:1.1
--- /dev/null Sun Dec  1 00:10:51 2002
+++ kernel/linuxppc/drivers/net/Makefile.lib Fri Nov 15 17:37:58 2002
@@ -0,0 +1,69 @@
+# These drivers all require crc32.o
+obj-$(CONFIG_8139CP)  += crc32.o
+obj-$(CONFIG_8139TOO)  += crc32.o
+obj-$(CONFIG_A2065)  += crc32.o
+obj-$(CONFIG_ARM_AM79C961A) += crc32.o
+obj-$(CONFIG_AT1700)  += crc32.o
+obj-$(CONFIG_ATP)  += crc32.o
+obj-$(CONFIG_DE2104X)  += crc32.o
+obj-$(CONFIG_DE4X5)  += crc32.o
+obj-$(CONFIG_DECLANCE)  += crc32.o
+obj-$(CONFIG_DEPCA)  += crc32.o
+obj-$(CONFIG_DL2K)  += crc32.o
+obj-$(CONFIG_DM9102)  += crc32.o
+obj-$(CONFIG_EPIC100)  += crc32.o
+obj-$(CONFIG_EWRK3)  += crc32.o
+obj-$(CONFIG_FEALNX)  += crc32.o
+obj-$(CONFIG_HAPPYMEAL)  += crc32.o
+obj-$(CONFIG_MACE)  += crc32.o 
+obj-$(CONFIG_MACMACE)  += crc32.o
+obj-$(CONFIG_MIPS_AU1000_ENET) += crc32.o
+obj-$(CONFIG_NATSEMI)  += crc32.o 
+obj-$(CONFIG_PCMCIA_FMVJ18X) += crc32.o
+obj-$(CONFIG_PCMCIA_SMC91C92) += crc32.o
+obj-$(CONFIG_PCMCIA_XIRTULIP) += crc32.o
+obj-$(CONFIG_PCNET32)  += crc32.o
+obj-$(CONFIG_SIS900)  += crc32.o
+obj-$(CONFIG_SMC9194)  += crc32.o
+obj-$(CONFIG_ADAPTEC_STARFIRE) += crc32.o
+obj-$(CONFIG_SUNBMAC)  += crc32.o
+obj-$(CONFIG_SUNDANCE)  += crc32.o
+obj-$(CONFIG_SUNGEM)  += crc32.o
+obj-$(CONFIG_SUNGEM)  += crc32.o
+obj-$(CONFIG_SUNLANCE)  += crc32.o
+obj-$(CONFIG_SUNQE)  += crc32.o
+obj-$(CONFIG_TULIP)  += crc32.o
+obj-$(CONFIG_VIA_RHINE)  += crc32.o
+obj-$(CONFIG_YELLOWFIN)  += crc32.o
+obj-$(CONFIG_WINBOND_840) += crc32.o
+
+
+# These rely on drivers/net/7990.o which requires crc32.o
+obj-$(CONFIG_HPLANCE)  += crc32.o 
+obj-$(CONFIG_MVME147_NET) += crc32.o 
+
+
+# These rely on drivers/net/8390.o which requires crc32.o
+obj-$(CONFIG_OAKNET)  += crc32.o
+obj-$(CONFIG_NE2K_PCI)  += crc32.o
+obj-$(CONFIG_STNIC)  += crc32.o
+obj-$(CONFIG_MAC8390)  += crc32.o
+obj-$(CONFIG_APNE)  += crc32.o
+obj-$(CONFIG_PCMCIA_PCNET) += crc32.o
+obj-$(CONFIG_ARM_ETHERH) += crc32.o
+obj-$(CONFIG_WD80x3)  += crc32.o
+obj-$(CONFIG_EL2)  += crc32.o
+obj-$(CONFIG_NE2000)  += crc32.o
+obj-$(CONFIG_NE2_MCA)  += crc32.o
+obj-$(CONFIG_HPLAN)  += crc32.o
+obj-$(CONFIG_HPLAN_PLUS) += crc32.o
+obj-$(CONFIG_ULTRA)  += crc32.o
+obj-$(CONFIG_ULTRAMCA)  += crc32.o
+obj-$(CONFIG_ULTRA32)  += crc32.o
+obj-$(CONFIG_E2100)  += crc32.o
+obj-$(CONFIG_ES3210)  += crc32.o
+obj-$(CONFIG_LNE390)  += crc32.o
+obj-$(CONFIG_NE3210)  += crc32.o
+obj-$(CONFIG_AC3200)  += crc32.o
+obj-$(CONFIG_ARIADNE2)  += crc32.o
+obj-$(CONFIG_HYDRA)  += crc32.o
Index: kernel/linuxppc/drivers/usb/Makefile.lib
diff -u /dev/null kernel/linuxppc/drivers/usb/Makefile.lib:1.1
--- /dev/null Sun Dec  1 00:10:52 2002
+++ kernel/linuxppc/drivers/usb/Makefile.lib Fri Nov 15 17:37:58 2002
@@ -0,0 +1 @@
+obj-$(CONFIG_USB_CATC)  += crc32.o
Index: kernel/linuxppc/fs/Makefile.lib
diff -u /dev/null kernel/linuxppc/fs/Makefile.lib:1.1
--- /dev/null Sun Dec  1 00:10:52 2002
+++ kernel/linuxppc/fs/Makefile.lib Fri Nov 15 17:37:58 2002
@@ -0,0 +1,2 @@
+obj-$(CONFIG_JFFS2_FS)  += crc32.o
+obj-$(CONFIG_EFI_PARTITION) += crc32.o
Index: kernel/linuxppc/include/linux/crc32.h
diff -u kernel/linuxppc/include/linux/crc32.h:1.1.1.1 kernel/linuxppc/include/linux/crc32.h:1.2
--- kernel/linuxppc/include/linux/crc32.h:1.1.1.1 Fri Nov  1 14:44:27 2002
+++ kernel/linuxppc/include/linux/crc32.h Fri Nov 15 17:37:58 2002
@@ -1,49 +1,17 @@
 /*
- * crc32.h for early Linux 2.4.19pre kernel inclusion
- * This defines ether_crc_le() and ether_crc() as inline functions
- * This is slated to change to using the library crc32 functions
- * as kernel 2.5.2 included at some future date.
+ * crc32.h
+ * See linux/lib/crc32.c for license and changes
  */
 #ifndef _LINUX_CRC32_H
 #define _LINUX_CRC32_H
 
 #include <linux/types.h>
 
-/* The little-endian AUTODIN II ethernet CRC calculation.
-   N.B. Do not use for bulk data, use a table-based routine instead.
-   This is common code and should be moved to net/core/crc.c */
-static unsigned const ethernet_polynomial_le = 0xedb88320U;
-static inline unsigned ether_crc_le(int length, unsigned char *data)
-{
- unsigned int crc = 0xffffffff; /* Initial value. */
- while(--length >= 0) {
-  unsigned char current_octet = *data++;
-  int bit;
-  for (bit = 8; --bit >= 0; current_octet >>= 1) {
-   if ((crc ^ current_octet) & 1) {
-    crc >>= 1;
-    crc ^= ethernet_polynomial_le;
-   } else
-    crc >>= 1;
-  }
- }
- return crc;
-}
+extern u32  crc32_le(u32 crc, unsigned char const *p, size_t len);
+extern u32  crc32_be(u32 crc, unsigned char const *p, size_t len);
 
-static unsigned const ethernet_polynomial = 0x04c11db7U;
-static inline u32 ether_crc(int length, unsigned char *data)
-{
- int crc = -1;
- while (--length >= 0) {
-  unsigned char current_octet = *data++;
-  int bit;
-  for (bit = 0; bit < 8; bit++, current_octet >>= 1) {
-   crc = (crc << 1) ^
-    ((crc < 0) ^ (current_octet & 1) ?
-     ethernet_polynomial : 0);
-  }
- }
- return crc;
-}
+#define crc32(seed, data, length)  crc32_le(seed, (unsigned char const *)data, length)
+#define ether_crc_le(length, data) crc32_le(~0, data, length)
+#define ether_crc(length, data)    crc32_be(~0, data, length)
 
 #endif /* _LINUX_CRC32_H */
Index: kernel/linuxppc/lib/Config.in
diff -u kernel/linuxppc/lib/Config.in:1.1.1.1 kernel/linuxppc/lib/Config.in:1.2
--- kernel/linuxppc/lib/Config.in:1.1.1.1 Fri Nov  1 14:44:56 2002
+++ kernel/linuxppc/lib/Config.in Fri Nov 15 17:37:59 2002
@@ -4,6 +4,8 @@
 mainmenu_option next_comment
 comment 'Library routines'
 
+tristate 'CRC32 functions' CONFIG_CRC32
+
 #
 # Do we need the compression support?
 #
Index: kernel/linuxppc/lib/Makefile
diff -u kernel/linuxppc/lib/Makefile:1.1.1.1 kernel/linuxppc/lib/Makefile:1.2
--- kernel/linuxppc/lib/Makefile:1.1.1.1 Fri Nov  1 14:44:56 2002
+++ kernel/linuxppc/lib/Makefile Fri Nov 15 17:37:59 2002
@@ -20,8 +20,17 @@
   obj-y += dec_and_lock.o
 endif
 
+obj-$(CONFIG_CRC32)     += crc32.o
+# make sure to always unroll the crc32 loops. It's a major
+# performance advantage and it only costs 600-700 bytes in extra size
+CFLAGS_crc32.o := -funroll-loops
+ 
 subdir-$(CONFIG_ZLIB_INFLATE) += zlib_inflate
 subdir-$(CONFIG_ZLIB_DEFLATE) += zlib_deflate
+
+include $(TOPDIR)/drivers/net/Makefile.lib
+include $(TOPDIR)/drivers/usb/Makefile.lib
+include $(TOPDIR)/fs/Makefile.lib
 
 # Include the subdirs, if necessary.
 obj-y += $(join $(subdir-y),$(subdir-y:%=/%.o))
Index: kernel/linuxppc/lib/crc32.c
diff -u /dev/null kernel/linuxppc/lib/crc32.c:1.2
--- /dev/null Sun Dec  1 00:10:52 2002
+++ kernel/linuxppc/lib/crc32.c Mon Nov 25 13:16:51 2002
@@ -0,0 +1,683 @@
+/* 
+ * Oct 15, 2000 Matt Domsch <Matt_Domsch@dell.com>
+ * Nicer crc32 functions/docs submitted by linux@horizon.com.  Thanks!
+ *
+ * Oct 12, 2000 Matt Domsch <Matt_Domsch@dell.com>
+ * Same crc32 function was used in 5 other places in the kernel.
+ * I made one version, and deleted the others.
+ * There are various incantations of crc32().  Some use a seed of 0 or ~0.
+ * Some xor at the end with ~0.  The generic crc32() function takes
+ * seed as an argument, and doesn't xor at the end.  Then individual
+ * users can do whatever they need.
+ *   drivers/net/smc9194.c uses seed ~0, doesn't xor with ~0.
+ *   fs/jffs2 uses seed 0, doesn't xor with ~0.
+ *   fs/partitions/efi.c uses seed ~0, xor's with ~0.
+ * 
+ */
+
+#include <linux/crc32.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <asm/atomic.h>
+
+#if __GNUC__ >= 3 /* 2.x has "attribute", but only 3.0 has "pure */
+#define attribute(x) __attribute__(x)
+#else
+#define attribute(x)
+#endif
+
+/*
+ * This code is in the public domain; copyright abandoned.
+ * Liability for non-performance of this code is limited to the amount
+ * you paid for it.  Since it is distributed for free, your refund will
+ * be very very small.  If it breaks, you get to keep both pieces.
+ */
+
+MODULE_AUTHOR("Matt Domsch <Matt_Domsch@dell.com>");
+MODULE_DESCRIPTION("Ethernet CRC32 calculations");
+MODULE_LICENSE("GPL and additional rights");
+
+
+/*
+ * There are multiple 16-bit CRC polynomials in common use, but this is
+ * *the* standard CRC-32 polynomial, first popularized by Ethernet.
+ * x^32+x^26+x^23+x^22+x^16+x^12+x^11+x^10+x^8+x^7+x^5+x^4+x^2+x^1+x^0
+ */
+#define CRCPOLY_LE 0xedb88320
+#define CRCPOLY_BE 0x04c11db7
+
+/* How many bits at a time to use.  Requires a table of 4<<CRC_xx_BITS bytes. */
+/* For less performance-sensitive, use 4 */
+#define CRC_LE_BITS 8
+#define CRC_BE_BITS 8
+
+/*
+ * Little-endian CRC computation.  Used with serial bit streams sent
+ * lsbit-first.  Be sure to use cpu_to_le32() to append the computed CRC.
+ */
+#if CRC_LE_BITS > 8 || CRC_LE_BITS < 1 || CRC_LE_BITS & CRC_LE_BITS-1
+# error CRC_LE_BITS must be a power of 2 between 1 and 8
+#endif
+
+#if CRC_LE_BITS == 1
+/*
+ * In fact, the table-based code will work in this case, but it can be
+ * simplified by inlining the table in ?: form.
+ */
+#define crc32init_le()
+#define crc32cleanup_le()
+/**
+ * crc32_le() - Calculate bitwise little-endian Ethernet AUTODIN II CRC32
+ * @crc - seed value for computation.  ~0 for Ethernet, sometimes 0 for
+ *        other uses, or the previous crc32 value if computing incrementally.
+ * @p   - pointer to buffer over which CRC is run
+ * @len - length of buffer @p
+ * 
+ */
+u32 attribute((pure)) crc32_le(u32 crc, unsigned char const *p, size_t len)
+{
+ int i;
+ while (len--) {
+  crc ^= *p++;
+  for (i = 0; i < 8; i++)
+   crc = (crc >> 1) ^ ((crc & 1) ? CRCPOLY_LE : 0);
+ }
+ return crc;
+}
+#else    /* Table-based approach */
+
+static u32 *crc32table_le;
+/**
+ * crc32init_le() - allocate and initialize LE table data
+ *
+ * crc is the crc of the byte i; other entries are filled in based on the
+ * fact that crctable[i^j] = crctable[i] ^ crctable[j].
+ *
+ */
+static int __init crc32init_le(void)
+{
+ unsigned i, j;
+ u32 crc = 1;
+
+ crc32table_le =
+     kmalloc((1 << CRC_LE_BITS) * sizeof(u32), GFP_KERNEL);
+ if (!crc32table_le)
+  return 1;
+ crc32table_le[0] = 0;
+
+ for (i = 1 << (CRC_LE_BITS - 1); i; i >>= 1) {
+  crc = (crc >> 1) ^ ((crc & 1) ? CRCPOLY_LE : 0);
+  for (j = 0; j < 1 << CRC_LE_BITS; j += 2 * i)
+# if CRC_LE_BITS == 8 
+   crc32table_le[i + j] = __cpu_to_le32(crc) ^ crc32table_le[j];
+# else
+   crc32table_le[i + j] = crc ^ crc32table_le[j];
+# endif
+ }
+ return 0;
+}
+
+/**
+ * crc32cleanup_le(): free LE table data
+ */
+static void __exit crc32cleanup_le(void)
+{
+ if (crc32table_le) kfree(crc32table_le);
+ crc32table_le = NULL;
+}
+
+/**
+ * crc32_le() - Calculate bitwise little-endian Ethernet AUTODIN II CRC32
+ * @crc - seed value for computation.  ~0 for Ethernet, sometimes 0 for
+ *        other uses, or the previous crc32 value if computing incrementally.
+ * @p   - pointer to buffer over which CRC is run
+ * @len - length of buffer @p
+ * 
+ */
+u32 attribute((pure)) crc32_le(u32 crc, unsigned char const *p, size_t len)
+{
+# if CRC_LE_BITS == 8
+ const u32      *b =(u32 *)p;
+ const u32      *e;
+ /* load data 32 bits wide, xor data 32 bits wide. */
+
+ crc = __cpu_to_le32(crc);
+ /* Align it */
+ for ( ; ((u32)b)&3 && len ; len--){
+# ifdef __LITTLE_ENDIAN
+  crc = (crc>>8) ^ crc32table_le[ (crc ^ *((u8 *)b)++) & 0xff ];
+# else
+  crc = (crc<<8) ^ crc32table_le[ crc>>24 ^ *((u8 *)b)++ ];
+# endif
+ }
+ e = (u32 *) ( (u8 *)b + (len & ~7));
+ while (b < e) {
+  crc ^= *b++;
+# ifdef __LITTLE_ENDIAN
+  crc = (crc>>8) ^ crc32table_le[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_le[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_le[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_le[ crc & 0xff ];
+# else
+  crc = (crc<<8) ^ crc32table_le[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_le[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_le[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_le[ crc >> 24 ];
+# endif
+  crc ^= *b++;
+# ifdef __LITTLE_ENDIAN
+  crc = (crc>>8) ^ crc32table_le[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_le[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_le[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_le[ crc & 0xff ];
+# else
+  crc = (crc<<8) ^ crc32table_le[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_le[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_le[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_le[ crc >> 24 ];
+# endif
+ }
+ /* And the last few bytes */
+ e = (u32 *)((u8 *)b + (len & 7));
+ while (b < e){
+# ifdef __LITTLE_ENDIAN
+  crc = (crc>>8) ^ crc32table_le[ (crc ^ *((u8 *)b)++) & 0xff ];
+# else
+  crc = (crc<<8) ^ crc32table_le[ crc>>24 ^ *((u8 *)b)++ ];
+# endif
+ }
+ return __le32_to_cpu(crc) ;
+# elif CRC_LE_BITS == 4
+ while (len--) {
+  crc ^= *p++;
+  crc = (crc >> 4) ^ crc32table_le[crc & 15];
+  crc = (crc >> 4) ^ crc32table_le[crc & 15];
+ }
+ return crc;
+# elif CRC_LE_BITS == 2
+ while (len--) {
+  crc ^= *p++;
+  crc = (crc >> 2) ^ crc32table_le[crc & 3];
+  crc = (crc >> 2) ^ crc32table_le[crc & 3];
+  crc = (crc >> 2) ^ crc32table_le[crc & 3];
+  crc = (crc >> 2) ^ crc32table_le[crc & 3];
+ }
+ return crc;
+# endif
+}
+#endif
+
+/*
+ * Big-endian CRC computation.  Used with serial bit streams sent
+ * msbit-first.  Be sure to use cpu_to_be32() to append the computed CRC.
+ */
+#if CRC_BE_BITS > 8 || CRC_BE_BITS < 1 || CRC_BE_BITS & CRC_BE_BITS-1
+# error CRC_BE_BITS must be a power of 2 between 1 and 8
+#endif
+
+#if CRC_BE_BITS == 1
+/*
+ * In fact, the table-based code will work in this case, but it can be
+ * simplified by inlining the table in ?: form.
+ */
+#define crc32init_be()
+#define crc32cleanup_be()
+
+/**
+ * crc32_be() - Calculate bitwise big-endian Ethernet AUTODIN II CRC32
+ * @crc - seed value for computation.  ~0 for Ethernet, sometimes 0 for
+ *        other uses, or the previous crc32 value if computing incrementally.
+ * @p   - pointer to buffer over which CRC is run
+ * @len - length of buffer @p
+ * 
+ */
+u32 attribute((pure)) crc32_be(u32 crc, unsigned char const *p, size_t len)
+{
+ int i;
+ while (len--) {
+  crc ^= *p++ << 24;
+  for (i = 0; i < 8; i++)
+   crc =
+       (crc << 1) ^ ((crc & 0x80000000) ? CRCPOLY_BE :
+       0);
+ }
+ return crc;
+}
+
+#else    /* Table-based approach */
+static u32 *crc32table_be;
+
+/**
+ * crc32init_be() - allocate and initialize BE table data
+ */
+static int __init crc32init_be(void)
+{
+ unsigned i, j;
+ u32 crc = 0x80000000;
+
+ crc32table_be =
+     kmalloc((1 << CRC_BE_BITS) * sizeof(u32), GFP_KERNEL);
+ if (!crc32table_be)
+  return 1;
+ crc32table_be[0] = 0;
+
+ for (i = 1; i < 1 << CRC_BE_BITS; i <<= 1) {
+  crc = (crc << 1) ^ ((crc & 0x80000000) ? CRCPOLY_BE : 0);
+  for (j = 0; j < i; j++)
+# if CRC_BE_BITS == 8
+   crc32table_be[i + j] =  __cpu_to_be32(crc) ^ crc32table_be[j];
+# else
+   crc32table_be[i + j] = crc ^ crc32table_be[j];
+# endif
+ }
+ return 0;
+}
+
+/**
+ * crc32cleanup_be(): free BE table data
+ */
+static void __exit crc32cleanup_be(void)
+{
+ if (crc32table_be) kfree(crc32table_be);
+ crc32table_be = NULL;
+}
+
+
+/**
+ * crc32_be() - Calculate bitwise big-endian Ethernet AUTODIN II CRC32
+ * @crc - seed value for computation.  ~0 for Ethernet, sometimes 0 for
+ *        other uses, or the previous crc32 value if computing incrementally.
+ * @p   - pointer to buffer over which CRC is run
+ * @len - length of buffer @p
+ * 
+ */
+u32 attribute((pure)) crc32_be(u32 crc, unsigned char const *p, size_t len)
+{
+# if CRC_BE_BITS == 8
+ const u32      *b =(u32 *)p;
+ const u32      *e;
+ /* load data 32 bits wide, xor data 32 bits wide. */
+
+ crc = __cpu_to_be32(crc);
+ /* Align it */
+ for ( ; ((u32)b)&3 && len ; len--){
+# ifdef __LITTLE_ENDIAN
+  crc = (crc>>8) ^ crc32table_be[ (crc ^ *((u8 *)b)++) & 0xff ];
+# else
+  crc = (crc<<8) ^ crc32table_be[ crc>>24 ^ *((u8 *)b)++ ];
+# endif
+ }
+ e = (u32 *) ( (u8 *)b + (len & ~7));
+ while (b < e) {
+  crc ^= *b++;
+# ifdef __LITTLE_ENDIAN
+  crc = (crc>>8) ^ crc32table_be[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_be[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_be[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_be[ crc & 0xff ];
+# else
+  crc = (crc<<8) ^ crc32table_be[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_be[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_be[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_be[ crc >> 24 ];
+# endif
+  crc ^= *b++;
+# ifdef __LITTLE_ENDIAN
+  crc = (crc>>8) ^ crc32table_be[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_be[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_be[ crc & 0xff ];
+  crc = (crc>>8) ^ crc32table_be[ crc & 0xff ];
+# else
+  crc = (crc<<8) ^ crc32table_be[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_be[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_be[ crc >> 24 ];
+  crc = (crc<<8) ^ crc32table_be[ crc >> 24 ];
+# endif
+ }
+ /* And the last few bytes */
+ e = (u32 *)((u8 *)b + (len & 7));
+ while (b < e){
+# ifdef __LITTLE_ENDIAN
+  crc = (crc>>8) ^ crc32table_be[ (crc ^ *((u8 *)b)++) & 0xff ];
+# else
+  crc = (crc<<8) ^ crc32table_be[ crc>>24 ^ *((u8 *)b)++ ];
+# endif
+ }
+ return __be32_to_cpu(crc) ;
+# elif CRC_BE_BITS == 4
+ while (len--) {
+  crc ^= *p++ << 24;
+  crc = (crc << 4) ^ crc32table_be[crc >> 28];
+  crc = (crc << 4) ^ crc32table_be[crc >> 28];
+ }
+ return crc;
+# elif CRC_BE_BITS == 2
+ while (len--) {
+  crc ^= *p++ << 24;
+  crc = (crc << 2) ^ crc32table_be[crc >> 30];
+  crc = (crc << 2) ^ crc32table_be[crc >> 30];
+  crc = (crc << 2) ^ crc32table_be[crc >> 30];
+  crc = (crc << 2) ^ crc32table_be[crc >> 30];
+ }
+ return crc;
+# endif
+}
+#endif
+
+/*
+ * A brief CRC tutorial.
+ *
+ * A CRC is a long-division remainder.  You add the CRC to the message,
+ * and the whole thing (message+CRC) is a multiple of the given
+ * CRC polynomial.  To check the CRC, you can either check that the
+ * CRC matches the recomputed value, *or* you can check that the
+ * remainder computed on the message+CRC is 0.  This latter approach
+ * is used by a lot of hardware implementations, and is why so many
+ * protocols put the end-of-frame flag after the CRC.
+ *
+ * It's actually the same long division you learned in school, except that
+ * - We're working in binary, so the digits are only 0 and 1, and
+ * - When dividing polynomials, there are no carries.  Rather than add and
+ *   subtract, we just xor.  Thus, we tend to get a bit sloppy about
+ *   the difference between adding and subtracting.
+ *
+ * A 32-bit CRC polynomial is actually 33 bits long.  But since it's
+ * 33 bits long, bit 32 is always going to be set, so usually the CRC
+ * is written in hex with the most significant bit omitted.  (If you're
+ * familiar with the IEEE 754 floating-point format, it's the same idea.)
+ *
+ * Note that a CRC is computed over a string of *bits*, so you have
+ * to decide on the endianness of the bits within each byte.  To get
+ * the best error-detecting properties, this should correspond to the
+ * order they're actually sent.  For example, standard RS-232 serial is
+ * little-endian; the most significant bit (sometimes used for parity)
+ * is sent last.  And when appending a CRC word to a message, you should
+ * do it in the right order, matching the endianness.
+ *
+ * Just like with ordinary division, the remainder is always smaller than
+ * the divisor (the CRC polynomial) you're dividing by.  Each step of the
+ * division, you take one more digit (bit) of the dividend and append it
+ * to the current remainder.  Then you figure out the appropriate multiple
+ * of the divisor to subtract to being the remainder back into range.
+ * In binary, it's easy - it has to be either 0 or 1, and to make the
+ * XOR cancel, it's just a copy of bit 32 of the remainder.
+ *
+ * When computing a CRC, we don't care about the quotient, so we can
+ * throw the quotient bit away, but subtract the appropriate multiple of
+ * the polynomial from the remainder and we're back to where we started,
+ * ready to process the next bit.
+ *
+ * A big-endian CRC written this way would be coded like:
+ * for (i = 0; i < input_bits; i++) {
+ *  multiple = remainder & 0x80000000 ? CRCPOLY : 0;
+ *  remainder = (remainder << 1 | next_input_bit()) ^ multiple;
+ * }
+ * Notice how, to get at bit 32 of the shifted remainder, we look
+ * at bit 31 of the remainder *before* shifting it.
+ *
+ * But also notice how the next_input_bit() bits we're shifting into
+ * the remainder don't actually affect any decision-making until
+ * 32 bits later.  Thus, the first 32 cycles of this are pretty boring.
+ * Also, to add the CRC to a message, we need a 32-bit-long hole for it at
+ * the end, so we have to add 32 extra cycles shifting in zeros at the
+ * end of every message,
+ *
+ * So the standard trick is to rearrage merging in the next_input_bit()
+ * until the moment it's needed.  Then the first 32 cycles can be precomputed,
+ * and merging in the final 32 zero bits to make room for the CRC can be
+ * skipped entirely.
+ * This changes the code to:
+ * for (i = 0; i < input_bits; i++) {
+ *      remainder ^= next_input_bit() << 31;
+ *  multiple = (remainder & 0x80000000) ? CRCPOLY : 0;
+ *  remainder = (remainder << 1) ^ multiple;
+ * }
+ * With this optimization, the little-endian code is simpler:
+ * for (i = 0; i < input_bits; i++) {
+ *      remainder ^= next_input_bit();
+ *  multiple = (remainder & 1) ? CRCPOLY : 0;
+ *  remainder = (remainder >> 1) ^ multiple;
+ * }
+ *
+ * Note that the other details of endianness have been hidden in CRCPOLY
+ * (which must be bit-reversed) and next_input_bit().
+ *
+ * However, as long as next_input_bit is returning the bits in a sensible
+ * order, we can actually do the merging 8 or more bits at a time rather
+ * than one bit at a time:
+ * for (i = 0; i < input_bytes; i++) {
+ *  remainder ^= next_input_byte() << 24;
+ *  for (j = 0; j < 8; j++) {
+ *   multiple = (remainder & 0x80000000) ? CRCPOLY : 0;
+ *   remainder = (remainder << 1) ^ multiple;
+ *  }
+ * }
+ * Or in little-endian:
+ * for (i = 0; i < input_bytes; i++) {
+ *  remainder ^= next_input_byte();
+ *  for (j = 0; j < 8; j++) {
+ *   multiple = (remainder & 1) ? CRCPOLY : 0;
+ *   remainder = (remainder << 1) ^ multiple;
+ *  }
+ * }
+ * If the input is a multiple of 32 bits, you can even XOR in a 32-bit
+ * word at a time and increase the inner loop count to 32.
+ *
+ * You can also mix and match the two loop styles, for example doing the
+ * bulk of a message byte-at-a-time and adding bit-at-a-time processing
+ * for any fractional bytes at the end.
+ *
+ * The only remaining optimization is to the byte-at-a-time table method.
+ * Here, rather than just shifting one bit of the remainder to decide
+ * in the correct multiple to subtract, we can shift a byte at a time.
+ * This produces a 40-bit (rather than a 33-bit) intermediate remainder,
+ * but again the multiple of the polynomial to subtract depends only on
+ * the high bits, the high 8 bits in this case.  
+ *
+ * The multile we need in that case is the low 32 bits of a 40-bit
+ * value whose high 8 bits are given, and which is a multiple of the
+ * generator polynomial.  This is simply the CRC-32 of the given
+ * one-byte message.
+ *
+ * Two more details: normally, appending zero bits to a message which
+ * is already a multiple of a polynomial produces a larger multiple of that
+ * polynomial.  To enable a CRC to detect this condition, it's common to
+ * invert the CRC before appending it.  This makes the remainder of the
+ * message+crc come out not as zero, but some fixed non-zero value.
+ *
+ * The same problem applies to zero bits prepended to the message, and
+ * a similar solution is used.  Instead of starting with a remainder of
+ * 0, an initial remainder of all ones is used.  As long as you start
+ * the same way on decoding, it doesn't make a difference.
+ */
+
+#if UNITTEST
+
+#include <stdlib.h>
+#include <stdio.h>
+
+#if 0    /*Not used at present */
+static void
+buf_dump(char const *prefix, unsigned char const *buf, size_t len)
+{
+ fputs(prefix, stdout);
+ while (len--)
+  printf(" %02x", *buf++);
+ putchar('\n');
+
+}
+#endif
+
+static u32 attribute((const)) bitreverse(u32 x)
+{
+ x = (x >> 16) | (x << 16);
+ x = (x >> 8 & 0x00ff00ff) | (x << 8 & 0xff00ff00);
+ x = (x >> 4 & 0x0f0f0f0f) | (x << 4 & 0xf0f0f0f0);
+ x = (x >> 2 & 0x33333333) | (x << 2 & 0xcccccccc);
+ x = (x >> 1 & 0x55555555) | (x << 1 & 0xaaaaaaaa);
+ return x;
+}
+
+static void bytereverse(unsigned char *buf, size_t len)
+{
+ while (len--) {
+  unsigned char x = *buf;
+  x = (x >> 4) | (x << 4);
+  x = (x >> 2 & 0x33) | (x << 2 & 0xcc);
+  x = (x >> 1 & 0x55) | (x << 1 & 0xaa);
+  *buf++ = x;
+ }
+}
+
+static void random_garbage(unsigned char *buf, size_t len)
+{
+ while (len--)
+  *buf++ = (unsigned char) random();
+}
+
+#if 0    /* Not used at present */
+static void store_le(u32 x, unsigned char *buf)
+{
+ buf[0] = (unsigned char) x;
+ buf[1] = (unsigned char) (x >> 8);
+ buf[2] = (unsigned char) (x >> 16);
+ buf[3] = (unsigned char) (x >> 24);
+}
+#endif
+
+static void store_be(u32 x, unsigned char *buf)
+{
+ buf[0] = (unsigned char) (x >> 24);
+ buf[1] = (unsigned char) (x >> 16);
+ buf[2] = (unsigned char) (x >> 8);
+ buf[3] = (unsigned char) x;
+}
+
+/*
+ * This checks that CRC(buf + CRC(buf)) = 0, and that
+ * CRC commutes with bit-reversal.  This has the side effect
+ * of bytewise bit-reversing the input buffer, and returns
+ * the CRC of the reversed buffer.
+ */
+static u32 test_step(u32 init, unsigned char *buf, size_t len)
+{
+ u32 crc1, crc2;
+ size_t i;
+
+ crc1 = crc32_be(init, buf, len);
+ store_be(crc1, buf + len);
+ crc2 = crc32_be(init, buf, len + 4);
+ if (crc2)
+  printf("\nCRC cancellation fail: 0x%08x should be 0\n",
+         crc2);
+
+ for (i = 0; i <= len + 4; i++) {
+  crc2 = crc32_be(init, buf, i);
+  crc2 = crc32_be(crc2, buf + i, len + 4 - i);
+  if (crc2)
+   printf("\nCRC split fail: 0x%08x\n", crc2);
+ }
+
+ /* Now swap it around for the other test */
+
+ bytereverse(buf, len + 4);
+ init = bitreverse(init);
+ crc2 = bitreverse(crc1);
+ if (crc1 != bitreverse(crc2))
+  printf("\nBit reversal fail: 0x%08x -> %0x08x -> 0x%08x\n",
+         crc1, crc2, bitreverse(crc2));
+ crc1 = crc32_le(init, buf, len);
+ if (crc1 != crc2)
+  printf("\nCRC endianness fail: 0x%08x != 0x%08x\n", crc1,
+         crc2);
+ crc2 = crc32_le(init, buf, len + 4);
+ if (crc2)
+  printf("\nCRC cancellation fail: 0x%08x should be 0\n",
+         crc2);
+
+ for (i = 0; i <= len + 4; i++) {
+  crc2 = crc32_le(init, buf, i);
+  crc2 = crc32_le(crc2, buf + i, len + 4 - i);
+  if (crc2)
+   printf("\nCRC split fail: 0x%08x\n", crc2);
+ }
+
+ return crc1;
+}
+
+#define SIZE 64
+#define INIT1 0
+#define INIT2 0
+
+int main(void)
+{
+ unsigned char buf1[SIZE + 4];
+ unsigned char buf2[SIZE + 4];
+ unsigned char buf3[SIZE + 4];
+ int i, j;
+ u32 crc1, crc2, crc3;
+
+ crc32init_le();
+ crc32init_be();
+
+ for (i = 0; i <= SIZE; i++) {
+  printf("\rTesting length %d...", i);
+  fflush(stdout);
+  random_garbage(buf1, i);
+  random_garbage(buf2, i);
+  for (j = 0; j < i; j++)
+   buf3[j] = buf1[j] ^ buf2[j];
+
+  crc1 = test_step(INIT1, buf1, i);
+  crc2 = test_step(INIT2, buf2, i);
+  /* Now check that CRC(buf1 ^ buf2) = CRC(buf1) ^ CRC(buf2) */
+  crc3 = test_step(INIT1 ^ INIT2, buf3, i);
+  if (crc3 != (crc1 ^ crc2))
+   printf("CRC XOR fail: 0x%08x != 0x%08x ^ 0x%08x\n",
+          crc3, crc1, crc2);
+ }
+ printf("\nAll test complete.  No failures expected.\n");
+ return 0;
+}
+
+#endif    /* UNITTEST */
+
+/**
+ * init_crc32(): generates CRC32 tables
+ * 
+ * On successful initialization, use count is increased.
+ * This guarantees that the library functions will stay resident
+ * in memory, and prevents someone from 'rmmod crc32' while
+ * a driver that needs it is still loaded.
+ * This also greatly simplifies drivers, as there's no need
+ * to call an initialization/cleanup function from each driver.
+ * Since crc32.o is a library module, there's no requirement
+ * that the user can unload it.
+ */
+static int __init init_crc32(void)
+{
+ int rc1, rc2, rc;
+ rc1 = crc32init_le();
+ rc2 = crc32init_be();
+ rc = rc1 || rc2;
+ if (!rc) MOD_INC_USE_COUNT;
+ return rc;
+}
+
+/**
+ * cleanup_crc32(): frees crc32 data when no longer needed
+ */
+static void __exit cleanup_crc32(void)
+{
+ crc32cleanup_le();
+ crc32cleanup_be();
+}
+
+module_init(init_crc32);
+module_exit(cleanup_crc32);
+
+EXPORT_SYMBOL(crc32_le);
+EXPORT_SYMBOL(crc32_be);
