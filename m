From: David Woodhouse <dwmw2@infradead.org>
To: Dave Dillow <ddillow@idleaire.com>
In-Reply-To: <1067376879.9396.1.camel@dillow.idleaire.com>
References: <3F9EA810.6010905@celerity.net>
	 <1067376879.9396.1.camel@dillow.idleaire.com>
Content-Type: text/plain
Message-Id: <1068038898.6065.76.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 05 Nov 2003 13:28:18 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: INFTL problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-28 at 16:34 -0500, Dave Dillow wrote:
>  When I get time, I plan to work on nand/diskonchip.c, per
>  dwmw2's suggestion.

I've merged the basics; it should correctly detect it and install the
Millennium ASIC methods. T'would be interesting to know if it actually
works.

Note that NFTL and INFTL aren't expected to work on this driver yet; we
don't implement the hardware ECC yet. But JFFS2 still works on both an
old DiskOnChip 2000 and a Millennium, with what I just committed.

-- 
dwmw2
