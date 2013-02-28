Message-ID: <512F17B0.5080705@freescale.com>
Date: Thu, 28 Feb 2013 16:39:12 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 07/12] mtd: gpmi: move to use generic DMA helper
References: <1361978748-25281-1-git-send-email-shawn.guo@linaro.org>
 <1361978748-25281-8-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1361978748-25281-8-git-send-email-shawn.guo@linaro.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Arnd Bergmann <arnd@arndb.de>,
 Artem Bityutskiy <dedekind1@gmail.com>, Vinod Koul <vinod.koul@intel.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA02=D4=C227=C8=D5 23:25, Shawn Guo =D0=B4=B5=C0:
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> @@ -7,10 +7,12 @@ Required properties:
>    - compatible : should be "fsl,<chip>-gpmi-nand"
>    - reg : should contain registers location and length for gpmi and bc=
h.
>    - reg-names: Should contain the reg names "gpmi-nand" and "bch"
> -  - interrupts : The first is the DMA interrupt number for GPMI.
> -                 The second is the BCH interrupt number.
> -  - interrupt-names : The interrupt names "gpmi-dma", "bch";
> -  - fsl,gpmi-dma-channel : Should contain the dma channel it uses.
> +  - interrupts : BCH interrupt number.
> +  - interrupt-names : Should be "bch".
why split out the bch interrupt? It seems no use to do it.

thanks
Huang Shijie
