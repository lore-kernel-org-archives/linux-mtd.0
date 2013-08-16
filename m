Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAKGs-0002Rr-Rr
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 13:40:55 +0000
Message-ID: <1376660759.2089.358.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 6/6] mtd: update the ABI document about the ecc step
 size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 16 Aug 2013 16:45:59 +0300
In-Reply-To: <1376619009-8622-7-git-send-email-b32955@freescale.com>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <1376619009-8622-7-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, pekon@ti.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-08-16 at 10:10 +0800, Huang Shijie wrote:
> +
> +What:          /sys/class/mtd/mtdX/ecc_step_size
> +Date:          May 2013
> +KernelVersion: 3.10
> +Contact:       linux-mtd@lists.infradead.org
> +Description:
> +               The size of each ECC step which is used for ECC.
> +               Note that some devices will have multiple ecc steps within each
> +               writesize region.

Actually this phrase is a bit confusing because it may be interpreted as
that one write-size may have ECC steps of multiple sizes. Would you
re-phrase, may be?

Otherwise the patch-set looks good, thanks, but I am not merging the
patches to let Brian review.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

-- 
Best Regards,
Artem Bityutskiy
