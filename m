Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O4pNM-00024X-Kj
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2010 05:55:01 +0000
Date: Thu, 22 Apr 2010 07:54:48 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [PATCH] [MTD] Fix JFFS2 sync silent failure
Message-ID: <20100422055448.GA27309@logfs.org>
References: <20100417184016.GA17345@logfs.org>
	<20100419073843.GN27497@kernel.dk>
	<20100419101559.GA4145@logfs.org>
	<20100419102056.GS27497@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100419102056.GS27497@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 April 2010 12:20:56 +0200, Jens Axboe wrote:
> 
> Thanks, we definitely should have put a debug statement to catch this in
> from day 1, good debugging should be an important part of any new
> infrastructure.

Woke up early and had another look at this.  Looks like a much more
widespread problem.  Based on a quick grep an uncaffeinated brain:

9p	no s_bdi
afs	no s_bdi
ceph	creates its own s_bdi
cifs	no s_bdi
coda	no s_bdi
ecryptfs no s_bdi
exofs	no s_bdi
fuse	creates its own s_bdi?
gfs2	creates its own s_bdi?
jffs2	patch exists
logfs	fixed now
ncpfs	no s_bdi
nfs	creates its own s_bdi
ocfs2	no s_bdi
smbfs	no s_bdi
ubifs	creates its own s_bdi

I excluded all filesystems that appear to be read-only, block device
based or lack any sort of backing store.  So there is a chance I have
missed some as well.

Jörn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
