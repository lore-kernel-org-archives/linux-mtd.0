Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3hkZ-0001oK-Fo
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 12:42:53 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 0/9] Update for QCOM NAND driver
Date: Wed,  4 Apr 2018 18:12:16 +0530
Message-Id: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
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

Abhishek Sahu (9):
  mtd: nand: qcom: use the ecc strength from device parameter
  mtd: nand: qcom: wait for desc completion in all BAM channels
  mtd: nand: qcom: erased page detection for uncorrectable errors only
  mtd: nand: qcom: fix null pointer access for erased buffer detection
  mtd: nand: qcom: parse read errors for read oob also
  mtd: nand: qcom: support for checking read errors for last codeword
  mtd: nand: qcom: check for operation errors in case of raw read
  mtd: nand: qcom: helper function for raw read
  mtd: nand: qcom: erased page bitflips detection

 drivers/mtd/nand/qcom_nandc.c | 468 ++++++++++++++++++++++++++++++------------
 1 file changed, 333 insertions(+), 135 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
