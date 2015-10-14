Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmOtH-0001x4-QJ
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 16:27:00 +0000
Received: by pabur7 with SMTP id ur7so9657392pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2015 09:26:39 -0700 (PDT)
Date: Wed, 14 Oct 2015 09:26:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: han.xu@freescale.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Include <linux/sizes.h> to avoid build
 error
Message-ID: <20151014162636.GH107187@google.com>
References: <1444793984-21655-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444793984-21655-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 14, 2015 at 12:39:44AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Building for x86 results in the following build errors:
> 
>    drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_init_lut':
> >> drivers/mtd/spi-nor/fsl-quadspi.c:355:21: error: 'SZ_16M' undeclared (first use in this function)
>      if (q->nor_size <= SZ_16M) {
>                         ^
>    drivers/mtd/spi-nor/fsl-quadspi.c:355:21: note: each undeclared identifier is reported only once for each function it appears in
>    drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_read':
> >> drivers/mtd/spi-nor/fsl-quadspi.c:208:27: error: 'SZ_4M' undeclared (first use in this function)
>     #define QUADSPI_MIN_IOMAP SZ_4M
>                               ^
> >> drivers/mtd/spi-nor/fsl-quadspi.c:845:25: note: in expansion of macro 'QUADSPI_MIN_IOMAP'
>       q->memmap_len = len > QUADSPI_MIN_IOMAP ? len : QUADSPI_MIN_IOMAP;
> 
> Explicitly include <linux/sizes.h> to fix the problem.
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Applied to l2-mtd.git. Thanks.
