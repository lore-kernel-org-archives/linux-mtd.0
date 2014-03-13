Date: Thu, 13 Mar 2014 17:04:10 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 5/6] ARM: mvebu: Enable NAND controller in Armada 385-DB
Message-ID: <20140313200410.GA30590@arch.cereza>
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1394739542-30017-6-git-send-email-ezequiel@vanguardiasur.com.ar>
 <53221AD4.3090002@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53221AD4.3090002@cogentembedded.com>
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
> On 03/13/2014 10:39 PM, Ezequiel Garcia wrote:
> 
> >From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> 
> >The Armada 385-DB board has a NAND flash, so enable it in the
> >devicetree and add the partitions as prepared in the factory images.
> 
> >Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> >---
> >  arch/arm/boot/dts/armada-385-db.dts | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> 
> >diff --git a/arch/arm/boot/dts/armada-385-db.dts b/arch/arm/boot/dts/armada-385-db.dts
> >index 9a13642..edcf7ff 100644
> >--- a/arch/arm/boot/dts/armada-385-db.dts
> >+++ b/arch/arm/boot/dts/armada-385-db.dts
> >@@ -80,6 +80,27 @@
> >  					reg = <1>;
> >  				};
> >  			};
> >+
> >+			flash: flash@d0000 {
> 
>    Note that you don't have to label your device the same way as it's named,
> i.e. you could have labelled it "nand" if it would make things clearer.

Right.

>    Although I don't readily see the value of labeling nodes in the board's
> .dts file. Do you really expect to refer to it somewhere?
> 

Yeah, I was thinking the same thing just after I sent this. No, I don't think
we need the label.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
