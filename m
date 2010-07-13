Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYnlI-0005m7-N8
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 22:15:38 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/2] Improved BB Scanning
Date: Tue, 13 Jul 2010 15:12:59 -0700
Message-ID: <1279059181-29300-1-git-send-email-norris@broadcom.com>
In-Reply-To: <1279009292.30765.10.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a two-patch correction and update to my previous attempt
to address a few issues with bad block scanning. Overall, they should
help renovate some incorrect and unwieldy code.

I included the top few maintainers from get_maintainers.pl. Sorry if these
were incorrect addressees.

Brian Norris (2):
  mtd/nand, BB detect: factory marker in page 1, 2, last and byte 1 or 6
  mtd/nand: More BB Detection, dynamic scan options

 drivers/mtd/nand/nand_base.c |   38 ++++++++++++++++--
 drivers/mtd/nand/nand_bbt.c  |   89 +++++++++++++++++++++++++++++------------
 include/linux/mtd/bbm.h      |    4 ++
 3 files changed, 101 insertions(+), 30 deletions(-)
