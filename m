Received: from moutng.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWZt3-0003mR-Pd
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 16:53:22 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Fri, 22 Aug 2008 18:52:37 +0200
References: <48AD0101.4020505@gmail.com> <48AE19AD.1020209@lougher.demon.co.uk>
	<6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
In-Reply-To: <6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200808221852.38950.arnd@arndb.de>
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
> > This implies for block devices that the entire filesystem metadata has =
to be
> > cached in RAM. =C2=A0This severely limits the size of AXFS filesystems =
when using
> > block devices, or the else memory usage will be excessive.
>=20
> This is where 64bit squashfs could be a better fit.

Is this the only place where squashfs has a significant advantage?=20
If so, you might want to change it in axfs eventually to make the
decision easier for users ;-)

It certainly sounds like something for your medium-term TODO list,
although I wouldn't think of it as a show-stopper.

	Arnd <><
