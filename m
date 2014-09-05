Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQ3Io-0002k1-HN
 for linux-mtd@lists.infradead.org; Fri, 05 Sep 2014 23:52:26 +0000
Received: by mail-pd0-f180.google.com with SMTP id ft15so1026110pdb.39
 for <linux-mtd@lists.infradead.org>; Fri, 05 Sep 2014 16:52:04 -0700 (PDT)
Date: Fri, 5 Sep 2014 16:52:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD fixes for 3.17-rc4
Message-ID: <20140905235201.GG18411@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit 2a500afe1e0e84c7a126df693dbd01353756dcfa:

  mtd: gpmi: make blockmark swapping optional (2014-07-27 22:06:31 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20140905

for you to fetch changes up to b25046b1e5e3f1423434da77ccc859f2f779d1ce:

  mtd: nand: fix DocBook warnings on nand_sdr_timings doc (2014-08-19 11:55:38 -0700)

----------------------------------------------------------------
Two trivial MTD updates for 3.17-rc4:

 * A tiny comment tweak, to kill a bunch of DocBook warnings added during the
   merge window

 * A small fixup to the OTP routines' error handling

----------------------------------------------------------------
Boris BREZILLON (1):
      mtd: nand: fix DocBook warnings on nand_sdr_timings doc

Brian Norris (1):
      mtd: cfi_cmdset_0002: check return code for get_chip()

 drivers/mtd/chips/cfi_cmdset_0002.c | 4 ++++
 include/linux/mtd/nand.h            | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)
