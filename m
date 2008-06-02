Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K34TM-0003RT-NH
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 07:28:53 +0000
Date: Mon, 2 Jun 2008 09:28:42 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: big flash disks?
Message-ID: <20080602072842.GB19219@logfs.org>
References: <20080601184239.GA11135@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080601184239.GA11135@shareable.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 1 June 2008 19:42:39 +0100, Jamie Lokier wrote:
> 
> Some people developing newer flash filesystems (UBIFS, Logfs,
> FAT-over-UBI :-) and interested in flash filesystem performance might
> be interested in this slashdot comment:
> 
>     http://slashdot.org/comments.pl?sid=569439&cid=23618215
> 
> They're implying that UBIFS and Logfs aren't suitable for high
> performance writes and/or large flash, and don't work well with up and
> coming flash disks either.
> 
> Also that patents may get in the way.

He has some good points, but also happens to argue in favor of his
company and against their competition.  To be served with a grain of
salt.

> I've never heard of MFT before.

Basically they create a log-structured block device.  For a while I've
been thinking of doing the same, essentially strip logfs down to a
single file, which gets a block device interface.  Removing all the
filesystem complexities (atomic create/unlink/rename, interactions with
vfs and mm, etc.) makes the project a _lot_ simpler.  I'm nor surprised
they have a usable product already.

I decided against it, because I don't believe it to be the best approach
long-term.  One of the disadvantages is that block devices have
relatively little knowledge about caching constraints.  A filesystem can
easily have gigabytes of dirty data around, where a block device is
expected to return success for every single write in a reasonable
timeframe, usually measures in milliseconds.

Jörn

-- 
Rules of Optimization:
Rule 1: Don't do it.
Rule 2 (for experts only): Don't do it yet.
-- M.A. Jackson
