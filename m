Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VturO-0001Tp-Td
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:51:03 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 0/5] mtd: nand: omap: optimized chip->ecc.correct() for H/W
 ECC schemes
Date: Fri, 20 Dec 2013 13:20:15 +0530
Message-ID: <1387525820-25709-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: avinashphilipk@gmail.com, Felipe Balbi <balbi@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series is split version of earlier patch:
http://lists.infradead.org/pipermail/linux-mtd/2013-November/050241.html

chip->ecc.correct() is used for detecting and correcting bit-flips during read
operations. In OMAP NAND driver different ecc-schemes have different callbacks:
 - omap_correct_data()		for HAM1_HW ecc-schemes (Untouched)
 - nand_bch_correct_data()	for BCHx_HW_DETECTION_SW ecc-schemes (Untouched)
 - omap_elm_correct_data()	for BCHx_HW ecc-schemes

This patch-series fixes following issues in omap_elm_correct_data():
(1) Dependency on a specific reserved byte-position in OOB area
    to differentiates between erased-pages v/s programmed-pages.
    Problem: reserved byte-position cannot be accomodated in all ecc-schemes
    Problem: reserved byte-position can itself be subjected upto 8 bit-flips
             causing the 0xff to become 0x00, causing page to be
             mis-recognized as erased-page.

(2) Bit-flips in erased-pages are detected by comparing each byte of Data & OOB
    with 0xff in check_erased_page().
    Problem: This is causes performance penalty when erased-pages are checked.

(3) Current code is not scalable for future ECC schemes due to presence of 
    tweaks for BCH4_ECC and BCH8_ECC at multiple places.

(4) Currently, bit-flips are evaluated and fixed even when ELM reports them as
    un-correctable bit-flips, this should not happen as 'number-of-error' field
    in ELM_LOCATION_STATUS becomes invalid when un-correctable flag is set.

(5) Driver should return with error-code = '-EBADMSG' when
     uncorrectable bit-flip is detected
     bit-flip outside valid Data and OOB region is detected


Pekon Gupta (5):
  mtd: nand: omap: add field to indicate current ecc-scheme in 'struct
    omap_nand_info'
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: rename eccsize
    and ecc_vector_size to avoid confusion
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: fix erased-pages
    and bit-flips detection for H/W ECC schemes
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: cleanup to make
    it scalable for future ecc-schemes
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: fix bit-flip
    correction logic

 drivers/mtd/nand/omap2.c | 248 +++++++++++++++++++----------------------------
 1 file changed, 100 insertions(+), 148 deletions(-)

-- 
1.8.1
