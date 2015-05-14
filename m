Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ysq9n-0002qF-1L
 for linux-mtd@lists.infradead.org; Thu, 14 May 2015 10:14:23 +0000
Message-ID: <55547564.60107@nod.at>
Date: Thu, 14 May 2015 12:13:56 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] UBI/UBIFS updates for 4.1-rc4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

the following changes since commit 5ebe6afaf0057ac3eaeb98defd5456894b446d22:

  Linux 4.1-rc2 (2015-05-03 19:22:23 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.1-rc4

for you to fetch changes up to 98fb1ffd8154890d7051750e61ff5548c3ee2ab2:

  UBI: block: Add missing cache flushes (2015-05-06 22:52:22 +0200)

----------------------------------------------------------------
This pull request contains a single bug fix for the UBI block driver.

----------------------------------------------------------------
Kevin Cernekee (1):
      UBI: block: Add missing cache flushes

 drivers/mtd/ubi/block.c | 2 ++
 1 file changed, 2 insertions(+)
