Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSH42-00036c-AV
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 01:53:51 +0000
Received: by mail-wg0-f50.google.com with SMTP id f12so4982130wgh.5
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2013 18:53:23 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 4 Oct 2013 20:53:23 -0500
Message-ID: <CAP+RiCBN_VojAqYBfSV6eH=5FVej43j_hG7ouKLbRSi0m5gmTA@mail.gmail.com>
Subject: [PATCH v2] ubifs; Add lz4hc compression
From: Brent Taylor <motobud@gmail.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,
   I replaced the Kconfig description with your suggestion slightly edited.

Konstarev,
   I haven't looked at what it would take to add lz4hc to mkfs.ubifs.
I wasn't planning on it, but I can take a look.

-- Brent

diff -uN -uNr linux-3.12-rc3.orig/fs/ubifs/compress.c
linux-3.12-rc3/fs/ubifs/compress.c
--- linux-3.12-rc3.orig/fs/ubifs/compress.c     2013-09-29
17:02:38.000000000 -0500
+++ linux-3.12-rc3/fs/ubifs/compress.c  2013-07-17 21:57:27.440653860 -0500
@@ -53,6 +53,22 @@
 };
 #endif

+#ifdef CONFIG_UBIFS_FS_LZ4HC
+static DEFINE_MUTEX(lz4hc_mutex);
+
+static struct ubifs_compressor lz4hc_compr = {
+       .compr_type = UBIFS_COMPR_LZ4HC,
+       .comp_mutex = &lz4hc_mutex,
+       .name = "lz4hc",
+       .capi_name = "lz4hc",
+};
+#else
+static struct ubifs_compressor lz4hc_compr = {
+       .compr_type = UBIFS_COMPR_LZ4HC,
+       .name = "lz4hc",
+};
+#endif
+
 #ifdef CONFIG_UBIFS_FS_ZLIB
 static DEFINE_MUTEX(deflate_mutex);
 static DEFINE_MUTEX(inflate_mutex);
@@ -224,10 +240,14 @@
 {
        int err;

-       err = compr_init(&lzo_compr);
+       err = compr_init(&lz4hc_compr);
        if (err)
                return err;

+       err = compr_init(&lzo_compr);
+       if (err)
+               goto out_lz4hc;
+
        err = compr_init(&zlib_compr);
        if (err)
                goto out_lzo;
@@ -237,6 +257,8 @@

 out_lzo:
        compr_exit(&lzo_compr);
+out_lz4hc:
+       compr_exit(&lz4hc_compr);
        return err;
 }

@@ -245,6 +267,7 @@
  */
 void ubifs_compressors_exit(void)
 {
+       compr_exit(&lz4hc_compr);
        compr_exit(&lzo_compr);
        compr_exit(&zlib_compr);
 }
diff -uN -uNr linux-3.12-rc3.orig/fs/ubifs/Kconfig
linux-3.12-rc3/fs/ubifs/Kconfig
--- linux-3.12-rc3.orig/fs/ubifs/Kconfig        2013-09-29
17:02:38.000000000 -0500
+++ linux-3.12-rc3/fs/ubifs/Kconfig     2013-10-04 20:25:16.767776913 -0500
@@ -29,6 +29,16 @@
           LZO compressor is generally faster than zlib but compresses worse.
           Say 'Y' if unsure.

+config UBIFS_FS_LZ4HC
+       bool "LZ4HC compression support" if UBIFS_FS_ADVANCED_COMPR
+       depends on UBIFS_FS && CRYPTO_LZ4HC
+       default y
+       help
+          LZ4HC generally beats LZO on decompression speed while provides a lot
+      better compression ratio (comparable to zlib). Compression speed is
+      generally slower compared to LZO, but faster compared to zlib.
+          Say 'Y' if unsure.
+
 config UBIFS_FS_ZLIB
        bool "ZLIB compression support" if UBIFS_FS_ADVANCED_COMPR
        depends on UBIFS_FS
diff -uN -uNr linux-3.12-rc3.orig/fs/ubifs/super.c
linux-3.12-rc3/fs/ubifs/super.c
--- linux-3.12-rc3.orig/fs/ubifs/super.c        2013-09-29
17:02:38.000000000 -0500
+++ linux-3.12-rc3/fs/ubifs/super.c     2013-09-30 23:01:06.899526709 -0500
@@ -1040,6 +1040,8 @@
                                return -ENOMEM;
                        if (!strcmp(name, "none"))
                                c->mount_opts.compr_type = UBIFS_COMPR_NONE;
+                       else if (!strcmp(name, "lz4hc"))
+                               c->mount_opts.compr_type = UBIFS_COMPR_LZ4HC;
                        else if (!strcmp(name, "lzo"))
                                c->mount_opts.compr_type = UBIFS_COMPR_LZO;
                        else if (!strcmp(name, "zlib"))
diff -uN -uNr linux-3.12-rc3.orig/fs/ubifs/ubifs-media.h
linux-3.12-rc3/fs/ubifs/ubifs-media.h
--- linux-3.12-rc3.orig/fs/ubifs/ubifs-media.h  2013-09-29
17:02:38.000000000 -0500
+++ linux-3.12-rc3/fs/ubifs/ubifs-media.h       2013-10-04
20:25:58.839777442 -0500
@@ -332,12 +332,14 @@
  * UBIFS_COMPR_NONE: no compression
  * UBIFS_COMPR_LZO: LZO compression
  * UBIFS_COMPR_ZLIB: ZLIB compression
+ * UBIFS_COMPR_LZ4HC: LZ4HC compression
  * UBIFS_COMPR_TYPES_CNT: count of supported compression types
  */
 enum {
        UBIFS_COMPR_NONE,
        UBIFS_COMPR_LZO,
        UBIFS_COMPR_ZLIB,
+       UBIFS_COMPR_LZ4HC,
        UBIFS_COMPR_TYPES_CNT,
 };
