Date: Wed, 2 Aug 2017 10:36:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Guochun Mao <guochun.mao@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Russell
 King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org, David
 Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mtd: add new compatible strings for mtk
 nor controller
Message-ID: <20170802103637.16cd6548@bbrezillon>
In-Reply-To: <03016ea3-51ad-0b2d-e824-0a20913bd7c1@gmail.com>
References: <1500948617-19627-1-git-send-email-guochun.mao@mediatek.com>
 <1500948617-19627-2-git-send-email-guochun.mao@mediatek.com>
 <03016ea3-51ad-0b2d-e824-0a20913bd7c1@gmail.com>
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

Hi Matthias,

On Tue, 1 Aug 2017 14:33:22 +0200
Matthias Brugger <matthias.bgg@gmail.com> wrote:

> On 07/25/2017 04:10 AM, Guochun Mao wrote:
> > Add "mediatek,mt2712-nor" and "mediatek,mt7622-nor"
> > for nor flash node's compatible strings.
> > 
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> > ---
> >   .../devicetree/bindings/mtd/mtk-quadspi.txt        |    2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > index 5ded66a..9845ff4 100644
> > --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > @@ -3,6 +3,8 @@
> >   Required properties:
> >   - compatible: 	  The possible values are:
> >   		  "mediatek,mt2701-nor"
> > +		  "mediatek,mt2712-nor"
> > +		  "mediatek,mt7622-nor"
> >   		  "mediatek,mt7623-nor"
> >   		  "mediatek,mt8173-nor"
> >   		  For mt8173, compatible should be "mediatek,mt8173-nor".
> >   
> 
> Boris, will you take this through your tree, or do you prefer that I take it?

I'm not the spi-nor maintainer, you should ask Cyrille or Marek.

Regards,

Boris
