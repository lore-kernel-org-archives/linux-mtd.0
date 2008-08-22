Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWcT2-0003qZ-0G
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 19:38:40 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Fri, 22 Aug 2008 21:37:15 +0200
References: <48AD0101.4020505@gmail.com> <200808221852.38950.arnd@arndb.de>
	<6934efce0808221043i3d463ac2gb54b7dd4cfde4b81@mail.gmail.com>
In-Reply-To: <6934efce0808221043i3d463ac2gb54b7dd4cfde4b81@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200808222137.16108.arnd@arndb.de>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	Phillip Lougher <phillip@lougher.demon.co.uk>,
	=?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 22 August 2008, Jared Hulbert wrote:
> > It certainly sounds like something for your medium-term TODO list,
> > although I wouldn't think of it as a show-stopper.
>=20
> Maybe. =C2=A0It more of a feature rather than a bug. =C2=A0It makes stat(=
) and
> such fast. =C2=A0The trade off is RAM...

Yes. And if you implement it at some point later, it can well be
a mount option or an mkfs option in case it needs format changes.

	Arnd <><
