Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3axG-0000vS-Dg
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 18:09:54 +0000
Date: Tue, 3 Jun 2008 20:09:44 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: big flash disks?
Message-ID: <20080603180944.GE1224@logfs.org>
References: <20080601184239.GA11135@shareable.org>
	<1212386359.31023.154.camel@sauron>
	<20080602082346.GB20259@logfs.org>
	<20080602104330.GD31032@shareable.org>
	<20080602115538.GC21359@logfs.org>
	<20080602123217.GA2679@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080602123217.GA2679@shareable.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2008 13:32:18 +0100, Jamie Lokier wrote:
> 
> If they can do 4k writes, and you cannot, it sounds like the SSDs you
> have used are very different to the SSDs they have used.  Is that
> right?

It isn't.  Their SSDs have shitty performance for 4k random writes.
That's the entire point of their product.  They reorder the data,
turning random 4k writes into aligned eraseblock-sized writes.  After
that reordering the performance goes way up.  Iirc at least one SSD they
used must have 1MB erasesize to explain the performance boost.

Jörn

-- 
Audacity augments courage; hesitation, fear.
-- Publilius Syrus
