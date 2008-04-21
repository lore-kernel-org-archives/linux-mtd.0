Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jnwca-0004NJ-09
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 14:03:52 +0000
Subject: Re: [U-Boot-Users] ubi and u-boot
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <1208785853.5965.388.camel@sauron>
References: <20080420222237.4AE5324657@gemini.denx.de>
	<1208779508.5965.371.camel@sauron>
	<Pine.LNX.4.64.0804211533140.27984@lnxricardw.se.axis.com>
	<1208785463.6654.34.camel@vader.jdub.homelinux.org>
	<1208785853.5965.388.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Mon, 21 Apr 2008 17:01:04 +0300
Message-Id: <1208786464.11721.0.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "u-boot-users@lists.sourceforge.net" <u-boot-users@lists.sourceforge.net>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-04-21 at 16:50 +0300, Artem Bityutskiy wrote:
> On Mon, 2008-04-21 at 08:44 -0500, Josh Boyer wrote:
> > I think there was only 1 time the on-flash format changed, and that was
> > before UBI was merged upstream.  New features can be introduced with
> > additional flags, however older versions should be able to ignore those=
.
> >=20
> > Artem, is that right?  My memory is fuzzy here.
>=20
> No, this is not right. We never changed the media format since UBI was
> merged.

Err, I meant what you said is right, but it is not right that we changed
media format.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
