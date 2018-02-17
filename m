Date: Sat, 17 Feb 2018 09:48:46 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 boris.brezillon@free-electrons.com, prabhakar.kushwaha@nxp.com,
 suresh.gupta@nxp.com, cyrille.pitchen@wedev4u.fr, han.xu@nxp.com,
 computersforpeace@gmail.com, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: spi: updated usage example for
 spi-rx/tx-bus-width properties
Message-ID: <20180217094846.60475e2f@bbrezillon>
In-Reply-To: <1518504675-26286-3-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1518504675-26286-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1518504675-26286-3-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Hi Yogesh,

Looks like you forgot to Cc Mark and the linux-spi ML.

Regards,

Boris

On Tue, 13 Feb 2018 12:21:15 +0530
Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Updated usage example by adding properties spi-rx-bus-width
> and spi-tx-bus-width for slave node binding.
> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
> Changes for v3:
> - None
> Changes for v2:
> - None
> 
>  Documentation/devicetree/bindings/spi/spi-bus.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt
> index 1f6e86f..4dbe267 100644
> --- a/Documentation/devicetree/bindings/spi/spi-bus.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
> @@ -101,6 +101,8 @@ SPI example for an MPC5200 SPI bus:
>  			compatible = "micrel,ks8995m";
>  			spi-max-frequency = <1000000>;
>  			reg = <0>;
> +			spi-rx-bus-width = 4;
> +			spi-tx-bus-width = 4;
>  		};
>  
>  		codec@1 {



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
