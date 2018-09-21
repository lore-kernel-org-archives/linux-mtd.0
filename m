Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3Hod-0005jz-Te
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2018 09:33:37 +0000
From: Richard Weinberger <richard@nod.at>
To: gregkh@linuxfoundation.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] UBIFS fixes for 4.19-rc4
Date: Fri, 21 Sep 2018 11:33:15 +0200
Message-ID: <3383200.5o9oegka29@blindfold>
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

Greg,

The following changes since commit ae596de1a0c8c2c924dc99d23c026259372ab234:

  Compiler Attributes: naked can be shared (2018-09-20 15:23:58 +0200)

are available in the Git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.19-rc4

for you to fetch changes up to f061c1cc404a618858a77aea233fde0aeaad2f2d:

  Revert "ubifs: xattr: Don't operate on deleted inodes" (2018-09-20 21:37:41 +0200)

----------------------------------------------------------------
This pull request contains fixes for UBIFS:

- A wrong UBIFS assertion in mount code
- Fix for a NULL pointer deref in mount code
- Revert of a bad fix for xattrs

----------------------------------------------------------------
Richard Weinberger (2):
      ubifs: Check for name being NULL while mounting
      Revert "ubifs: xattr: Don't operate on deleted inodes"

Sascha Hauer (1):
      ubifs: drop false positive assertion

 fs/ubifs/super.c |  7 ++++++-
 fs/ubifs/xattr.c | 24 ------------------------
 2 files changed, 6 insertions(+), 25 deletions(-)
