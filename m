Received: from relay101a.appriver.com ([207.97.230.14] helo=relay.appriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEK6v-0005E1-8n
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 18:05:02 +0000
From: Mike Crowe <mac@mcrowe.com>
To: linux-mtd@lists.infradead.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 0/2] Support skipping a certain number of good blocks
Date: Tue,  6 Dec 2016 18:04:15 +0000
Message-Id: <1481047457-25427-1-git-send-email-mac@mcrowe.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found myself needing to write part of a partition that will be read
by the bootloader by skipping blocks from the start of the partition.
These new command-line options let me write and verify.

Mike Crowe (2):
  nandwrite: Add --output-skip
  nanddump: Add --input-skip

 nand-utils/nanddump.c  | 30 +++++++++++++++++++++++++++---
 nand-utils/nandwrite.c | 20 ++++++++++++++++++--
 2 files changed, 45 insertions(+), 5 deletions(-)

-- 
2.1.4
