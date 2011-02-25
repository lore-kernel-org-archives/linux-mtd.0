Subject: Re: [PATCH] mtd: nand: fix one typo in the comments
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Liu <r64343@freescale.com>
In-Reply-To: <1298610378-3105-1-git-send-email-r64343@freescale.com>
References: <1298610378-3105-1-git-send-email-r64343@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 14:43:05 +0200
Message-ID: <1298637785.2798.106.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, David.Woodhouse@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-25 at 13:06 +0800, Jason Liu wrote:
> In the function nand_do_write_oob, the comments
> has one typo, this patch fix it.
> 
> - /* Do not allow reads past end of device */
> + /* Do not allow write past end of device */
> if (unlikely(to >= mtd->size ||
> 	     ops->ooboffs + ops->ooblen >
> 		((mtd->size >> chip->page_shift) -
> 		 (to >> chip->page_shift)) * len)) {
> 	DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt write beyond "
> 			"end of device\n", __func__);
> 	return -EINVAL;
> }
> 
> Signed-off-by: Jason Liu <r64343@freescale.com>

Oh, please, do not copy the patch into the commit message! It is enough
to say that you fix a typo in a commentary.

But I've amended the commit message and pushed the patch to my
l2-mtd-2.6.git tree, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
