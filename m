Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8d7w-0003GP-P4
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 15:29:45 +0000
Date: Tue, 17 Jun 2008 17:29:32 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080617152932.GD28448@logfs.org>
References: <20080616.233222.112854616.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080616.233222.112854616.anemo@mba.ocn.ne.jp>
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

On Mon, 16 June 2008 23:32:22 +0900, Atsushi Nemoto wrote:
> 
>  
> -			for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
> +			i--;
> +			slave->mtd.erasesize = regions[i].erasesize;
> +			for (; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
>  				if (slave->mtd.erasesize < regions[i].erasesize) {
>  					slave->mtd.erasesize = regions[i].erasesize;
>  				}

While this patch appears to work, I still don't like it.  Before the
patch, the whole function is simply a mess.  After your patch, it looks
even worse and becomes almost impossible to understand.  So while you
are fixing a bug today, the very next change may introduce a new bug
simply because whoever makes the change doesn't understand the code.

At least I have a hard enough time understanding it today.  The first
loop seems to look for the last eraseregion that is part of the current
partition.  Why then it should check for
	slave->offset + slave->mtd.size > regions[i].offset
instead of 
	slave->offset >= regions[i].offset

Odd.  And the second loop should go backwards as long as the
eraseregions are part of the current partition.  Which means that
	i < master->numeraseregions
doesn't make sense at all and
	slave->offset + slave->mtd.size > regions[i].offset
would imply that eraseregions go backwards.

In other words, I am tempted to replace all that with a single line:
	BUG();

At least that line is short and descriptive.  Otherwise it seems to be
roughly equivalent of what we had before.

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
