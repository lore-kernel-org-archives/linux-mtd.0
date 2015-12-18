Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA3vv-0007Le-Mi
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 22:55:33 +0000
Received: by mail-pa0-x233.google.com with SMTP id wq6so67043449pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 14:55:11 -0800 (PST)
Date: Fri, 18 Dec 2015 14:55:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Yao Yuan <yao.yuan@freescale.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>, Xu Han <han.xu@freescale.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: fsl-quadspi: add big-endian support
Message-ID: <20151218225508.GT10460@google.com>
References: <1447838008-3744-1-git-send-email-yao.yuan@freescale.com>
 <20151125190900.GA2959@chopperman.am.freescale.net>
 <BLUPR03MB134C01F17B8F52849C4CFD783E10@BLUPR03MB134.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BLUPR03MB134C01F17B8F52849C4CFD783E10@BLUPR03MB134.namprd03.prod.outlook.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 18, 2015 at 09:12:13AM +0000, Yao Yuan wrote:
> Hi Woodhouse, Norris,
> 
> Do you have any comments for this patch?

No, it looks fine. But the driver maintainer (Han) already asked you for
DT binding documentation already. This is a requirement before I can
merge your patch. See
Documentation/devicetree/bindings/submitting-patches.txt.

> Thanks for your review.
> 
> Best Regards,
> Yuan Yao
> 
> > -----Original Message-----
> > From: Han Xu [mailto:han.xu@freescale.com]

> > > +	q->big_endian = of_property_read_bool(np, "big-endian");
> > 
> > I am fine with this patch, but need document the new property with another
> > patch

^^^ See here

Brian
