Received: from xi.wantstofly.org ([80.101.37.227])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LW6nP-0006fP-JF
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2009 10:21:54 +0000
Date: Sun, 8 Feb 2009 11:21:47 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [PATCH] [MTD] NAND: add ts7xxx driver
Message-ID: <20090208102147.GL13433@xi.wantstofly.org>
References: <20090208085919.GD11872@woodchuck>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090208085919.GD11872@woodchuck>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 08, 2009 at 08:59:19AM +0000, Alexander Clouter wrote:

> This patch adds support for the NAND found in Technologic Systems ARM
> boards[1].  The platform specific parts (IO address and parititoning
> schemes) have been moved into platform specific files whilst the driver
> it's self can be used as a complete replacement for the ts7250 NAND
> driver.

Why don't you morph the ts7250 into the form you want instead of adding
a parallel driver for the same thing?
