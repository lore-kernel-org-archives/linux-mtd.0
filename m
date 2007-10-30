Received: from nz-out-0506.google.com ([64.233.162.234])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1ImxNp-0007hT-Ls
	for linux-mtd@lists.infradead.org; Tue, 30 Oct 2007 16:08:23 -0400
Received: by nz-out-0506.google.com with SMTP id z3so1403022nzf
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 Oct 2007 13:08:13 -0700 (PDT)
Message-ID: <79ac09b60710301308m294ae82m79e6ee982208ca35@mail.gmail.com>
Date: Tue, 30 Oct 2007 15:08:11 -0500
From: Duke <ezbonites@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: jffs2: too few erase blocks
In-Reply-To: <20071030160948.GD13455@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20071025092225.410ca383@weaponx.rchland.ibm.com>
	<79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
	<20071028180223.GB14076@mail.shareable.org>
	<1193626747.2915.87.camel@shinybook.infradead.org>
	<20071029143818.GA29885@lazybastard.org>
	<20071029205125.GA27773@mail.shareable.org>
	<20071029215457.GB1027@lazybastard.org>
	<20071029224638.GA7122@mail.shareable.org>
	<20071030160948.GD13455@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	Jamie Lokier <jamie@shareable.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/30/07, J=F6rn Engel <joern@logfs.org> wrote:
> On Mon, 29 October 2007 22:46:38 +0000, Jamie Lokier wrote:
> >
> > Here's an idea for testing:
> >
> > [...]
>
> Thank you.  I won't get hacking on this right away, but it is
> appreciated.
>
> > > Any filesystem should follow the standards here.  Anything else is a
> > > bug.
> >
> > True.  But JFFS2 is a bit buggy from an application point of view (*),
> > and we care about what an application can actually rely on in
> > practice, not what the standard says :-)
>
> Notice the magical word "here". :)
>
> Jffs2 and logfs do diverge from the standards, or at least from other
> filesystems.  I am aware of two differences:
> - all mounts implicitly set noatime,
> - rewriting data in existing non-sparse files can return -ENOSPC.
>
> The first makes at least some sense and the second cannot be avoided for
> compressed files.  Logfs allows files to be non-compressing, though.
> Any further differences are likely bugs.
>
> > (*) Hence the subject of this thread, and the uncertainty of the
> > answer to that question.  Do any of the flash filesystems in
> > development guarantee a specific amount of the partition can actually
> > be used for data, and return "disk full" deterministically at that
> > point, for a given set of file contents?
>
> I'm not sure if I interpret this correctly.  With logfs, compression is
> optional.  Disabling compression will remove one uncertainty.  Also both
> data and metadata draw from the same pool.  If you create a million
> empty files, the space for file content is reduced.  After those two
> uncertainties, logfs is deterministic.  Garbage collection will neither
> increase nor reduce the amount of available free space.
>
> > Does the answer change if
> > compression is disable?  Do any of them not go suspiciously crazy with
> > the CPU for a whole minute when it's nearly full, as JFFS2 GC threads
> > do occasionally?
>
> Depending on the write pattern, they all will.  When your filesystem is
> 99% full and your writes are completely random, you end up garbage
> collecting 99% old data for every 1% new data.
>
> Well, maybe they won't go crazy for a whole minute.  That can be
> avoided.  But they will become slow as molasses.
>
> Two things can be done about this.  First, logfs will let you specify
> some amount of space reserved for GC.  With 5% reserved, the
> pathological case is much better than with 1% or 0% reserved.
>
> Secondly, the applications should have some amount of structure in their
> writes.  If 70% of the filesystem is never moved, the filesystem can
> actually get some usage spread.  Having some segments 100% full and some
> 100% empty translates to good performance.  Having all equally full, as
> happens for completely random writes, will give you molasses.
>
> J=F6rn


After all is said and done, can the minimum number of jffs2 blocks be
determined? Or it varies from system to system? Or flash system type
(NOR flash in my case).

--D.
