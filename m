Received: from mail-la0-f42.google.com ([209.85.215.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOBo6-0005lJ-OS
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 20:00:47 +0000
Received: by mail-la0-f42.google.com with SMTP id ec20so1072159lab.29
 for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2014 13:00:24 -0700 (PDT)
Message-ID: <53221AD4.3090002@cogentembedded.com>
Date: Thu, 13 Mar 2014 23:53:40 +0300
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 5/6] ARM: mvebu: Enable NAND controller in Armada 385-DB
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1394739542-30017-6-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1394739542-30017-6-git-send-email-ezequiel@vanguardiasur.com.ar>
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

On 03/13/2014 10:39 PM, Ezequiel Garcia wrote:

> From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

> The Armada 385-DB board has a NAND flash, so enable it in the
> devicetree and add the partitions as prepared in the factory images.

> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>   arch/arm/boot/dts/armada-385-db.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)

> diff --git a/arch/arm/boot/dts/armada-385-db.dts b/arch/arm/boot/dts/armada-385-db.dts
> index 9a13642..edcf7ff 100644
> --- a/arch/arm/boot/dts/armada-385-db.dts
> +++ b/arch/arm/boot/dts/armada-385-db.dts
> @@ -80,6 +80,27 @@
>   					reg = <1>;
>   				};
>   			};
> +
> +			flash: flash@d0000 {

    Note that you don't have to label your device the same way as it's named, 
i.e. you could have labelled it "nand" if it would make things clearer.
    Although I don't readily see the value of labeling nodes in the board's 
.dts file. Do you really expect to refer to it somewhere?

WBR, Sergei
