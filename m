Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFZtH-0007YB-7v
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2018 07:18:30 +0000
Date: Thu, 25 Oct 2018 09:16:53 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: masonccyang@mxic.com.tw
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 juliensu@mxic.com.tw, zhengxunli@mxic.com.tw
Subject: Re: [PATCH] mtd: rawnand: Add all 1.8V AC chips have a broken
 GET_FEATURES(TIMINGS)
Message-ID: <20181025091653.113a3d6e@bbrezillon>
In-Reply-To: <1540449871-7224-1-git-send-email-masonccyang@mxic.com.tw>
References: <1540449871-7224-1-git-send-email-masonccyang@mxic.com.tw>
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

Hi Mason,

On Thu, 25 Oct 2018 14:44:30 +0800
masonccyang@mxic.com.tw wrote:

> From: Mason Yang <masonccyang@mxic.com.tw>
> 
> Hi Boris,
> I patched this for Macronix all 1.8V AC chips.
> Thanks for your review.

No need to add a cover letter when you only have patch.
 
> best regards,
> Mason
> 
> Mason Yang (1):
>   mtd: rawnand: Add All 1.8V AC chips have a broken
>     GET_FEATURES(TIMINGS)
> 
>  drivers/mtd/nand/raw/nand_macronix.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
