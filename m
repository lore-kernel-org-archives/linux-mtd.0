Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOTDK-00019N-0A
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 08:08:46 +0000
Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200807302357.53204.david-b@pacbell.net>
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<200807302210.00307.david-b@pacbell.net>
	<1217482661.9048.74.camel@sauron>
	<200807302357.53204.david-b@pacbell.net>
Content-Type: text/plain; charset=utf-8
Date: Thu, 31 Jul 2008 11:03:37 +0300
Message-Id: <1217491417.9432.23.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, trimarchimichael@yahoo.it,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org,
	jwboyer@gmail.com, rmk@arm.linux.org.uk
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2008-07-30 at 23:57 -0700, David Brownell wrote:
> > Or if not, we could add one more argument to read()/write() which tells
> > whether the memory is contiguous or not. Then the driver would chose ho=
w
> > to deal with the buffer.
>=20
> Is updating all the MTD users in such a way a real possibility?

I need to look closer, but at the first glance it seems that it should
be possible. There are not so many mtd->read/write users.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
