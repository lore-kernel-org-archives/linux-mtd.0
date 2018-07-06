Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbLXT-000411-8x
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 07:52:24 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 0/5] Update for removing driver specific BBM functions
Date: Fri,  6 Jul 2018 13:21:54 +0530
Message-Id: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
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

This patch series deals mainly with removing driver specific bad block
functions and some minor fixing/cleanup.

1. When initial support for this driver was added [1], then the
   plan was to remove these driver specific functions when NAND base
   layer has support for doing raw read/write for bad block related
   things. Moving to raw read/write seems to take more time so this patch
   series implemented alternate logic for reading/writing bad block with
   normal read/write itself. This alternate logic relies on some
   assumption which seems to be better than driver specific functions and
   provide more functionality. Some discussion regarding it has already
   happened in [2].

2. Some part of code is duplicated in every read/write function
   so clean up the code by making helper function.

3. Bootloaders does access protection for some of the NAND
   registers which generates few write errors if it is enabled.

4. Create RAM based BBT table. Flash based BBT table can’t be
   used since our bootloader does not have support for the same.

**This patch series is rebased over linux-next with PATCH [3]

[1]: http://patchwork.ozlabs.org/patch/508565/
[2]: https://patchwork.ozlabs.org/patch/920563/
[3]: https://patchwork.ozlabs.org/patch/938631/

Abhishek Sahu (5):
  mtd: rawnand: qcom: remove driver specific bad block check function
  mtd: rawnand: qcom: remove driver specific block_markbad function
  mtd: rawnand: qcom: fix NAND register write errors
  mtd: rawnand: qcom: update BBT related flags
  mtd: rawnand: qcom: reorganization by removing read/write helpers

 drivers/mtd/nand/raw/qcom_nandc.c | 439 ++++++++++++++------------------------
 1 file changed, 162 insertions(+), 277 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
