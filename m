Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuFyU-0003pG-Q0
 for linux-mtd@lists.infradead.org; Tue, 10 Jun 2014 06:56:03 +0000
Message-ID: <1402383330.20454.56.camel@sauron.fi.intel.com>
Subject: Re: [GIT PULL] UBIFS changes for 3.16
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 10 Jun 2014 09:55:30 +0300
In-Reply-To: <CA+55aFwr9Gtgn1JssNJFUDTsvgxoDe9BAM4XLiv5g3wDqxfS_Q@mail.gmail.com>
References: <1402307589.20454.49.camel@sauron.fi.intel.com>
 <CA+55aFwr9Gtgn1JssNJFUDTsvgxoDe9BAM4XLiv5g3wDqxfS_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-06-09 at 09:53 -0700, Linus Torvalds wrote:
> Mind re-sending the explanations in their full form?

Hi Linus, I've created a new tag and now re-sending the pull request.
Thanks for pointing to the copy-paste problem.

The following changes since commit d6d211db37e75de2ddc3a4f979038c40df7cc79c:

  Linux 3.15-rc5 (2014-05-09 13:10:52 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.16-rc1-v2

for you to fetch changes up to 380347e9ca76828ee9bac63cfc338ca99cdee4f3:

  UBIFS: Add an assertion for clean_zn_cnt (2014-06-03 11:16:51 +0300)

----------------------------------------------------------------
This pull request contains several UBIFS fixes. One of them fixes a race
condition between the mmap page fault path and fsync. Another just removes a
bogus assertion from the UBIFS memory shrinker.

UBIFS also started honoring the MS_SILENT mount flag, so now it won't print
many I/O errors when user-space just tries to probe for the FS.

Rest of the changes are rather minor UBI/UBIFS fixes, improvements, and
clean-ups.

----------------------------------------------------------------
Artem Bityutskiy (1):
      UBIFS: fix debugging check

Daniel Golle (2):
      UBIFS: add missing ui pointer in debugging code
      UBIFS: respect MS_SILENT mount flag

Ezequiel Garcia (1):
      UBI: weaken the 'exclusive' constraint when opening volumes to rename

Helmut Schaa (1):
      UBI: block: Fix error path on alloc_workqueue failure

Mike Snitzer (1):
      UBI: fix rb_tree node comparison in add_map

hujianyang (5):
      UBIFS: fix an mmap and fsync race condition
      UBIFS: Remove unused variables in ubifs_budget_space
      UBIFS: Fix dump messages in ubifs_dump_lprops
      UBIFS: Remove incorrect assertion in shrink_tnc()
      UBIFS: Add an assertion for clean_zn_cnt

 drivers/mtd/ubi/block.c   |  4 +++-
 drivers/mtd/ubi/cdev.c    |  2 +-
 drivers/mtd/ubi/fastmap.c |  4 ++--
 fs/ubifs/budget.c         |  1 -
 fs/ubifs/debug.c          |  4 +++-
 fs/ubifs/file.c           |  6 +++---
 fs/ubifs/io.c             | 18 ++++++++++--------
 fs/ubifs/shrinker.c       |  1 -
 fs/ubifs/super.c          |  5 +++++
 fs/ubifs/tnc.c            |  5 +++--
 fs/ubifs/ubifs.h          | 11 +++++++++++
 11 files changed, 41 insertions(+), 20 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
