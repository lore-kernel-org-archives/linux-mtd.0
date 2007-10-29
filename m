Received: from mail.shareable.org ([81.29.64.88])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1ImeCP-0001Tn-T8
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 19:39:20 -0400
Date: Mon, 29 Oct 2007 22:46:38 +0000
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: jffs2: too few erase blocks
Message-ID: <20071029224638.GA7122@mail.shareable.org>
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
	<20071025092225.410ca383@weaponx.rchland.ibm.com>
	<20071025221553.GA29785@mail.shareable.org>
	<79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
	<20071028180223.GB14076@mail.shareable.org>
	<1193626747.2915.87.camel@shinybook.infradead.org>
	<20071029143818.GA29885@lazybastard.org>
	<20071029205125.GA27773@mail.shareable.org>
	<20071029215457.GB1027@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071029215457.GB1027@lazybastard.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Josh Boyer <jwboyer@gmail.com>,
	linux-mtd@lists.infradead.org, Duke <ezbonites@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> fsync/fdatasync should work on logfs.  If you know a good way to test
> this, I'd add it to my suite of regression tests.  Right now I have to
> rely on reading the code.

Here's an idea for testing:

    1. Open file w/O_CREAT|O_EXCL, write some data, then after write()
       returns, immediately force the MTD device read-only somehow (so
       anything not committed cannot be committed after this point).
       Then unmount and mount, and read the file.  Then open the file:
       either it should't exist, or the written data shouldn't be
       present, if buffering is working.

    2. If the file doesn't exist in test 1, call fsync() after opening
       the file and before writing, and also call fsync() on the
       directory containing the created file.  Afterwards, the file
       should exist, but not contain the written data.

    3. Variation: create file, write data, then fsync(), then
       overwrite with new data (not changing the length).  Afterwards,
       the read data should be the first written data, not the second.

    4. Same as tests 1, 2 and 3, but call fsync() after writing.  This
       time, the written data should always be read back.  This tests
       that fsync() makes a difference.

    5. Same as test 3, but call fdatasync() instead of fsync().  The
       second written data should always be read back.

    6. Create the file, set modtime to some fixed time A, call
       fsync(), set modtime to fixed time B, then set MTD read-only,
       unmount, mount.  stat() the file: you might get time A.

    7. As test 6, but call fsync() following the second setting of
       modtime.  Afterwards, stat() should return time B, proving that
       fsync() commits the inode change.

    8. As test 7 but using fdatasync(): if it is really different from
       fsync(), you should get time A the same as test 6.

    9. I'm not sure if fdatasync() is required to update the length of
       a file, when the file is extended by write() or ftruncate().

    10. Variations on the above involving small writes, large writes,
       and scattered writes.

    10. fsync() tests on a directory involve doing changes to
       directories (changing the modtime, and
       creating/linking/unlinking/renaming in them) and checking the
       name change after marking the MTD device read-only and
       unmounting + mount.  Quite similar to the above tests, but
       using directory operations.  I'm not sure if fdatasync() has
       any meaning for directories (indeed I'm not sure if fsync()
       does formally).

> > Probably all are unnecessary in my specific application, as I use a
> > JFFS2 with cfi_cmdset_0002, which I get the impression doesn't buffer
> > any writes anyway.  But I like to get the application code right, in
> > case I change to another device.
> 
> Any filesystem should follow the standards here.  Anything else is a
> bug.

True.  But JFFS2 is a bit buggy from an application point of view (*),
and we care about what an application can actually rely on in
practice, not what the standard says :-)

(*) Hence the subject of this thread, and the uncertainty of the
answer to that question.  Do any of the flash filesystems in
development guarantee a specific amount of the partition can actually
be used for data, and return "disk full" deterministically at that
point, for a given set of file contents?  Does the answer change if
compression is disable?  Do any of them not go suspiciously crazy with
the CPU for a whole minute when it's nearly full, as JFFS2 GC threads
do occasionally?  I see lots of nice things in the white papers about
the new fses, but GC problems, and the amount of space required, seems
curiously glossed over.  Does this mean they're fixed?  I have been
bitten hard by these areas of JFFS2.  It wasn't pretty.

Thanks :-)
-- Jamie
