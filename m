Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5AhJ-0004uJ-6E
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 11:08:13 +0000
Date: Sat, 5 Dec 2015 16:40:48 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dan.j.williams@intel.com,
 dmaengine@vger.kernel.org
Subject: Re: [PATCH v8 2/7] dmaengine: mxs: APBH DMA supports deep sleep mode
Message-ID: <20151205111048.GE1854@localhost>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-3-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449096466-18064-3-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 04:47:41PM -0600, Han Xu wrote:
> From: Huang Shijie <b32955@freescale.com>
> 
> Deep Sleep Mode(dsm) turns off the power for APBH DMA module, DMA
> need to be re-initialized when system resumed back.

Acked-by: Vinod Koul <vinod.koul@intel.com>

-- 
~Vinod
