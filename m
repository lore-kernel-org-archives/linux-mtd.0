Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elLeG-0002HG-Ub
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 21:28:30 +0000
Date: Mon, 12 Feb 2018 22:28:17 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de
Subject: Re: [PATCH v2] mxc_nand controller fixes
Message-ID: <20180212222817.4f4cafe8@bbrezillon>
In-Reply-To: <20180117113213.15455-1-s.hauer@pengutronix.de>
References: <20180117113213.15455-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 Jan 2018 12:32:05 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> This series fixes several problems in the mxc_nand driver.
> 
> - Raw support does not work since hardware ECC is unconditionally
>   enabled
> - The v2/v3 controller code returns the number of corrected
>   bitflips for the whole page for each subpage leading to
>   results for times too high
> - The v1 controller code returns the number of corrected bitflips
>   only for the last subpage. On 2k page NANDs bitflips in the
>   first three subpages remain uncovered
> 
> This series fixes these issues. Tested with the mtd test modules
> mtd_nandbiterrs, mtd_oobtest, mtd_pagetest and mtd_readtest and the
> corresponding userspace tests from mtd-utils on a i.MX27 board which
> is a v1 controller and a i.MX25 board which is a v2 controller.
> 
> Based on nand/next.

Applied the whole series.

Thanks,

Boris

> 
> Sascha
> 
> Changes since v1:
> - drop mtd argument from read_page/write_page functions
> - do not add function beginning with two underscores
> - simplify bitflips counting for v1 controllers
> - Add ecc argument to mxc_nand_write_page()
> - drop unused oob_required argument from mxc_nand_write_page()
> 



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
