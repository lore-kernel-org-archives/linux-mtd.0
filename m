Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGoGG-0005dR-64
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 13:36:24 +0000
Date: Wed, 6 Jan 2016 14:36:01 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, fransklaver@gmail.com,
 Peter Pan <peterpandong@micron.com>, beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 karlzhang@micron.com
Subject: Re: [PATCH v2 05/12] mtd: nand: use new BBT API instead of old ones
Message-ID: <20160106143601.4d1f5b33@bbrezillon>
In-Reply-To: <1450159178-29895-6-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <1450159178-29895-6-git-send-email-peterpandong@micron.com>
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

On Tue, 15 Dec 2015 05:59:31 +0000
Peter Pan <peterpansjtu@gmail.com> wrote:

> From: Brian Norris <computersforpeace@gmail.com>
> 
> Use new BBT APIs (nand_bbt_*()) in NAND. Keep old APIs (nand_*_bbt())
> exist temporarily.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> [Peter: 1. use nand_bbt_markbad_factory() in docg4.c and implement
>         2. nand_create_factory_badblock_pattern(), nand_is_bad_bbm() and
>         nand_default_bbt() in nand_base.c
>         3. add NAND_BADBLOCK_PATTERN_ALLOC macro]
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/docg4.c     |   6 +-
>  drivers/mtd/nand/nand_base.c | 140 ++++++++++++++++++++++++++++++++++++++++---
>  include/linux/mtd/nand.h     |   9 ++-
>  3 files changed, 143 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
> index da93d7f..1be7fa2 100644
> --- a/drivers/mtd/nand/docg4.c
> +++ b/drivers/mtd/nand/docg4.c
> @@ -1037,7 +1037,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
>  	 * operation after device power-up.  The above read ensures it never is.
>  	 * Ugly, I know.
>  	 */
> -	if (nand->bbt == NULL)  /* no memory-based bbt */
> +	if (nand->nand_bbt == NULL)  /* no memory-based bbt */

Hm, can we avoid direct references to the ->nand_bbt field by either
providing an accessor (nand_get_bbt()), or providing wrappers around
the nand_chip device (nand_has_bbt(nand), nand_markbad_factory(nand,
ofs), ...)?
In my rather limited experience, doing that is more future-proof.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
