Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFkyw-0008Qw-HB
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 10:31:31 +0000
Received: by wwb39 with SMTP id 39so2898707wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Apr 2011 03:31:27 -0700 (PDT)
Sender: Bryan De faria <bryan.defaria@gmail.com>
From: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
To: 
Subject: [PATCH 0/3] omap : nand : omap2 nand driver fixes
Date: Fri, 29 Apr 2011 12:31:07 +0200
Message-Id: <1304073070-24526-1-git-send-email-bdefaria@adeneo-embedded.com>
To: linux-omap@vger.kernel.org
Cc: Bryan DE FARIA <bdefaria@adeneo-embedded.com>, jjhiblot@adetelgroup.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Theses patches make the omap2 nand driver able to compile as a module and fix 
an issue when the module is reinserted. The last patch corrects an issue when 
using the software ecc with prefecth.

Bryan DE FARIA (3):
  omap : nand : fix omap2 module compilation
  omap : nand : fix omap2 module reinsertion
  omap : nand : fix subpage ecc issue with prefetch

 arch/arm/mach-omap2/gpmc.c |    2 ++
 drivers/mtd/nand/omap2.c   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)
