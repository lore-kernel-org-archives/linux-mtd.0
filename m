Received: from forward9.mail.yandex.net ([77.88.61.48])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VS0PT-0003z8-SJ
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 08:06:52 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Brent Taylor <motobud@gmail.com>
In-Reply-To: <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
Subject: Re: lz4hc compression in UBIFS?
MIME-Version: 1.0
Message-Id: <409951380873962@web7m.yandex.ru>
Date: Fri, 04 Oct 2013 12:06:02 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
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



04.10.2013, 07:09, "Brent Taylor" <motobud@gmail.com>:
> Here is a patch based on linux-3.12-rc3. šI haven't performed any
> performance testing UBIFS using lz4hc, but I can mount UBIFS volumes
> and haven't seen any problems yet.

Thank you!

Are you planning to implement a patch for mtd-utils (mkfs.ubifs) as well?


> šThe only think I know that isn't
> correct about the patch is the description for the Kconfig element for
> select lz4hc as a compression option. šI only copied the description
> from the lzo description.
>
> diff -uN -uNr linux-3.12-rc3.orig/fs/ubifs/compress.c
> linux-3.12-rc3/fs/ubifs/compress.c
> --- linux-3.12-rc3.orig/fs/ubifs/compress.c šššš2013-09-29
> 17:02:38.000000000 -0500
> +++ linux-3.12-rc3/fs/ubifs/compress.c š2013-07-17 21:57:27.440653860 -0500
> @@ -53,6 +53,22 @@
> š};
> š#endif
>
> +#ifdef CONFIG_UBIFS_FS_LZ4HC
> +static DEFINE_MUTEX(lz4hc_mutex);
> +
> +static struct ubifs_compressor lz4hc_compr = {
> + šššššš.compr_type = UBIFS_COMPR_LZ4HC,
> + šššššš.comp_mutex = &lz4hc_mutex,
> + šššššš.name = "lz4hc",
> + šššššš.capi_name = "lz4hc",
> +};
> +#else
> +static struct ubifs_compressor lz4hc_compr = {
> + šššššš.compr_type = UBIFS_COMPR_LZ4HC,
> + šššššš.name = "lz4hc",
> +};
> +#endif
> +
> š#ifdef CONFIG_UBIFS_FS_ZLIB
> šstatic DEFINE_MUTEX(deflate_mutex);
> šstatic DEFINE_MUTEX(inflate_mutex);
> @@ -224,10 +240,14 @@
> š{
> ššššššššint err;
>
> - ššššššerr = compr_init(&lzo_compr);
> + ššššššerr = compr_init(&lz4hc_compr);
> ššššššššif (err)
> ššššššššššššššššreturn err;
>
> + ššššššerr = compr_init(&lzo_compr);
> + ššššššif (err)
> + ššššššššššššššgoto out_lz4hc;
> +
> ššššššššerr = compr_init(&zlib_compr);
> ššššššššif (err)
> ššššššššššššššššgoto out_lzo;
> @@ -237,6 +257,8 @@
>
> šout_lzo:
> ššššššššcompr_exit(&lzo_compr);
> +out_lz4hc:
> + ššššššcompr_exit(&lz4hc_compr);
> ššššššššreturn err;
> š}
>
> @@ -245,6 +267,7 @@
> šš*/
> švoid ubifs_compressors_exit(void)
> š{
> + ššššššcompr_exit(&lz4hc_compr);
> ššššššššcompr_exit(&lzo_compr);
> ššššššššcompr_exit(&zlib_compr);
> š}
> diff -uN -uNr linux-3.12-rc3.orig/fs/ubifs/Kconfig
> linux-3.12-rc3/fs/ubifs/Kconfig
> --- linux-3.12-rc3.orig/fs/ubifs/Kconfig ššššššš2013-09-29
> 17:02:38.000000000 -0500
> +++ linux-3.12-rc3/fs/ubifs/Kconfig šššš2013-10-03 21:40:39.098747630 -0500
> @@ -29,6 +29,14 @@
> šššššššššššLZO compressor is generally faster than zlib but compresses worse.
> šššššššššššSay 'Y' if unsure.
>
> +config UBIFS_FS_LZ4HC
> + ššššššbool "LZ4HC compression support" if UBIFS_FS_ADVANCED_COMPR
> + ššššššdepends on UBIFS_FS && CRYPTO_LZ4HC
> + ššššššdefault y
> + ššššššhelp
> + šššššššššLZ4HC compressor is generally faster than zlib but compresses worse.
> + šššššššššSay 'Y' if unsure.
> +
> šconfig UBIFS_FS_ZLIB
> ššššššššbool "ZLIB compression support" if UBIFS_FS_ADVANCED_COMPR
> ššššššššdepends on UBIFS_FS
> diff -uN -uNr linux-3.12-rc3.orig/fs/ubifs/super.c
> linux-3.12-rc3/fs/ubifs/super.c
> --- linux-3.12-rc3.orig/fs/ubifs/super.c ššššššš2013-09-29
> 17:02:38.000000000 -0500
> +++ linux-3.12-rc3/fs/ubifs/super.c šššš2013-09-30 23:01:06.899526709 -0500
> @@ -1040,6 +1040,8 @@
> ššššššššššššššššššššššššššššššššreturn -ENOMEM;
> ššššššššššššššššššššššššif (!strcmp(name, "none"))
> ššššššššššššššššššššššššššššššššc->mount_opts.compr_type = UBIFS_COMPR_NONE;
> + ššššššššššššššššššššššelse if (!strcmp(name, "lz4hc"))
> + ššššššššššššššššššššššššššššššc->mount_opts.compr_type = UBIFS_COMPR_LZ4HC;
> ššššššššššššššššššššššššelse if (!strcmp(name, "lzo"))
> ššššššššššššššššššššššššššššššššc->mount_opts.compr_type = UBIFS_COMPR_LZO;
> ššššššššššššššššššššššššelse if (!strcmp(name, "zlib"))
> diff -uN -uNr linux-3.12-rc3.orig/fs/ubifs/ubifs-media.h
> linux-3.12-rc3/fs/ubifs/ubifs-media.h
> --- linux-3.12-rc3.orig/fs/ubifs/ubifs-media.h š2013-09-29
> 17:02:38.000000000 -0500
> +++ linux-3.12-rc3/fs/ubifs/ubifs-media.h šššššš2013-07-16
> 22:56:02.435523610 -0500
> @@ -332,12 +332,14 @@
> šš* UBIFS_COMPR_NONE: no compression
> šš* UBIFS_COMPR_LZO: LZO compression
> šš* UBIFS_COMPR_ZLIB: ZLIB compression
> + * UBIFS_COMPR_LZ4HZ: LZ4HZ compression
> šš* UBIFS_COMPR_TYPES_CNT: count of supported compression types
> šš*/
> šenum {
> ššššššššUBIFS_COMPR_NONE,
> ššššššššUBIFS_COMPR_LZO,
> ššššššššUBIFS_COMPR_ZLIB,
> + ššššššUBIFS_COMPR_LZ4HC,
> ššššššššUBIFS_COMPR_TYPES_CNT,
> š};
>
> Enjoy,
> Brent Taylor

-- 
Regards,
Konstantin
