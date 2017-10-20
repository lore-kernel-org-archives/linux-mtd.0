Received: from smtpcmd10101.aruba.it ([62.149.156.101])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e5Vye-0000Ph-Tb
 for linux-mtd@lists.infradead.org; Fri, 20 Oct 2017 12:00:43 +0000
To: Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org
From: Rodolfo Giometti <giometti@enneenne.com>
Subject: VF610 NAND driver on MPC5125
Message-ID: <653b2631-9e94-c37b-19ce-e7ede518b251@enneenne.com>
Date: Fri, 20 Oct 2017 14:00:00 +0200
MIME-Version: 1.0
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

Hello,

I'm trying to use this driver on a custom board based on MPC5125 equipped with a 
NAND chip TH58NVG5S0FTAK (which should be compatible with MT29F16G08AJADAWP).

Below is my DTS section NFC related:

         nfc@40000000 {
                 compatible = "fsl,vf610-nfc";
                 #address-cells = <0x1>;
                 #size-cells = <0x0>;
                 reg = <0x40000000 0x100000>;
                 interrupts = <0x6 0x8>;
                 interrupt-parent = <0x1>;
                 bank-width = <0x1>;
                 write-size = <4096>; // Page size
                 spare-size = <128>;  // OOB size
                 chips = <0x1>;
                 clocks = <&clks MPC512x_CLK_NFC>;
                 clock-names = "ipg";

                 nand@0 {
                         compatible = "fsl,vf610-nfc-nandcs";
                         reg = <0>;
                         nand-bus-width = <8>;
                         nand-ecc-mode = "hw";
                         nand-ecc-strength = <32>;
                         nand-ecc-step-size = <2048>;
                         nand-on-flash-bbt;
                 };
         };

Just enabling the driver as is I get the following:

[    0.886396] vf610_nfc 40000000.nfc: Timeout while waiting for BUSY.
[    0.998378] vf610_nfc 40000000.nfc: Timeout while waiting for BUSY.
[    1.110378] vf610_nfc 40000000.nfc: Timeout while waiting for BUSY.
[    1.222378] vf610_nfc 40000000.nfc: Timeout while waiting for BUSY.
[    1.334381] vf610_nfc 40000000.nfc: Timeout while waiting for BUSY.
[    1.340590] nand: No NAND device found

Any advice regarding why I get these timeout messages?

Thanks in advance,

Rodolfo

-- 

HCE Engineering                      e-mail: giometti@hce-engineering.it
GNU/Linux Solutions                          giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
Cosino Project - the quick prototyping embedded system - www.cosino.it
Freelance ICT Italia - Consulente ICT Italia - www.consulenti-ict.it
