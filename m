Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K9FS9-0000Au-Kn
	for linux-mtd@lists.infradead.org; Thu, 19 Jun 2008 08:25:10 +0000
Date: Thu, 19 Jun 2008 10:24:54 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080619082454.GJ10271@logfs.org>
References: <20080618.111907.60384971.nemoto@toshiba-tops.co.jp>
	<20080618174034.GA10271@logfs.org>
	<20080618175253.GD10271@logfs.org>
	<20080619.160938.108184127.nemoto@toshiba-tops.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080619.160938.108184127.nemoto@toshiba-tops.co.jp>
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 19 June 2008 16:09:38 +0900, Atsushi Nemoto wrote:
> On Wed, 18 Jun 2008 19:52:53 +0200, Jörn Engel <joern@logfs.org> wrote:
> 
> > +		err = add_one_partition(master, parts + i, i, cur_offset);
> > +		if (err)
> > +			return err;
> > +		slave = PART(parts[i].mtdp);
> > +		cur_offset = slave->offset + slave->mtd.size;
> 
> This should be 'slave = PART(*parts[i].mtdp)', but anyway you cannot
> dereference mtdp while it can be NULL.
> 
> Other parts of your patchset are very good for me.  Thanks.
> 
> This is my quick fix on top of your patchset.  Please fold this (or
> your own fix) into first patch.

Much better.  I was thinking about the same thing while doing the
patches, but for some reason forgot about it again.

Do you want me to push the patchset?  And would you be willing to add a
tested-by: or so?

Jörn

-- 
The key to performance is elegance, not battalions of special cases.
-- Jon Bentley and Doug McIlroy
