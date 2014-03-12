Received: from mail-lb0-f169.google.com ([209.85.217.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNpbG-0002Pv-7H
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 20:18:03 +0000
Received: by mail-lb0-f169.google.com with SMTP id q8so21107lbi.14
 for <linux-mtd@lists.infradead.org>; Wed, 12 Mar 2014 13:17:33 -0700 (PDT)
Message-ID: <5320CEE7.6020506@cogentembedded.com>
Date: Thu, 13 Mar 2014 00:17:27 +0300
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Mike Turquette <mturquette@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 4/6] ARM: mvebu: Add support for NAND controller in Armada
 38x SoC
References: <1394637404-7651-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394637404-7651-5-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1394637404-7651-5-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Andrew Lunn <andrew@lunn.ch>, Seif Mazareeb <seif@marvell.com>,
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

On 03/12/2014 06:16 PM, Ezequiel Garcia wrote:

> The Armada 38x SoC family has a NAND controller, compatible
> with the controller in Armada 370/375/XP SoCs. Add support for
> it in the devicetree file.

> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>   arch/arm/boot/dts/armada-38x.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)

> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index 76cc27e..18d8f80 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -345,6 +345,16 @@
>   				clocks = <&mainpll>;
>   				clock-output-names = "nand";
>   			};
> +
> +			nand@d0000 {

    ePAPR standard [1] tells us:

The name of a node should be somewhat generic, reflecting the function of the 
device and not its precise programming model. If appropriate, the name should 
be one of the following choices:

[...]
• flash

[1] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf

WBR, Sergei
