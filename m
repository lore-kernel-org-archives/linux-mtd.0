From: David Woodhouse <dwmw2@infradead.org>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <200510101928.35485.manningc2@actrix.gen.nz>
References: <BAY112-F220F3A8DFFA9ECE3156A5AB3790@phx.gbl>
	<200510101928.35485.manningc2@actrix.gen.nz>
Content-Type: text/plain
Date: Mon, 10 Oct 2005 10:02:00 +0100
Message-Id: <1128934920.3830.19.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, wen jia <ganganwen@hotmail.com>
Subject: Re: what should i do? using DOM and CF's problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-10-10 at 19:28 +1300, Charles Manning wrote:
> DOM and DOC or anything else won't help if you're using FAT.
> 
> Consider using NAND flash or SmartMedia or XD. These are raw NAND
> flash parts. Then, use them with JFFS2 or YAFFS. That should give you
> a very reliable solution.

The DiskOnChip _is_ basically raw NAND parts, albeit with a helpful
extra ASIC with ECC and a FIFO, and possibly even DMA support in the
latest versions. You should be able to use JFFS2 on that quite happily.

DOM and CF are different.

-- 
dwmw2
