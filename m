Received: from moutng.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBnI-0006VV-HV
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 15:09:49 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Thu, 21 Aug 2008 17:06:36 +0200
References: <48AD00F8.1030004@gmail.com> <200808211339.37187.arnd@arndb.de>
	<6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
In-Reply-To: <6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200808211706.37761.arnd@arndb.de>
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

> 1) same mount point -
> I don't see how this works without an ioctl. =C2=A0I can't just make up
> files in my mounted filesystem. =C2=A0 You expect the mounted version to
> match input to the mkfs. =C2=A0I'd not be happy with an ioctl. =C2=A0You =
can
> just read it.

I think what Carsten was suggesting is that you create extra files
in the file system that behave like your current procfs files.
This limits the choice for names inside of the file system, and
therefor I think should not be done.
=20
> 2) sysfs -
> I agree with Carsten, I don't see how this fits in the sysfs hierarchy.

You can create attributes below the device you have mounted.
Technically possible, the main issue I see with this is having
to maintain ABI compatibility.

> 3) debugfs -
> I don't know diddly about this.
>=20
> So why not /proc?

/proc has the same ABI restrictions as sysfs. We more or less stopped
allowing new files in /proc some 5 years ago for this reason. I didn't
even read beyond the word /proc to know that what you do here is wrong.
debugfs is normally easier to use than procfs as well, you just
define some file_operations with read/write callbacks and call
debugfs_create_file with the path name below /sys/kernel/debug.

If I may give yet another suggestion:

4) no profiling at all
The profiling code has certainly been useful to you during development,
and you should keep that code around for your own work on it,
but maybe you should not push that upstream, because regular users
are not going to need it.

	Arnd <><
