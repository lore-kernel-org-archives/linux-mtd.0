Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KnSEL-0008DI-FY
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 06:09:05 +0000
Subject: Re: mtd-utils: fec.c uses bcopy()
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mitch Davis <mjd-linux-mtd@afork.com>
In-Reply-To: <8956d4ca0810072306t64d28c8apa888ede8c7ccbc33@mail.gmail.com>
References: <8956d4ca0810071727i63554837k923a0091b3ef9bd0@mail.gmail.com>
	<8bd0f97a0810071802t52bc60fs6a230e30d7ed1c8f@mail.gmail.com>
	<8956d4ca0810071936p21240f4dn89e161c6ef07847c@mail.gmail.com>
	<8bd0f97a0810071938s3366f340redc61e87e6b020b8@mail.gmail.com>
	<8956d4ca0810072156w4fcdf1barb2d740e10d97c380@mail.gmail.com>
	<8bd0f97a0810072207h6848895fpea038316aa583fa6@mail.gmail.com>
	<8956d4ca0810072306t64d28c8apa888ede8c7ccbc33@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 08 Oct 2008 09:08:30 +0300
Message-Id: <1223446110.8051.92.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2008-10-08 at 17:06 +1100, Mitch Davis wrote:
> Hi Mike,
>=20
> On Wed, Oct 8, 2008 at 4:07 PM, Mike Frysinger <vapier.adi@gmail.com> wro=
te:
> > On Wed, Oct 8, 2008 at 00:56, Mitch Davis wrote:
> >> On Wed, Oct 8, 2008 at 1:38 PM, Mike Frysinger wrote:
> >>> use `git diff` to generate a diff instead of posting the entire file
> >>> as an attachment.
> >>
> > sorry, my mistake
> >
> >>> really you should use git to send the patch
> >>
> >> Do you mean a git push?
> >
> > no.  use the send-email function.  read `man git-send-email` for more i=
nfo.
>=20
>  - Who is best told about the broken git info links on the MTD git web pa=
ge?
>=20
>  - This process of submitting stuff with git-send-email is not
> documented on the MTD page, but newbies should use it anyway.  Can I
> suggest the howto on the MTD page be updated to avoid people like me
> getting it wrong?
>  - On my machine (Fedora 9) git-send-email is part of the git-email
> package, not standard git.  Others may benefit from knowing this if
> it's part of that updated page.

MTD web site source may be found at:
git://git.infradead.org/mtd-www.git

Please, feel free to add such a HOWTO and send a patch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
