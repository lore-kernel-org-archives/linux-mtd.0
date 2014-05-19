Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmW9y-0001Zs-Rh
 for linux-mtd@lists.infradead.org; Mon, 19 May 2014 22:35:55 +0000
Date: Mon, 19 May 2014 15:35:23 -0700
From: Tony Lindgren <tony@atomide.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v4 1/4] mtd: nand: omap: add support for BCH16_ECC - GPMC
 driver updates
Message-ID: <20140519223523.GK11945@atomide.com>
References: <1400486082-4345-1-git-send-email-pekon@ti.com>
 <1400486082-4345-2-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400486082-4345-2-git-send-email-pekon@ti.com>
Cc: linux-omap <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>, Felipe Balbi <balbi@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Pekon Gupta <pekon@ti.com> [140519 00:55]:
> This patch add support for BCH16_ECC in GPMC (controller) driver:
> - extends configuration space to include BCH16 registers
> - extends parsing of DT binding for selecting BCH16 ecc-scheme
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>

This patch seems OK to merge via the MTD tree, so for the
arch/arm/*omap* changes:

Acked-by: Tony Lindgren <tony@atomide.com>
