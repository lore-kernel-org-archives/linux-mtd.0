Received: from mail-vc0-f175.google.com ([209.85.220.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVFj4-0001IV-0Z
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2013 06:32:14 +0000
Received: by mail-vc0-f175.google.com with SMTP id lf10so2477426vcb.6
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2013 23:32:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366707297-31309-2-git-send-email-b32955@freescale.com>
References: <1366707297-31309-1-git-send-email-b32955@freescale.com>
 <1366707297-31309-2-git-send-email-b32955@freescale.com>
Date: Wed, 24 Apr 2013 23:32:12 -0700
Message-ID: <CAN8TOE-oy=74kSKrnxG+Ve4qZfrwEYbvh6hGGquTyLu6T+UbSA@mail.gmail.com>
Subject: Re: [PATCH V3 1/9] mtd: add more comment for ecc_strength/ecc_size
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would recommend different wording, describing what they represent
rather than how we accomplish it. See below.

On Tue, Apr 23, 2013 at 1:54 AM, Huang Shijie <b32955@freescale.com> wrote:
> Add more commit for ecc_strength and ecc_size fields.
> We can treat the comment as the initial semantics for the two fields.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  include/linux/mtd/nand.h |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 5458021..c1cc690 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -436,7 +436,9 @@ struct nand_buffers {
>   * @cellinfo:          [INTERN] MLC/multichip data from chip ident
>   * @ecc_strength:      [INTERN] ECC correctability from the datasheet.

How about just: "minimum number of bits correctability, if known; if
unknown, set to 0

>   * @ecc_size:          [INTERN] ECC size required by the @ecc_strength,
> - *                      also from the datasheet.
> + *                      also from the datasheet. If we do not know the
> + *                     @ecc_size and @ecc_strength of the nand chips, we can
> + *                     set zeros to them which are the default value.

"recommend ECC step size, if known; if unknown, set to 0"

>   * @numchips:          [INTERN] number of physical chips
>   * @chipsize:          [INTERN] the size of one chip for multichip arrays
>   * @pagemask:          [INTERN] page number mask = number of (pages / chip) - 1

Brian
