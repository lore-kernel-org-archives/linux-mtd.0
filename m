Message-ID: <1494492952.15376.4.camel@mhfsdcap03>
Subject: Re: [PATCH v1 1/2] mtd: nand: mediatek: update DT bindings
From: xiaolei li <xiaolei.li@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <rogercc.lin@mediatek.com>, <yt.shen@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Thu, 11 May 2017 16:55:52 +0800
In-Reply-To: <fdf9d691-347d-83e0-d4e4-734be5fbecd3@gmail.com>
References: <1494487532-36594-1-git-send-email-xiaolei.li@mediatek.com>
 <1494487532-36594-2-git-send-email-xiaolei.li@mediatek.com>
 <fdf9d691-347d-83e0-d4e4-734be5fbecd3@gmail.com>
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

Hi Matthias,

On Thu, 2017-05-11 at 10:08 +0200, Matthias Brugger wrote:
> 
> On 11/05/17 09:25, Xiaolei Li wrote:
> > Add MT2712 NAND Flash Controller dt bindings documentation.
> > 
> > Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> > ---
> >   Documentation/devicetree/bindings/mtd/mtk-nand.txt | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> > index 069c192..6482650 100644
> > --- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> > @@ -12,7 +12,9 @@ tree nodes.
> >   
> >   The first part of NFC is NAND Controller Interface (NFI) HW.
> >   Required NFI properties:
> > -- compatible:			Should be "mediatek,mtxxxx-nfc".
> > +- compatible:			Should be "mediatek,mt{SoC name}-nfc".
> > +				So far, the supported are
> > +				"mediatek,mt2701-nfc", "mediatek,mt2712-nfc".
> 
> Better would be:
> Should be one of "mediatek,mt2701-nfc", "mediatek,mt2712-nfc".

OK.
> 
> >   - reg:				Base physical address and size of NFI.
> >   - interrupts:			Interrupts of NFI.
> >   - clocks:			NFI required clocks.
> > @@ -141,7 +143,8 @@ Example:
> >   ==============
> >   
> >   Required BCH properties:
> > -- compatible:	Should be "mediatek,mtxxxx-ecc".
> > +- compatible:	Should be "mediatek,mt{SoC name}-ecc". So far, the supported
> > +		are "mediatek,mt2701-ecc", "mediatek,mt2712-ecc".
> 
> Same here.
> 
OK.
> >   - reg:		Base physical address and size of ECC.
> >   - interrupts:	Interrupts of ECC.
> >   - clocks:	ECC required clocks.
> > -- 
> > 1.9.1
> > 
> > ************* Email Confidentiality Notice
> >   ********************
> > The information contained in this e-mail message (including any
> > attachments) may be confidential, proprietary, privileged, or otherwise
> > exempt from disclosure under applicable laws. It is intended to be
> > conveyed only to the designated recipient(s). Any use, dissemination,
> > distribution, printing, retaining or copying of this e-mail (including its
> > attachments) by unintended recipient(s) is strictly prohibited and may
> > be unlawful. If you are not an intended recipient of this e-mail, or believe
> >   
> > that you have received this e-mail in error, please notify the sender
> > immediately (by replying to this e-mail), delete any and all copies of
> > this e-mail (including any attachments) from your system, and do not
> > disclose the content of this e-mail to any other person. Thank
> >   you!
> > 
> 
> Please fix your mail setup to not send this footer.
> 
OK. Has updated mail setting, should be OK now.

> Regards,
> Matthias
