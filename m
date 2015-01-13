Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YApks-0004Ha-6i
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 00:54:46 +0000
Date: Tue, 13 Jan 2015 08:52:14 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Frank.Li@freescale.com
Subject: Re: [PATCH 1/1 v2] mtd: spi-nor: fsl-qspi: support deep sleep mode
 for imx6 sx chip
Message-ID: <20150113005213.GA12302@hsj.sh.intel.com>
References: <1421096200-28174-1-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421096200-28174-1-git-send-email-Frank.Li@freescale.com>
Cc: lznuaa@gmail.com, linux-mtd@lists.infradead.org,
 Allen Xu <b45815@freescale.com>, computersforpeace@gmail.com,
 shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 13, 2015 at 04:56:40AM +0800, Frank.Li@freescale.com wrote:
> From: Allen Xu <b45815@freescale.com>
> 
> i.mx6 sx support turn off fastmix and megamix power.
> qpsi controller can be turned off and all status lost when suspend/resume.
> add suspend/resume functions and reset qspi controller when resume.
> 
> Signed-off-by: Allen Xu <b45815@freescale.com>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
I am glad that Allen has began to maintain this driver.

Acked-by: Huang Shijie <shijie.huang@intel.com>
