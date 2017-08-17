Message-ID: <1502934695.1128.11.camel@mhfsdcap03>
Subject: Re: [PATCH v5 1/1] dt-bindings: mtd: add new compatible strings and
 improve description
From: Guochun Mao <guochun.mao@mediatek.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Thu, 17 Aug 2017 09:51:35 +0800
In-Reply-To: <20170810182146.glmikeqpqwe66dwt@rob-hp-laptop>
References: <1501834239-25581-1-git-send-email-guochun.mao@mediatek.com>
 <1501834239-25581-2-git-send-email-guochun.mao@mediatek.com>
 <20170810182146.glmikeqpqwe66dwt@rob-hp-laptop>
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

On Thu, 2017-08-10 at 13:21 -0500, Rob Herring wrote:
> On Fri, Aug 04, 2017 at 04:10:39PM +0800, Guochun Mao wrote:
> > Add "mediatek,mt2712-nor" and "mediatek,mt7622-nor"
> > for nor flash node's compatible strings.
> > Explicate the fallback compatible.
> > 
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> > ---
> >  .../devicetree/bindings/mtd/mtk-quadspi.txt        |   15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>

Hi Rob,
Thank you very much!

Hi Matthias, Cyrille,
Thanks a lot for your efforts in reviewing the patch.

Is there any comment about the patch this version?
I appreciate your suggestion.

BR,
Guochun
