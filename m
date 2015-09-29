Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgsVd-0006as-Ff
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 10:51:46 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS fixes for 4.3-rc4
Message-ID: <560A6D29.6060402@nod.at>
Date: Tue, 29 Sep 2015 12:51:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

the following changes since commit 1f93e4a96c9109378204c147b3eec0d0e8100fde:

  Linux 4.3-rc2 (2015-09-20 14:32:34 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.3-rc4

for you to fetch changes up to 7c7feb2ebfc9c0552c51f0c050db1d1a004faac5:

  UBI: return ENOSPC if no enough space available (2015-09-29 12:47:05 +0200)

----------------------------------------------------------------
This pull request contains three bug fixes for both UBI
and UBIFS.

----------------------------------------------------------------
Richard Weinberger (2):
      UBIFS: Kill unneeded locking in ubifs_init_security
      UBI: Validate data_size

shengyong (1):
      UBI: return ENOSPC if no enough space available

 drivers/mtd/ubi/io.c   | 5 +++++
 drivers/mtd/ubi/vtbl.c | 1 +
 drivers/mtd/ubi/wl.c   | 1 +
 fs/ubifs/xattr.c       | 3 ---
 4 files changed, 7 insertions(+), 3 deletions(-)
