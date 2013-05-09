Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaOJ2-0002zj-A8
 for linux-mtd@lists.infradead.org; Thu, 09 May 2013 10:42:36 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Mike Frysinger <vapier@gentoo.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH [mtd-utils] 3/3] nandwrite: add --input-{skip,size} options
Date: Thu, 9 May 2013 10:42:01 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9C32D8@DBDE04.ent.ti.com>
References: <1368054125-32214-1-git-send-email-vapier@gentoo.org>
 <1368057794-32735-3-git-send-email-vapier@gentoo.org>
In-Reply-To: <1368057794-32735-3-git-send-email-vapier@gentoo.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>  	pagelen =3D mtd.min_io_size + ((writeoob) ? mtd.oob_size : 0);
>=20

> +		imglen =3D inputsize ? : pagelen;
> +		if (inputskip) {
> +			errmsg("seeking stdin does not work");
> +			goto closeall;
> +		}
>  	} else {
> -		struct stat st;
> -		if (fstat(ifd, &st)) {
> -			sys_errmsg("unable to stat input image");
> +		if (!inputsize) {
> +			struct stat st;
> +			if (fstat(ifd, &st)) {
> +				sys_errmsg("unable to stat input
> image");
> +				goto closeall;
> +			}
> +			imglen =3D st.st_size;
> +		} else
> +			imglen =3D inputsize;
> +

[Pekon]: It would be good to check that both 'inputsize' & 'inputskip'=20
are multiples of:
-  mtd->writesize : if not using '-o' option, OR
- (mtd->writesize + mtd->oobsize): is using '-o' option.
Or Simply, both arguments should be aligned to 'pagelen' boundary.


with regards, pekon
