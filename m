Received: from mail-ee0-f46.google.com ([74.125.83.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZQnA-0002Hr-A7
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 19:09:45 +0000
Received: by mail-ee0-f46.google.com with SMTP id b57so1971019eek.33
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2013 12:09:19 -0700 (PDT)
Date: Mon, 6 May 2013 22:08:58 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Pomerantz <bapper@gmail.com>
Subject: Re: [PATCH] UBI: fastmap convert used list to rb tree
Message-ID: <20130506220858.319f81a3.shmulik.ladkani@gmail.com>
In-Reply-To: <1367801267-15659-1-git-send-email-bapper@gmail.com>
References: <1367801267-15659-1-git-send-email-bapper@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: richard -rw- weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Nice!
Few tiny comments.

On Sun,  5 May 2013 17:47:47 -0700 Brian Pomerantz <bapper@gmail.com> wrote:
> +/**
> + * add_aeb - create and add a attach erase block to a given rb tree root.

s/add_aeb/add_aeb_rb/

> + * @ai: UBI attach info object
> + * @root: the target rb tree
> + * @pnum: PEB number of the new attach erase block
> + * @ec: erease counter of the new LEB
> + * @scrub: scrub this PEB after attaching
> + *
> + * Returns 0 on success, < 0 indicates an internal error.
> + */
> +static int add_aeb_rb(struct ubi_attach_info *ai, struct rb_root *root,
> +		   int pnum, int ec, int scrub)
> +{
> +	struct ubi_ainf_peb *aeb;
> +	struct ubi_ainf_peb *tmp_aeb;
> +	struct rb_node **p =3D &root->rb_node, *parent =3D NULL;
> +
> +	aeb =3D kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
> +	if (!aeb)
> +		return -ENOMEM;
> +
> +	aeb->pnum =3D pnum;
> +	aeb->ec =3D ec;
> +	aeb->lnum =3D -1;
> +	aeb->scrub =3D scrub;
> +	aeb->copy_flag =3D aeb->sqnum =3D 0;
> +
> +	ai->ec_sum +=3D aeb->ec;
> +	ai->ec_count++;
> +
> +	if (ai->max_ec < aeb->ec)
> +		ai->max_ec =3D aeb->ec;
> +
> +	if (ai->min_ec > aeb->ec)
> +		ai->min_ec =3D aeb->ec;

Up until here, the code is identical to 'add_aeb'.
Suggest unify the above 'aeb' construction code.

>  /**
> - * assign_aeb_to_av - assigns a SEB to a given ainf_volume and removes it
> - * from it's original list.
> + * assign_aeb_to_av - assigns a SEB to a given ainf_volume

Maybe comment that 'aeb' should be already unlinked from any prior
aeb->u.list or aeb->u.rb?

> @@ -726,10 +803,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  				continue;
> =20
>  			aeb =3D NULL;
> -			list_for_each_entry(tmp_aeb, &used, u.list) {
> -				if (tmp_aeb->pnum =3D=3D pnum)
> -					aeb =3D tmp_aeb;
> -			}
> +			aeb =3D find_aeb_in_rb(&used, pnum);

The above 'aeb =3D NULL' is now redundant.

=46rom ubi.h, struct ubi_ainf_peb documentation:
 * @u.rb: link in the per-volume RB-tree of &struct ubi_ainf_peb objects
 * @u.list: link in one of the eraseblock lists

Maybe we should amend the documentation, now that u.rb serves other
purposes than the per-volume RB-tree link?

Regards,
Shmulik
