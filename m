Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNOgP-0003qT-Ik
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 17:10:22 +0000
Received: by pdco4 with SMTP id o4so34534972pdc.3
 for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2015 10:10:00 -0700 (PDT)
Date: Thu, 6 Aug 2015 10:09:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <b45815@freescale.com>
Cc: linux-mtd@lists.infradead.org, frank.li@freescale.com, han.xu@freescale.com
Subject: Re: [PATCH v4 01/10] mtd: spi-nor: fsl-quadspi: dynamically map
 memory space for AHB read
Message-ID: <20150806170956.GT10676@google.com>
References: <1438701922-26916-1-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438701922-26916-1-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 04, 2015 at 10:25:22AM -0500, Han Xu wrote:
> From: Han Xu <han.xu@freescale.com>
> 
> QSPI may failed to map enough memory (256MB) for AHB read in
> previous implementation, especially in 3G/1G memory layout kernel.
> Dynamically map memory to avoid such issue.
> 
> This implementation generally map QUADSPI_MAX_IOMAP (default 4MB) memory
> for AHB read, it should be enough for common scenarios, and the side
> effect (0.6% performance drop) is minor.
> 
> Previous implementation
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=1K count=32K
> 32768+0 records in
> 32768+0 records out
> 33554432 bytes (34 MB) copied, 2.16006 s, 15.5 MB/s
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=32M count=1
> 1+0 records in
> 1+0 records out
> 33554432 bytes (34 MB) copied, 1.43149 s, 23.4 MB/s
> 
> After applied the patch
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=1K count=32K
> 32768+0 records in
> 32768+0 records out
> 33554432 bytes (34 MB) copied, 2.1743 s, 15.4 MB/s
> 
> root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=32M count=1
> 1+0 records in
> 1+0 records out
> 33554432 bytes (34 MB) copied, 1.43158 s, 23.4 MB/s
> 
> Signed-off-by: Han Xu <han.xu@freescale.com>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> ---
> 
> Change from v3 to v4:
> According to Brian's comments,
> - introduce a new macro QUADSPI_MIN_IOMAP instead of SZ_4M
> - reduce the duplicated computation for offset
> - reintroduce the devm_request_mem_region()
> 
> Change from v2 to v3:
> Resend whole serial patch
> 
> Change from v1 to v2:
>    rebase to last l2-mtd

Thanks, pushed the series to l2-mtd.git, with a few whitespace fixups.

Brian
