Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF5NU-000868-JJ
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 12:29:17 +0000
Date: Mon, 30 Nov 2009 13:29:03 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC] mxc nand controller updates
Message-ID: <20091130122903.GO27548@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1257925792.21596.858.camel@localhost>
	<20091112073630.GV30179@pengutronix.de>
	<1258101131.21596.1189.camel@localhost>
	<1259580031.19465.378.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1259580031.19465.378.camel@macbook.infradead.org>
Cc: dedekind1@gmail.com, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 30, 2009 at 11:20:31AM +0000, David Woodhouse wrote:
> On Fri, 2009-11-13 at 10:32 +0200, Artem Bityutskiy wrote:
> > 
> > I've pulled your stuff to my l2-mtd-2.6 tree to the dunno branch, so
> > there are less chances your pull request will be missed.
> 
> Was there a pull request? I only see the [RFC].

I should have sent a pull request afterwards, sorry.

> 
> Please could you fix up the commit message for the reversion. It should
> contain the subject of the original commit as well as its commit-id, and
> it should say _why_.

This revert is already in the mtd master tree as
1cc523999e0acd0c21f83bf89b7a44b4ab6f7bd8 along with a correct commit
message, so this patch got dropped when I rebased my tree onto mtd
master.

So please pull from the following address if you haven't done already
from Artems branch.

Sascha


The following changes since commit
8ce110ac19bc88b82e3feacfbb3a2ee08a07fe22:
  H Hartley Sweeten (1):
        mtd: Fix compile failure and error path in physmap.c

are available in the git repository at:

  git://git.pengutronix.de/git/imx/linux-2.6.git mxc-nand

Sascha Hauer (18):
      mxc_nand: cleanup eccoob descriptions
      mxc_nand: cleanup initialization
      mxc_nand: merge send_read_page and send_prog_page
      mxc_nand: introduce mxc_do_addr_cycle
      mxc nand: remove debug param
      mxc nand: remove dead code
      mxc nand: use resource_size()
      mxc nand: use buffers
      mxc nand: simplify command processing
      mxc nand: modify send_page to send all pages, not only one
      mxc_nand: remove unused defines
      mxc_nand: Make main/spare areas runtime configurable
      mxc_nand: Get rid of pagesize_2k flag
      mxc_nand: Add NFC V2 support
      mxc_nand: disable sp_en bit only once
      mxc_nand: Allow flash based bbt
      mxc_nand: remove TROP_US_DELAY
      mxc_nand: use DRIVER_NAME where appropriate

 arch/arm/plat-mxc/include/mach/mxc_nand.h |    3 +-
 drivers/mtd/nand/mxc_nand.c               |  773 +++++++++++------------------
 2 files changed, 300 insertions(+), 476 deletions(-)



-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
