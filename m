Subject: Re: [PATCH] physmap: Fix leak of memory returned by
	parse_mtd_partitions
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0811120808p5858d5adleeef43b1d374bee1@mail.gmail.com>
References: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
	<20081113.005534.56563769.anemo@mba.ocn.ne.jp>
	<8bd0f97a0811120808p5858d5adleeef43b1d374bee1@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 18 Nov 2008 13:57:27 +0000
Message-Id: <1227016647.27728.398.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-11-12 at 11:08 -0500, Mike Frysinger wrote:
> i wonder why we duplicate this same code block in so many places.  and
> why does every driver have to declare its own list of parsers ?  cant
> we unify all of these in one place ?

Well, most boards only really want _one_ partition type; maybe two. And
the probes can be quite expensive and have false positives, so we don't
want to be doing all the probes for all devices.

It might make sense to just pass a bitmask indicating which partition
probes to use. Assuming we can agree on an ordering, that is :)

Another complication is that some boards have registered the whole
device first, while others have just registered the partitions.

I suspect it might be better to take the simple bug-fix approach for
now, given that we are planning a revamp of the MTD core API anyway --
we can redo partitions properly at the point, so they aren't just an
evil hack.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
