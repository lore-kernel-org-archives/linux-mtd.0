Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoHqT-00043I-US
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 07:39:15 -0400
Subject: Re: [PATCH] LogFS take three
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20070516113434.GC20482@mail.shareable.org>
References: <20070515151919.GA32510@lazybastard.org>
	<17994.1241.436841.681216@stoffel.org>
	<20070515191926.GB1220@lazybastard.org>
	<1179291255.2859.195.camel@shinybook.infradead.org>
	<20070516110933.GA5472@lazybastard.org>
	<20070516113434.GC20482@mail.shareable.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 16 May 2007 14:38:18 +0300
Message-Id: <1179315498.3642.19.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, John Stoffel <john@stoffel.org>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Greg KH <greg@kroah.com>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-16 at 12:34 +0100, Jamie Lokier wrote:
> J=C3=B6rn Engel wrote:
> > On Wed, 16 May 2007 12:54:14 +0800, David Woodhouse wrote:
> > > Personally I'd just go for 'JFFS3'. After all, it has a better claim =
to
> > > the name than either of its predecessors :)
> >=20
> > Did you ever see akpm's facial expression when he tried to pronounce
> > "JFFS2"?  ;)
>=20
> JFFS3 is a good, meaningful name to anyone familiar with JFFS2.
>=20
> But if akpm can't pronounce it, how about FFFS for faster flash
> filesystem.... ;-)

The problem is that JFFS2 will always be faster in terms of I/O speed
anyway, just because it does not have to maintain on-flash indexing
data structures. But yes, it is slow in mount and in building big
inodes, so the "faster" is confusing.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
