Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KYDon-00057i-AZ
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 05:43:45 +0000
Subject: Re: [PATCH 2/2] Add support for > 2GiB MTD devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce Leonard <brucle@earthlink.net>
In-Reply-To: <48AB3AAF.3010504@earthlink.net>
References: <48AB3AAF.3010504@earthlink.net>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Aug 2008 08:40:17 +0300
Message-Id: <1219815617.18027.132.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bruce,

On Tue, 2008-08-19 at 14:27 -0700, Bruce Leonard wrote:
> +/*
> + * Inline function for determining the size of the MTD device, independa=
nt
> + * of old or new way of doing things.
> + *
> + */
> +static inline u_int64_t device_size(struct mtd_info *a)
> +{
> +	return a->num_eraseblocks =3D=3D 0 ? a->size : a->num_eraseblocks * a->=
erasesize;
> +}

I do not think it is a good idea to do multiplication every time we need
MTD device size. It is unnecessarily large overhead in terms of speed
and code size.

Did you consider a possibility of just making mtd->size 64 bit?
Or using eraseblock:offset pairs instead of absolute address?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
