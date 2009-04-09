Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lryex-0005rC-5J
	for linux-mtd@lists.infradead.org; Thu, 09 Apr 2009 18:07:38 +0000
Date: Thu, 9 Apr 2009 19:07:24 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Doug Graham <dgraham@nortel.com>
Subject: Re: mtdblock caching and syncing
Message-ID: <20090409180724.GG14196@shareable.org>
References: <20090409141556.GG15952@nortel.com>
	<20090409145100.GB7538@yoda.jdub.homelinux.org>
	<20090409160247.GI15952@nortel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090409160247.GI15952@nortel.com>
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Doug Graham wrote:
> > The device in question isn't the flash.  It's the mtdblock device.  So
> > fsync semantics are preserved.  This is the same as writing to a file
> > on a hard drive, calling fsync, and having it sit in the hard drive's
> > cache.
> 
> That's a good point, and one I've wondered about before.  I don't know
> much about how hard drives manage their cache, but I would assume that
> they don't leave dirty data in their cache for an unbounded period
> of time.  I'd guess that data is written to the actual disk within a
> few 10s of milliseconds after being sent to the device.

Ideally, fsync() should flush data from a hard drive's cache too.

-- Jamie
