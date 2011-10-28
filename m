Received: from smtp6-g21.free.fr ([212.27.42.6])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RJqbD-0006uF-Ip
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 17:52:12 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dwmw2@infradead.org,
	dedekind1@gmail.com,
	mikedunn@newsguy.com
Subject: [PATCH 00/13]  DocG3 fixes and write support
Date: Fri, 28 Oct 2011 19:51:19 +0200
Message-Id: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset is aimed at :
 - fixing 4 glitches in the driver
 - add several new functions

The added functions are :
 - add block erase capability
 - add write page capability
 - add powerdown and powerup
 - add multiple floor support
 - add ECC support

The ECC part should especially be reviewed by Ivan and Mike,
as this is their work (patch "add ECC correction code"). 

Happy review.

--
Robert

Robert Jarzmik (13):
  mtd/docg3: fix debug log verbosity
  mtd/docg3: fix tracing of IO in writeb
  mtd/docg3: fix protection areas reading
  mtd/docg3: fix BCH registers
  mtd/docg3: add multiple floor support
  mtd/docg3: add OOB layout to mtdinfo
  mtd/docg3: add registers for erasing and writing
  mtd/docg3: add OOB buffer to device structure
  mtd/docg3: add write functions
  mtd/docg3: add erase functions
  mtd/docg3: map erase and write functions
  mtd/docg3: add ECC correction code
  mtd/docg3: add suspend and resume

 drivers/mtd/devices/Kconfig |    1 +
 drivers/mtd/devices/docg3.c |  933 +++++++++++++++++++++++++++++++++++++------
 drivers/mtd/devices/docg3.h |   42 ++-
 3 files changed, 860 insertions(+), 116 deletions(-)

-- 
1.7.5.4
