Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmkPi-0000HX-EW
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 10:03:15 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/5] mtd: test patches and bug fixes
Date: Tue,  8 Feb 2011 12:02:37 +0200
Message-Id: <1297159362-8407-1-git-send-email-adrian.hunter@nokia.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Here are a couple of patches for MTD tests
and also a couple of OneNAND bug fixes.

Adrian Hunter (2):
      mtd: OneNAND: return read error for 4KiB page read
      mtd: tests: add count parameter to mtd_speedtest

Roman Tereshonkov (3):
      mtd: tests: add multiblock erase test to the mtd_speedtest
      mtd: tests : move ebcnt and pgcnt definitions before usage in printing.
      mtd: onenand_base: onenand_verify bugfix for writepage non-aligned address

 drivers/mtd/onenand/onenand_base.c  |   12 +++--
 drivers/mtd/tests/mtd_speedtest.c   |   74 +++++++++++++++++++++++++++++++++--
 drivers/mtd/tests/mtd_subpagetest.c |   10 ++--
 3 files changed, 82 insertions(+), 14 deletions(-)


Regards
Adrian
