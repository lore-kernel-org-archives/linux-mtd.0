Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaLwO-0006FI-Oj
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 09:15:37 +0000
Received: by mail-pa0-f48.google.com with SMTP id hz1so10680908pad.21
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 02:15:16 -0700 (PDT)
Date: Wed, 16 Apr 2014 02:15:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: fix __iomem annotations
Message-ID: <20140416091512.GG5512@norris-Latitude-E6410>
References: <1397638079-1894-1-git-send-email-computersforpeace@gmail.com>
 <534E4528.6030700@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <534E4528.6030700@freescale.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 16, 2014 at 04:54:00PM +0800, Huang Shijie wrote:
> 于 2014年04月16日 16:47, Brian Norris 写道:
> > This corrects some sparse warnings:
> >
> >    drivers/mtd/spi-nor/fsl-quadspi.c:281:31: warning: incorrect type in initializer (different address spaces) [sparse]
> >    drivers/mtd/spi-nor/fsl-quadspi.c:281:31:    expected void *[noderef] <asn:2>base [sparse]
> >    drivers/mtd/spi-nor/fsl-quadspi.c:281:31:    got void [noderef] <asn:2>*iobase [sparse]
> >    (etc.)
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> > Branched off of a previous patch series, but dropped the memcpy() stuff for now
> >
> Acked-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git/spinor.

Brian
