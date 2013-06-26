Received: from mms2.broadcom.com ([216.31.210.18])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UrrR3-00031D-PT
 for linux-mtd@lists.infradead.org; Wed, 26 Jun 2013 15:15:06 +0000
Date: Wed, 26 Jun 2013 20:52:44 +0530
From: "Kamlakant Patel" <kamlakant.patel@broadcom.com>
To: "Sourav Poddar" <sourav.poddar@ti.com>
Subject: Re: [PATCH 1/3] drivers: mtd: spinand: Add generic spinand
 frameowrk and micron driver.
Message-ID: <20130626152243.GA9414@kpatel.netlogicmircro.com>
References: <1372232472-2641-1-git-send-email-sourav.poddar@ti.com>
 <1372232472-2641-2-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
In-Reply-To: <1372232472-2641-2-git-send-email-sourav.poddar@ti.com>
Content-Type: text/plain;
 charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Cc: rnayak@ti.com, linux-kernel@vger.kernel.org, balbi@ti.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, tqnguyen@micron.com,
 grant.likely@linaro.org, spi-devel-general@lists.sourceforge.net,
 linux-omap@vger.kernel.org, dwmw2@infradead.org, manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 26, 2013 at 01:11:10PM +0530, Sourav Poddar wrote:
> From: Mona Anonuevo <manonuevo@micron.com>
> 
> This patch adds support for a generic spinand framework(spinand_mtd.c).
> This frameowrk can be used for other spi based flash devices also. The idea
> is to have a common model under drivers/mtd, as also present for other no spi
> devices(there is a generic framework and device part simply attaches itself to it.)
> 
> The generic frework will be used later by me for a SPI based spansion S25FL256 device.
> The patch also contains a micron driver attaching itself to generic framework.
> 
> Signed-off-by: Mona Anonuevo <manonuevo@micron.com>
> Signed-off-by: Tuan Nguyen <tqnguyen@micron.com>
> Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
> ----
> [I picked this as a standalone patch, can split it into generic and device part
> based on community feedback.]
> 
>  drivers/mtd/Kconfig               |    2 +
>  drivers/mtd/Makefile              |    2 +
>  drivers/mtd/spinand/Kconfig       |   24 ++
>  drivers/mtd/spinand/Makefile      |   10 +
>  drivers/mtd/spinand/spinand_lld.c |  776 +++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spinand/spinand_mtd.c |  690 +++++++++++++++++++++++++++++++++
>  include/linux/mtd/spinand.h       |  155 ++++++++
>  7 files changed, 1659 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/spinand/Kconfig
>  create mode 100644 drivers/mtd/spinand/Makefile
>  create mode 100644 drivers/mtd/spinand/spinand_lld.c
>  create mode 100644 drivers/mtd/spinand/spinand_mtd.c
>  create mode 100644 include/linux/mtd/spinand.h
> 

I am working on Micron SPINAND(Micron MT29F1G01ZACH). I tried this patch, but it's not working.
It is throwing following error message while mounting:
[  260.232000] jffs2: cannot read OOB for EB at 00000000, requested 8 bytes, read 0 bytes, error -22
mount: mounting /dev/mtdblock5 on /mnt/ failed: Input/output error

I am working on it to fix into the driver, will send an updated patch with the fix.

Thanks,
Kamlakant Patel
