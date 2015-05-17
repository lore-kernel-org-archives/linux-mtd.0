Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtsOC-00014R-Eq
 for linux-mtd@lists.infradead.org; Sun, 17 May 2015 06:49:32 +0000
Received: by pdfh10 with SMTP id h10so96275328pdf.3
 for <linux-mtd@lists.infradead.org>; Sat, 16 May 2015 23:49:11 -0700 (PDT)
Date: Sat, 16 May 2015 23:49:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD fixes for 4.1-rc4
Message-ID: <20150517064907.GL6055@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20150516

for you to fetch changes up to 8947e396a8296c5297928b60043f35dfa56baa05:

  Documentation: dt: mtd: replace "nor-jedec" binding with "jedec, spi-nor" (2015-05-15 13:04:00 -0700)

----------------------------------------------------------------
Two MTD fixes for 4.1:

 * readtest: the signal-handling code was clobbering the error codes we should
   be handling/reporting in this test, rendering it useless. Noticed by Coverity.

 * the common SPI NOR flash DT binding (merged for 4.1-rc1) is being revised,
   so let's change that before 4.1 is minted.

----------------------------------------------------------------
Brian Norris (2):
      mtd: readtest: don't clobber error reports
      Documentation: dt: mtd: replace "nor-jedec" binding with "jedec, spi-nor"

 .../devicetree/bindings/mtd/{m25p80.txt => jedec,spi-nor.txt}       | 6 +++---
 drivers/mtd/devices/m25p80.c                                        | 6 +++---
 drivers/mtd/tests/readtest.c                                        | 6 ++++--
 3 files changed, 10 insertions(+), 8 deletions(-)
 rename Documentation/devicetree/bindings/mtd/{m25p80.txt => jedec,spi-nor.txt} (85%)
