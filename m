Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dlywQ-0007Yb-FL
 for linux-mtd@lists.infradead.org; Sun, 27 Aug 2017 14:53:36 +0000
Date: Sun, 27 Aug 2017 17:44:23 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
Message-ID: <20170827144423.GE2980@lahna.fi.intel.com>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
 <20170825104015.GB2980@lahna.fi.intel.com>
 <CAEUhbmWihuxtF81qf6MD9k2ViUvY3AjBr4uHE1kGWj-iptqffg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmWihuxtF81qf6MD9k2ViUvY3AjBr4uHE1kGWj-iptqffg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 25, 2017 at 08:11:54PM +0800, Bin Meng wrote:
> Other LPC_ICH users (like gpio, watchdog) use the 'select' logic, so I
> would prefer to keep things consistent.

Fair enough.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
