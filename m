Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K38S3-0006CF-Qp
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 11:43:48 +0000
Date: Mon, 2 Jun 2008 13:43:40 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: big flash disks?
Message-ID: <20080602114339.GB21359@logfs.org>
References: <20080601184239.GA11135@shareable.org>
	<20080602072842.GB19219@logfs.org>
	<20080602104106.GC31032@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080602104106.GC31032@shareable.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2008 11:41:06 +0100, Jamie Lokier wrote:
> 
> Won't you get essentially the same by creating a single file on LogFS,
> and using it for a loopback mount?

In a broad sense, yes.  Drawbacks of this setup are the usual ones of
loop plus a deeper tree for logfs.  Instead of having a single 'file'
with indirect blocks, you also have the inode file with indirect blocks.
So for every sync, another couple of writes are necessary that don't
give you any gains in such a setup.

> Sure, it's more complicated under the hood than a stripped-down LogFS,
> but will it behave and perform similarly?

With plenty of memory and sync being a sufficiently rare event, it
might.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
