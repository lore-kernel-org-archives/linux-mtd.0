Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K23IK-0006xr-SG
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 12:01:17 +0000
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
From: Artem Bityutskiy <dedekind@infradead.org>
To: KeunO Park <lastnite@gmail.com>
In-Reply-To: <5ed5c4730805300015o4f757dcbn394c770c2f92566a@mail.gmail.com>
References: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
	<1212129223.31023.106.camel@sauron>
	<5ed5c4730805300015o4f757dcbn394c770c2f92566a@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 30 May 2008 15:02:22 +0300
Message-Id: <1212148942.31023.135.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-05-30 at 16:15 +0900, KeunO Park wrote:
> > Yes, yaffs, jffs2 are "special" class of file-systems and they were not
> > designed to be what you call "mass storage class func". They should
> > rather be used as root file system on "internal" flash, which is smalle=
r
> > than "mass memory", where you store your core libraries, etc.
> >
> >> yaffs2
> >> write: 10.20s, 12.09s, 12.24s avg:11.51s (868KB/s)
> >> load avg right after copy&sync: 0.03 -> 0.11
> >>
> >> ubifs (LZO)
> >> write: 14.45s, 14.40s, 14.45s avg:14.43s (693KB/s)
> >> load avg right after copy&sync: 0.03 -> 0.53
> >>
> >> ubifs (ZLIB)
> >> write : 27.17s, 27.18s, 27.21s avg:27.18 (367KB/s)
> >> load avg right after copy&sync: 0.03 -> 0.80
> >>
> >> ubifs (No Compression)
> >> write: 6.69s, 10.90s, 10.98s avg:9.52s (1050KB/s)
> >> load avg right after copy&sync: 0.03 -> 0.43
> > We beat yaffs2? Sounds nice :-)
>=20
> according to the above result(and only with no compressor option :-), yes=
.
> but, I think that load avg result is too much higher than yaffs2's.

So what you do is you write a large file, this does not go to the flash
but instead sits in the kernel buffers, in the page cache, then you call
fsync() which causes _massive_ page-cache write-back (flushing) and
consume a lot of CPU.


Yaffs2 is synchronous, so you cannot compare it with UBIFS like this.
Make your test file synchronous then compare. With synchronous file you
will end up with much slower write speed, but sync will not cause sudden
CPU usage peaks, everything will be smoother.

I think opening the file with O_SYNC should do the work. Or chattr +s
should do. Or mount ubifs with -o sync flag to make everything
synchronous, but then everything should become slow as well.

> For example, camera or camcorder application in mobile devices need to wr=
ite
> the encoded display data steadily to NAND. so because of the high load av=
g,

The application should be clever enough to be aware of file buffering
and use fsync() after writing some amount of data. Or make the file
synchronous. Or assign lower priority to the camera task.

> so I wanna more light ubi.

It's not about UBI, it is about UBIFS I think, namely about the
buffering. You should be aware of this and be careful with this.

UBIFS fast write speed is not magic. It is because we cache stuff and
postpone writing, which is a well known and nice optimization. In some
situation this may be undesirable, though. So UBIFS is more complex than
yaffs and jffs2 in this respect. The applications which work with UBIFS
should be more clever and the programmers should be aware of stuff like
this:

$ man 2 write:
...
"A  successful return from write() does not make any guarantee that data
has been committed to disk.  In fact, on some buggy implementations, it
does not even guarantee that space has successfully been reserved for
the data.  The only way to be sure is to call fsync(2) after you are
done writing all your data."

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
