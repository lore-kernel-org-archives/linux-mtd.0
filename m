Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JyB1R-0003ZK-VY
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 19:27:50 +0000
Date: Mon, 19 May 2008 21:27:39 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Chris Malley <mail@chrismalley.co.uk>
Subject: Re: [PATCH] [MTD] CORE: Use list_for_each_entry[_safe] where
	appropriate (3rd attempt)
Message-ID: <20080519192739.GC32679@logfs.org>
References: <1211046845.17244.19.camel@localhost>
	<20080517194914.GA21674@logfs.org>
	<1211139433.19435.19.camel@localhost>
	<20080519113858.GB32679@logfs.org>
	<1211224310.7343.2.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1211224310.7343.2.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 May 2008 20:11:50 +0100, Chris Malley wrote:
> 
> [MTD] CORE: Use list_for_each_entry[_safe] where appropriate.
> 
> Janitorial work to remove temporary pointers and make some functions a bit
> more readable.
> 
> Signed-off-by: Chris Malley <mail@chrismalley.co.uk>
> Reviewed-By: Joern Engel <joern@logfs.org>

Excellent, thanks!

Jörn

-- 
Data dominates. If you've chosen the right data structures and organized
things well, the algorithms will almost always be self-evident. Data
structures, not algorithms, are central to programming.
-- Rob Pike
