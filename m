Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajNRa-0006Lk-9y
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 08:50:10 +0000
Date: Fri, 25 Mar 2016 09:49:48 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com, Peter
 Pan <peterpandong@micron.com>
Subject: Re: [PATCH 03/11] mtd: nand_bbt: add new API definitions
Message-ID: <20160325094948.136c4501@bbrezillon>
In-Reply-To: <1457923684-13505-4-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <1457923684-13505-4-git-send-email-peterpandong@micron.com>
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

On Mon, 14 Mar 2016 02:47:56 +0000
Peter Pan <peterpansjtu@gmail.com> wrote:

> Add new API definitions for nand_bbt to replace old ones without
> any users. These API includes:
> 	struct nand_bbt_create(struct mtd_info *mtd);
> 	struct nand_bbt *nand_bbt_create(struct mtd_info *mtd,
> 				const struct nand_bbt_ops *ops,
> 				struct nand_chip_layout_info *info,
> 				unsigned int options,
> 				struct nand_bbt_descr *bbt_td,
> 				struct nand_bbt_descr *bbt_md);
> 	void nand_bbt_destroy(struct nand_bbt *bbt);
> 	int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs);
> 	int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs);
> 	int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs);
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/nand_bbt.c  | 113 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/nand_bbt.h |  11 +++++
>  2 files changed, 124 insertions(+)
> 

>  
> +struct nand_bbt *nand_bbt_create(struct mtd_info *mtd,
> +		const struct nand_bbt_ops *ops,
> +		struct nand_chip_layout_info *info,

Should be const struct nand_chip_layout_info *.




-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
