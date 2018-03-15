Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewTrC-0008G1-9g
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 14:27:56 +0000
Subject: Re: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found.
 is25lp256d
To: Frank Smith <smith-f@gmx.de>
References: <trinity-f2c4ec20-92aa-4549-961a-54ada3bed090-1521123187434@3c-app-gmx-bs35>
Cc: linux-mtd@lists.infradead.org
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <4fa247df-ecd3-1034-aaa1-45bfdc1bcda8@exceet.de>
Date: Thu, 15 Mar 2018 15:27:33 +0100
MIME-Version: 1.0
In-Reply-To: <trinity-f2c4ec20-92aa-4549-961a-54ada3bed090-1521123187434@3c-app-gmx-bs35>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hi Frank,

On 15.03.2018 15:13, Frank Smith wrote:
> Dear list,
> 
> I am trying to get a new issi flash device (is25lp256d, 32MB) working.
> http://www.issi.com/WW/pdf/IS25LP(WP)256D.pdf
> 
> Therefore I added this line to spi-nor.c:
> 
> { "is25lp256d", INFO(0x9d6019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK) },
> 
> I can confirm the flash device works as espected for the first 16MB.
> 
> 
> But, when I change the partition in the device tree, from 16MB to 32MB I get the following errror: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found.

I guess you need to set SPI_NOR_4B_OPCODES flag to use 4 byte addressing 
and be able to access memory above 16MB.

Regards,

Frieder

> 
> Changed "reg = <0x600000 0xa00000>;" to "reg = <0x600000 0x1a00000>;" in my device-tree file as follows:
> 
> spi_2: spi@0x31044000 {
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	compatible = "adi,spi3";
> 	reg = <0x31044000 0xFF>;
> 	interrupts = <0 71 0>;
> 	num-cs = <128>;
> 	dma-channel = <26>, <27>;
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&spi2_quad>;
> 
> 	flash: s25fl128s@0 {
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		compatible = "issi,is25lp256d", "jedec,spi-nor";
> 		spi-max-frequency = <50000000>;
> 		reg = <31>;
> 		spi-cpol;
> 		spi-cpha;
> 		spi-tx-bus-width = <4>;
> 		spi-rx-bus-width = <4>;
> 		dma-mode;
> 		partition@0 {
> 			label = "uboot (spi)";
> 			reg = <0x0 0x80000>;
> 		};
> 		partition@1 {
> 			label = "kernel (spi)";
> 			reg = <0x80000 0x580000>;
> 		};
> 		partition@2 {
> 			label = "root file system (spi)";
> 			reg = <0x600000 0x1a00000>;   /* <--- changed this from 0x0a00000 to 0x1a00000 */
> 		};
> 	};
> };
> 
> Tried to use mtd-tools, but when writing at address 0xaXXXXX or higher, linux starts hanging, without a Ops.
> 
> Any Ideas? What is wrong with the higher addresses?
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
