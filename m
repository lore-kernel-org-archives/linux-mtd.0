Received: from moutng.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBru-00053C-Jk
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 15:14:35 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Thu, 21 Aug 2008 17:12:26 +0200
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>
	<6934efce0808210806r701f2e3bo677d2bd2da78faec@mail.gmail.com>
In-Reply-To: <6934efce0808210806r701f2e3bo677d2bd2da78faec@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200808211712.27146.arnd@arndb.de>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
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

On Thursday 21 August 2008, Jared Hulbert wrote:
> > Have you seen any benefit of the rwsem over a simple mutex? I would gue=
ss
> > that you can never even get into the situation where you get concurrent
> > readers since I haven't found a single down_read() in your code, only
> > downgrade_write()
>=20
> We implemented a rwsem here because you can get concurrent readers.
> My understanding is that downgrade_write() puts the rewem into the
> same state as down_read(). =C2=A0Am I mistaken?

Your interpretation of downgrade_write is correct, but if every thread
always does

down_write();
serialized_code();
downgrade_write();
parallel_code();
up_read();

Then you still won't have any concurrency, because each thread trying
to down_write() will be blocked until the previous one has done its up_read=
(),
causing parallel_code() to be serialized as well.

In addition to that, I'd still consider it better to use a simple mutex
if parallel_code() is a much faster operation than serialized_code(), as it
is in your case, where only the memcpy is parallel and that is much slower
than the deflate.

	Arnd <><
