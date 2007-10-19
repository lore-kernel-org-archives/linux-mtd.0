Received: from rv-out-0910.google.com ([209.85.198.186])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IixXj-0008Pj-JD
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 20:30:01 +0100
Received: by rv-out-0910.google.com with SMTP id c24so544814rvf
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Oct 2007 12:29:45 -0700 (PDT)
Message-ID: <f383264b0710191229q612ae6b3y23835ca9cf873f35@mail.gmail.com>
Date: Fri, 19 Oct 2007 12:29:45 -0700
From: "Matt Reimer" <mattjreimer@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] MTD: make s3c2410's correct_data indicate an error for
	multi-bit read errors
In-Reply-To: <1192784447.3421.27.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <f383264b0710181813i61b5b9acs76afdf27f199adcc@mail.gmail.com>
	<20071019082438.GA26913@lazybastard.org>
	<1192784447.3421.27.camel@sauron>
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/19/07, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Fri, 2007-10-19 at 10:24 +0200, J=F6rn Engel wrote:
> > > @@ -397,7 +397,7 @@ static int s3c2410_nand_correct_data(struct
> > > mtd_info *mtd, u_char *dat,
> > >         if ((diff0 & ~(1<<fls(diff0))) =3D=3D 0)
> > >                 return 1;
> > >
> > > -       return 0;
> > > +       return -1;
> > >  }
>
> Yup, J=F6rn is right, you should return -EBADMSG on ECC errors and
> -EUCLEAN if there was a correctable bit-flip.

See the patch I posted a couple of days ago with the subject "MTD:
treat any negative return value from correct() as an error". Once that
patch is accepted, doing what you say will work as you expect; right
now, it results in lying to upper layers about errors.

Matt
