Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ftU3X-00081x-Nx
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2018 08:36:29 +0000
From: Richard Weinberger <richard@nod.at>
To: torvalds@linux-foundation.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] UBIFS fix for 4.19-rc1
Date: Sat, 25 Aug 2018 10:36:05 +0200
Message-ID: <10888946.TpHzFjB4nf@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit 99a24e02ccf6604e3020cf9e2c7a042b6ebb655f:

  ubifs: Set default assert action to read-only (2018-08-15 00:25:22 +0200)

are available in the Git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.19-rc1-fix

for you to fetch changes up to 6e5461d774bf42aae622ad0f3ff53e41962f886b:

  ubifs: Remove empty file.h (2018-08-24 13:50:07 +0200)

----------------------------------------------------------------
This pull request contains a single fix for UBIFS:

- Remove an empty file from UBIFS source

----------------------------------------------------------------
Richard Weinberger (1):
      ubifs: Remove empty file.h

 fs/ubifs/file.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 fs/ubifs/file.h
