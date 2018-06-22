Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWKLf-0006sh-M6
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 11:35:32 +0000
Date: Fri, 22 Jun 2018 13:35:06 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2] mtd: rawnand: All AC chips have a broken
 GET_FEATURES(TIMINGS).
Message-ID: <20180622133506.4057c782@bbrezillon>
In-Reply-To: <20180620121122.65631b14@xps13>
References: <20180620094630.10212-1-boris.brezillon@bootlin.com>
 <20180620121122.65631b14@xps13>
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

On Wed, 20 Jun 2018 12:11:22 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> On Wed, 20 Jun 2018 11:46:30 +0200, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> 
> > From: Mason Yang <masonccyang@mxic.com.tw>
> > 
> > Make sure we flag all broken chips as not supporting this feature.
> > Also move this logic to a new function to keep things readable.
> > 
> > Fixes: 34c5c01e0c8c ("mtd: rawnand: macronix: nack the support of changing timings for one chip")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> > Changes in v2:
> > - Add Fixes and Cc-stable tags  
> 
> Thank you ;)
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied.

Thanks,

Boris

> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
