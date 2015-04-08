Received: from mail-vn0-x22a.google.com ([2607:f8b0:400c:c0f::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfmLr-0008Ky-VG
 for linux-mtd@lists.infradead.org; Wed, 08 Apr 2015 09:32:53 +0000
Received: by vnbf62 with SMTP id f62so13935237vnb.13
 for <linux-mtd@lists.infradead.org>; Wed, 08 Apr 2015 02:32:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2204501.a0qztNJuDl@devpool02>
References: <2204501.a0qztNJuDl@devpool02>
Date: Wed, 8 Apr 2015 11:32:30 +0200
Message-ID: <CAFLxGvwK+S-Qk537Qd22YZx7WwY_M7=Rx+J+Ex0=-W=9rbEaSg@mail.gmail.com>
Subject: Re: [PATCH] fix build when WITHOUT_LZO is set
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Rolf Eike Beer <eb@emlix.com>
Content-Type: text/plain; charset=UTF-8
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 10, 2015 at 3:52 PM, Rolf Eike Beer <eb@emlix.com> wrote:
> From 3019806268ef1a9a483ca2bc35dcf1365415829f Mon Sep 17 00:00:00 2001
> From: Rolf Eike Beer <eb@emlix.com>
> Date: Tue, 10 Mar 2015 15:20:52 +0100
> Subject: [PATCH] fix build when WITHOUT_LZO is set
>
> Make mkfs.ubifs honor the WITHOUT_LZO flag, too.
>
> Fixes this build error:
>   mkfs.ubifs/compr.c:27:23: lzo/lzo1x.h: No such file or directory
>   mkfs.ubifs/compr.c: In function `lzo_compress':
>   mkfs.ubifs/compr.c:92: error: `lzo_uint' undeclared (first use in this function)
>   mkfs.ubifs/compr.c:92: error: (Each undeclared identifier is reported only once
>   mkfs.ubifs/compr.c:92: error: for each function it appears in.)
>   mkfs.ubifs/compr.c:92: error: syntax error before "len"
>   mkfs.ubifs/compr.c:95: error: `len' undeclared (first use in this function)
>   mkfs.ubifs/compr.c:96: warning: implicit declaration of function `lzo1x_999_compress'
>   mkfs.ubifs/compr.c:99: error: `LZO_E_OK' undeclared (first use in this function)
>   mkfs.ubifs/compr.c: In function `init_compression':
>   mkfs.ubifs/compr.c:201: error: `LZO1X_999_MEM_COMPRESS' undeclared (first use in this function)
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---
>  Makefile                |  2 +-
>  mkfs.ubifs/compr.c      | 15 +++++++++++++++
>  mkfs.ubifs/mkfs.ubifs.c | 24 ++++++++++++++++++++----
>  3 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index eade234..6209471 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -105,7 +105,7 @@ $(call _mkdep,lib/,libmtd.a)
>  obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
>         hashtable/hashtable.o hashtable/hashtable_itr.o
>  LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
> -LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
> +LDLIBS_mkfs.ubifs = -lz $(LZOLDLIBS) -lm -luuid
>  $(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
>
>  #
> diff --git a/mkfs.ubifs/compr.c b/mkfs.ubifs/compr.c
> index 34b2f60..d534f10 100644
> --- a/mkfs.ubifs/compr.c
> +++ b/mkfs.ubifs/compr.c
> @@ -24,7 +24,9 @@
>  #include <stdio.h>
>  #include <stdint.h>
>  #include <string.h>
> +#ifndef WITHOUT_LZO
>  #include <lzo/lzo1x.h>
> +#endif
>  #include <linux/types.h>
>
>  #define crc32 __zlib_crc32
> @@ -85,6 +87,7 @@ static int zlib_deflate(void *in_buf, size_t in_len, void *out_buf,
>         return 0;
>  }
>
> +#ifndef WITHOUT_LZO
>  static int lzo_compress(void *in_buf, size_t in_len, void *out_buf,
>                         size_t *out_len)
>  {
> @@ -102,6 +105,7 @@ static int lzo_compress(void *in_buf, size_t in_len, void *out_buf,
>
>         return 0;
>  }
> +#endif
>
>  static int no_compress(void *in_buf, size_t in_len, void *out_buf,
>                        size_t *out_len)
> @@ -113,6 +117,7 @@ static int no_compress(void *in_buf, size_t in_len, void *out_buf,
>
>  static char *zlib_buf;
>
> +#ifndef WITHOUT_LZO
>  static int favor_lzo_compress(void *in_buf, size_t in_len, void *out_buf,
>                                size_t *out_len, int *type)
>  {
> @@ -158,6 +163,7 @@ select_zlib:
>         memcpy(out_buf, zlib_buf, zlib_len);
>         return 0;
>  }
> +#endif
>
>  int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
>                   int type)
> @@ -169,6 +175,10 @@ int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
>                 return MKFS_UBIFS_COMPR_NONE;
>         }
>
> +#ifdef WITHOUT_LZO
> +       {
> +               switch (type) {
> +#else
>         if (c->favor_lzo)
>                 ret = favor_lzo_compress(in_buf, in_len, out_buf, out_len, &type);
>         else {
> @@ -176,6 +186,7 @@ int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
>                 case MKFS_UBIFS_COMPR_LZO:
>                         ret = lzo_compress(in_buf, in_len, out_buf, out_len);
>                         break;
> +#endif
>                 case MKFS_UBIFS_COMPR_ZLIB:
>                         ret = zlib_deflate(in_buf, in_len, out_buf, out_len);
>                         break;
> @@ -197,9 +208,13 @@ int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
>
>  int init_compression(void)
>  {
> +#ifdef WITHOUT_LZO
> +       lzo_mem = NULL;
> +#else
>         lzo_mem = malloc(LZO1X_999_MEM_COMPRESS);
>         if (!lzo_mem)
>                 return -1;
> +#endif
>
>         zlib_buf = malloc(UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR);
>         if (!zlib_buf) {
> diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
> index ca17e2b..24d4f04 100644
> --- a/mkfs.ubifs/mkfs.ubifs.c
> +++ b/mkfs.ubifs/mkfs.ubifs.c
> @@ -483,7 +483,11 @@ static int get_options(int argc, char**argv)
>         c->orph_lebs = 1;
>         c->key_hash = key_r5_hash;
>         c->key_len = UBIFS_SK_LEN;
> +#ifdef WITHOUT_LZO
> +       c->default_compr = UBIFS_COMPR_ZLIB;
> +#else
>         c->default_compr = UBIFS_COMPR_LZO;
> +#endif
>         c->favor_percent = 20;
>         c->lsave_cnt = 256;
>         c->leb_size = -1;
> @@ -594,21 +598,29 @@ static int get_options(int argc, char**argv)
>                                 return err_msg("bad key hash");
>                         break;
>                 case 'x':
> -                       if (strcmp(optarg, "favor_lzo") == 0)
> -                               c->favor_lzo = 1;
> +                       if (strcmp(optarg, "none") == 0)
> +                               c->default_compr = UBIFS_COMPR_NONE;
>                         else if (strcmp(optarg, "zlib") == 0)
>                                 c->default_compr = UBIFS_COMPR_ZLIB;
> -                       else if (strcmp(optarg, "none") == 0)
> -                               c->default_compr = UBIFS_COMPR_NONE;
> +#ifndef WITHOUT_LZO
> +                       else if (strcmp(optarg, "favor_lzo") == 0)
> +                               c->favor_lzo = 1;
>                         else if (strcmp(optarg, "lzo") != 0)
> +#else
> +                       else
> +#endif
>                                 return err_msg("bad compressor name");
>                         break;
>                 case 'X':
> +#ifdef WITHOT_LZO
> +                       return err_msg("built without LZO support");
> +#else
>                         c->favor_percent = strtol(optarg, &endp, 0);
>                         if (*endp != '\0' || endp == optarg ||
>                             c->favor_percent <= 0 || c->favor_percent >= 100)
>                                 return err_msg("bad favor LZO percent '%s'",
>                                                optarg);
> +#endif
>                         break;
>                 case 'j':
>                         c->max_bud_bytes = get_bytes(optarg);
> @@ -1276,7 +1288,11 @@ static int add_file(const char *path_name, struct stat *st, ino_t inum,
>                 out_len = NODE_BUFFER_SIZE - UBIFS_DATA_NODE_SZ;
>                 if (c->default_compr == UBIFS_COMPR_NONE &&
>                     (flags & FS_COMPR_FL))
> +#ifdef WITHOUT_LZO
> +                       use_compr = UBIFS_COMPR_ZLIB;
> +#else
>                         use_compr = UBIFS_COMPR_LZO;
> +#endif
>                 else
>                         use_compr = c->default_compr;
>                 compr_type = compress_data(buf, bytes_read, &dn->data,

Patches makes sense to me.

Maybe it would make sense to move LZO related stuff out of compr.c
to reduce the amount of ifdefs.

Artem, Brian, what do you think?

-- 
Thanks,
//richard
