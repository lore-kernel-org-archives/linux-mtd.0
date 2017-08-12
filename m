Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dgeam-0002SJ-Bw
 for linux-mtd@lists.infradead.org; Sat, 12 Aug 2017 22:09:14 +0000
Received: by mail-pg0-x242.google.com with SMTP id u185so5801163pgb.0
 for <linux-mtd@lists.infradead.org>; Sat, 12 Aug 2017 15:08:50 -0700 (PDT)
Date: Sat, 12 Aug 2017 15:08:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [GIT PULL] Another MTD fix for v4.13-rc5
Message-ID: <20170812220827.GA28868@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit 33983675fbd5b2447430c3dd4c205e879576b475:

  Merge tag 'nand/fixes-for-4.13-rc4' of git://git.infradead.org/l2-mtd into MTD (2017-08-04 18:42:37 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20170812

for you to fetch changes up to 9a51544774a57fcb94994a61860a17f9e63a8d7b:

  mtd: blkdevs: Fix mtd block write failure (2017-08-12 14:53:24 -0700)

----------------------------------------------------------------
Another MTD fix for v4.13-rc5:

An mtdblock regression occurred in -rc1 (all writes were broken!), in the
process of some block subsystem refactoring. Noticed and fixed last week, but
I'm a little slow on the uptake.

----------------------------------------------------------------
Abhishek Sahu (1):
      mtd: blkdevs: Fix mtd block write failure

 drivers/mtd/mtd_blkdevs.c | 1 +
 1 file changed, 1 insertion(+)
