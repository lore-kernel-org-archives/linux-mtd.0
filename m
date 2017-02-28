Received: from lgeamrelo12.lge.com ([156.147.23.52])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cia9y-00067W-T1
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 05:17:23 +0000
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 Hyunchul Lee <cheol.lee@lge.com>
Subject: [PATCH 0/3] ubifs: add lz4hc compression
Date: Tue, 28 Feb 2017 14:16:46 +0900
Message-ID: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hyunchul Lee <cheol.lee@lge.com>

This patch set is for adding support for lz4hc compression.  lz4hc's
compression ratio is comparable to zlib, but its compression/decompression
speed is faster than zlib[1].

Another compression type cannot be added any more in respect that type of
ubifs_inode's compr_type is "unsigned:2" and there are 4 compression
types.  There may be overflow in assignment to compr_type, and prevision 
version of ubifs is trying to decompress file with wrong compression type.

[1] https://github.com/lz4/lz4

Brent Taylor (1):
  ubifs: add lz4hc compressor

Hyunchul Lee (2):
  ubifs: change type of ubifs_inode's compr_type to unsigend:16
  ubifs: add "compr=lz4hc" into ubifs.txt

 Documentation/filesystems/ubifs.txt |  1 +
 fs/ubifs/Kconfig                    | 10 ++++++++++
 fs/ubifs/compress.c                 | 25 ++++++++++++++++++++++++-
 fs/ubifs/super.c                    |  2 ++
 fs/ubifs/ubifs-media.h              |  2 ++
 fs/ubifs/ubifs.h                    |  2 +-
 6 files changed, 40 insertions(+), 2 deletions(-)

-- 
1.9.1
