Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K91eK-0000ar-UA
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 17:40:49 +0000
Date: Wed, 18 Jun 2008 19:40:34 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080618174034.GA10271@logfs.org>
References: <20080617152932.GD28448@logfs.org>
	<20080618.005735.51867626.anemo@mba.ocn.ne.jp>
	<20080617164629.GG28448@logfs.org>
	<20080618.111907.60384971.nemoto@toshiba-tops.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080618.111907.60384971.nemoto@toshiba-tops.co.jp>
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

On Wed, 18 June 2008 11:19:07 +0900, Atsushi Nemoto wrote:
> 
> The decrement is there because when the first loop stoped 'i' points
> the second region in the partition.

Finally even I understand that code.  Thank you for your patience.

> Putting 'goto somewhere' or 'slave->mtd.erasesize = master->erasesize'
> in the above 'if' block can be an alternative fix.

That seems a better idea.

Jörn

-- 
A defeated army first battles and then seeks victory.
-- Sun Tzu
