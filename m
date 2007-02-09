Subject: Re: [2.6 patch] drivers/mtd/nand/cafe_ecc.c: fix an off-by-one in
	a BUG_ON
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20070202142919.GE3754@stusta.de>
References: <20070202142919.GE3754@stusta.de>
Content-Type: text/plain
Date: Fri, 09 Feb 2007 15:06:17 +0000
Message-Id: <1171033577.29713.47.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-02-02 at 15:29 +0100, Adrian Bunk wrote:
> err_pos_lut[4096] of an array with 4096 elements is a bug.
> 
> Spotted by the Coverity checker.
> 
> While I was at it, I also converted it to ARRAY_SIZE(). 

Applied; thanks.

-- 
dwmw2
