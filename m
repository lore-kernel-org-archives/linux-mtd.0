Received: from ozlabs.org ([203.10.76.45])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCNgd-0008Ot-UG
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 00:21:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <18758.62580.416920.482077@cargo.ozlabs.ibm.com>
Date: Tue, 16 Dec 2008 11:21:08 +1100
From: Paul Mackerras <paulus@samba.org>
To: Trent Piepho <tpiepho@freescale.com>
Subject: Re: [PATCH] POWERPC: MTD: Add cached map support to physmap_of MTD
	driver
In-Reply-To: <1229365518-20538-1-git-send-email-tpiepho@freescale.com>
References: <1229365518-20538-1-git-send-email-tpiepho@freescale.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Trent Piepho <xyzzy@speakeasy.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trent Piepho writes:

> The MTD system supports operation where a direct mapped flash chip is
> mapped twice.  The normal mapping is a standard ioremap(), which is
> non-cached and guarded on powerpc.  The second mapping is used only for
> reads and can be cached and non-guarded.  Currently, only the pxa2xx
> mapping driver makes use of this feature.  This patch adds support to the
> physmap_of driver on PPC32 platforms for this cached mapping mode.

Note that having two mappings of the same physical address that differ
in cacheability is a programming error according to the PowerPC
architecture.

Do you know that the processor implementations where you want to do
this can cope with having two mappings with different cacheability?

Paul.
