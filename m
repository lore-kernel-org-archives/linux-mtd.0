Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ju88o-0004ww-IE
	for linux-mtd@lists.infradead.org; Thu, 08 May 2008 15:34:42 +0000
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080508153038.GC14141@logfs.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
	<fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
	<20080505073745.GA13916@logfs.org>
	<fe810cf0805050510g2bf7ef4brfaf4352454dd204b@mail.gmail.com>
	<20080505153959.GA17330@logfs.org>
	<fe810cf0805060229j3c20ab77g96c5ade0f111d278@mail.gmail.com>
	<20080508153038.GC14141@logfs.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 08 May 2008 18:33:41 +0300
Message-Id: <1210260821.3645.68.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	Alexey Korolev <akorolev@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-05-08 at 17:30 +0200, J=C3=B6rn Engel wrote:
> On Tue, 6 May 2008 13:29:09 +0400, Alexander Belyakov wrote:
> >=20
> > Thanks. I believe mtd caching deserves separate discussion, because
> > too many mtd things are going to be affected.
>=20
> Indeed.  For that very reason I've kept the caching part of logfs for
> now.  It is not a trivial decision to make and regressions can show up
> in surprising places.

We could provide a possibility to explicitly enable/disable it I guess.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
