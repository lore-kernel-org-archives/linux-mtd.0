Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL1Yr-0007yk-Ng
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 03:32:30 +0000
Date: Tue, 10 Feb 2015 11:29:53 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: nand: gpmi: Check for scan_bbt() error
Message-ID: <20150210032953.GA18865@hsj.sh.intel.com>
References: <1423516953-22938-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423516953-22938-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, shijie8@gmail.com,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 09, 2015 at 07:22:33PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> In case of scan_bbt() failure, we should better propagate it.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

thanks

Acked-by: Huang Shijie <shijie.huang@intel.com>
