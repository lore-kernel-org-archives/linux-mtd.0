Received: from py-out-1112.google.com ([64.233.166.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K24Dy-0006Ep-FP
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 13:00:50 +0000
Received: by py-out-1112.google.com with SMTP id a73so3459032pye.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 May 2008 06:00:49 -0700 (PDT)
Message-ID: <5ed5c4730805300600v33e9c2d1hada32b24953cfaf7@mail.gmail.com>
Date: Fri, 30 May 2008 22:00:40 +0900
From: "KeunO Park" <lastnite@gmail.com>
To: dedekind@infradead.org
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
In-Reply-To: <1212149102.31023.138.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
	<1212129223.31023.106.camel@sauron>
	<5ed5c4730805300015o4f757dcbn394c770c2f92566a@mail.gmail.com>
	<1212148942.31023.135.camel@sauron>
	<1212149102.31023.138.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/5/30, Artem Bityutskiy <dedekind@infradead.org>:
> On Fri, 2008-05-30 at 15:02 +0300, Artem Bityutskiy wrote:
> > On Fri, 2008-05-30 at 16:15 +0900, KeunO Park wrote:
> > > > Yes, yaffs, jffs2 are "special" class of file-systems and they were not
> > > > designed to be what you call "mass storage class func". They should
> > > > rather be used as root file system on "internal" flash, which is smaller
> > > > than "mass memory", where you store your core libraries, etc.
> > > >
> > > >> yaffs2
> > > >> write: 10.20s, 12.09s, 12.24s avg:11.51s (868KB/s)
> > > >> load avg right after copy&sync: 0.03 -> 0.11
> > > >>
> > > >> ubifs (LZO)
> > > >> write: 14.45s, 14.40s, 14.45s avg:14.43s (693KB/s)
> > > >> load avg right after copy&sync: 0.03 -> 0.53
> > > >>
> > > >> ubifs (ZLIB)
> > > >> write : 27.17s, 27.18s, 27.21s avg:27.18 (367KB/s)
> > > >> load avg right after copy&sync: 0.03 -> 0.80
> > > >>
> > > >> ubifs (No Compression)
> > > >> write: 6.69s, 10.90s, 10.98s avg:9.52s (1050KB/s)
> > > >> load avg right after copy&sync: 0.03 -> 0.43
> > > > We beat yaffs2? Sounds nice :-)
> > >
> > > according to the above result(and only with no compressor option :-), yes.
> > > but, I think that load avg result is too much higher than yaffs2's.
> >
> > So what you do is you write a large file, this does not go to the flash
> > but instead sits in the kernel buffers, in the page cache, then you call
> > fsync() which causes _massive_ page-cache write-back (flushing) and
> > consume a lot of CPU.
>
> But I have to add that of course, YAFFS/JFFS2 are more light-weight
> file-system, because they do not maintain the FS index on the flash
> media. UBIFS does and this costs extra CPU cycles and extra I/O.
>

actually I did write & fsync the file during test. :-)
anyway thank you for your comment.

regards,
KeunO Park.
