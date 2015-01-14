Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBCfd-0001Wz-NV
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 01:22:54 +0000
Date: Wed, 14 Jan 2015 09:20:35 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Frank.Li@freescale.com
Subject: Re: [PATCH 1/1] mtd: fsl-quadspi: improve read performance by
 increase AHB transfer size
Message-ID: <20150114012035.GA11245@hsj.sh.intel.com>
References: <1421166536-13601-1-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421166536-13601-1-git-send-email-Frank.Li@freescale.com>
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

On Wed, Jan 14, 2015 at 12:28:56AM +0800, Frank.Li@freescale.com wrote:
> From: Allen Xu <b45815@freescale.com>
> 
> Set AHB transfer size to 1K which improved the read performance.
> 
> Add ahb_buf_size field in fsl_qspi_devtype_data to denote the size for
> different SoC.
> 
> Before:
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd1 of=/dev/null bs=1M count=16
> 16+0 records in
> 16+0 records out
> 16777216 bytes (17 MB) copied, 0.472183 s, 25.1 MB/s
> 
> After:
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd1 of=/dev/null bs=1M count=16
> 16+0 records in
> 16+0 records out
> 16777216 bytes (17 MB) copied, 0.369439 s, 29.5 MB/s
> 
> Signed-off-by: Allen Xu <b45815@freescale.com>
> Signed-off-by: Huang Shijie <shijie8@gmail.com>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
This is a very good patch.

This patch has my signed-off, but if it is needed, please add my ack:
Acked-by: Huang Shijie <shijie.huang@intel.com>
