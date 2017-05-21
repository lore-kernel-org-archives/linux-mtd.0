Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dCXMA-0000gF-J2
 for linux-mtd@lists.infradead.org; Sun, 21 May 2017 20:21:40 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 adilger.kernel@dilger.ca, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, bfields@redhat.com, marcus.folkesson@gmail.com,
 hyc.lee@gmail.com, rockdotlee@gmail.com, leon.pollak@gmail.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 0/6] UBIFS NFS export support v2
Date: Sun, 21 May 2017 22:20:45 +0200
Message-Id: <1495398051-4604-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding fscrypto support to UBIFS forced us to implement 64bit
cookies. Using this building block we can finally implement
export operations and allow UBIFS being exported via NFS.
This series adds the last missing bits.

It can be obtained from:
git://git.infradead.org/users/rw/linux.git ubifs_export_v2

Changes since v1, https://lkml.org/lkml/2016/12/1/711
 - Addressed comments from Marcus Folkesson, Hyunchul Lee and J. Bruce Fields
 - Added Acks/Reviewed-bys from J. Bruce Fields and Andreas Dilger

Richard Weinberger (6):
  ext4: Move is_32bit_api() to generic code
  ubifs: Provide a custom llseek for directories
  ubifs: Use 64bit readdir cookies
  ubifs: Maintain a parent pointer
  ubifs: Implement export_operations
  ubifs: Wire up NFS support

 fs/ext4/dir.c          |  9 -----
 fs/ubifs/dir.c         | 89 +++++++++++++++++++++++++++++++++++++-------------
 fs/ubifs/journal.c     |  5 ++-
 fs/ubifs/key.h         | 61 ++++++++++++++++++++++++++++++++++
 fs/ubifs/sb.c          |  2 ++
 fs/ubifs/super.c       | 39 ++++++++++++++++++++++
 fs/ubifs/ubifs-media.h | 18 ++++++++--
 fs/ubifs/ubifs.h       |  6 ++++
 include/linux/compat.h |  2 ++
 9 files changed, 195 insertions(+), 36 deletions(-)

-- 
2.12.0
