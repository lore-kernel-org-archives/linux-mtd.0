Received: from moutng.kundenserver.de ([212.227.126.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWCSw-0003id-Rg
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 15:52:51 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Thu, 21 Aug 2008 17:50:44 +0200
References: <48AD00F8.1030004@gmail.com> <200808211706.37761.arnd@arndb.de>
	<6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
In-Reply-To: <6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200808211750.45559.arnd@arndb.de>
Cc: linux-embedded@vger.kernel.org, carsteno@de.ibm.com,
	=?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
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
> So /sys/kernel/debug/axfs/volume0 would work?
>=20
> > 4) no profiling at all
> > The profiling code has certainly been useful to you during development,
> > and you should keep that code around for your own work on it,
> > but maybe you should not push that upstream, because regular users
> > are not going to need it.
>=20
> Nope. =C2=A0Profiling is absolutely fundamental to how AXFS works. =C2=A0=
Read
> the [PATCH 00/10] thread again.

Ok, understood it now. So it actually is a stable interface into
the file system, which means that debugfs might not be the best
solution.

I need to think about this some more. So far none of the options
are perfect. What I can think of so far includes:

1. An ioctl on the mount point of the fs
2. An ioctl that you need to call on each file
3. sysfs files is /sys/fs/axfs/
4. A new virtual file system to be mounted to /sys/fs/axfs/
5. A file below the device in sysfs, e.g. /sys/block/mtdblk0/axfs-profile

I've also taken a look at the format of the profiling data file.
I'm not sure that it is ideal if you want to be able to share
identical data blocks between files. Do you currently do that
in your mkfs? The fs format certainly allows it. I would expect
that if you checksum each page, you can find duplicates on a page
basis and save some space this way. However, it can make profiling
harder if you count based on blocks but report the data based on
the file name. Not sure what a better solution would look like.

	Arnd <><
