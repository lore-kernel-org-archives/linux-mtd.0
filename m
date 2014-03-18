Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPu38-0002NU-Sd
 for linux-mtd@lists.infradead.org; Tue, 18 Mar 2014 13:27:24 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v9 0/5] mtd: nand: omap: optimized chip->ecc.correct() for H/W
 ECC schemes
Date: Tue, 18 Mar 2014 18:56:41 +0530
Message-ID: <1395149206-23713-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*changes v8 -> v9*
[PATCH v9 1/5] <no change>
[PATCH v9 2/5] <no change>
[PATCH v9 3/5]
 - dropped earlier versions [PATCH v8 3/6] and PATCH v8 4/6], as per feedbacks from
   MTD maintainer 'Brian Norris <computersforpeace@gmail.com>'
   http://lists.infradead.org/pipermail/linux-mtd/2014-March/052472.html
 - Current patch uses existing method of comparing calc_ecc[] with pre-known ECC(all 0xff data + OOB)
   to identify erased-pages. Thereby removing dependency on 'reserved-marker'.
[PATCH v9 4/5] <same as [PATCH v8 5/6]>
[PATCH v9 5/5] <same as [PATCH v8 6/6]>


*changes v7 -> v8*
[PATCH v8 1/6] <no change>
[PATCH v8 2/6] <minor cleanup>
[PATCH v8 3/6] 
 - use reference instead of local variables as suggested by Brian Norris <computersforpeace@gmail.com>
 - fix: report bit-flips in DATA region for 'confirmed' erased-page
[PATCH v8 4/6] <minor cleanup>
[PATCH v8 5/6] <no change>
[PATCH v8 6/6] <no change>

*changes v6 -> v7*
[PATCH v7 1/6] <no change>
[PATCH v7 2/6] <no change>
[PATCH v7 3/6] <dropped older version, refer commit message>
 - erased-page detection done based on count of zero-bits in OOB & DATA
 - incorporated some feedbacks from Brian Norris <computersforpeace@gmail.com>
	http://lists.infradead.org/pipermail/linux-mtd/2014-January/051533.html
	http://lists.infradead.org/pipermail/linux-mtd/2014-January/051534.html
[PATCH v7 4/6] <new> remove redundant bit-flip counting for erased-page
[PATCH v7 5/6] <minor cleanup>
[PATCH v7 6/6] <minor cleanup>
(As there are functional changes in this version, so not attaching
 Tested-by: Stefan Roese <sr@denx.de>)


*changes v5 -> v6*
[PATCH v6 1/6] <no change>
[PATCH v6 2/6] introduced variable 'actual_eccbytes' to omit reserved byte-position
[PATCH v6 3/6] split from [PATCH v5 3/5] fix erased-page bit-flip correction
[PATCH v6 4/6] split from [PATCH v5 3/5] fix erased-page detection
[PATCH v6 5/6] <minor cleanup>
[PATCH v6 6/6] <no change>


*changes v4 -> v5*
This patch series was split version of earlier patch:
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
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: rename ambiguous
    variable 'eccsize' and 'ecc_vector_size'
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: fix erased-page
    detection for BCHx_HW ECC schemes
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: cleanup for
    future enhancements
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: fix
    programmed-page bit-flip correction logic

 drivers/mtd/nand/omap2.c | 187 ++++++++++++++++++++++-------------------------
 1 file changed, 87 insertions(+), 100 deletions(-)

-- 
1.8.5.1.163.gd7aced9
