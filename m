Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4LKL-0003an-SA
 for linux-mtd@lists.infradead.org; Fri, 06 Apr 2018 06:58:27 +0000
Date: Fri, 6 Apr 2018 08:58:11 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [GIT PULL v2] mtd: spi-nor: Changes for 4.17
Message-ID: <20180406085811.36f41edf@bbrezillon>
In-Reply-To: <20180330102034.7db0a4e4@bbrezillon>
References: <20180330102034.7db0a4e4@bbrezillon>
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

On Fri, 30 Mar 2018 10:20:34 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hello,
> 
> Nothing new compared to the v1 expect I added my SoB on Fabio's patch
> because I amended my own patch to fix the subject prefix and became
> commiter of the 2 other patches during the process.
> 
> Regards,
> 
> Boris
> 
> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:
> 
>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
> 
> are available in the git repository at:
> 
>   git://git.infradead.org/linux-mtd.git tags/spi-nor/for-4.17
> 
> for you to fetch changes up to e8de85d5a107352ff428f735b0afc8133bcbc3e5:
> 
>   dt-bindings: fsl-quadspi: Add the example of two SPI NOR (2018-03-30 10:05:08 +0200)

Merged in mtd/next.

> 
> ----------------------------------------------------------------
> * Make fsl-quaspi assign different names to MTD devices connected
>   to the same QSPI controller
> * Remove an unneeded driver.bus assigned in the fsl-qspi driver
> 
> ----------------------------------------------------------------
> Boris Brezillon (1):
>       mtd: fsl-quadspi: Remove unneeded driver.bus assignment
> 
> Fabio Estevam (2):
>       mtd: fsl-quadspi: Distinguish the mtd device names
>       dt-bindings: fsl-quadspi: Add the example of two SPI NOR
> 
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 24 ++++++++++++++++++++++++
>  drivers/mtd/spi-nor/fsl-quadspi.c                     | 19 ++++++++++++++++++-
>  2 files changed, 42 insertions(+), 1 deletion(-)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
