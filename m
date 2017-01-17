Received: from relay101b.appriver.com ([207.97.230.15] helo=relay.appriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTSLp-0006zh-FN
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 11:55:01 +0000
From: Mike Crowe <mac@mcrowe.com>
To: linux-mtd@lists.infradead.org
Cc: Mike Crowe <mac@mcrowe.com>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>, richard@nod.at
Subject: [PATCH 0/2] Support skipping bad blocks when seeking to start address
Date: Tue, 17 Jan 2017 11:54:02 +0000
Message-Id: <1484654044-17722-1-git-send-email-mac@mcrowe.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found myself needing to write and verify part of a partition that
will be read by the bootloader by skipping blocks from the start of
the partition. Initially I added separate --input-skip and
--output-skip options but David Oberhollenzer suggested in
<cdfdbe5d-1aa8-e424-7691-338d0d63f7b1 at sigma-star.at>
http://lists.infradead.org/pipermail/linux-mtd/2016-December/070855.html
that a simple flag to indicate that the start address should skip bad
blocks would avoid ambiguity.

David also suggested that I skip the bad blocks in a separate step
before the already-cluttered main loop.

This version uses is_virt_block_bad in nandwrite, so the series now depends
on David Oberhollenzer's virtual block handling fixes from
<20170112102828.13124-1-david.oberhollenzer@sigma-star.at>
http://lists.infradead.org/pipermail/linux-mtd/2017-January/071544.html

Mike Crowe (2):
  nandwrite: Add --skip-bad-blocks-to-start option
  nanddump: Add --skip-bad-blocks-to-start option

 nand-utils/nanddump.c  | 23 +++++++++++++++++++++++
 nand-utils/nandwrite.c | 26 ++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

-- 
2.1.4
