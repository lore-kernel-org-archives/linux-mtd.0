Message-ID: <53CF5E4A.8050306@gmail.com>
Date: Wed, 23 Jul 2014 15:03:38 +0800
From: Zhou Wang <wangzhou.bry@gmail.com>
MIME-Version: 1.0
To: Zhou Wang <wangzhou.bry@gmail.com>
Subject: Re: [PATCH v1 3/3] mtd: hisilicon: add device tree binding
 documentation
References: <1405421906-660-1-git-send-email-wangzhou.bry@gmail.com>
 <1405421906-660-4-git-send-email-wangzhou.bry@gmail.com>
In-Reply-To: <1405421906-660-4-git-send-email-wangzhou.bry@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jussi Kivilinna <jussi.kivilinna@iki.fi>, linux-doc@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Russell King <linux@arm.linux.org.uk>,
 Alexander Shiyan <shc_work@mail.ru>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Joern Engel <joern@logfs.org>, Rob Herring <robh+dt@kernel.org>,
 Pekon Gupta <pekon@ti.com>, linux-arm-kernel@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 wangzhou1@hisilicon.com, Kumar Gala <galak@codeaurora.org>,
 caizhiyong@huawei.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014年07月15日 18:58, Zhou Wang wrote:
> Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
> ---
>   .../devicetree/bindings/mtd/hisi-nand.txt          |   40 ++++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/hisi-nand.txt
>

Hi Randy Dunlap,

Is there anything that should be modified about this binding document? 
It would be very appreciated that I could get some comments from you.

Best regards,
Zhou

> diff --git a/Documentation/devicetree/bindings/mtd/hisi-nand.txt b/Documentation/devicetree/bindings/mtd/hisi-nand.txt
> new file mode 100644
> index 0000000..c8b3988
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/hisi-nand.txt
> @@ -0,0 +1,40 @@
> +Hisilicon Hip04 Soc NAND controller DT binding
> +
> +Required properties:
> +- compatible:          Should be "hisilicon,504-nfc".
> +- reg:                 The first contains base physical address and size of
> +                       NAND controller's registers. The second contains base
> +                       physical address and size of NAND controller's buffer.
> +- interrupts:          Interrupt number for nfc.
> +- nand-bus-width:      See nand.txt.
> +- nand-ecc-mode:       See nand.txt.
> +- hisi,nand-ecc-bits:  ECC bits type support.
> +                 <0>:  none ecc
> +                 <1>:  Can correct 1bit per 512byte.
> +                 <6>:  Can correct 16bits per 1K byte.
> +- #address-cells:      partition address, should be set 1.
> +- #size-cells:         partition size, should be set 1.
> +
> +Flash chip may optionally contain additional sub-nodes describing partitions of
> +the address space. See partition.txt for more detail.
> +
> +Example:
> +
> +	nand: nand@4020000 {
> +		compatible = "hisilicon,504-nfc";
> +		reg = <0x4020000 0x10000>, <0x5000000 0x1000>;
> +		interrupts = <0 379 4>;
> +		nand-bus-width = <8>;
> +		nand-ecc-mode = "hw";
> +		hisi,nand-ecc-bits = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		partition@0 {
> +			label = "nand_text";
> +			reg = <0x00000000 0x00400000>;
> +		};
> +
> +		...
> +
> +	};
>
