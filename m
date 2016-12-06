Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEOeV-0000M1-RQ
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 22:56:04 +0000
From: David Gstir <david@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: tytso@mit.edu, dedekind1@gmail.com, ebiggers@google.com,
 mhalcrow@google.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dengler@linutronix.de, sbabic@denx.de, wd@denx.de, richard@nod.at,
 David Gstir <david@sigma-star.at>
Subject: [PATCH v2 0/6] UBIFS related fscrypt updates
Date: Tue,  6 Dec 2016 23:53:52 +0100
Message-Id: <20161206225358.12126-1-david@sigma-star.at>
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

Changes since v1:
- Never allocate fscrypt_ctx in "own pages" mode
- Fix code comments
- Fix issues reported by checkpatch.pl

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git fscrypt

David Gstir (6):
  fscrypt: Use correct index in decrypt path.
  fscrypt: Never allocate fscrypt_ctx on in-place encryption
  fscrypt: Cleanup fscrypt_{decrypt,encrypt}_page()
  fscrypt: Cleanup page locking requirements for
    fscrypt_{decrypt,encrypt}_page()
  fscrypt: Delay bounce page pool allocation until needed
  fscrypt: Rename FS_WRITE_PATH_FL to FS_CTX_HAS_BOUNCE_BUFFER_FL

 fs/crypto/crypto.c       | 135 ++++++++++++++++++++++++++++-------------------
 fs/crypto/keyinfo.c      |   2 +-
 fs/ext4/inode.c          |   1 -
 fs/f2fs/data.c           |   1 -
 include/linux/fscrypto.h |  14 ++---
 5 files changed, 90 insertions(+), 63 deletions(-)

-- 
2.10.1
