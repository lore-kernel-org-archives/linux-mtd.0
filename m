Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCZda-0007Ay-Kf
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 22:15:31 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 0/6] UBIFS related fscrypt updates
Date: Thu,  1 Dec 2016 23:14:52 +0100
Message-Id: <1480630498-19201-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series applies on top of Ted's fscrypt tree[0] addresses the review
comments from Eric.
Ted, it would be awesome to have this patches in the v4.10 merge window.

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git fscrypt

David Gstir (6):
  fscrypt: Use correct index in decrypt path.
  fscrypt: Release fscrypt context on in-place encryption
  fscrypt: Cleanup fscrypt_{decrypt,encrypt}_page()
  fscrypt: Cleanup page locking requirements for
    fscrypt_{decrypt,encrypt}_page()
  fscrypt: Deplay bounce page pool allocation until needed
  fscrypt: Rename FS_WRITE_PATH_FL to FS_CTX_HAS_BOUNCE_BUFFER_FL

 fs/crypto/crypto.c       | 107 ++++++++++++++++++++++++++++-------------------
 fs/crypto/keyinfo.c      |   2 +-
 fs/ext4/inode.c          |   1 -
 fs/f2fs/data.c           |   1 -
 fs/ubifs/crypto.c        |   2 +-
 include/linux/fscrypto.h |  14 +++----
 6 files changed, 74 insertions(+), 53 deletions(-)

-- 
2.7.3
