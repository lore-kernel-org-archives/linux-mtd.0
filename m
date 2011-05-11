Received: from na3sys009aog108.obsmtp.com ([74.125.149.199])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKFjI-00040B-I4
	for linux-mtd@lists.infradead.org; Wed, 11 May 2011 20:09:58 +0000
Received: by mail-vw0-f41.google.com with SMTP id 4so689351vws.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 May 2011 13:09:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTik_AAvVwZrRHPP7sWbsxgAJz1e3sQ@mail.gmail.com>
References: <BANLkTik_AAvVwZrRHPP7sWbsxgAJz1e3sQ@mail.gmail.com>
Date: Wed, 11 May 2011 16:09:53 -0400
Message-ID: <BANLkTikUaM4-3M+iAFewFNwWMC_nNSXVMg@mail.gmail.com>
Subject: Re: [PATCH v2] mkfs.ubifs: add "-F" option for "free-space fixup"
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthew,

I keep meaning to get around to testing the free-space fixup patches
as promised. Sorry.

For now all I can offer is some superficial criticisms of this patch.
Sorry again.

I think your mail client wrapped the patch. When I try to 'git am' it
onto "e15b521 fs-tests: integck: print error number in pcv messages" I
get

Applying: mkfs.ubifs: add "-F" option for "free-space fixup"
fatal: corrupt patch at line 30
Patch failed at 0001 mkfs.ubifs: add "-F" option for "free-space fixup"
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".

On Wed, May 4, 2011 at 6:14 PM, Matthew L. Creech <mlcreech@gmail.com> wrot=
e:
> This adds a superblock flag indicating that "free-space fixup" is needed,=
 and
> allows it to be set by the user via the "-F" command-line option. =A0The =
first
> time the filesystem is mounted, this flag will trigger a one-time re-mapp=
ing of
> all LEBs containing free space. =A0This fixes problems seen on some NAND =
flashes
> when a non-UBIFS-aware flash programmer is used.
>
>
> Changes since v1: renamed "LEB fixup" to "free space fixup"

Put stuff like 'changes since' below a tearline ('---') so it doesn't
make it into the commit message

> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
> ---
> =A0mkfs.ubifs/mkfs.ubifs.c =A0| =A0 11 ++++++++++-
> =A0mkfs.ubifs/ubifs-media.h | =A0 =A02 ++
> =A0mkfs.ubifs/ubifs.h =A0 =A0 =A0 | =A0 =A02 ++
> =A03 files changed, 14 insertions(+), 1 deletions(-)
>
> diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
> index a306dd6..96e17a3 100644
> --- a/mkfs.ubifs/mkfs.ubifs.c
> +++ b/mkfs.ubifs/mkfs.ubifs.c
> @@ -132,7 +132,7 @@ static struct inum_mapping **hash_table;
> =A0/* Inode creation sequence number */
> =A0static unsigned long long creat_sqnum;
>
> -static const char *optstring =3D "d:r:m:o:D:h?vVe:c:g:f:p:k:x:X:j:R:l:j:=
UQq";
> +static const char *optstring =3D "d:r:m:o:D:h?vVe:c:g:f:Fp:k:x:X:j:R:l:j=
:UQq";
>
> =A0static const struct option longopts[] =3D {
> =A0 =A0 =A0 =A0{"root", =A0 =A0 =A0 =A0 =A0 =A0 =A0 1, NULL, 'r'},
> @@ -150,6 +150,7 @@ static const struct option longopts[] =3D {
> =A0 =A0 =A0 =A0{"compr", =A0 =A0 =A0 =A0 =A0 =A0 =A01, NULL, 'x'},
> =A0 =A0 =A0 =A0{"favor-percent", =A0 =A0 =A01, NULL, 'X'},
> =A0 =A0 =A0 =A0{"fanout", =A0 =A0 =A0 =A0 =A0 =A0 1, NULL, 'f'},
> + =A0 =A0 =A0 {"space-fixup", =A0 =A0 =A0 =A00, NULL, 'F'},
> =A0 =A0 =A0 =A0{"keyhash", =A0 =A0 =A0 =A0 =A0 =A01, NULL, 'k'},
> =A0 =A0 =A0 =A0{"log-lebs", =A0 =A0 =A0 =A0 =A0 1, NULL, 'l'},
> =A0 =A0 =A0 =A0{"orph-lebs", =A0 =A0 =A0 =A0 =A01, NULL, 'p'},
> @@ -183,6 +184,7 @@ static const char *helptext =3D
> =A0" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 how many percent bet=
ter zlib should
> compress to make\n"

here

> =A0" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mkfs.ubifs use zlib =
instead of LZO (default 20%)\n"
> =A0"-f, --fanout=3DNUM =A0 =A0 =A0 =A0 fanout NUM (default: 8)\n"
> +"-F, --space-fixup =A0 =A0 =A0 =A0fixup free space on first mount (neede=
d for
> some NANDs)\n"

here

> =A0"-k, --keyhash=3DTYPE =A0 =A0 =A0 key hash type - \"r5\" or \"test\"
> (default: \"r5\")\n"

and here

are detrimental wraps

> =A0"-p, --orph-lebs=3DCOUNT =A0 =A0count of erase blocks for orphans (def=
ault: 1)\n"
> =A0"-D, --devtable=3DFILE =A0 =A0 =A0use device table FILE\n"
> @@ -537,6 +539,7 @@ static int get_options(int argc, char**argv)
> =A0 =A0 =A0 =A0c->max_leb_cnt =3D -1;
> =A0 =A0 =A0 =A0c->max_bud_bytes =3D -1;
> =A0 =A0 =A0 =A0c->log_lebs =3D -1;
> + =A0 =A0 =A0 c->space_fixup =3D 0;
>
> =A0 =A0 =A0 =A0while (1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0opt =3D getopt_long(argc, argv, optstring,=
 longopts, &i);
> @@ -610,6 +613,9 @@ static int get_options(int argc, char**argv)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (*endp !=3D '\0' || end=
p =3D=3D optarg || c->fanout <=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return err=
_msg("bad fanout %s", optarg);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 'F':
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c->space_fixup =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 'l':
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c->log_lebs =3D strtol(opt=
arg, &endp, 0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (*endp !=3D '\0' || end=
p =3D=3D optarg || c->log_lebs <=3D 0)
> @@ -758,6 +764,7 @@ static int get_options(int argc, char**argv)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0"r5" : "test");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf("\tfanout: =A0 =A0 =A0 %d\n", c->fa=
nout);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf("\torph_lebs: =A0 =A0%d\n", c->orph=
_lebs);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf("\tspace_fixup: =A0%d\n", c->space_f=
ixup);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (validate_options())
> @@ -1997,6 +2004,8 @@ static int write_super(void)
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0if (c->big_lpt)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sup.flags |=3D cpu_to_le32(UBIFS_FLG_BIGLP=
T);
> + =A0 =A0 =A0 if (c->space_fixup)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sup.flags |=3D cpu_to_le32(UBIFS_FLG_SPACE_=
FIXUP);
>
> =A0 =A0 =A0 =A0return write_node(&sup, UBIFS_SB_NODE_SZ, UBIFS_SB_LNUM, U=
BI_LONGTERM);
> =A0}
> diff --git a/mkfs.ubifs/ubifs-media.h b/mkfs.ubifs/ubifs-media.h
> index a9ecbd9..fe62d0e 100644
> --- a/mkfs.ubifs/ubifs-media.h
> +++ b/mkfs.ubifs/ubifs-media.h
> @@ -373,9 +373,11 @@ enum {
> =A0* Superblock flags.
> =A0*
> =A0* UBIFS_FLG_BIGLPT: if "big" LPT model is used if set
> + * UBIFS_FLG_SPACE_FIXUP: first-mount "fixup" of free space within LEBs =
needed
> =A0*/
> =A0enum {
> =A0 =A0 =A0 =A0UBIFS_FLG_BIGLPT =3D 0x02,
> + =A0 =A0 =A0 UBIFS_FLG_SPACE_FIXUP =3D 0x04,
> =A0};
>
> =A0/**
> diff --git a/mkfs.ubifs/ubifs.h b/mkfs.ubifs/ubifs.h
> index 5c29046..f94a52c 100644
> --- a/mkfs.ubifs/ubifs.h
> +++ b/mkfs.ubifs/ubifs.h
> @@ -317,6 +317,7 @@ struct ubifs_znode
> =A0* @nhead_lnum: LEB number of LPT head
> =A0* @nhead_offs: offset of LPT head
> =A0* @big_lpt: flag that LPT is too big to write whole during commit
> + * @space_fixup: flag indicating that free space in LEBs needs to be cle=
aned up
> =A0* @lpt_sz: LPT size
> =A0*
> =A0* @ltab_lnum: LEB number of LPT's own lprops table
> @@ -394,6 +395,7 @@ struct ubifs_info
> =A0 =A0 =A0 =A0int nhead_lnum;
> =A0 =A0 =A0 =A0int nhead_offs;
> =A0 =A0 =A0 =A0int big_lpt;
> + =A0 =A0 =A0 int space_fixup;
> =A0 =A0 =A0 =A0long long lpt_sz;
>
> =A0 =A0 =A0 =A0int ltab_lnum;
> --
> 1.6.3.3
>
>
> --
> Matthew L. Creech
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

I am planning to do actual testing of this flag on the da850 at the
end of next week.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
