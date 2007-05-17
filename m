Received: from moutng.kundenserver.de ([212.227.126.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoeKb-0000oO-KX
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 07:39:48 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
Date: Thu, 17 May 2007 13:39:15 +0200
References: <20070515151919.GA32510@lazybastard.org>
	<17994.1241.436841.681216@stoffel.org>
	<20070515191926.GB1220@lazybastard.org>
In-Reply-To: <20070515191926.GB1220@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200705171339.16806.arnd@arndb.de>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 15 May 2007, J=C3=B6rn Engel wrote:
>=20
> > I've been semi watching this, and the only comment I really can give
> > is that I hate the name. =C2=A0To me, logfs implies a filesystem for
> > logging purposes, not for Flash hardware with wear leveling issues to
> > be taken into account.
>=20
> Yeah, well, ...
>=20
> Two years ago when I started all this, I was looking for a good name.
> All I could come up with sounded stupid, so I picked "LogFS" as a code
> name. =C2=A0As soon as I find a better name, the code name should get
> replaced.
>=20

When doing a google search on logfs, there are less than five results
among the first 100 that don't refer to your work. The other two listed
in there are also log-structured file systems: The inferno flash file
system (http://inferno-os.googlecode.com/svn/trunk/liblogfs/) and the
(discontinued) file system named lfs from the 2005 google summer of
code.

I'd say the name should stay, changing it now can only add more confusion.

	Arnd <><
