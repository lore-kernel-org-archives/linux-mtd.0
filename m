Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O4v0W-0006Q4-R9
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2010 11:55:49 +0000
Date: Thu, 22 Apr 2010 13:55:39 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [PATCH] [MTD] Fix JFFS2 sync silent failure
Message-ID: <20100422115539.GE27309@logfs.org>
References: <20100417184016.GA17345@logfs.org>
	<20100419073843.GN27497@kernel.dk>
	<20100419101559.GA4145@logfs.org>
	<20100419102056.GS27497@kernel.dk>
	<20100422055448.GA27309@logfs.org>
	<20100422090303.GA27497@kernel.dk>
	<20100422103953.GB27497@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100422103953.GB27497@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 April 2010 12:39:53 +0200, Jens Axboe wrote:
> 
> Here's a series for fixing these. At this point they are totally
> untested except that I did compile them. Note that your analysis
> appeared correct for all cases but ocfs2, which does use get_sb_bdev()
> and hence gets ->s_bdi assigned.
> 
> You can see them here, I'll post the series soon:
> 
> http://git.kernel.dk/?p=linux-2.6-block.git;a=shortlog;h=refs/heads/for-linus
> 
> The first patch is a helper addition, the rest are per-fs fixups.

Looks good at a cursory glance.  What's still missing is some sort of
assertion.  You are a smart person and missed this problem, twice even.
Even if you hadn't, a not so smart person can add a new filesystem and
miss s_bdi, like I did.  We want some automatism to catch this.

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
