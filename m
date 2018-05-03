Received: from mail.intenta.de ([178.249.25.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEDmX-0001iu-6J
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 12:56:22 +0000
Date: Thu, 3 May 2018 14:56:01 +0200
From: Helmut Grohne <h.grohne@intenta.de>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [LINUX, v8, 2/2] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Message-ID: <20180503125600.vkv5vowdyjz5p2zt@laureti-dev>
References: <1521024505-30677-1-git-send-email-nagasureshkumarrelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1521024505-30677-1-git-send-email-nagasureshkumarrelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 14, 2018 at 04:18:25PM +0530, Naga Sureshkumar Relli wrote:
> +	xnand->row_addr_cycles = nand_chip->onfi_params.addr_cycles & 0xF;
> +	xnand->col_addr_cycles =
> +				(nand_chip->onfi_params.addr_cycles >> 4) & 0xF;

Meanwhile onfi_params have been removed from the mainline and this patch
no longer builds against v4.17-rc3. Can you resend a version that builds
against with more recent kernels?

Helmut
