Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xjepl-00051x-Q7
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 01:47:30 +0000
Received: by mail-pa0-f52.google.com with SMTP id fa1so4331049pad.25
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 18:47:07 -0700 (PDT)
Date: Wed, 29 Oct 2014 18:47:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v2] mtd: omap: fix mtd devices not showing up
Message-ID: <20141030014704.GE23619@ld-irv-0074>
References: <1414416749-19598-1-git-send-email-frans.klaver@xsens.com>
 <1414420445-9020-1-git-send-email-frans.klaver@xsens.com>
 <544F6611.1000801@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <544F6611.1000801@ti.com>
Cc: Frans Klaver <frans.klaver@xsens.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Ezequiel =?iso-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 28, 2014 at 11:46:57AM +0200, Roger Quadros wrote:
> On 10/27/2014 04:34 PM, Frans Klaver wrote:
> > Since commit 6d178ef2fd5e ("mtd: nand: Move ELM driver and rename as
> > omap_elm"), I don't have any mtd devices present on my am335x. This
> > changes the link order of the omap_elm and omap2 objects, causing them
> > to probe in the wrong order.
> > 
> > To fix this, make elm_config defer probing until the omap_elm driver is
> > actually loaded.
> > 
> > Signed-off-by: Frans Klaver <frans.klaver@xsens.com>
> 
> Acked-by: Roger Quadros <rogerq@ti.com>

Pushed to l2-mtd.git/for-3.18. Thanks!

While this might be considered a link-order bug from long ago, it's not
actually important until 3.18-rc1 where we changed the link order,
right? So it doesn't need to go to -stable?

Brian
