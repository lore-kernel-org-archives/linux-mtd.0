Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTy83-0001BC-D2
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 21:50:53 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBIFS fixes for 4.10-rc5
Message-ID: <1955518c-df1d-1010-fa6f-a192079b915a@nod.at>
Date: Wed, 18 Jan 2017 22:50:21 +0100
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

The following changes since commit 5cf7a0f3442b2312326c39f571d637669a478235:

  Merge tag 'nfs-for-4.10-3' of git://git.linux-nfs.org/projects/trondmy/linux-nfs (2017-01-16 12:15:59 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.10-rc5

for you to fetch changes up to 1cb51a15b576ee325d527726afff40947218fd5e:

  ubifs: Fix journal replay wrt. xattr nodes (2017-01-17 14:35:58 +0100)

----------------------------------------------------------------
This pull request contains fixes for UBIFS:
- A long standing issue in UBIFS journal replay code
- Fallout from the merge window

----------------------------------------------------------------
Arnd Bergmann (1):
      ubifs: add CONFIG_BLOCK dependency for encryption

Colin Ian King (1):
      ubifs: ensure zero err is returned on successful return

Eric Biggers (2):
      ubifs: allow encryption ioctls in compat mode
      ubifs: remove redundant checks for encryption key

Peter Rosin (1):
      ubifs: fix unencrypted journal write

Richard Weinberger (1):
      ubifs: Fix journal replay wrt. xattr nodes

 fs/ubifs/Kconfig   |  2 +-
 fs/ubifs/dir.c     | 58 +++---------------------------------------------------
 fs/ubifs/ioctl.c   |  3 +++
 fs/ubifs/journal.c |  2 ++
 fs/ubifs/tnc.c     | 25 +++++++++++++++++++++--
 5 files changed, 32 insertions(+), 58 deletions(-)
