Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av44P-0005Zh-9z
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 14:34:34 +0000
Received: by mail-wm0-x236.google.com with SMTP id v188so132599689wme.1
 for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2016 07:34:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1461622409-14970-4-git-send-email-richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-4-git-send-email-richard@nod.at>
Date: Tue, 26 Apr 2016 11:34:07 -0300
Message-ID: <CAAEAJfCP1Lsxe+9r1vp-iaZsJhjfa+uZi+=kPpocSpc-zaA_cg@mail.gmail.com>
Subject: Re: [PATCH 3/8] mtd-utils: Add flash torture test utility
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 April 2016 at 19:13, Richard Weinberger <richard@nod.at> wrote:
> From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>
> Basically a user space port of the mtd torture test kernel module. In
> addition to the block offset and count module parameters, the utility
> supports a block stride and can restore the block contents after test.
>
> In contrast to the kernel module, the torture test is implemented by
> the libmtd mtd_toruture function and thus doesn't allow for similarly
> fine grained options on diagnostics.
>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  .gitignore                 |   1 +
>  Makefile                   |   2 +-
>  misc-utils/flash_torture.c | 240 +++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 242 insertions(+), 1 deletion(-)
>  create mode 100644 misc-utils/flash_torture.c
>
> diff --git a/.gitignore b/.gitignore
> index 2aac52c..5b529d1 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -35,6 +35,7 @@
>  /jffsX-utils/mkfs.jffs2
>  /misc-utils/mtd_debug
>  /misc-utils/mtdpart
> +/misc-utils/flash_torture
>  /nand-utils/nanddump
>  /nand-utils/nandtest
>  /nand-utils/nandwrite
> diff --git a/Makefile b/Makefile
> index 977c9c5..af3d1fd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -20,7 +20,7 @@ MISC_BINS =3D \
>         ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
>         serve_image recv_image mtdpart flash_erase flash_lock \
>         flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
> -       flash_otp_write flashcp
> +       flash_otp_write flashcp flash_torture
>  UBI_BINS =3D \
>         ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
>         ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
> diff --git a/misc-utils/flash_torture.c b/misc-utils/flash_torture.c
> new file mode 100644
> index 0000000..b5625c8
> --- /dev/null
> +++ b/misc-utils/flash_torture.c
> @@ -0,0 +1,240 @@
> +/*
> + * Copyright (C) 2006-2008 Artem Bityutskiy
> + * Copyright (C) 2006-2008 Jarkko Lavinen
> + * Copyright (C) 2006-2008 Adrian Hunter
> + * Copyright (C) 2015 sigma star gmbh
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms of the GNU General Public License version 2 as publis=
hed by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License =
for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program; see the file COPYING. If not, write to the Free Softwar=
e
> + * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
> + *
> + *
> + * WARNING: this test program may kill your flash and your device. Do no=
t
> + * use it unless you know what you do. Authors are not responsible for a=
ny
> + * damage caused by this program.
> + *
> + * Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> + *
> + * Based on linux torturetest.c
> + * Authors: Artem Bityutskiy, Jarkko Lavinen, Adria Hunter
> + */
> +
> +#define PROGRAM_NAME "flash_torture"
> +
> +#define KEEP_CONTENTS 0x01
> +#define RUN_FOREVER 0x02
> +
> +#include <mtd/mtd-user.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <libmtd.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <fcntl.h>
> +
> +#include "common.h"
> +
> +static int peb=3D-1, blocks=3D-1, skip=3D-1;
> +static struct mtd_dev_info mtd;
> +static sig_atomic_t flags=3D0;
> +static const char *mtddev;
> +static libmtd_t mtd_desc;
> +static int mtdfd;
> +
> +static void sighandler(int sig)
> +{
> +       if (sig =3D=3D SIGINT || sig =3D=3D SIGTERM || sig =3D=3D SIGHUP)
> +               flags &=3D ~RUN_FOREVER;
> +}
> +
> +static void usage(int status)
> +{
> +       fputs(
> +       "Usage: "PROGRAM_NAME" [OPTIONS] <device>\n\n"
> +       "Options:\n"
> +       "  -h, --help         Display this help output\n"
> +       "  -b, --peb <num>    Start from this physical erase block\n"
> +       "  -c, --blocks <num> Number of erase blocks to torture\n"
> +       "  -s, --skip <num>   Number of erase blocks to skip\n"
> +       "  -k, --keep         Try to restore existing contents after test=
\n"
> +       "  -r, --repeate      Repeate the torture test indefinitely\n",
> +       status=3D=3DEXIT_SUCCESS ? stdout : stderr);
> +       exit(status);
> +}
> +
> +static long read_num(int idx, int argidx, int argc, char **argv)
> +{
> +       char *end;
> +       long num;
> +
> +       if (argidx >=3D argc) {
> +               fprintf(stderr, "%s: missing argument\n", argv[idx]);
> +               exit(EXIT_FAILURE);
> +       }
> +
> +       num =3D strtol(argv[argidx], &end, 0);
> +
> +       if (!end || *end!=3D'\0') {
> +               fprintf(stderr, "%s: expected integer argument\n", argv[i=
dx]);
> +               exit(EXIT_FAILURE);
> +       }
> +       return num;
> +}
> +
> +static void process_options(int argc, char **argv)
> +{
> +       int i;
> +
> +       for (i=3D1; i<argc; ++i) {
> +               if (!strcmp(argv[i], "--help") || !strcmp(argv[i], "-h"))=
 {
> +                       usage(EXIT_SUCCESS);
> +               } else if (!strcmp(argv[i], "--peb") || !strcmp(argv[i], =
"-b")) {
> +                       if (peb >=3D 0)
> +                               goto failmulti;
> +                       peb =3D read_num(i, i+1, argc, argv);
> +                       if (peb < 0)
> +                               goto failarg;
> +                       ++i;
> +               } else if (!strcmp(argv[i], "--blocks") || !strcmp(argv[i=
], "-c")) {
> +                       if (blocks > 0)
> +                               goto failmulti;
> +                       blocks =3D read_num(i, i+1, argc, argv);
> +                       if (blocks <=3D 0)
> +                               goto failarg;
> +                       ++i;
> +               } else if (!strcmp(argv[i], "--skip") || !strcmp(argv[i],=
 "-s")) {
> +                       if (skip >=3D 0)
> +                               goto failmulti;
> +                       skip =3D read_num(i, i+1, argc, argv);
> +                       if (skip < 0)
> +                               goto failarg;
> +                       ++i;
> +               } else if (!strcmp(argv[i], "--keep") || !strcmp(argv[i],=
 "-k")) {
> +                       if (flags & KEEP_CONTENTS)
> +                               goto failmulti;
> +                       flags |=3D KEEP_CONTENTS;
> +               } else if (!strcmp(argv[i], "--repeate") || !strcmp(argv[=
i], "-r")) {
> +                       if (flags & RUN_FOREVER)
> +                               goto failmulti;
> +                       flags |=3D RUN_FOREVER;
> +               } else {
> +                       if (mtddev)
> +                               usage(EXIT_FAILURE);
> +                       mtddev =3D argv[i];
> +               }
> +       }
> +
> +       if (!mtddev)
> +               errmsg_die("No device specified!\n");
> +       if (peb < 0)
> +               peb =3D 0;
> +       if (skip < 0)
> +               skip =3D 0;
> +       if (blocks < 0)
> +               blocks =3D 1;
> +       return;
> +failmulti:
> +       fprintf(stderr, "'%s' specified more than once!\n", argv[i]);
> +       exit(EXIT_FAILURE);
> +failarg:
> +       fprintf(stderr, "Invalid argument for '%s'!\n", argv[i]);
> +       exit(EXIT_FAILURE);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +       int i, eb, err, count =3D 0;
> +       char* is_bad =3D NULL;
> +       void *old=3DNULL;
> +
> +       process_options(argc, argv);
> +
> +       mtd_desc =3D libmtd_open();
> +       if (!mtd_desc)
> +               return errmsg("can't initialize libmtd");
> +
> +       if (mtd_get_dev_info(mtd_desc, mtddev, &mtd) < 0)
> +               return errmsg("mtd_get_dev_info failed");
> +
> +       if (peb >=3D mtd.eb_cnt)
> +               return errmsg("Physical erase block %d is out of range!\n=
", peb);
> +
> +       if ((peb + (blocks - 1)*(skip + 1)) >=3D mtd.eb_cnt) {
> +               return errmsg("Given block range exceeds block count of %=
d!\n",
> +                               mtd.eb_cnt);
> +       }
> +
> +       signal(SIGINT, sighandler);
> +       signal(SIGTERM, sighandler);
> +       signal(SIGHUP, sighandler);
> +
> +       if (flags & KEEP_CONTENTS) {
> +               old =3D xmalloc(mtd.eb_size);
> +       }
> +
> +       is_bad =3D xmalloc(blocks);
> +
> +       if ((mtdfd =3D open(mtddev, O_RDWR)) =3D=3D -1) {
> +               perror(mtddev);
> +               free(is_bad);
> +               free(old);
> +               return EXIT_FAILURE;
> +       }
> +
> +       for (i =3D 0; i < blocks; ++i) {
> +               eb =3D peb + i * (skip + 1);
> +               is_bad[i] =3D mtd_is_bad(&mtd, mtdfd, eb);
> +               if (is_bad[i]) {
> +                       fprintf(stderr, "PEB %d marked bad, will be skipp=
ed\n", eb);
> +               }
> +       }
> +
> +       do {
> +               for (i =3D 0; i < blocks; ++i) {
> +                       if (is_bad[i])
> +                               continue;
> +
> +                       eb =3D peb + i * (skip + 1);
> +
> +                       if (flags & KEEP_CONTENTS) {
> +                               err =3D mtd_read(&mtd, mtdfd, eb, 0, old,=
 mtd.eb_size);
> +                               if (err) {
> +                                       fprintf(stderr, "Failed to create=
 backup copy "
> +                                                       "of PEB %d, skipp=
ing!\n", eb);
> +                                       continue;
> +                               }
> +                       }
> +
> +                       if (mtd_torture(mtd_desc, &mtd, mtdfd, eb))
> +                               fprintf(stderr, "Block %d failed torture =
test!\n", eb);
> +

mtd_torture seems to print its own message when the torture fails:

normsg("PEB %d passed torture test, do not mark it a bad", eb);

Isn't confusing to print "do not mark it a bad" (sic) in the torture test?
I mean: this would imply that the test would mark as bad if the torture fai=
ls?

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
