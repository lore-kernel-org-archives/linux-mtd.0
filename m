Received: from mail.shareable.org ([81.29.64.88])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1F9rJC-0007mY-P4
	for linux-mtd@lists.infradead.org; Thu, 16 Feb 2006 17:09:07 -0500
Date: Thu, 16 Feb 2006 22:08:54 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Charles Manning <manningc2@actrix.gen.nz>
Message-ID: <20060216220854.GA27562@mail.shareable.org>
References: <200602091126.10462.manningc2@actrix.gen.nz>
	<200602141510.12749.wolfgang.mues@auerswald.de>
	<200602161617.04905.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200602161617.04905.manningc2@actrix.gen.nz>
Cc: linux-mtd@lists.infradead.org,
	Wolfgang =?iso-8859-1?Q?M=FCes?= <wolfgang.mues@auerswald.de>
Subject: Re: Questions about NAND (double)bit errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning wrote:
> > About bad block detection: what is your oppinion about partitioning the
> > flash (the programs in a read-only partition, the data in r/w).
> 
> This gets fs specific. With YAFFS (and I assume JFFS2, but consult
> an expert), grabage collection will force read-only files to get
> rewritten occasionally.  Thus for ultimate reliability it is
> probably a GoodIdea to seperate the read-only stuff into a seperate
> partition. This is also a GoodIdea in that a smaller partition
> mounts faster (true for YAFFS and JFFS2). So if all your kernel +
> mount stuff is seperated from your rw stuff things will probably dgo
> better.

Absolutely.

I've been testing 40 devices lately, and in 2 weeks, 5 of them (out of 40)
have corrupted files in JFFS2 when those files aren't being written.
I haven't seen any errors in the ROMFS partitions.

I'm still getting round to analysing the corrupt files / filesystems,
because that failure rate is too high even for configuration files
that are written from time to time.

These are 8MB chips, so presumably NOR.

-- Jamie
