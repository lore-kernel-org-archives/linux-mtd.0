Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVa5R-0002FY-Up
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 10:11:39 +0000
Date: Wed, 20 Jun 2018 12:11:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Julien
 Su <juliensu@mxic.com.tw>, Mason Yang <masonccyang@mxic.com.tw>,
 <zhengxunli@mxic.com.tw>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: All AC chips have a broken
 GET_FEATURES(TIMINGS).
Message-ID: <20180620121122.65631b14@xps13>
In-Reply-To: <20180620094630.10212-1-boris.brezillon@bootlin.com>
References: <20180620094630.10212-1-boris.brezillon@bootlin.com>
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

Hi Boris,

On Wed, 20 Jun 2018 11:46:30 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> From: Mason Yang <masonccyang@mxic.com.tw>
> 
> Make sure we flag all broken chips as not supporting this feature.
> Also move this logic to a new function to keep things readable.
> 
> Fixes: 34c5c01e0c8c ("mtd: rawnand: macronix: nack the support of changing timings for one chip")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v2:
> - Add Fixes and Cc-stable tags

Thank you ;)

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
