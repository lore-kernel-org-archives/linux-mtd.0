Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWdO3-0002SZ-Sq
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 20:37:36 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Fri, 22 Aug 2008 22:37:19 +0200
References: <48AD00F8.1030004@gmail.com> <200808211339.37187.arnd@arndb.de>
	<6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
In-Reply-To: <6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200808222237.20346.arnd@arndb.de>
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
	carsteno@de.ibm.com, =?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 21 August 2008, Jared Hulbert wrote:
> 1) same mount point -
> I don't see how this works without an ioctl. =C2=A0I can't just make up
> files in my mounted filesystem. =C2=A0 You expect the mounted version to
> match input to the mkfs. =C2=A0I'd not be happy with an ioctl. =C2=A0You =
can
> just read it.
>=20
> 2) sysfs -
> I agree with Carsten, I don't see how this fits in the sysfs hierarchy.
>=20
> 3) debugfs -
> I don't know diddly about this.

Ok, so now yet another suggestion, which may sound a little strange:

oprofilefs

I believe you can use the oprofile infrastructure to record data
about file accesses, even independent of the file system you
are looking at.

It's probably a lot of work to get it right, but I would be worth it.

	Arnd <><
