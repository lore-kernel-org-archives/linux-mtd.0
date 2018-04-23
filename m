Message-ID: <1524447862.14673.41.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/4] MAINTAINERS: Add entry for Mediatek NAND
 controller driver
From: xiaolei li <xiaolei.li@mediatek.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Mon, 23 Apr 2018 09:44:22 +0800
In-Reply-To: <20180420222451.20d72560@bbrezillon>
References: <1523864464-41059-1-git-send-email-xiaolei.li@mediatek.com>
 <1523864464-41059-3-git-send-email-xiaolei.li@mediatek.com>
 <20180420222451.20d72560@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2018-04-20 at 22:24 +0200, Boris Brezillon wrote:
> On Mon, 16 Apr 2018 15:41:02 +0800
> Xiaolei Li <xiaolei.li@mediatek.com> wrote:
> 
> > Add entry for Mediatek NAND controller driver and its bindings.
> > 
> > Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d262f17..429ef09 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8838,6 +8838,13 @@ L:	linux-wireless@vger.kernel.org
> >  S:	Maintained
> >  F:	drivers/net/wireless/mediatek/mt7601u/
> >  
> > +MEDIATEK NAND CONTROLLER DRIVER
> > +M:	Xiaolei Li <xiaolei.li@mediatek.com>
> > +L:	linux-mtd@lists.infradead.org
> > +S:	Maintained
> > +F:	drivers/mtd/nand/raw/mtk_*
> > +F:	Documentation/devicetree/bindings/mtd/mtk-nand.txt
> 
> Thanks for doing that.
> 
> I'll apply the patch, you can drop it from your v3.
> 
OK. Thanks.

> > +
> >  MEDIATEK RANDOM NUMBER GENERATOR SUPPORT
> >  M:	Sean Wang <sean.wang@mediatek.com>
> >  S:	Maintained
> 
