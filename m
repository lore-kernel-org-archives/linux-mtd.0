Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3bgq-0007FP-I1
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 18:57:00 +0000
Date: Tue, 3 Jun 2008 19:56:59 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: big flash disks?
Message-ID: <20080603185659.GB6899@shareable.org>
References: <20080601184239.GA11135@shareable.org>
	<20080602072842.GB19219@logfs.org>
	<20080602104106.GC31032@shareable.org>
	<20080602114339.GB21359@logfs.org>
	<20080602124822.GB2679@shareable.org>
	<20080603181226.GF1224@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080603181226.GF1224@logfs.org>
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
> On Mon, 2 June 2008 13:48:22 +0100, Jamie Lokier wrote:
> > 
> > The basic idea is for a pointer in a tree node to point not to one
> > child, but to a small set of potential children.  The child-set are a
> > journal in the jffs2 sense.  When reading, you read each block of the
> > child-set, and pick the most recent.  This slows down reading, but
> > reduces the amount of writing.  You still read in O(log tree_size)
> > blocks, and since most of the extra reads are hot-cache internal tree
> > blocks, the amount of extra reading is quite small.  Child-sets can
> > overlap to reduce storage duplication, at cost of more operations -
> > it's a heuristic balancing act.  Child-sets are not used for all tree
> > nodes, especially data.  They can be invoked and destroyed dynamically
> > using heuristics to detect some parts of the tree undergoing lots of
> > write+sync sequences and others being coalescable writes or not
> > written.
> 
> This is actually a good explanation of the logfs journal. :)

Oh.  Great, cheers.  Great minds think alike :-)

If that's the logfs journal - why would extra static tree depth near
the root add any write-commit overhead as you said in the grandparent
post? :-)

(Btw, I thought a difference between logfs and ubifs is the latter
does async writes?  Or do they both?)

-- Jamie
