Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I0bX2-0007pO-MD
	for linux-mtd@lists.infradead.org; Tue, 19 Jun 2007 07:05:58 -0400
Subject: Re: [PATCH/RFC] oops and panic message logging to MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1182250350.5760.42.camel@localhost.localdomain>
References: <1182184301.6074.62.camel@localhost.localdomain>
	<1182239749.4403.48.camel@sauron>
	<1182247254.5760.17.camel@localhost.localdomain>
	<1182248962.4403.60.camel@sauron>
	<1182250350.5760.42.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 19 Jun 2007 14:05:44 +0300
Message-Id: <1182251144.4403.63.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-19 at 11:52 +0100, Richard Purdie wrote:
> >  Error
> > code means that something very bad and sever is going on and you have t=
o
> > just refuse working with this device.
>=20
> In this case, it will just move on to the next EB. There is code to
> handle no available EBs at which point it will refuse to work with the
> device.

My point is that instead of moving you should return error. You cannot
keep working with this device just because something really bad
happened, you do not know what, and you cannot react accordingly because
you do not know how.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
