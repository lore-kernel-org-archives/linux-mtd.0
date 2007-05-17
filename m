Received: from moutng.kundenserver.de ([212.227.126.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoneS-0000zl-Lq
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 17:37:23 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: [PATCH] LogFS take three
Date: Thu, 17 May 2007 23:36:13 +0200
References: <20070515151919.GA32510@lazybastard.org>
	<20070516132035.GJ5472@lazybastard.org>
	<464CC209.4060500@cs.helsinki.fi>
In-Reply-To: <464CC209.4060500@cs.helsinki.fi>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200705172336.14552.arnd@arndb.de>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	=?utf-8?q?J=C3=B6rn?= Engel <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
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

On Thursday 17 May 2007, Pekka Enberg wrote:
>=20
> J=C3=B6rn Engel wrote:
> > Compressing random data will actually enlarge it. =C2=A0If that happens=
 I
> > simply store the verbatim uncompressed data instead and mark it as such.
> >=20
> > There is also demand for a user-controlled bit in the inode to disable
> > compression completely. =C2=A0All those .jpg, .mpg, .mp3, etc. just was=
te
> > time by trying and failing to compress them.
>=20
> So any sane way to enable compression is on per-inode basis which makes=20
> me still wonder why you need per-object compression.

1. it doesn't require user interaction, the file system will do the right
thing most of the time.

2. enlarging data is a very bad thing because it makes the behaviour
of the fs unpredictable. With uncompressed objects, you have a guaranteed
upper bound on the size.

	Arnd <><
