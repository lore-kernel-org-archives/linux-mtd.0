Received: from fmmailgate02.web.de ([217.72.192.227])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N8UEL-0001OJ-Ov
	for linux-mtd@lists.infradead.org; Thu, 12 Nov 2009 07:36:38 +0000
Date: Thu, 12 Nov 2009 08:36:30 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC] mxc nand controller updates
Message-ID: <20091112073630.GV30179@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1257925792.21596.858.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1257925792.21596.858.camel@localhost>
Sender: saschahauer@web.de
Cc: Vladimir Barinov <vova.barinov@gmail.com>, mathieu.berland@eads.com,
	jbe@pengutronix.de, linux-mtd@lists.infradead.org,
	Eric Benard <ebenard@eukrea.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, Nov 11, 2009 at 09:49:52AM +0200, Artem Bityutskiy wrote:
> On Wed, 2009-10-21 at 16:13 +0200, Sascha Hauer wrote:
> > Hi all,
> > 
> > Here are several patches for the mxc nand controller. At the end
> > of this series we are able to use this driver with the i.MX25/35
> > SoCs. Please review and test if you do not want to see your boards
> > break ;)
> 
> Just tried to pull your tree, but could not - there were confilicts.
> Could you please provide a branch/patches against the mtd-2.6 tree?

I updated the tree, the branch is still the same.

Thanks
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
