Received: from mail.shareable.org ([81.29.64.88])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1ImcKJ-0002xH-5H
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 17:39:21 -0400
Date: Mon, 29 Oct 2007 20:51:25 +0000
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: jffs2: too few erase blocks
Message-ID: <20071029205125.GA27773@mail.shareable.org>
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
	<20071025092225.410ca383@weaponx.rchland.ibm.com>
	<20071025221553.GA29785@mail.shareable.org>
	<79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<79ac09b60710261402h3cf9dfa5o1ce9e33e5468d742@mail.gmail.com>
	<20071028180223.GB14076@mail.shareable.org>
	<1193626747.2915.87.camel@shinybook.infradead.org>
	<20071029143818.GA29885@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071029143818.GA29885@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Duke <ezbonites@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Sun, 28 October 2007 22:59:07 -0400, David Woodhouse wrote:
> > 
> > Yes, it does. In fact, on NOR flash you get entirely synchronous
> > behaviour even _without_ explicit syncs -- effectively the same as
> > MS_SYNC.
> 
> On older ones.  There appears to be a tendency for newer flashes to
> require wbuf and hence sync.

When you say "sync", do fdatasync() / fsync() on open files and
directories flush the necessary blocks from wbuf for those
files/directories data and their inode metadata, for JFFS2?

I have been calling sync(), but I wonder if fdatasync/fsync do as they
are supposed to?

(If you know about other fses like LogFS/Yaffs/UBIFS that would be
handy, too).

Probably all are unnecessary in my specific application, as I use a
JFFS2 with cfi_cmdset_0002, which I get the impression doesn't buffer
any writes anyway.  But I like to get the application code right, in
case I change to another device.

-- Jamie
