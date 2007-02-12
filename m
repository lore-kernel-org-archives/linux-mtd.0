Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGY1d-00081S-5s
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 05:03:12 -0500
Subject: Re: [PATCH] [MTD] UBI: Fix counting of ec value
From: Artem Bityutskiy <dedekind@infradead.org>
To: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
In-Reply-To: <200702121016.40516.lindhors@linux.vnet.ibm.com>
References: <200702121016.40516.lindhors@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 12 Feb 2007 11:52:39 +0200
Message-Id: <1171273959.17314.16.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Timo,

thanks for the patches. The comment-fixing one is fine - applied. This
one is fine in general, but i have questions.

On Mon, 2007-02-12 at 10:16 +0100, Timo Lindhorst wrote:
>  static int sync_erase(const struct ubi_info *ubi, struct ubi_wl_entry *e=
,
>  		      int torture)
>  {
> -	int err;
> +	int err, ret;
>  	struct ubi_ec_hdr *ec_hdr;
>  	struct ubi_wl_info *wl =3D ubi->wl;
> -	uint64_t ec =3D e->ec + 1;
> +	uint64_t ec =3D e->ec;
> =20
> -	dbg_wl("erase PEB %d, new EC %lld", e->pnum, (long long)ec);
> +	dbg_wl("erase PEB %d, old EC %lld", e->pnum, (long long)ec);
> =20
>  	err =3D paranoid_check_ec(ubi, e->pnum, e->ec);
>  	if (unlikely(err > 0))
>  		return -EINVAL;
> =20
> +	ec_hdr =3D ubi_zalloc_ec_hdr(ubi);
> +	if (unlikely(!ec_hdr))
> +		return -ENOMEM;

So why have you moved this memory allocation here?

> +
> +	ret =3D err =3D ubi_io_sync_erase(ubi, e->pnum, torture);
> +	if (unlikely(err < 0))
> +		goto out_free;
> +
> +	ec +=3D ret;
What's the point in the new 'ret' variable? Why ec +=3D err does not work?

>  	if (unlikely(ec > UBI_MAX_ERASECOUNTER)) {
>  		/*
>  		 * Erase counter overflow. Upgrade UBI and use 64-bit
>  		 * erase counters internally.
>  		 */
>  		ubi_err("erase counter overflow at PEB %d, EC %d",
> -			e->pnum, e->ec);
> +			e->pnum, ec);
>  		return -EINVAL;
And now you do not free memory. Please do not move the allocation if it
is not really necessary.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
