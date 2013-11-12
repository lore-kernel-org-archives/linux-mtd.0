Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgDA7-0003qS-Ko
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 12:33:44 +0000
Message-ID: <1384259599.15824.137.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBIFS changes for 3.13-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 12 Nov 2013 14:33:19 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit d4e4ab86bcba5a72779c43dc1459f71fea3d89c8:

  Linux 3.11-rc5 (2013-08-11 18:04:20 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.13-rc1

for you to fetch changes up to 58a4e23703b22c331b01fbd0c12161aadaa6d50b:

  UBIFS: correct data corruption range (2013-10-26 11:33:38 +0100)

----------------------------------------------------------------
Mostly fixes for the power cut emulation UBIFS mode, and only one functional
change which fixes a return error code.

----------------------------------------------------------------
Mats Kärrman (2):
      UBIFS: remove invalid warn msg with tst_recovery enabled
      UBIFS: correct data corruption range

Wei Yongjun (1):
      UBIFS: fix return code

wang.bo116@zte.com.cn (1):
      UBIFS: remove unnecessary code in ubifs_garbage_collect

 fs/ubifs/debug.c | 13 +++++++------
 fs/ubifs/gc.c    |  3 +--
 fs/ubifs/super.c |  8 ++++++--
 3 files changed, 14 insertions(+), 10 deletions(-)

-- 
Best Regards,
Artem Bityutskiy
