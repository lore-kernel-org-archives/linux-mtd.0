Date: Tue, 3 Jan 2017 09:48:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Richard Weinberger <richard@nod.at>, Mark Rutland
 <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Mans Rullgard
 <mans@mansr.com>, Arnd Bergmann <arnd@arndb.de>, linux-mtd
 <linux-mtd@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1] mtd: nand: tango: Update DT binding description
Message-ID: <20170103094814.54b45f53@bbrezillon>
In-Reply-To: <24522cc9-9d9a-980d-8cd2-18fb0de19a5f@sigmadesigns.com>
References: <ba47f2f1-bcdc-91e8-ed79-153931ccdad8@sigmadesigns.com>
 <20161229192302.5c94ecdb@bbrezillon>
 <24522cc9-9d9a-980d-8cd2-18fb0de19a5f@sigmadesigns.com>
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

On Tue, 3 Jan 2017 09:34:59 +0100
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> On 29/12/2016 19:23, Boris Brezillon wrote:
> > On Mon, 19 Dec 2016 15:30:12 +0100
> > Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:
> >   
> >> Visually separate register ranges (address/size pairs) in reg prop.
> >> Change DMA channel name, for consistency with other drivers.
> >>
> >> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> >> ---
> >>  Documentation/devicetree/bindings/mtd/tango-nand.txt | 6 +++---
> >>  drivers/mtd/nand/tango_nand.c                        | 2 +-
> >>  2 files changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/tango-nand.txt b/Documentation/devicetree/bindings/mtd/tango-nand.txt
> >> index ad5a02f2ac8c..cd1bf2ac9055 100644
> >> --- a/Documentation/devicetree/bindings/mtd/tango-nand.txt
> >> +++ b/Documentation/devicetree/bindings/mtd/tango-nand.txt
> >> @@ -5,7 +5,7 @@ Required properties:
> >>  - compatible: "sigma,smp8758-nand"
> >>  - reg: address/size of nfc_reg, nfc_mem, and pbus_reg
> >>  - dmas: reference to the DMA channel used by the controller
> >> -- dma-names: "nfc_sbox"
> >> +- dma-names: "rxtx"  
> > 
> > You probably want to fix the driver accordingly ;-).  
> 
> I'm confused...
> 
> Did you miss the change (below) to drivers/mtd/nand/tango_nand.c
> fixing the driver as well as the documentation?

Indeed, I missed it. The patch is fine, I'll queue it for 4.10-rcX.

Sorry for the noise.

BTW, I heard you had some fixes for 4.10. Feel free to send them.

Regards,

Boris
