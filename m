Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRb2L-0004V2-AZ
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 22:34:06 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH 2.6.24] block2mtd: removing a device and typo fixes
Date: Tue, 19 Feb 2008 23:33:38 +0100
References: <chaz20080212134751.GI30304@artesyncp.com>
	<chaz20080212161034.GJ30304@artesyncp.com>
	<20080219150822.GA29587@lazybastard.org>
In-Reply-To: <20080219150822.GA29587@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200802192333.39707.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org,
	Stephane Chazelas <stephane.chazelas@emerson.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 19 February 2008, you wrote:
> > What about having a /dev/block2mtd (with owner/permissions that
> > could allow non-root users to use it), with 2 ioctls:
> >=20
> > - one to "link" a block dev to a mtd that would take as
> > =C2=A0 parameter a fd to an open block dev (again allowing for
> > =C2=A0 flexible permissions) and would return the number of the
> > =C2=A0 allocated mtd and success/failure in errno. Upon sucess it
> > =C2=A0 would increase the refcnt of block2mtd.
> >=20
> > - and one to "release" the link. That would fail if the mtd is
> > =C2=A0 in use and decrease block2mtd's refcnt upon success.
> >=20
> > A bit like the loop devices (or /dev/ptmx) actually. What do you
> > think?
>=20
> Could work. =C2=A0Passing the fd raises several alarm bells. =C2=A0Arnd, =
any
> comments from you?

Given that loop works in this way, I certainly see that as doable,
but then I'd vote for using the existing ioctl semantics of
LOOP_SET_FD and LOOP_DEL_FD on the mtdchar device, which already
comes with an ioctl interface for mtd devices.
I'd probably also allow the LOOP_{GET,SET}_STATUS{,64} commands,
so you can actually use the existing losetup tool.
That way, we wouldn't have to introduce a new API, just extend
an existing one to work on more things.

	Arnd <><
