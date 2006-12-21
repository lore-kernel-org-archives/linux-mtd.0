Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GxN9h-0003hJ-Oj
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 07:36:16 -0500
Subject: Re: OneNAND: Update OOB free table
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <1166699703.3939.37.camel@sauron>
References: <14053092.180201166415887159.JavaMail.weblogic@ep_ml21>
	<1166699703.3939.37.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Dec 2006 14:35:35 +0200
Message-Id: <1166704535.3939.45.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Vitaly Wool <vwool@ru.mvista.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Timo Teras <timo.teras@solidboot.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-12-21 at 13:15 +0200, Artem Bityutskiy wrote:
> Hello,
>=20
> On Mon, 2006-12-18 at 04:24 +0000, Kyungmin Park wrote:
> > How about the this patch?
> > It skips the ecc position which is defined in ecc layout in mtd drivers=
.
>=20
> Here is my understanding of the problem.
>=20
> Nowadays MTD supports nicer interface to work with OOB. This is the
> MTD_OOB_AUTO command. Currently JFFS2 uses old MTD_OOB_PLACE command.
>=20
> The idea behind the MTD_OOB_AUTO command is that user provides buffer
> with his data, and MTD takes care about how to put it to the OOB area,
> MTD knows which OOB bytes may be used. Similar for reading OOB - MTD
> automatically reads data bytes, skips ECC, and returns the data.
>=20
> So what we should do is to teach JFFS2 using MTD_OOB_AUTO instead of
> MTD_OOB_PLACE.

I may try to do this, but only in 2007. Vitaly said he may also try to
do this later.

Also, dwmw2 is concerned about compatibility, so we should explore this
too.

Kyungmin, may you make sure OneNAND is OK WRT MTD_OOB_AUTO?

Also Kyungmin, in you driver I see touch_softlockup_watchdog() calls. I
believe they should not be there. You must be hid a problem with this
instead of fixing it. Please, look at that stuff.

Kyungmin, do you have your own OneNAND git tree? If yes, what's the URL?
How about putting it on infradead.org, just like we have our UBI git
there?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
