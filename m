Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JrQb1-0005oU-3S
	for linux-mtd@lists.infradead.org; Thu, 01 May 2008 04:40:39 +0000
Date: Thu, 1 May 2008 14:40:27 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080501044027.GA26541@cloud.net.au>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
Cc: dwmw2@infradead.org, joern@logfs.org, linux-mtd@lists.infradead.org,
	tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 30, 2008 at 01:13:24PM +0100, Alexey Korolev wrote:
> This patch enables NAND subpage read functionality. 
[..]
> As I know some of you already use this feature. I would be much
> appreciate if you give me some performance numbers. It may assist to get this
> feature included. 

To attach my 512Mb NAND with UBI, with software NAND controller
(plat_nand), on a 533MHz IXP4xx, I measure:

No partial reads: 5.75 seconds
Previous partial read patch: 2.72 seconds
New subpage read patch: 2.42 seconds

Very fine. Thanks.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
