Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3fnk-0003w8-GW
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 10:38:02 +0000
Received: by mail-wm0-x243.google.com with SMTP id b127so38954883wmf.5
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2018 03:37:51 -0700 (PDT)
Subject: Re: [RFC PATCH 3/4] dt-bindings: Add binding file for NXP FlexSPI
 driver
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 frieder.schrempf@exceet.de, suresh.gupta@nxp.com
References: <1522836371-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1522836371-2828-4-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3292873d-c94e-e140-e09a-6529e672cb5e@gmail.com>
Date: Wed, 4 Apr 2018 12:37:26 +0200
MIME-Version: 1.0
In-Reply-To: <1522836371-2828-4-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/04/2018 12:06 PM, Yogesh Gaur wrote:
> Added binding file for NXP FlexSPI driver in Documentation folder.

What's a "folder" ?

> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
>  .../devicetree/bindings/mtd/nxp-flexspi.txt        | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp-flexspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nxp-flexspi.txt b/Documentation/devicetree/bindings/mtd/nxp-flexspi.txt
> new file mode 100644
> index 0000000..23817dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nxp-flexspi.txt
> @@ -0,0 +1,40 @@
> +* NXP Flex Serial Peripheral Interface(FlexSPI)
> +
> +Required properties:
> +  - compatible : Should be "nxp,lx2160a-fspi"
> +  - reg : the first contains the register location and length,
> +          the second contains the memory mapping address and length
> +  - reg-names: Should contain the reg names "FSPI" and "FSPI-memory"

This should be lowercase.

> +  - interrupts : Should contain the interrupt for the device
> +
> +Optional properties:
> +  - nxp,fspi-has-second-chip: The controller has two buses, bus A and bus B.
> +			      Each bus can be connected with two NOR flashes.
> +			      Most of the time, each bus only has one NOR flash
> +			      connected, this is the default case.
> +			      But if there are two NOR flashes connected to the
> +			      bus, you should enable this property.
> +			     ( Please check the board's schematic.)

Can't you model this by specifying two chips in the DT ?

> +  - big-endian : That means the IP register is big endian. If not specified,
> +		 IP register works in little endian mode.
> +
> +Example:
> +fspi0: flexspi@20c0000 {
> +	compatible = "nxp,lx2160a-fspi";
> +	reg = <0x0 0x20c0000 0x0 0x10000>, <0x0 0x20000000 0x0 0x10000000>;
> +	reg-names = "FSPI", "FSPI-memory";
> +	interrupts = <0 25 0x4>; /* Level high type */
> +
> +	status = "okay";
> +	nxp,fspi-has-second-chip;
> +	flash0: mt35xu512aba@0 {
> +		reg = <0>;
> +		....
> +	};
> +
> +	flash1: mt35xu512aba@1 {
> +		reg = <1>;
> +		....
> +	};
> +
> +};
> 


-- 
Best regards,
Marek Vasut
