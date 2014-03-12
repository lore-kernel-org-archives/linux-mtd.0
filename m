Date: Wed, 12 Mar 2014 17:30:07 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 4/6] ARM: mvebu: Add support for NAND controller in
 Armada 38x SoC
Message-ID: <20140312203007.GA7396@arch.cereza>
References: <1394637404-7651-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394637404-7651-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <5320CEE7.6020506@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5320CEE7.6020506@cogentembedded.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Andrew Lunn <andrew@lunn.ch>, Seif Mazareeb <seif@marvell.com>,
 Lior Amsalem <alior@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 13, Sergei Shtylyov wrote:
> On 03/12/2014 06:16 PM, Ezequiel Garcia wrote:
> 
> >The Armada 38x SoC family has a NAND controller, compatible
> >with the controller in Armada 370/375/XP SoCs. Add support for
> >it in the devicetree file.
> 
> >Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> >---
> >  arch/arm/boot/dts/armada-38x.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> 
> >diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> >index 76cc27e..18d8f80 100644
> >--- a/arch/arm/boot/dts/armada-38x.dtsi
> >+++ b/arch/arm/boot/dts/armada-38x.dtsi
> >@@ -345,6 +345,16 @@
> >  				clocks = <&mainpll>;
> >  				clock-output-names = "nand";
> >  			};
> >+
> >+			nand@d0000 {
> 
>    ePAPR standard [1] tells us:
> 
> The name of a node should be somewhat generic, reflecting the function of
> the device and not its precise programming model. If appropriate, the name
> should be one of the following choices:
> 
> [...]
> • flash
> 

I think 'nand' is generic enough, isn't it?

In any case, it seems sane to distinguish a NAND flash from a NOR flash,
from a SPI flash.

FWIW, quite a few other SoCs have chosen 'nand' for the node name, including
the other Armada variants. Was this a wrong choice?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
