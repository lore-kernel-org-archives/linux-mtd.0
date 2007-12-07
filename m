Received: from wr-out-0506.google.com ([64.233.184.226])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J0csB-000877-C0
	for linux-mtd@lists.infradead.org; Fri, 07 Dec 2007 13:04:14 +0000
Received: by wr-out-0506.google.com with SMTP id c8so670836wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Dec 2007 05:04:04 -0800 (PST)
Date: Fri, 7 Dec 2007 07:03:54 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH][MTD-UTILS] Set mkfs.jffs2 page size runtime instead of
	fixed.
Message-ID: <20071207070354.02e020b2@weaponx>
In-Reply-To: <Pine.LNX.4.64.0712061232550.28640@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0712061232550.28640@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 6 Dec 2007 12:43:47 +0100 (CET)
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

>=20
> This patch reads the default PAGE_SIZE from sysconf(), i.e. the system
> mkfs.jffs2 is running on, instead of just setting it to 4096 (which of=20
> course is valid for most systems but not all).

This makes sense overall.  I'd like to do it a slightly different way
though.

> This is useful if mkfs.jffs2 is running on the target system, e.g. to=20
> create a backup image during firmware upgrade, so that the page size does=
=20
> not have to be set explicitly using a command line parameter.
>=20
> The --pagesize option is supported just as before.
>=20
> Patch is included both as an attachment for patching and inline for=20
> review. (Patch made against git head).
>=20
> Signed-off-by Ricard Wanderl=C3=B6f <ricardw@axis.com> .
>=20
> Index: mkfs.jffs2.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /usr/local/cvs/linux/apps/utils/mtdutils/mkfs.jffs2.c,v
> retrieving revision 1.2
> retrieving revision 1.3
> diff -u -r1.2 -r1.3
> --- mkfs.jffs2.c	17 Oct 2006 11:40:40 -0000	1.2
> +++ mkfs.jffs2.c	6 Dec 2007 07:46:47 -0000	1.3
> @@ -672,9 +672,9 @@
>   	0xff, 0xff, 0xff, 0xff, 0xff
>   };
>=20
> -/* We default to 4096, per x86.  When building a fs for
> - * 64-bit arches and whatnot, use the --pagesize=3DSIZE option */
> -int page_size =3D 4096;
> +/* We set this at start of main() using sysconf(), -1 means we don't kno=
w */
> +/* When building an fs for non-native systems, use --pagesize=3DSIZE opt=
ion */
> +int page_size =3D -1;
>=20
>   #include "compr.h"
>=20
> @@ -787,6 +787,10 @@
>   	struct stat *statbuf;
>   	unsigned int totcomp =3D 0;
>=20
> +	page_size =3D sysconf(_SC_PAGESIZE);
> +	if (page_size < 0) /* System doesn't know so ... */
> +		page_size =3D 4096; /* ... we make an educated guess */
> +

Could we add an additional check here to see if page_size !=3D 4096, and
print a loud warning with the page size that is actually being used and
suggest the --pagesize option if that isn't what is desired?

It's not that we have tons of systems using a page size different than
4KiB, but it's a change in behavior for those that do and I'd like to
at least warn users about it.  Otherwise the patch looks fine.

josh
