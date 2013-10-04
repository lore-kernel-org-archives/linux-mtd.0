Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRvmJ-0007u1-IR
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 03:10:08 +0000
Received: by mail-wg0-f46.google.com with SMTP id k14so3387548wgh.13
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2013 20:09:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55541379679397@web20h.yandex.ru>
References: <55541379679397@web20h.yandex.ru>
Date: Thu, 3 Oct 2013 22:09:45 -0500
Message-ID: <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
Subject: Re: lz4hc compression in UBIFS?
From: Brent Taylor <motobud@gmail.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 20, 2013 at 7:16 AM, Konstantin Tokarev <annulen@yandex.ru> wro=
te:
> Hi all,
>
> Are there any plans for adding lz4hc [1] compression support to UBIFS?
>
> Benchmarks are quite impressive, and it looks like lz4hc can achieve bett=
er compression ration while providing 3.5x faster decompression. From quick=
 look at UBIFS module sources it looks like adding new compressor supported=
 by crypto API is a matter of a few lines of code in compress.c.
>
> Or are there any known obstacles?
>
> [1] http://code.google.com/p/lz4/
>
> --
> Regards,
> Konstantin
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Here is a patch based on linux-3.12-rc3.  I haven't performed any
performance testing UBIFS using lz4hc, but I can mount UBIFS volumes
and haven't seen any problems yet.  The only think I know that isn't
correct about the patch is the description for the Kconfig element for
select lz4hc as a compression option.  I only copied the description
from the lzo description.

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
+static struct ubifs_compressor lz4hc_compr =3D {
+       .compr_type =3D UBIFS_COMPR_LZ4HC,
+       .comp_mutex =3D &lz4hc_mutex,
+       .name =3D "lz4hc",
+       .capi_name =3D "lz4hc",
+};
+#else
+static struct ubifs_compressor lz4hc_compr =3D {
+       .compr_type =3D UBIFS_COMPR_LZ4HC,
+       .name =3D "lz4hc",
+};
+#endif
+
 #ifdef CONFIG_UBIFS_FS_ZLIB
 static DEFINE_MUTEX(deflate_mutex);
 static DEFINE_MUTEX(inflate_mutex);
@@ -224,10 +240,14 @@
 {
        int err;

-       err =3D compr_init(&lzo_compr);
+       err =3D compr_init(&lz4hc_compr);
        if (err)
                return err;

+       err =3D compr_init(&lzo_compr);
+       if (err)
+               goto out_lz4hc;
+
        err =3D compr_init(&zlib_compr);
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
+++ linux-3.12-rc3/fs/ubifs/Kconfig     2013-10-03 21:40:39.098747630 -0500
@@ -29,6 +29,14 @@
           LZO compressor is generally faster than zlib but compresses wors=
e.
           Say 'Y' if unsure.

+config UBIFS_FS_LZ4HC
+       bool "LZ4HC compression support" if UBIFS_FS_ADVANCED_COMPR
+       depends on UBIFS_FS && CRYPTO_LZ4HC
+       default y
+       help
+          LZ4HC compressor is generally faster than zlib but compresses wo=
rse.
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
                                c->mount_opts.compr_type =3D UBIFS_COMPR_NO=
NE;
+                       else if (!strcmp(name, "lz4hc"))
+                               c->mount_opts.compr_type =3D UBIFS_COMPR_LZ=
4HC;
                        else if (!strcmp(name, "lzo"))
                                c->mount_opts.compr_type =3D UBIFS_COMPR_LZ=
O;
                        else if (!strcmp(name, "zlib"))
diff -uN -uNr linux-3.12-rc3.orig/fs/ubifs/ubifs-media.h
linux-3.12-rc3/fs/ubifs/ubifs-media.h
--- linux-3.12-rc3.orig/fs/ubifs/ubifs-media.h  2013-09-29
17:02:38.000000000 -0500
+++ linux-3.12-rc3/fs/ubifs/ubifs-media.h       2013-07-16
22:56:02.435523610 -0500
@@ -332,12 +332,14 @@
  * UBIFS_COMPR_NONE: no compression
  * UBIFS_COMPR_LZO: LZO compression
  * UBIFS_COMPR_ZLIB: ZLIB compression
+ * UBIFS_COMPR_LZ4HZ: LZ4HZ compression
  * UBIFS_COMPR_TYPES_CNT: count of supported compression types
  */
 enum {
        UBIFS_COMPR_NONE,
        UBIFS_COMPR_LZO,
        UBIFS_COMPR_ZLIB,
+       UBIFS_COMPR_LZ4HC,
        UBIFS_COMPR_TYPES_CNT,
 };

Enjoy,
Brent Taylor
