Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXrrM-0001vb-2m
	for linux-mtd@lists.infradead.org; Tue, 26 Aug 2008 06:16:56 +0000
Subject: Re: [PATCH] mtd-utils: allow 'ubiformat' to read from stdin
From: Artem Bityutskiy <dedekind@infradead.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1219691391-15149-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1219691391-15149-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1219691391-15149-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
Content-Type: text/plain; charset=utf-8
Date: Tue, 26 Aug 2008 09:13:43 +0300
Message-Id: <1219731223.18027.116.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-08-25 at 21:09 +0200, Enrico Scholz wrote:
> This patch allows to read the image from stdin and adds an
> '--image-size' option to specify its size.  'upiupdatevol' has this
> feature already and it is useful for 'ubiformat' too.
>=20
> It adds a read_all() function which reads a block of data. Plain
> 'read(2)' can fail on
>=20
>   nc -l -p 1234 | ubiformat -f - -S 25427968
>=20
> else.

Applied, pushed, but with few minor tweaks to make the utilities be
uni-styled. Thanks.

> +	int		fd;
Here I've removed TABs between "int" and "fd", and put a space.

> +		ssize_t		l =3D read(fd, buf, len);
And here.

> -	struct stat st;
> +	off_t	st_size;
And here.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
