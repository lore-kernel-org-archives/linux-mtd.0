Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K37Te-0003On-Tz
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 10:41:23 +0000
Date: Mon, 2 Jun 2008 11:41:06 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: big flash disks?
Message-ID: <20080602104106.GC31032@shareable.org>
References: <20080601184239.GA11135@shareable.org>
	<20080602072842.GB19219@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080602072842.GB19219@logfs.org>
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
> Basically they create a log-structured block device.  For a while I've
> been thinking of doing the same, essentially strip logfs down to a
> single file, which gets a block device interface.  Removing all the
> filesystem complexities (atomic create/unlink/rename, interactions with
> vfs and mm, etc.) makes the project a _lot_ simpler.  I'm nor surprised
> they have a usable product already.
> 
> I decided against it, because I don't believe it to be the best approach
> long-term.  One of the disadvantages is that block devices have
> relatively little knowledge about caching constraints.  A filesystem can
> easily have gigabytes of dirty data around, where a block device is
> expected to return success for every single write in a reasonable
> timeframe, usually measures in milliseconds.

Won't you get essentially the same by creating a single file on LogFS,
and using it for a loopback mount?

Sure, it's more complicated under the hood than a stripped-down LogFS,
but will it behave and perform similarly?

-- Jamie
