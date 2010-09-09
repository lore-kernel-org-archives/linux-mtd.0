Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtgIU-0000m7-32
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 12:32:12 +0000
Received: by iwn10 with SMTP id 10so1130037iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Sep 2010 05:32:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <C7A5B00EFC707A46AB67997D0215216786812A@mx1.grid-net.com>
References: <1283933928-14601-1-git-send-email-dedekind1@gmail.com>
	<C7A5B00EFC707A46AB67997D0215216786812A@mx1.grid-net.com>
Date: Thu, 9 Sep 2010 14:32:09 +0200
Message-ID: <AANLkTimOCyLXdHM0sJ-ObVgS3S9PFtYomorJhWpE+gB-@mail.gmail.com>
Subject: Re: [PATCHv2] mkfs.ubifs: do not override root inode permissions
From: Arno Steffen <arno.steffen@googlemail.com>
To: Steve Iribarne <siribarne@grid-net.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does someone of you is expert enough to patch mkfs.jffs2?

2010/9/8 Steve Iribarne <siribarne@grid-net.com>:
>
> Sorry for the top post... stupid M$oft outlook.
>
> Anyway.. .just a quick thanks for v2 of this from someone who uses this i=
n
> production.
> I can eventually migrate to the proper option but it's going to take me t=
wo
> releases to do it.
>
> -stv
>
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org on behalf of Artem Bityutskiy
> Sent: Wed 9/8/2010 1:18 AM
> To: linux-mtd@lists.infradead.org
> Cc: Arno Steffen; Adrian Hunter
> Subject: [PATCHv2] mkfs.ubifs: do not override root inode permissions
>
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>
> When mkfs.ubifs is used with -r dir, it does not make the root UBIFS
> inode uid/gid/permissions to be equivalent to dir's permissions, but
> it makes root inode permissions to be equivalent to uid =3D git =3D 0
> (root) and permissions =3D u+rwx go+rx.
>
> Unfortunately, we cannot simply fix this bug, because mkfs.ubifs is
> already used in production. Thus, we have introduce --squash-rino-perm
> option which is the default and it preserves the old mkfs.ubifs
> behavior. We also introduce --nosquash-rino-perm option which fixes
> mkfs.ubifs behavior. If none of these options is used, we print a
> warning. The plan is to make everyone use one of these options, then
> make --nosquash-rino-perm to be the default and remove the warning,
> and then eventually deprecate and remove both options.
>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
> =A0mkfs.ubifs/mkfs.ubifs.c |=A0=A0 87
> ++++++++++++++++++++++++++++++++++------------
> =A01 files changed, 64 insertions(+), 23 deletions(-)
>
> diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
> index 9f2a226..eeb5e42 100644
> --- a/mkfs.ubifs/mkfs.ubifs.c
> +++ b/mkfs.ubifs/mkfs.ubifs.c
> @@ -23,7 +23,7 @@
> =A0#include "mkfs.ubifs.h"
> =A0#include <crc32.h>
>
> -#define PROGRAM_VERSION "1.3"
> +#define PROGRAM_VERSION "1.4"
>
> =A0/* Size (prime number) of hash table for link counting */
> =A0#define HASH_TABLE_SIZE 10099
> @@ -109,6 +109,7 @@ static char *output;
> =A0static int out_fd;
> =A0static int out_ubi;
> =A0static int squash_owner;
> +static int squash_rino_perm =3D -1;
>
> =A0/* The 'head' (position) which nodes are written */
> =A0static int head_lnum;
> @@ -134,25 +135,27 @@ static unsigned long long creat_sqnum;
> =A0static const char *optstring =3D "d:r:m:o:D:h?vVe:c:g:f:P:k:x:X:j:R:l:=
j:U";
>
> =A0static const struct option longopts[] =3D {
> -=A0=A0=A0=A0=A0=A0 {"root",=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NULL, 'r'},
> -=A0=A0=A0=A0=A0=A0 {"min-io-size",=A0=A0 1, NULL, 'm'},
> -=A0=A0=A0=A0=A0=A0 {"leb-size",=A0=A0=A0=A0=A0 1, NULL, 'e'},
> -=A0=A0=A0=A0=A0=A0 {"max-leb-cnt",=A0=A0 1, NULL, 'c'},
> -=A0=A0=A0=A0=A0=A0 {"output",=A0=A0=A0=A0=A0=A0=A0 1, NULL, 'o'},
> -=A0=A0=A0=A0=A0=A0 {"devtable",=A0=A0=A0=A0=A0 1, NULL, 'D'},
> -=A0=A0=A0=A0=A0=A0 {"help",=A0=A0=A0=A0=A0=A0=A0=A0=A0 0, NULL, 'h'},
> -=A0=A0=A0=A0=A0=A0 {"verbose",=A0=A0=A0=A0=A0=A0 0, NULL, 'v'},
> -=A0=A0=A0=A0=A0=A0 {"version",=A0=A0=A0=A0=A0=A0 0, NULL, 'V'},
> -=A0=A0=A0=A0=A0=A0 {"debug-level",=A0=A0 1, NULL, 'g'},
> -=A0=A0=A0=A0=A0=A0 {"jrn-size",=A0=A0=A0=A0=A0 1, NULL, 'j'},
> -=A0=A0=A0=A0=A0=A0 {"reserved",=A0=A0=A0=A0=A0 1, NULL, 'R'},
> -=A0=A0=A0=A0=A0=A0 {"compr",=A0=A0=A0=A0=A0=A0=A0=A0 1, NULL, 'x'},
> -=A0=A0=A0=A0=A0=A0 {"favor-percent", 1, NULL, 'X'},
> -=A0=A0=A0=A0=A0=A0 {"fanout",=A0=A0=A0=A0=A0=A0=A0 1, NULL, 'f'},
> -=A0=A0=A0=A0=A0=A0 {"keyhash",=A0=A0=A0=A0=A0=A0 1, NULL, 'k'},
> -=A0=A0=A0=A0=A0=A0 {"log-lebs",=A0=A0=A0=A0=A0 1, NULL, 'l'},
> -=A0=A0=A0=A0=A0=A0 {"orph-lebs",=A0=A0=A0=A0 1, NULL, 'p'},
> -=A0=A0=A0=A0=A0=A0 {"squash-uids" ,=A0 0, NULL, 'U'},
> +=A0=A0=A0=A0=A0=A0 {"root",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1,=
 NULL, 'r'},
> +=A0=A0=A0=A0=A0=A0 {"min-io-size",=A0=A0=A0=A0=A0=A0=A0 1, NULL, 'm'},
> +=A0=A0=A0=A0=A0=A0 {"leb-size",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NULL, '=
e'},
> +=A0=A0=A0=A0=A0=A0 {"max-leb-cnt",=A0=A0=A0=A0=A0=A0=A0 1, NULL, 'c'},
> +=A0=A0=A0=A0=A0=A0 {"output",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NUL=
L, 'o'},
> +=A0=A0=A0=A0=A0=A0 {"devtable",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NULL, '=
D'},
> +=A0=A0=A0=A0=A0=A0 {"help",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0,=
 NULL, 'h'},
> +=A0=A0=A0=A0=A0=A0 {"verbose",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0, NULL,=
 'v'},
> +=A0=A0=A0=A0=A0=A0 {"version",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0, NULL,=
 'V'},
> +=A0=A0=A0=A0=A0=A0 {"debug-level",=A0=A0=A0=A0=A0=A0=A0 1, NULL, 'g'},
> +=A0=A0=A0=A0=A0=A0 {"jrn-size",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NULL, '=
j'},
> +=A0=A0=A0=A0=A0=A0 {"reserved",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NULL, '=
R'},
> +=A0=A0=A0=A0=A0=A0 {"compr",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, N=
ULL, 'x'},
> +=A0=A0=A0=A0=A0=A0 {"favor-percent",=A0=A0=A0=A0=A0 1, NULL, 'X'},
> +=A0=A0=A0=A0=A0=A0 {"fanout",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NUL=
L, 'f'},
> +=A0=A0=A0=A0=A0=A0 {"keyhash",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NULL,=
 'k'},
> +=A0=A0=A0=A0=A0=A0 {"log-lebs",=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NULL, '=
l'},
> +=A0=A0=A0=A0=A0=A0 {"orph-lebs",=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, NULL, 'p'=
},
> +=A0=A0=A0=A0=A0=A0 {"squash-uids" ,=A0=A0=A0=A0=A0=A0 0, NULL, 'U'},
> +=A0=A0=A0=A0=A0=A0 {"squash-rino-perm",=A0=A0 0, NULL, 'Q'},
> +=A0=A0=A0=A0=A0=A0 {"nosquash-rino-perm", 0, NULL, 'q'},
> =A0=A0=A0=A0=A0=A0=A0 {NULL, 0, NULL, 0}
> =A0};
>
> @@ -190,6 +193,12 @@ static const char *helptext =3D
> =A0"-V, --version=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 display version inform=
ation\n"
> =A0"-g, --debug=3DLEVEL=A0=A0=A0=A0=A0=A0=A0 display debug information (0=
 - none, 1 -
> statistics,\n"
> =A0"=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 2 - files, 3 - more details)\n"
> +"-Q, --squash-rino-perm=A0=A0 ignore permissions of the FS image directo=
ry (the
> one\n"
> +"=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 specified with --root) and make the UBIFS root
> inode\n"
> +"=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0 permiss=
ions to be {uid=3Dgid=3Droot, u+rwx,go+rx};
> this is\n"
> +"=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 see also the default so far, see explanations
> below\n"
> +"-q, --nosquash-rino-perm for the UBIFS root inode use permissions of th=
e
> FS\n"
> +"=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 image directory (the one specified with
> --root)\n"
> =A0"-h, --help=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 display this hel=
p text\n\n"
> =A0"Note, SIZE is specified in bytes, but it may also be specified in
> Kilobytes,\n"
> =A0"Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
> @@ -201,7 +210,19 @@ static const char *helptext =3D
> =A0"or more percent better than \"lzo\", mkfs.ubifs chooses \"lzo\", othe=
rwise
> it chooses\n"
> =A0"\"zlib\". The \"--favor-percent\" may specify arbitrary threshold ins=
tead
> of the\n"
> =A0"default 20%.\n\n"
> -"The -R parameter specifies amount of bytes reserved for the
> super-user.\n";
> +"The -R parameter specifies amount of bytes reserved for the
> super-user.\n\n"
> +"Some clarifications about --squash-rino-perm and --nosquash-rino-perm
> options.\n"
> +"Originally, mkfs.ubifs did not have them, and it always set permissions
> for the UBIFS\n"
> +"root inode to be {uid=3Dgid=3Droot, u+rwx,go+rx}. This was a bug which =
was
> found too\n"
> +"late, when mkfs.ubifs had already been used in production. To fix this
> bug, 2 new\n"
> +"options were introduced: --squash-rino-perm which preserves the old
> behavior and\n"
> +"--nosquash-rino-perm which makes mkfs.ubifs use the right permissions f=
or
> the root\n"
> +"inode. For now --squash-rino-perm is the default, and if neither
> --squash-rino-perm\n"
> +"nor --nosquash-rino-perm are used, mkfs.ubifs prints a warning. The
> further plan is:\n"
> +" o keep the warning for few releases to make sure users start using one=
 of
> the\n"
> +"=A0=A0 options\n"
> +" o make --nosquash-rino-perm to be the default, and remove the warning\=
n"
> +" o eventually deprecate both options\n";
>
> =A0/**
> =A0 * make_path - make a path name from a directory and a name.
> @@ -643,6 +664,12 @@ static int get_options(int argc, char**argv)
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 case 'U':
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 squash_=
owner =3D 1;
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 break;
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 case 'Q':
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 squash_ri=
no_perm =3D 1;
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 break;
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 case 'q':
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 squash_ri=
no_perm =3D 0;
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 break;
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 }
> =A0=A0=A0=A0=A0=A0=A0 }
>
> @@ -671,6 +698,10 @@ static int get_options(int argc, char**argv)
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 return err_msg("Maximum count=
 of LEBs was not specified "
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=
=A0=A0=A0=A0 "(use -h for help)");
>
> +=A0=A0=A0=A0=A0=A0 if (squash_rino_perm !=3D -1 && root)
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 return err_msg("--squash-rino-p=
erm and nosquash-rino-perm
> options"
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=
=A0=A0=A0 "can be used only with the --root option");
> +
> =A0=A0=A0=A0=A0=A0=A0 if (c->max_bud_bytes =3D=3D -1) {
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 int lebs;
>
> @@ -1630,18 +1661,28 @@ static int add_multi_linked_files(void)
> =A0static int write_data(void)
> =A0{
> =A0=A0=A0=A0=A0=A0=A0 int err;
> +=A0=A0=A0=A0=A0=A0 mode_t mode =3D S_IFDIR | S_IRWXU | S_IRGRP | S_IXGRP=
 | S_IROTH |
> S_IXOTH;
>
> =A0=A0=A0=A0=A0=A0=A0 if (root) {
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 err =3D stat(root, &root_st);
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 if (err)
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 return =
sys_err_msg("bad root file-system directory
> '%s'",
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=
=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0 root);
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 if (squash_rino_perm =3D=3D -1)=
 {
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 printf("W=
ARNING: setting root UBIFS inode UID=3DGID=3D0
> (root) and permissions "
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=
=A0=A0=A0=A0=A0 "to u+rwx,go+rx; use --squash-rino-perm or
> --nosquash-rino-perm "
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=
=A0=A0=A0=A0=A0 "to suppress this warning");
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 squash_ri=
no_perm =3D 1;
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 }
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 if (squash_rino_perm) {
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 root_st.s=
t_uid =3D root_st.st_gid =3D 0;
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 root_st.s=
t_mode =3D mode;
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 }
> =A0=A0=A0=A0=A0=A0=A0 } else {
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 root_st.st_mtime =3D time(NUL=
L);
> =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 root_st.st_atime =3D root_st.=
st_ctime =3D root_st.st_mtime;
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 root_st.st_mode =3D mode;
> =A0=A0=A0=A0=A0=A0=A0 }
> -=A0=A0=A0=A0=A0=A0 root_st.st_uid =3D root_st.st_gid =3D 0;
> -=A0=A0=A0=A0=A0=A0 root_st.st_mode =3D S_IFDIR | S_IRWXU | S_IRGRP | S_I=
XGRP | S_IROTH |
> S_IXOTH;
>
> =A0=A0=A0=A0=A0=A0=A0 head_flags =3D 0;
> =A0=A0=A0=A0=A0=A0=A0 err =3D add_directory(root, UBIFS_ROOT_INO, &root_s=
t, !root);
> --
> 1.7.1.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
