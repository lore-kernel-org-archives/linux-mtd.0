Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3azq-00040J-C4
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 18:12:34 +0000
Date: Tue, 3 Jun 2008 20:12:26 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: big flash disks?
Message-ID: <20080603181226.GF1224@logfs.org>
References: <20080601184239.GA11135@shareable.org>
	<20080602072842.GB19219@logfs.org>
	<20080602104106.GC31032@shareable.org>
	<20080602114339.GB21359@logfs.org>
	<20080602124822.GB2679@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080602124822.GB2679@shareable.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2008 13:48:22 +0100, Jamie Lokier wrote:
> 
> The basic idea is for a pointer in a tree node to point not to one
> child, but to a small set of potential children.  The child-set are a
> journal in the jffs2 sense.  When reading, you read each block of the
> child-set, and pick the most recent.  This slows down reading, but
> reduces the amount of writing.  You still read in O(log tree_size)
> blocks, and since most of the extra reads are hot-cache internal tree
> blocks, the amount of extra reading is quite small.  Child-sets can
> overlap to reduce storage duplication, at cost of more operations -
> it's a heuristic balancing act.  Child-sets are not used for all tree
> nodes, especially data.  They can be invoked and destroyed dynamically
> using heuristics to detect some parts of the tree undergoing lots of
> write+sync sequences and others being coalescable writes or not
> written.

This is actually a good explanation of the logfs journal. :)

Jörn

-- 
All art is but imitation of nature.
-- Lucius Annaeus Seneca
