From: David Woodhouse <dwmw2@infradead.org>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
In-Reply-To: <dbr0tp$87s$1@sea.gmane.org>
References: <dbl42b$hcn$1@sea.gmane.org>
	<1121867130.12903.15.camel@localhost.localdomain>
	<dblm4l$802$1@sea.gmane.org>
	<1121869156.12903.19.camel@localhost.localdomain>
	<dblne1$cgd$1@sea.gmane.org>
	<1121887042.20077.1.camel@localhost.localdomain>
	<dbr0tp$87s$1@sea.gmane.org>
Content-Type: text/plain
Date: Sat, 23 Jul 2005 11:07:18 -0400
Message-Id: <1122131239.12630.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-07-22 at 16:47 +0200, Martin Egholm Nielsen wrote:
> 47695   idled                   384,63710
> 2997    nand_read_buf           62,43750
> 1122    nand_calculate_ecc      5,84380
> 677     __delay                 33,85000
> 502     nand_do_read_ecc        0,26370

Right, so we're spending most of that time actually reading the flash.
If you just read the entire flash device, how long does that take?
 (time dd if=/dev/mtd0 of=/dev/null) 

Artem's patch will improve things further by building up the fragtree
from newest to oldest node instead of from oldest to newest as we
currently do -- which actually means we don't need to check the CRC on
the oldest nodes before they never get added to the tree; we don't
actually need to read their data payload at all.

In the longer term, Ferenc's summary patch would decrease the amount of
reading from the flash even further. I keep meaning to go through that
in detail and make it mergeable.

-- 
dwmw2
