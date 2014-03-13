Date: Thu, 13 Mar 2014 17:05:46 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 3/6] ARM: mvebu: Add the Core Divider clock to Armada
 38x SoCs
Message-ID: <20140313200546.GB30590@arch.cereza>
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1394739542-30017-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <53221B41.2030001@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53221B41.2030001@cogentembedded.com>
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org,
 Mike Turquette <mturquette@linaro.org>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Seif Mazareeb <seif@marvell.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
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
> Hello.
> 
> On 03/13/2014 10:38 PM, Ezequiel Garcia wrote:
> 
> >From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> 
> >The Armada 38x SoC family has a clock provider called "Core Divider",
> >derived from the fixed 2 GHz main PLL clock. This is similar to the
> >one on A370, A375 and AXP.
> 
> >Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> >---
> >  arch/arm/boot/dts/armada-38x.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> >diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> >index 38fc3a0..76cc27e 100644
> >--- a/arch/arm/boot/dts/armada-38x.dtsi
> >+++ b/arch/arm/boot/dts/armada-38x.dtsi
> >@@ -337,6 +337,14 @@
> >  				compatible = "marvell,orion-mdio";
> >  				reg = <0x72004 0x4>;
> >  			};
> >+
> >+			coredivclk: corediv-clock@e4250 {
> 
>    I would suggest naming the device just "clock@e4250" on the same grounds
> of having the generic device names.
> 

Right, I overlooked this.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
