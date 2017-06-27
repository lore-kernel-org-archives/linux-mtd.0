Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPwuQ-0003Ct-1N
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 20:16:27 +0000
Date: Tue, 27 Jun 2017 22:15:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Peter Pan =?UTF-8?B?5r2Y5qCL?= (peterpandong)" <peterpandong@micron.com>
Cc: "richard@nod.at" <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "arnaud.mouiche@gmail.com"
 <arnaud.mouiche@gmail.com>, "thomas.petazzoni@free-electrons.com"
 <thomas.petazzoni@free-electrons.com>, "marex@denx.de" <marex@denx.de>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "peterpansjtu@gmail.com" <peterpansjtu@gmail.com>,
 "linshunquan1@hisilicon.com" <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
Message-ID: <20170627221552.6e4efff9@bbrezillon>
In-Reply-To: <B7799737-B040-4824-BBAF-5A0510CD553C@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
 <20170530001152.1d8beb72@bbrezillon>
 <B7799737-B040-4824-BBAF-5A0510CD553C@micron.com>
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

   
> >> 
> >> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> >> index dd9da71..04ad1dd 100644
> >> --- a/include/linux/mtd/spinand.h
> >> +++ b/include/linux/mtd/spinand.h
> >> @@ -103,11 +103,14 @@ struct spinand_controller_ops {
> >>  *          return directly and let others to detect.
> >>  * @init: initialize SPI NAND device.
> >>  * @cleanup: clean SPI NAND device footprint.
> >> + * @prepare_op: prepara read/write operation.  
> > 
> >           ^ prepare
> > 
> > 
> >   
> >>  */
> >> struct spinand_manufacturer_ops {
> >>    bool (*detect)(struct spinand_device *spinand);
> >>    int (*init)(struct spinand_device *spinand);
> >>    void (*cleanup)(struct spinand_device *spinand);
> >> +    void (*prepare_op)(struct spinand_device *spinand,
> >> +               struct spinand_op *op, u32 page, u32 column);  
> > 
> > It seems to be here to prepare read/write page operations, so I'd like
> > to rename this method ->prepare_page_op() if you don't mind.  
> 
> I'm ok with the new name

Hm, actually I wonder if this ->prepare_op() method is really what we
want. It seems to be here to set the proper plane number and the
number of dummy bytes after the address cycles.
I'd say deducing the plane from the page is something standard. Whether
we need it or not depends on the information provide in the memorg
object (->nplanes).

Regarding the dummy byte, do you have examples of SPI NANDs requiring
less or more dummy bytes in this read/write from/to cache use case?
If not, I'd prefer to keep it hardcoded in the core for know, and add
a hook when the need appears.
