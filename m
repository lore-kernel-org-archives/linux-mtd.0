Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMBjS-0005lB-4B
 for linux-mtd@lists.infradead.org; Fri, 25 May 2018 12:22:08 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andy Gross <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 00/16] Update for QCOM NAND driver
Date: Fri, 25 May 2018 17:51:28 +0530
Message-Id: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* v3:

1. Addressed all review comments in v2.
2. Added patch for removing redundant nand-ecc-step-size DT property.
3. Renamed ECC configuration setup function with minor code changes.
4. Modified comments and commit message for few patches.

* v2:

1. Addressed all review comments in v1.
1. Make the generic helper function for NAND ECC parameters setup
   and used this helper function for QCOM and Denali nand driver
   for ECC setup.
2. Modified commit message for some of the patches and added more
   comments.
3. Added new patch for fixing ‘return 0’ for raw read.
4. Removed the read last codeword part for nand oob write.
5. Reorganized bad block check function and removed the
   read_last_cw function completely.

* v1:

This patch series mainly deals with error handling and erased page
bitflip detection for QCOM NAND driver.

1. The error handling was missing for some of the cases so fixed
   the same.

2. Add the support for taking ECC strength from ONFI parameter.
   The earlier QCOM boards were coming with 4-bit ECC chip but
   now the same boards are coming with 8-bit ECC chip since the
   earlier 4-bit parts are obsolete from some vendors.

3. We got few issues related with NAND erased page bitflips. The
   QCOM NAND controller can’t detect the bitflip in completely erased
   page so added the support to detect the same. It implemented the
   logic mentioned in patch [1] which didn’t go in mainline and later
   the generic functions were provided [2] to count the number of
   bitflips and make all 0xff. This patch series did some optimization
   logic to prevent the unnecessary full page raw read and data copy
   from QCOM NAND controller to DMA.

4. Following are the testing done for these patches in QCOM IPQ8074
   HK01 (4-bit and 8-bit ECC chip) and IPQ806x AP148 boards.
    a. Run all mtd test and check if it passes
    b. Introduce custom bitflips in erased page and check if it
       returns no error/EUCLEAN/EBADMSG depending upon number of
       bitflips and position.
    c. Introduce failure condition for operational failure and
       check if it detects the same.

[1]: https://patchwork.ozlabs.org/patch/328994/
[2]: https://patchwork.ozlabs.org/patch/509970/

Abhishek Sahu (16):
  mtd: rawnand: helper function for setting up ECC configuration
  mtd: rawnand: denali: use helper function for ecc setup
  dt-bindings: qcom_nandc: make nand-ecc-strength optional
  dt-bindings: qcom_nandc: remove nand-ecc-step-size
  mtd: rawnand: qcom: remove dt property nand-ecc-step-size
  mtd: rawnand: qcom: use the ecc strength from device parameter
  mtd: rawnand: qcom: wait for desc completion in all BAM channels
  mtd: rawnand: qcom: erased page detection for uncorrectable errors
    only
  mtd: rawnand: qcom: fix null pointer access for erased page detection
  mtd: rawnand: qcom: parse read errors for read oob also
  mtd: rawnand: qcom: modify write_oob to remove read codeword part
  mtd: rawnand: qcom: fix return value for raw page read
  mtd: rawnand: qcom: minor code reorganization for bad block check
  mtd: rawnand: qcom: check for operation errors in case of raw read
  mtd: rawnand: qcom: helper function for raw read
  mtd: rawnand: qcom: erased page bitflips detection

 .../devicetree/bindings/mtd/qcom_nandc.txt         |   7 +-
 drivers/mtd/nand/raw/denali.c                      |  30 +-
 drivers/mtd/nand/raw/nand_base.c                   |  31 +
 drivers/mtd/nand/raw/qcom_nandc.c                  | 628 ++++++++++++++-------
 include/linux/mtd/rawnand.h                        |   3 +
 5 files changed, 448 insertions(+), 251 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
