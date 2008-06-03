Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3bUk-0004YZ-Pk
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 18:44:31 +0000
Date: Tue, 3 Jun 2008 19:44:29 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: big flash disks?
Message-ID: <20080603184428.GA6899@shareable.org>
References: <20080601184239.GA11135@shareable.org>
	<1212386359.31023.154.camel@sauron>
	<20080602082346.GB20259@logfs.org>
	<20080602104330.GD31032@shareable.org>
	<20080602115538.GC21359@logfs.org>
	<20080602123217.GA2679@shareable.org>
	<20080603180944.GE1224@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080603180944.GE1224@logfs.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Mon, 2 June 2008 13:32:18 +0100, Jamie Lokier wrote:
> > 
> > If they can do 4k writes, and you cannot, it sounds like the SSDs you
> > have used are very different to the SSDs they have used.  Is that
> > right?
> 
> It isn't.  Their SSDs have shitty performance for 4k random writes.
> That's the entire point of their product.  They reorder the data,
> turning random 4k writes into aligned eraseblock-sized writes.  After
> that reordering the performance goes way up.  Iirc at least one SSD they
> used must have 1MB erasesize to explain the performance boost.

Yes, they reorder - he says as much, that traditional filesystems
perform very poorly.

But he quites a high write IOP rate, which is sometimes taken to mean
a high rate of database commits (e.g. fsync).  That can't be done with
eraseblock-sized writes.

If it's not high commit rate, then the quoted IOP rate is misleading
because you can do the same reordering thing with hard disks to get a
high write rate.  (Albeit hard disks suffer from random reads more if
ordering writes disorders reads).

If you think it's just reordering, not committing each 4k write one
after the other quickly, I'll ask him about it.

-- Jamie
