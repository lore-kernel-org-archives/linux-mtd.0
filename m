Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9dtN-0002Ii-Le
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 11:03:09 +0000
Subject: Re: ubi-utils updates for gcc-4.3.x
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tom Rini <trini@embeddedalley.com>
In-Reply-To: <20081208080138.GJ15204@smtp.west.cox.net>
References: <20081208080138.GJ15204@smtp.west.cox.net>
Content-Type: text/plain; charset=utf-8
Date: Mon, 08 Dec 2008 13:00:52 +0200
Message-Id: <1228734052.13686.103.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks for the patch.

On Mon, 2008-12-08 at 01:02 -0700, Tom Rini wrote:
> gcc-4.3.x introduces a number of new warnings (and we use -Werror) for
> things like not checking scanf return values and not using explicit
> formatting.  Finally, it caught that we were overflowing our own buffer
> in unubi.c, so increate the variable size as we want to declare and
> clear PATH_MAX + 1, then use only PATH_MAX of the variable.
>=20
> Signed-off-by: Tom Rini <trini@embeddedalley.com>
>=20
> diff --git a/ubi-utils/new-utils/src/ubiformat.c b/ubi-utils/new-utils/sr=
c/ubiformat.c
> index 05caed9..9c3e0fb 100644
> --- a/ubi-utils/new-utils/src/ubiformat.c
> +++ b/ubi-utils/new-utils/src/ubiformat.c
> @@ -225,7 +225,8 @@ static int want_exit(void)
> =20
>  	while (1) {
>  		normsg_cont("continue? (yes/no)  ");
> -		scanf("%3s", buf);
> +		if (!scanf("%3s", buf))
> +			return 1;

>From man scanf:

RETURN VALUE
These  functions  return  the  number  of input items successfully
matched and assigned, which can be fewer than provided for, or even zero
in the event of an early matching failure.

The value EOF is returned if the end of input is reached before either
the first successful conversion or a matching failure occurs.  EOF is
also returned  if a read error occurs, in which case the error indicator
for the stream (see ferror(3)) is set, and errno is set indicate the
error.

On this basis, I would say you should test for EOF, not for 0.

> +		if (!scanf("%3s", buf))
> +			return 0;

Similarly.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
