Received: from mail-lb0-f173.google.com ([209.85.217.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOBjM-0005VP-Kt
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 19:55:53 +0000
Received: by mail-lb0-f173.google.com with SMTP id p9so1058466lbv.18
 for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2014 12:55:30 -0700 (PDT)
Message-ID: <53221B41.2030001@cogentembedded.com>
Date: Thu, 13 Mar 2014 23:55:29 +0300
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 3/6] ARM: mvebu: Add the Core Divider clock to Armada
 38x SoCs
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1394739542-30017-4-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1394739542-30017-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Seif Mazareeb <seif@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 03/13/2014 10:38 PM, Ezequiel Garcia wrote:

> From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

> The Armada 38x SoC family has a clock provider called "Core Divider",
> derived from the fixed 2 GHz main PLL clock. This is similar to the
> one on A370, A375 and AXP.

> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>   arch/arm/boot/dts/armada-38x.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)

> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index 38fc3a0..76cc27e 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -337,6 +337,14 @@
>   				compatible = "marvell,orion-mdio";
>   				reg = <0x72004 0x4>;
>   			};
> +
> +			coredivclk: corediv-clock@e4250 {

    I would suggest naming the device just "clock@e4250" on the same grounds 
of having the generic device names.

WBR, Sergei
