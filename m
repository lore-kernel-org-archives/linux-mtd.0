Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlTJJ-0006fX-5k
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 18:21:45 +0000
Date: Mon, 14 Apr 2008 20:21:23 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [PATCH] JFFS2 Fix of panics caused by wrong condition for hole
	frag creation in write_begin
Message-ID: <20080414182123.GA2091@logfs.org>
References: <Pine.LNX.4.64.0804141747020.15842@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.64.0804141747020.15842@pentafluge.infradead.org>
Cc: nickpiggin@yahoo.com.au, akpm@linux-foundation.org, dwmw2@infradead.org,
	vailiy.leonenko@intel.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 April 2008 17:55:22 +0100, Alexey Korolev wrote:
>=20
> JFFS2 in Linux 2.6.24 fails to kernel panic on random read/write/truncate=
 operatons. We investigated the issue it is caused by
> bug in conditions for hole fragment creation in write_begin function. Off=
set of starting offset which is used to identify should we create hole frag=
 or not is calculated improperly.
> As result hole frags are not created when they must be - it leads to inte=
rnal memory corruptions and kernel panic.=20
>=20
> The following patch fixes the bug in JFFS2 write_begin hole frag conditio=
ns.=20
> Please include the patch.=20

Description is rather wide.

Reviewed-By: Joern Engel <joern@logfs.org>

> Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> Signed-off-by: Vasiliy Leonenko <vasiliy.leonenko@mail.ru>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff -aupNr a/fs/jffs2/file.c b/fs/jffs2/file.c
> --- a/fs/jffs2/file.c	2008-02-11 08:51:11.000000000 +0300
> +++ b/fs/jffs2/file.c	2008-04-11 13:54:08.000000000 +0400
> @@ -129,13 +129,14 @@ static int jffs2_write_begin(struct file
>  	struct inode *inode =3D mapping->host;
>  	struct jffs2_inode_info *f =3D JFFS2_INODE_INFO(inode);
>  	pgoff_t index =3D pos >> PAGE_CACHE_SHIFT;
> -	uint32_t pageofs =3D pos & (PAGE_CACHE_SIZE - 1);
> +	uint32_t pageofs;
>  	int ret =3D 0;
> =20
>  	pg =3D __grab_cache_page(mapping, index);
>  	if (!pg)
>  		return -ENOMEM;
>  	*pagep =3D pg;
> +	pageofs =3D pg->index << PAGE_CACHE_SHIFT;
> =20
>  	D1(printk(KERN_DEBUG "jffs2_write_begin()\n"));
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Thanks,
> Alexey

J=C3=B6rn

--=20
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
