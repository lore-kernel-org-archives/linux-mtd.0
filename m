Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Iinm4-000769-KC
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 10:04:10 +0100
Subject: Re: [PATCH] MTD: make s3c2410's correct_data indicate an error for
	multi-bit read errors
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20071019082438.GA26913@lazybastard.org>
References: <f383264b0710181813i61b5b9acs76afdf27f199adcc@mail.gmail.com>
	<20071019082438.GA26913@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Oct 2007 12:00:47 +0300
Message-Id: <1192784447.3421.27.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Matt Reimer <mattjreimer@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-10-19 at 10:24 +0200, J=C3=B6rn Engel wrote:
> > @@ -397,7 +397,7 @@ static int s3c2410_nand_correct_data(struct
> > mtd_info *mtd, u_char *dat,
> >         if ((diff0 & ~(1<<fls(diff0))) =3D=3D 0)
> >                 return 1;
> >=20
> > -       return 0;
> > +       return -1;
> >  }

Yup, J=C3=B6rn is right, you should return -EBADMSG on ECC errors and
-EUCLEAN if there was a correctable bit-flip.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
