Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acJp8-00062B-QR
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 21:33:19 +0000
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI fixes for 4.5-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <56DB5084.60500@nod.at>
Date: Sat, 5 Mar 2016 22:32:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit fc77dbd34c5c99bce46d40a2491937c3bcbd10af:

  Linux 4.5-rc6 (2016-02-28 08:41:20 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.5-rc7

for you to fetch changes up to e4f6daac20332448529b11f09388f1d55ef2084c:

  ubi: Fix out of bounds write in volume update code (2016-03-05 21:56:23 +0100)

----------------------------------------------------------------
This pull request contains a single bug fix for UBI.

----------------------------------------------------------------
Richard Weinberger (1):
      ubi: Fix out of bounds write in volume update code

 drivers/mtd/ubi/upd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
