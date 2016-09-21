Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmiCG-0001vb-67
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 14:08:27 +0000
Received: by mail-qt0-x22e.google.com with SMTP id 93so22820018qtg.2
 for <linux-mtd@lists.infradead.org>; Wed, 21 Sep 2016 07:08:02 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Tomas_=C5=BDukauskas?= <tomaszonline@gmail.com>
Date: Wed, 21 Sep 2016 17:08:00 +0300
Message-ID: <CA+0YsZrSAF4-fy=e4+tU+PSPVhZ6DraD1_tEy1RWEPzL6_2aOA@mail.gmail.com>
Subject: denali nand: reading fails with error: timeout occurred, status =
 0x4, mask = 0x3
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have problem reading from MT29F8G08ADADAH4 NAND flash.
Reading the nand flash fails with error:  "timeout occurred, status =
0x4, mask = 0x3"
Writing and erasing works fine.

System info: Altera CycloneV SOCFPGA, ARM v7 (custom board)
Kernel: longterm 4.4.21 (same problem with 4.1.13 kernel)
Driver: denali

driver messages at boot:
[    0.714460] denali-nand-dt ff900000.nand: Dump timing register values:
[    0.714460] acc_clks: 4, re_2_we: 20, re_2_re: 20
[    0.714460] we_2_re: 12, addr_2_data: 14, rdwr_en_lo_cnt: 2
[    0.714460] rdwr_en_hi_cnt: 2, cs_setup_cnt: 2
[    0.736767] nand: Could not find valid ONFI parameter page; aborting
[    0.743306] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd3
[    0.749661] nand: Micron NAND 1GiB 3,3V 8-bit
[    0.754030] nand: 1024 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64

dt configuration:
        nand: nand@ff900000 {
            #address-cells = <1>;
            #size-cells = <1>;
            compatible = "denali,denali-nand-dt";
            reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
            reg-names = "nand_data", "denali_reg";
            interrupts = <0 144 4>;
            dma-mask = <0xffffffff>;
            clocks = <&nand_clk>;
            have-hw-ecc-fixup;
            status = "okay";

            partition@nand-boot {
                /* 8MB for raw data. */
                label = "NAND Flash Boot Area 16MB";
                reg = <0x0 0x01000000>;
            };
        };

I found same problem reported with no solution on:
https://lists.rocketboards.org/pipermail/rfi/2016-May/003416.html

Any suggestions?
