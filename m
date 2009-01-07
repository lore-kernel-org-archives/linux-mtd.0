Received: from node3.inaccessnetworks.com ([212.205.200.118]
	helo=vm-dmz.priv.inaccessnetworks.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKVLW-0003XA-Qm
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 10:09:08 +0000
Received: from bender.priv.inaccessnetworks.com ([192.168.1.223])
	by vm-dmz.priv.inaccessnetworks.com with esmtp (Exim 4.69)
	(envelope-from <knakos@inaccessnetworks.com>) id 1LKV4R-0006kP-01
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 11:51:27 +0200
Message-ID: <49647B16.50006@inaccessnetworks.com>
Date: Wed, 07 Jan 2009 11:51:18 +0200
From: Kostas Nakos <knakos@inaccessnetworks.com>
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ndfc driver
References: <4950D8EA.7010905@inaccessnetworks.com>	<20081223170040.4e58de3f@lappy.seanm.ca>	<4958AD4E.8090608@inaccessnetworks.com>
	<20090105202340.7fd0f8c1@lappy.seanm.ca>
In-Reply-To: <20090105202340.7fd0f8c1@lappy.seanm.ca>
Content-Type: multipart/mixed; boundary="------------010203030203000507060509"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010203030203000507060509
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sean MacLennan wrote:
> That is where the NAND is on the warp. Could you post the complete dts?

Of course; attached. This is the one I use to boot the 2.6.28 kernel 
(with the hackish ndfc patches). The only changes required while 
migrating the entire dts from 2.6.26 to .28 concern just the ndfc block 
and particularly the parameter names according to the new scheme.

Thanks,
Kostas

--------------010203030203000507060509
Content-Type: text/plain;
 name="device.dts"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="device.dts"

/ {
        #address-cells = <2>;
        #size-cells = <1>;
        model = "amcc";
        compatible = "amcc";
        dcr-parent = <&/cpus/cpu@0>;

        aliases {
                ethernet0 = &EMAC0;
                ethernet1 = &EMAC1;
                serial0 = &UART0;
                serial1 = &UART1;
        };

        cpus {
                #address-cells = <1>;
                #size-cells = <0>;

                cpu@0 {
                        device_type = "cpu";
                        model = "PowerPC,440EPx";
                        reg = <0>;
                        clock-frequency = <0>; /* Filled in by zImage */
                        timebase-frequency = <0>; /* Filled in by zImage */
                        i-cache-line-size = <20>;
                        d-cache-line-size = <20>;
                        i-cache-size = <8000>;
                        d-cache-size = <8000>;
                        dcr-controller;
                        dcr-access-method = "native";
                };
        };

        memory {
                device_type = "memory";
                reg = <0 0 0>; /* Filled in by zImage */
        };

        UIC0: interrupt-controller0 {
                compatible = "ibm,uic-440epx","ibm,uic";
                interrupt-controller;
                cell-index = <0>;
                dcr-reg = <0c0 009>;
                #address-cells = <0>;
                #size-cells = <0>;
                #interrupt-cells = <2>;
        };

        UIC1: interrupt-controller1 {
                compatible = "ibm,uic-440epx","ibm,uic";
                interrupt-controller;
                cell-index = <1>;
                dcr-reg = <0d0 009>;
                #address-cells = <0>;
                #size-cells = <0>;
                #interrupt-cells = <2>;
                interrupts = <1e 4 1f 4>; /* cascade */
                interrupt-parent = <&UIC0>;
        };

        UIC2: interrupt-controller2 {
                compatible = "ibm,uic-440epx","ibm,uic";
                interrupt-controller;
                cell-index = <2>;
                dcr-reg = <0e0 009>;
                #address-cells = <0>;
                #size-cells = <0>;
                #interrupt-cells = <2>;
                interrupts = <1c 4 1d 4>; /* cascade */
                interrupt-parent = <&UIC0>;
        };

        SDR0: sdr {
                compatible = "ibm,sdr-440epx", "ibm,sdr-440ep";
                dcr-reg = <00e 002>;
        };

        CPR0: cpr {
                compatible = "ibm,cpr-440epx", "ibm,cpr-440ep";
                dcr-reg = <00c 002>;
        };

        plb {
                compatible = "ibm,plb-440epx", "ibm,plb4";
                #address-cells = <2>;
                #size-cells = <1>;
                ranges;
                clock-frequency = <0>; /* Filled in by zImage */

                SDRAM0: sdram {
                        compatible = "ibm,sdram-440epx", "ibm,sdram-44x-ddr2denali";
                        dcr-reg = <010 2>;
                };

                DMA0: dma {
                        compatible = "ibm,dma-440epx", "ibm,dma-4xx";
                        dcr-reg = <100 027>;
                };

                MAL0: mcmal {
                        compatible = "ibm,mcmal-440epx", "ibm,mcmal2";
                        dcr-reg = <180 62>;
                        num-tx-chans = <2>;
                        num-rx-chans = <2>;
                        interrupt-parent = <&MAL0>;
                        interrupts = <0 1 2 3 4>;
                        #interrupt-cells = <1>;
                        #address-cells = <0>;
                        #size-cells = <0>;
                        interrupt-map = </*TXEOB*/ 0 &UIC0 a 4
                                        /*RXEOB*/ 1 &UIC0 b 4
                                        /*SERR*/  2 &UIC1 0 4
                                        /*TXDE*/  3 &UIC1 1 4
                                        /*RXDE*/  4 &UIC1 2 4>;
                        interrupt-map-mask = <ffffffff>;
                };

                ndfc@0,d0000000 {
                        device_type = "nand";
                        compatible = "ibm,ndfc";
                        reg = <1 d0000000 2000>;
                        bank-settings = <80002222>;
                        ccr = <00001000>;
                        #address-cells = <1>;
                        #size-cells = <1>;

                        nand {
                                #address-cells = <1>;
                                #size-cells = <1>;

                                partition@0 {
                                        label = "u-boot";
                                        reg = <0 60000>;
                                };
                                partition@1 {
                                        label = "uboot-env-1";
                                        reg = <60000 4000>;
                                };
                                partition@2 {
                                        label = "uboot-env-2";
                                        reg = <64000 4000>;
                                };
                                partition@3 {
                                        label = "device-tree";
                                        reg = <68000 4000>;
                                };
                                partition@4 {
                                        label = "bootfs";
                                        reg = <6c000 340000>;
                                };
                                partition@5 {
                                        label = "rootfs";
                                        reg = <3ac000 0>;
                                };

                        };
                };

                USB0: ehci@e0000300 {
                        compatible = "ibm,usb-ehci-440epx", "usb-ehci";
                        interrupt-parent = <&UIC0>;
                        interrupts = <1a 4>;
                        reg = <0 e0000300 90 0 e0000390 70>;
                        big-endian;
                };

                POB0: opb {
                        compatible = "ibm,opb-440epx", "ibm,opb";
                        #address-cells = <1>;
                        #size-cells = <1>;
                        ranges = <00000000 1 00000000 80000000
                                          80000000 1 80000000 80000000>;
                        interrupt-parent = <&UIC1>;
                        interrupts = <7 4>;
                        clock-frequency = <0>; /* Filled in by zImage */

                        EBC0: ebc {
                                compatible = "ibm,ebc-440epx", "ibm,ebc";
                                dcr-reg = <012 2>;
                                #address-cells = <2>;
                                #size-cells = <1>;
                                clock-frequency = <0>; /* Filled in by zImage */
                                interrupts = <5 1>;
                                interrupt-parent = <&UIC1>;

                        };

                        UART0: serial@ef600300 {
                                device_type = "serial";
                                compatible = "ns16550";
                                reg = <ef600300 8>;
                                virtual-reg = <ef600300>;
                                clock-frequency = <0>; /* Filled in by zImage */
                                current-speed = <1c200>;
                                interrupt-parent = <&UIC0>;
                                interrupts = <0 4>;
                        };

                        UART1: serial@ef600400 {
                                device_type = "serial";
                                compatible = "ns16550";
                                reg = <ef600400 8>;
                                virtual-reg = <ef600400>;
                                clock-frequency = <0>;
                                current-speed = <0>;
                                interrupt-parent = <&UIC0>;
                                interrupts = <1 4>;
                        };

                        IIC0: i2c@ef600700 {
                                compatible = "ibm,iic-440gpx", "ibm,iic";
                                reg = <ef600700 14>;
                                index = <0>;
                                interrupt-parent = <&UIC0>;
                                interrupts = <2 4>;
                        };

                        IIC1: i2c@ef600800 {
                                compatible = "ibm,iic-440gpx", "ibm,iic";
                                reg = <ef600800 14>;
                                index = <1>;
                                interrupt-parent = <&UIC0>;
                                interrupts = <7 4>;
                        };

                        GPIO0: gpio@ef600b00 {
                                compatible = "ibm,gpio-440ep";
                                reg = <ef600b00 48>;
                                #gpio-cells = <2>;
                                gpio-controller;
                        };

                        GPIO1: gpio@ef600c00 {
                                compatible = "ibm,gpio-440ep";
                                reg = <ef600c00 48>;
                                #gpio-cells = <2>;
                                gpio-controller;
                        };

                        ZMII0: emac-zmii@ef600d00 {
                                compatible = "ibm,zmii-440epx", "ibm,zmii";
                                reg = <ef600d00 c>;
                        };

                        RGMII0: emac-rgmii@ef601000 {
                                compatible = "ibm,rgmii-440epx", "ibm,rgmii";
                                reg = <ef601000 8>;
                                has-mdio;
                        };

                        EMAC0: ethernet@ef600e00 {
                                device_type = "network";
                                compatible = "ibm,emac-440epx", "ibm,emac4";
                                interrupt-parent = <&EMAC0>;
                                interrupts = <0 1>;
                                #interrupt-cells = <1>;
                                #address-cells = <0>;
                                #size-cells = <0>;
                                interrupt-map = </*Status*/ 0 &UIC0 18 4
                                                /*Wake*/  1 &UIC1 1d 4>;
                                reg = <ef600e00 70>;
                                local-mac-address = [000000000000];
                                mal-device = <&MAL0>;
                                mal-tx-channel = <0>;
                                mal-rx-channel = <0>;
                                cell-index = <0>;
                                max-frame-size = <2328>;
                                rx-fifo-size = <1000>;
                                tx-fifo-size = <800>;
                                phy-mode = "rgmii";
                                phy-map = <00000000>;
                                zmii-device = <&ZMII0>;
                                zmii-channel = <0>;
                                rgmii-device = <&RGMII0>;
                                rgmii-channel = <0>;
                                has-inverted-stacr-oc;
                                has-new-stacr-staopc;
                        };

                        EMAC1: ethernet@ef600f00 {
                                device_type = "network";
                                compatible = "ibm,emac-440epx", "ibm,emac4";
                                interrupt-parent = <&EMAC1>;
                                interrupts = <0 1>;
                                #interrupt-cells = <1>;
                                #address-cells = <0>;
                                #size-cells = <0>;
                                interrupt-map = </*Status*/ 0 &UIC0 19 4
                                                /*Wake*/  1 &UIC1 1f 4>;
                                reg = <ef600f00 70>;
                                local-mac-address = [000000000000];
                                mal-device = <&MAL0>;
                                mal-tx-channel = <1>;
                                mal-rx-channel = <1>;
                                cell-index = <1>;
                                max-frame-size = <2328>;
                                rx-fifo-size = <1000>;
                                tx-fifo-size = <800>;
                                phy-mode = "rgmii";
                                phy-map = <00000000>;
                                zmii-device = <&ZMII0>;
                                zmii-channel = <1>;
                                rgmii-device = <&RGMII0>;
                                rgmii-channel = <1>;
                                has-inverted-stacr-oc;
                                has-new-stacr-staopc;
                        };
                        LEDS0: led0 {
                           compatible = "gpio-led";

                           label="led0";

                           gpios = <&GPIO1               1  0>;
                        };

                        LEDS1: led1 {
                           compatible = "gpio-led";

                           label="led1";

                           gpios = <&GPIO1               0  0>;
                        };

                        LEDS2: led2 {
                           compatible = "gpio-led";

                           label="led2";

                           gpios = <&GPIO0               1f  0>;
                        };
                        LEDS3: led3 {
                           compatible = "gpio-led";

                           label="led3";

                           gpios = <&GPIO0               1e  0>;
                        };
                        LEDS4: led4 {
                           compatible = "gpio-led";

                           label="led4";

                           gpios = <&GPIO0               1d  0>;
                        };

                        BUTTON0: button {
                           gpios = <&GPIO1               c  0
                                    >;
                           compatible = "gpio-button";
                           interrupt-parent = <&UIC0>;
                           interrupts = <1b 2>;
                        };

                };

                PCI0: pci@1ec000000 {
                        device_type = "pci";
                        #interrupt-cells = <1>;
                        #size-cells = <2>;
                        #address-cells = <3>;
                        compatible = "ibm,plb440epx-pci", "ibm,plb-pci";
                        primary;
                        reg = <1 eec00000 8     /* Config space access */
                               1 eed00000 4     /* IACK */
                               1 eed00000 4     /* Special cycle */
                               1 ef400000 40>;  /* Internal registers */

                        ranges = <02000000 0 80000000 1 80000000 0 40000000
                                01000000 0 00000000 1 e8000000 0 00010000
                                01000000 0 00000000 1 e8800000 0 03800000>;

                        dma-ranges = <42000000 0 0 0 0 0 80000000>;

                        interrupt-map-mask = <2800 0 0 0>;
                        interrupt-map = < 
                                          2000 0 0 0 &UIC2 3 8
                                          2800 0 0 0 &UIC2 4 8
                                        >;
                };
        };

        chosen {
                linux,stdout-path = "/plb/opb/serial@ef600300";
                bootargs = "console=ttyS0,115200 root=1f05 rootfstype=jffs2 getty_cons=ttyS0";
        };
};

--------------010203030203000507060509--
