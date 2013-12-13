Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrNbL-0007W2-LL
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 07:56:00 +0000
Date: Fri, 13 Dec 2013 15:27:12 +0800
From: Huang Shijie <b32955@freescale.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: increase max page/OOB size to support 16K
 pagesize NAND
Message-ID: <20131213072705.GA28525@shlinux2.ap.freescale.net>
References: <C3050A4DBA34F345975765E43127F10F25E47455@SZXEMA512-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <C3050A4DBA34F345975765E43127F10F25E47455@SZXEMA512-MBX.china.huawei.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Quyaxin <quyaxin@hisilicon.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 13, 2013 at 05:03:49AM +0000, Caizhiyong wrote:
> From: Cai Zhiyong <caizhiyong@huawei.com>
> Date: Fri, 13 Dec 2013 12:52:46 +0800
> Subject: [PATCH] mtd: increase max page/OOB size to support 16K pagesize NAND.
> 
> The Toshiba's TC58TEG5DCJTA pagesize is 16K, oob size is 1280 bytes.
> So increase the NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE.
> 
> Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
> ---
>  include/linux/mtd/nand.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index f3ea8da..2f0a7f2 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -56,8 +56,8 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>   * is supported now. If you add a chip with bigger oobsize/page
>   * adjust this accordingly.
>   */
> -#define NAND_MAX_OOBSIZE	744
> -#define NAND_MAX_PAGESIZE	8192
> +#define NAND_MAX_OOBSIZE	1280
> +#define NAND_MAX_PAGESIZE	16384
maybe it is time to remove these two macros.

thanks
Huang Shijie
