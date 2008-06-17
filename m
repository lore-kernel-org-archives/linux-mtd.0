Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8eKM-0002EH-Nc
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 16:46:39 +0000
Date: Tue, 17 Jun 2008 18:46:29 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080617164629.GG28448@logfs.org>
References: <20080616.233222.112854616.anemo@mba.ocn.ne.jp>
	<20080617152932.GD28448@logfs.org>
	<20080618.005735.51867626.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080618.005735.51867626.anemo@mba.ocn.ne.jp>
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

On Wed, 18 June 2008 00:57:35 +0900, Atsushi Nemoto wrote:
> 
> > Odd.  And the second loop should go backwards as long as the
> > eraseregions are part of the current partition.  Which means that
> > 	i < master->numeraseregions
> > doesn't make sense at all and
> > 	slave->offset + slave->mtd.size > regions[i].offset
> > would imply that eraseregions go backwards.
> 
> No, the second loop go forwards.  It searches maximum erasesize of the
> partition.

Indeed, it does.  And if I change the order in the conditions, those
make sense even to me.  Hm.

But what purpose does the 'i--' serve?  Why would we want to check an
eraseregion _before_ the start of the partition?

Next, you could simply add code like this below the second loop:
	/* In case no eraseregion matched. */
	if (slave->mtd.erasesize == 0)
		slave->mtd.erasesize = master->erasesize;

But under which conditions would we ever run into this?  It appears as
if those conditions would be better served with either 'BUG();' or
'return -EINVAL;'.

I am still rather confused by all this.

Jörn

-- 
...one more straw can't possibly matter...
-- Kirby Bakken
