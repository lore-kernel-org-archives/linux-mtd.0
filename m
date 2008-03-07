Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JXXeq-0005KJ-AM
	for linux-mtd@lists.infradead.org; Fri, 07 Mar 2008 08:10:28 +0000
Subject: Re: Powerfail-tests and jffs2-sync-mount
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Schlaegl Manfred jun." <manfred.schlaegl@gmx.at>
In-Reply-To: <1204875955.3476.13.camel@lisa.alm.archives.at>
References: <1204821719.3426.33.camel@lisa.alm.archives.at>
	<1204870246.23706.53.camel@sauron>
	<1204875955.3476.13.camel@lisa.alm.archives.at>
Content-Type: text/plain; charset=utf-8
Date: Fri, 07 Mar 2008 10:09:36 +0200
Message-Id: <1204877376.23706.73.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-03-07 at 08:45 +0100, Schlaegl Manfred jun. wrote:
> > > Now my question: Are there any non-obvious disadvantages, mounting jf=
fs2
> > > synchronal, except lower speed and a little(depends on usage) decreas=
ed
> > > flash-life-time (wear-out), or is this anyway the default approach?
> >=20
> > My understanding of the things is that this should not really matter. I
> > thought if you have some corruption in asynchronous mode, you should
> > have them in synchronous too, may its worth trying more synchronous mod=
e
> > testing?
> >=20
> I thought it's a matter of file-buffers between the file-operations and
> jffs2, but these buffer should be flushed on close of the file, so there
> should be no problem with echo.
> I think i've to take a look on vfs, perhaps there is some buffering, or
> (even worst) some reodering of actions.

Actually JFFS2 is synchronous from VFS's point of view. It does not have
write back for pages and inodes, and every time VFS asks to write
something, JFFS2 just writes straight away, without any postponing.

But, JFFS2 has its small internal buffer. Design-wise, it sits somewhere
at the bottom level of JFFS2, just before the I/O level.

The buffer (so-called write-buffrer) has size equivalent to NAND page
size. I think it is 2048 bytes in your case. All writes go to this
buffer, and when it becomes full, it is flushed to the flash. This is a
optimization which makes sure JFFS2 does not waste too much space,
because without the buffer it would waste space up to the next NAND page
on each write.

Thus, when you mount the FS with -a sync, it should flush the write
buffer every time before returning to user-space.

So, basically, returning to your original question - there should not be
too much difference, but I'd expect synchronous mode to be slower. E.g.,
compare:

time dd if=3D/dev/zero of=3Dfile
time tar -xf many_small_files_inside.tar

on sync and async mounts.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
