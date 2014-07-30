Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCVLs-0004dv-5d
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 14:59:36 +0000
Date: Wed, 30 Jul 2014 16:59:12 +0200
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 2/2] mtd: nand: add Hynix's H27UCG8T2ATR-BC to nand_ids
 table
Message-ID: <20140730165912.74e81f4c@bbrezillon>
In-Reply-To: <1406539012-16320-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1406539012-16320-1-git-send-email-boris.brezillon@free-electrons.com>
 <1406539012-16320-3-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 28 Jul 2014 11:16:52 +0200
Boris BREZILLON <boris.brezillon@free-electrons.com> wrote:

> Add the full description of the Hynix H27UCG8T2ATR-BC NAND chip in the
> nand_ids table so that we can later use the NAND ECC infos and ONFI timings
> mode in controller drivers.
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_ids.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index 3d7c89f..19d4168 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -46,6 +46,10 @@ struct nand_flash_dev nand_flash_ids[] = {
>  	{"SDTNRGAMA 64G 3.3V 8-bit",
>  		{ .id = {0x45, 0xde, 0x94, 0x93, 0x76, 0x50} },
>  		  SZ_16K, SZ_8K, SZ_4M, 0, 6, 1280, NAND_ECC_INFO(40, SZ_1K) },
> +	{"H27UCG8T2ATR-BC 64G 3.3V 8-bit",
> +		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
> +		  SZ_8K, SZ_8K, SZ_4M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K),

There is a big mistake here ------^

It should be SZ_2M not SZ_4M, I'll fix that.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
