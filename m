Received: from xi.wantstofly.org ([80.101.37.227])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KyMUj-00045a-4k
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 08:15:05 +0000
Date: Fri, 7 Nov 2008 09:15:02 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Jens Gehrlein <Jens.Gehrlein@tqs.de>
Subject: Re: CFI: major/minor number check?
Message-ID: <20081107081502.GE32552@xi.wantstofly.org>
References: <47F3F98010FF784EBEE6526EAAB078D103AC7274@tq-mailsrv.tq-net.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47F3F98010FF784EBEE6526EAAB078D103AC7274@tq-mailsrv.tq-net.de>
Cc: linux@ddcrew.com, dirk@upexia.nl, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 29, 2008 at 04:50:05PM +0100, Jens Gehrlein wrote:

> Why does the MTD driver check the major and minor version
> in the CFI primary extended table of AMD Flashes?
> 
> We have a Samsung K8P2815UQB NOR-Flash supporting AMD
> command set 0x2, but returns Major.Minor = 0.0
> Thus, the kernel does not accept the device by reporting
> "Unknown Amd/Fujitsu Extended Query version 0.0."

I don't know the answer to this question, but I noticed that the
"SAMSUNG SAMSUNG_FID_K8D6316T" (as found in the Linksys wrt350n v2
router) also trips this version number check.
