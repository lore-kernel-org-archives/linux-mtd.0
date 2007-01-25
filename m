Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HA6zH-0003q8-Q3
	for linux-mtd@lists.infradead.org; Thu, 25 Jan 2007 10:58:10 -0500
Subject: Re: What is ANAND header?
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1169739059.3593.84.camel@shinybook.infradead.org>
References: <20070124054731.GA31267@pooky.senux.com>
	<BFECAF9E178F144FAEF2BF4CE739C66803EAB0BB@exmail1.se.axis.com>
	<20070125064937.GA5712@pooky.senux.com>
	<1169716358.3609.12.camel@sauron>
	<1169739059.3593.84.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 25 Jan 2007 17:57:33 +0200
Message-Id: <1169740653.3721.10.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Seongsu Lee <senux@senux.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-01-25 at 23:30 +0800, David Woodhouse wrote:
> On Thu, 2007-01-25 at 20:12 +1100, Artem Bityutskiy wrote:
> > On Thu, 2007-01-25 at 15:49 +0900, Seongsu Lee wrote:
> > > Then, is there any technical reason that translation layer
> > > for bare NAND flash memory is *not* exist?
> >=20
> > Just because it is a damn difficult task.=20
>=20
> No it isn't. It's just not an _interesting_ task. A 'normal' file system
> on top of a translation layer is always going to be suboptimal when
> compared to a file system designed to run directly on flash.

Well, FTL is somewhat similar to flash FS in terms of complexity. A
reasonably good FTL is probably not a damn difficult task. But a
scalable FTL where you do not need to scan your device when initializing
it is really difficult.

Of course, FTL will always be slower then flash-oriented FS. But if you
have a very quick HW (like Cafe?) you may end-up with an acceptable
speed - this depends on requirements.

Also, if you teach the FS to inform FTL about blocks that are free -
it'll be much faster.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
