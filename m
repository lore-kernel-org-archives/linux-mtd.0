Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBR7p-0000z7-SA
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 15:12:10 +0000
Message-ID: <1376925445.2089.492.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] mtd: MTD_NAND_DENALI should depend on HAS_DMA
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2013 18:17:25 +0300
In-Reply-To: <1376823839-5853-1-git-send-email-geert@linux-m68k.org>
References: <1376823839-5853-1-git-send-email-geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-08-18 at 13:03 +0200, Geert Uytterhoeven wrote:
> If NO_DMA=y:
> 
> drivers/built-in.o: In function `denali_remove':
> drivers/mtd/nand/denali.c:1605: undefined reference to `dma_unmap_single'
> drivers/built-in.o: In function `denali_read_page_raw':
> drivers/mtd/nand/denali.c:1190: undefined reference to `dma_sync_single_for_cpu'
> drivers/built-in.o: In function `denali_read_page':
> drivers/mtd/nand/denali.c:1140: undefined reference to `dma_sync_single_for_cpu'
> drivers/built-in.o: In function `write_page':
> drivers/mtd/nand/denali.c:1051: undefined reference to `dma_sync_single_for_cpu'
> drivers/built-in.o: In function `denali_init':
> drivers/mtd/nand/denali.c:1433: undefined reference to `dma_set_mask'
> drivers/mtd/nand/denali.c:1438: undefined reference to `dma_map_single'
> drivers/mtd/nand/denali.c:1442: undefined reference to `dma_mapping_error'
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
