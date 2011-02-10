Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PnY0r-0005Jz-6Y
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 15:00:54 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 0/2] Further fixes for UBIFS recovery on CFI NOR
Date: Thu, 10 Feb 2011 16:01:44 +0100
Message-Id: <1297350106-16383-1-git-send-email-agust@denx.de>
In-Reply-To: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
Cc: Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches fix UBIFS recovery issues on CFI NOR flash.
With these patches applied additionally to the patch series
[PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
UBIFS successfuly recovers from following types of corruptions
resulted by power cuts:

1:
...
UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 113:165760 (96256 bytes left)
UBIFS DBG (pid 1390): scan_padding_bytes: not a node
UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 113:165760 (96256 bytes left)
UBIFS DBG (pid 1390): scan_padding_bytes: not a node
UBIFS error (pid 1390): ubifs_recover_leb: garbage
UBIFS error (pid 1390): ubifs_scanned_corruption: corruption at LEB 113:165760
UBIFS error (pid 1390): ubifs_scanned_corruption: first 8192 bytes from LEB 113:165760
00000000: ffff1006 fffff228 ffff0300 ffff0000 ffff0000 ffff0000 ffff0000 ffff0020  .......(.......................
00000020: 47830000 02010000 00100000 00020000 33b34142 43713233 61e24331 32334142  G...............3.ABCq23a.C123AB
00000040: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000060: 32334142 43313233 41424331 32334142 43313233 41424331 32334142 43313233  23ABC123ABC123ABC123ABC123ABC123
00000080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
... all ffffffff follow

2:
...
UBIFS DBG (pid 1390): no_more_nodes: unexpected bad common header at 42:182336
UBIFS error (pid 1390): ubifs_recover_leb: bad node
UBIFS error (pid 1390): ubifs_scanned_corruption: corruption at LEB 42:182336
UBIFS error (pid 1390): ubifs_scanned_corruption: first 8192 bytes from LEB 42:182336
00000000: 31181006 70b30c3c fbb30100 00000000 71520000 33330000 7b310000 f7430020  1...p..<........qR..33..{1...C.
00000020: 00000000 00000000 00100000 00000000 41424331 32334142 43313233 41424331  ................ABC123ABC123ABC1
00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
... all ffffffff follow here

3:
...
UBIFS DBG (pid 1390): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1390): ubifs_recover_leb: look at LEB 22:132608 (129408 bytes left)
UBIFS DBG (pid 1390): ubifs_scan_a_node: hit empty space
UBIFS error (pid 1390): ubifs_recover_leb: corrupt empty space LEB 22:132608, corruption starts at 96
UBIFS error (pid 1390): ubifs_scanned_corruption: corruption at LEB 22:96
UBIFS error (pid 1390): ubifs_scanned_corruption: first 8192 bytes from LEB 22:96
00000000: 43313233 41424331 32334142 43313233 41424331 32334142 43313233 41424331  C123ABC123ABC123ABC123ABC123ABC1
00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
... all ffffffff follow

These patches were tested with two S29GL512P chips interleaved
in 32-bit bank.

Anatolij Gustschin (1):
  mtd: cfi: fix writebufsize initialization

Signed-off-by: Artem Bityutskiy (1):
  UBIFS: fix no_more_nodes() to align to max_write_size

 drivers/mtd/chips/cfi_cmdset_0001.c |    2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c |    2 +-
 drivers/mtd/chips/cfi_cmdset_0020.c |    2 +-
 fs/ubifs/recovery.c                 |    4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.4
