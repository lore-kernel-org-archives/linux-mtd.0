Received: from nz-out-0506.google.com ([64.233.162.225])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IlWJs-0002NO-B0
	for linux-mtd@lists.infradead.org; Fri, 26 Oct 2007 22:02:18 +0100
Received: by nz-out-0506.google.com with SMTP id z3so822720nzf
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Oct 2007 14:02:05 -0700 (PDT)
Message-ID: <79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
Date: Fri, 26 Oct 2007 16:02:04 -0500
From: Duke <ezbonites@gmail.com>
To: "Jamie Lokier" <jamie@shareable.org>
Subject: Re: jffs2: too few erase blocks
In-Reply-To: <79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
	<20071025092225.410ca383@weaponx.rchland.ibm.com>
	<20071025221553.GA29785@mail.shareable.org>
	<79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/26/07, Duke <ezbonites@gmail.com> wrote:
> On 10/25/07, Jamie Lokier <jamie@shareable.org> wrote:
> > Josh Boyer wrote:
> > > > Hi All,
> > > > What's the deal with "too few erase blocks" message?
> > > > Is one block too few for a jffs2 partition?
> > > > My block size if 256K and I created a small jffs2 256K partition for
> > > > read/writing.
> > > > Is this really too small for jffs2? If so, is there anything I can do for this?
> > >
> > > Yes, it's too small.  JFFS2 requires a certain percentage of blocks in
> > > the partition to be reserved for it's usage.  At one point, it was 5
> > > eraseblocks.
> >
> > Fwiw, 5 blocks worth of free space is no guarantee that it'll be fine.
> > I have a 1MB JFFS2 partition with 64kB eraseblocks.  That's 320kB in 5
> > blocks.  But it can return disk full errors when reporting more than
> > 320kB free with 'df' (somewhere between 5 and 6 blocks worth), and it
> > can also do strange things shortly before it returns disk full errors,
> > like spending lots of CPU on GC.
>
> Is there another read/write filesystem I can use in this space?
>
> If I were to create a subdirectory and rw to that dir only? and can I
> do this with mtd_debug tool?

Just to clarity myself a bit here. There is nothing stopping me from
using the cp or mv (or any other file modification command for that
matter) to update one directory but I would like to be able to verify
the data is actually written and I thought perhaps mtd_debug or some
other mtd tool might be able to verify this. Maybe it's not maybe it
is, I would like to find out.
Thanks.
-D
