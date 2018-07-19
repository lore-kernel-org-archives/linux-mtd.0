Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgGHd-0004nf-Tj
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 21:16:23 +0000
Date: Thu, 19 Jul 2018 23:16:00 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: adapt misleading comment in mtd_oob_ops structure
Message-ID: <20180719231600.1bff62a5@bbrezillon>
In-Reply-To: <20180718203302.5666-1-miquel.raynal@bootlin.com>
References: <20180718203302.5666-1-miquel.raynal@bootlin.com>
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

On Wed, 18 Jul 2018 22:33:02 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> A comment in the kernel doc of the mtd_oob_ops structure tells that it
> is not possible to write more than one page with OOB. This is actually
> true for only a few MTD devices like 'onenand' but it is definitely not
> a general limitation. While this would benefit to be handled elsewhere
> either by the MTD layer or by the limited drivers, let's update this
> comment to reflect the reality.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied.

Thanks,

Boris

> ---
> 
> Changes since v1:
> =================
> * Boris pointed out that this comment was not entirely false but rather
>   too much restrictive compared to the reality and proposed an
>   alternative that I simply copied there.
> 
> 
>  include/linux/mtd/mtd.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index a86c4fa93115..cd0be91bdefa 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -67,9 +67,11 @@ struct mtd_erase_region_info {
>   * @datbuf:	data buffer - if NULL only oob data are read/written
>   * @oobbuf:	oob data buffer
>   *
> - * Note, it is allowed to read more than one OOB area at one go, but not write.
> - * The interface assumes that the OOB write requests program only one page's
> - * OOB area.
> + * Note, some MTD drivers do not allow you to write more than one OOB area at
> + * one go. If you try to do that on such an MTD device, -EINVAL will be
> + * returned. If you want to make your implementation portable on all kind of MTD
> + * devices you should split the write request into several sub-requests when the
> + * request crosses a page boundary.
>   */
>  struct mtd_oob_ops {
>  	unsigned int	mode;
