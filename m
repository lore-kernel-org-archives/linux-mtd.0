Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3O4T-0003CL-Qf
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 09:14:54 +0000
Message-ID: <1345454375.2848.21.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: sh_flctl: Switch from tick-based to time-based
 timeout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Date: Mon, 20 Aug 2012 12:19:35 +0300
In-Reply-To: <CABYn4syMFh4smteHS-zCAy3ygKsyxoD2+FfaBeQxKvK_FA+5mA@mail.gmail.com>
References: <1341410726-10562-1-git-send-email-hechtb@gmail.com>
 <CABYn4syMFh4smteHS-zCAy3ygKsyxoD2+FfaBeQxKvK_FA+5mA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2RAvyhNkP3WAQkuM0X0c"
Mime-Version: 1.0
Cc: Bastian Hecht <hechtb@gmail.com>, linux-mtd@lists.infradead.org,
 Linux-SH <linux-sh@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2RAvyhNkP3WAQkuM0X0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-25 at 17:21 +0200, Bastian Hecht wrote:
> Hello Artem!
>=20
> Could you please pull out this patch of your tree? While reworking the
> driver for IRQ-driven use, I've realized that this conversion makes no
> sense as all loops use a udelay(1) in them. So the timeout is already
> time based.

Dropped, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-2RAvyhNkP3WAQkuM0X0c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMgEnAAoJECmIfjd9wqK0FLwQALkvfvpQJUgo5e8zDrL3svYb
tO7gMRXSQE+HRWpwqmXBH+RRK89Ez6Hz8jRzj3N24uF7jqih6sWPU0g7tp2WA3ZW
xRgAbWwj/C0Qi+2dmYR8ClAbBaOQUgheIuvdcPqjQZuvkXwxGoUV/NqM7LvQDr+6
gibgte7wTPhs1QfiWDiJkQ3SQC2f4Xu0++/88LJvcHaqbaYADC//PSGE2EK2S4aw
X62JV2XNr664iTpIxCu3FcrJ+dhW0rBfwRFnbGXlN5mYCuFCesICLiSMo3iLh+X7
Ic7gCdOrwsWKfwJ2/bauRwUNqHAE4uezS7b9e/eHRTTTJYCa4BzkqXWOJwI5s6VA
fgz/le9n0a4F6jaLUI+E12glCfudvg3VbIl2sBbFj8vY99MLTJwLNL8Xy+iR//Jk
2Eac4mSHOVI5npdHew5H2Ycrkz+YXJDDjQOjTknbCUHxPe0Io0HLFKkntBy/XWGx
mC2y0F4h5ntrSsw0oOuab8WGkUSNcwZDVjXdkvLGWhD7Mjs9JQKz9iSx7LwCe1E5
xGa5kkRVUHI9iWQBt227ccAfn0QYU8Aw5RBlnMUnXSh0JuSFBNkk1Se5bhEg4cMa
cJ/Ezf1Kjk6JY0qkkhbfKcxhV5o9G8vkX7QuGlImmKr6pmOvbTFzV1xVo0muM7SC
8qtMU5zMf7dMxyrWhckp
=mw5T
-----END PGP SIGNATURE-----

--=-2RAvyhNkP3WAQkuM0X0c--
