Subject: Re: DiskOn Chip Millennium Plus 32MB + INFTL
From: David Woodhouse <dwmw2@infradead.org>
To: Jeff Kalikstein <jeff@kalikstein.com>
In-Reply-To: <4488665D.5010908@kalikstein.com>
References: <4488665D.5010908@kalikstein.com>
Content-Type: text/plain
Date: Thu, 08 Jun 2006 20:19:36 +0100
Message-Id: <1149794376.18635.2.camel@shinybook.infradead.org>
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

On Thu, 2006-06-08 at 13:03 -0500, Jeff Kalikstein wrote:
> and the MTD NAND based driver complains that "DiskOnChip Millennium
> Plus 32MB is not supported, ignoring.".

This is fixable. The 32MiB unit is just the same as the 16MiB unit
except that it works in 16-bit mode instead of 8-bit mode, and by
default does some bizarre interleaving of the data.

Just look for 'interleave' in drivers/mtd/devices/doc2001plus.c and see
how many places there are where we treat the 16MiB and 32MiB units
differently -- there aren't that many. Getting this to work in the
NAND-based driver should be relatively simple.

-- 
dwmw2
