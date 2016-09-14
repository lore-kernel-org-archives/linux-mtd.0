Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bk7Kj-00019L-3a
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2016 10:22:26 +0000
Received: by mail-lf0-x243.google.com with SMTP id l131so435024lfl.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Sep 2016 03:22:09 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 0/2] ubifs: respect dirty_writeback_interval
Date: Wed, 14 Sep 2016 12:21:48 +0200
Message-Id: <20160914102151.21722-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

Hi,

This patchset allows some ubifs adjustments that we realized we needed
in LEDE project.

LEDE can be unstable on power cuts when installed on NAND devices (with
ubifs). This is caused by the default high value of wbuf timeout used by
ubifs. Any write that isn't followed by fsync (this may happen with
buggy user space app or just shell script) may be lost if power cut
happens in less than 5 seconds.

One idea for fixing this (without modifying kernel at all) is to mount
ubifs with -o sync. This could affect NAND performance however, so I'm
looking for a better solution.

During IRC discussion MTD guys suggested lowering wbuf timeout and I
decided to give it a try. The simplest way to do that seems to be making
ubifs respect dirty_writeback_interval. This parameter can be easily set
with sysctl and is already used in some older file systems.

What do you think about this? I gave it a try with a simple
uci commit foo; sleep 1s; POWER_CUT
and it works as expected.

Rafał Miłecki (2):
  ubifs: drop softlimit and delta fields from struct ubifs_wbuf
  ubifs: use dirty_writeback_interval value for wbuf timer

 fs/ubifs/io.c    | 15 +++++++--------
 fs/ubifs/ubifs.h |  9 ---------
 2 files changed, 7 insertions(+), 17 deletions(-)

-- 
2.9.3
