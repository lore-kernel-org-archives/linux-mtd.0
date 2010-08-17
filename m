Received: from lvps87-230-0-242.dedicated.hosteurope.de ([87.230.0.242])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OlKTO-0005Gk-55
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2010 11:36:59 +0000
Date: Tue, 17 Aug 2010 13:36:44 +0200
From: Michael Guntsche <mike@it-loops.com>
To: Brian Norris <norris@broadcom.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] Nand support broken with v2.6.36-rc1
Message-ID: <20100817113644.GA31317@gibson.comsick.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello again,

Answering my own question here. Yes indeed with the new code a driver
change seems to be needed. The badblock pattern used with this nand is no longer
supported with the stock kernel code. I added this to the nand driver
itself.

static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
static struct nand_bbt_descr rbppc_nand_smallpage = {
  .options = NAND_BBT_SCAN2NDPAGE,
  .offs = NAND_SMALL_BADBLOCK_POS,
  .len = 1,
  .pattern = scan_ff_pattern
};

and the driver is working again. But shouldn't this be supported by the stock level code as well?

Kind regards,
Michael Guntsche
