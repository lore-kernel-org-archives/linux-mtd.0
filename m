Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZltQQ-00013H-7e
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 06:51:07 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH] UBIFS: Fix possible memory leak in ubifs_readdir()
From: David Gstir <david@sigma-star.at>
In-Reply-To: <1444685736-29878-1-git-send-email-richard@nod.at>
Date: Tue, 13 Oct 2015 08:50:42 +0200
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B14E7E10-F4C2-4200-B59F-B846B31B2AE1@sigma-star.at>
References: <1444685736-29878-1-git-send-email-richard@nod.at>
To: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 12.10.2015, at 23:35, Richard Weinberger <richard@nod.at> wrote:
>=20
> If ubifs_tnc_next_ent() returns something else than -ENOENT
> we leak file->private_data.
>=20
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> fs/ubifs/dir.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 5c27c66..cb88ea3 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -449,13 +449,14 @@ static int ubifs_readdir(struct file *file, =
struct dir_context *ctx)
> 	}
>=20
> out:
> +	kfree(file->private_data);
> +	file->private_data =3D NULL;
> +
> 	if (err !=3D -ENOENT) {
> 		ubifs_err(c, "cannot find next direntry, error %d", =
err);
> 		return err;
> 	}
>=20
> -	kfree(file->private_data);
> -	file->private_data =3D NULL;
> 	/* 2 is a special value indicating that there are no more =
direntries */
> 	ctx->pos =3D 2;
> 	return 0;
> --=20
> 2.5.0

Looks good to me.

Reviewed-by: David Gstir <david@sigma-star.at>=20

Thanks,
David=
