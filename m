Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eADVE-0000mu-I9
 for linux-mtd@lists.infradead.org; Thu, 02 Nov 2017 11:17:50 +0000
Received: by mail-lf0-x22a.google.com with SMTP id l23so5984213lfk.10
 for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2017 04:17:19 -0700 (PDT)
Message-ID: <1509621436.16695.3.camel@gmail.com>
Subject: sam9x5: MTD numbering changed
From: Richard Genoud <richard.genoud@gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Peter Rosin
 <peda@axentia.se>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Date: Thu, 02 Nov 2017 12:17:16 +0100
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've got an at91sam9g35-cm based board, with 4 partition on the spi-
dataflas and 5 partitions on the NAND flash.
Before commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND bindings"),
the NAND partitions were mtd0-4 and spi-dataflash partitions mtd5-8.

Since commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND bindings"),
the spi-dataflash partitions are discovered before the NAND partitions.
So NAND partition became mtd4-8 and spi-dataflash partition mtd0-3.

This broke some script that relied on the mtd numbering.

Updating those scripts to rely on the mtd device name instead of
number is not really a problem. The real problem is when an older
script using mtd numbering is run on the new system : I expect dead
kittens everywhere !

So, I'd like to know if there's a way to force the older numbering ?
(I tried poking around the DTS without succès).

any idea ?

regards,
Richard.


PS:
DTS looks like that:
/dts-v1/;
#include "at91sam9g35.dtsi"
#include "at91sam9x5cm.dtsi"

/ {
	ahb {
		apb {
			spi0: spi@f0000000 {
				pinctrl-0 = <&pinctrl_spi0 &pinctrl_spi0_cs>;
				status = "okay";
				cs-gpios = <&pioA 14 GPIO_ACTIVE_HIGH>, <0>, <0>, <0>;
				m25p80@0 {
					#address-cells = <1>;
					#size-cells = <1>;
					compatible = "atmel,at25df321a";
					spi-max-frequency = <50000000>;
					m25p,fast-read;
					reg = <0>;

					partitions {
						compatible = "fixed-partitions";
						#address-cells = <1>;
						#size-cells = <1>;

						bootpri@0000000 {
							label = "bootpri";
							reg = <0x00000000 0x00008000>;
						};

						bootsec@0008000 {
							label = "bootsec";
							reg = <0x00008000 0x00100000>;
						};

						bootenv@00108000 {
							label = "bootenv";
							reg = <0x00108000 0x00110000>;
						};

						free@00110000 {
							label = "free";
							reg = <0x00110000 0x002f0000>;
						};
					};
				};
			};
		};

                ebi: ebi@10000000 {
                        nand_controller: nand-controller {
                                nand@3 {
                                        status = "okay";
                                        nand-ecc-strength = <4>;
                                };
                        };
                };
	};
};
