Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzHIL-0004Mw-Ro
 for linux-mtd@lists.infradead.org; Sat, 04 Jan 2014 02:49:02 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v6 0/6] mtd: nand: omap: optimized chip->ecc.correct() for H/W
 ECC schemes
Date: Sat, 4 Jan 2014 08:18:12 +0530
Message-ID: <1388803698-26252-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, balbi@ti.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*changes v5 -> v6*
[PATCH 1/6] <no change>
[PATCH 2/6] introduced variable 'actual_eccbytes' to omit reserved byte-position
[PATCH 3/6] split from [PATCH v5 3/5] fix erased-page bit-flip correction
[PATCH 4/6] split from [PATCH v5 3/5] fix erased-page detection
[PATCH 5/6] <minor cleanup>
[PATCH 6/6] <no change>


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


Pekon Gupta (6):
  mtd: nand: omap: add field to indicate current ecc-scheme in 'struct
    omap_nand_info'
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: rename ambiguous
    variable 'eccsize' and 'ecc_vector_size'
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: fix erased-page
    bit-flip correction for H/W ECC schemes
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: fix erased-page
    detection for BCHx_HW ECC schemes
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: cleanup for
    future enhancements
  mtd: nand: omap: ecc.correct: omap_elm_correct_data: fix
    programmed-page bit-flip correction logic

 drivers/mtd/nand/omap2.c | 251 +++++++++++++++++++++--------------------------
 1 file changed, 114 insertions(+), 137 deletions(-)

-- 
1.8.1
