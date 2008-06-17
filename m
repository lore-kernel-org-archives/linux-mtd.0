Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8dHj-0004Dh-2V
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 15:39:51 +0000
Date: Tue, 17 Jun 2008 17:39:43 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080617153942.GE28448@logfs.org>
References: <20080616.233222.112854616.anemo@mba.ocn.ne.jp>
	<20080617152932.GD28448@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080617152932.GD28448@logfs.org>
Cc: David Woodhouse <dwmw2@infradead.org>, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 17 June 2008 17:29:32 +0200, Jörn Engel wrote:
> 
> In other words, I am tempted to replace all that with a single line:
> 	BUG();

Or maybe combine it with the else path:
	slave->mtd.erasesize = master->erasesize;
	if (master->numeraseregions > 1)
		printk(KERN_ERR"mtdpart can not handle multiple eraseregions correctly.\n");

Nemoto-san, would this be good enough for you?  It fixes the bug you
noticed, it removes most long lines and it removes the sparse warning.
It also removes functionality that may have been useful to some person -
detecting a smaller erasesize.  And with some luck and a warm easterly
wind, that functionality may even have worked.

Jörn

-- 
Maintenance in other professions and of other articles is concerned with
the return of the item to its original state; in Software, maintenance
is concerned with moving an item away from its original state.
-- Les Belady
