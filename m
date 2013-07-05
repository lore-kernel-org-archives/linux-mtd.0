Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uv7OF-00017p-P2
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2013 14:53:40 +0000
Message-ID: <1373036223.2711.62.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBI changes for 3.11-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 05 Jul 2013 17:57:03 +0300
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello Linus!

The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:

  Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubi.git tags/upstream-3.11-rc1

for you to fetch changes up to 83ff59a066637a6c28844bbf43009459408240f4:

  UBI: support ubi_num on mtd.ubi command line (2013-07-01 08:32:57 +0300)

----------------------------------------------------------------
A couple of fixes and clean-ups, allow for assigning user-defined
UBI device numbers when attaching MTD devices by using the "mtd="
module parameter.

----------------------------------------------------------------
Brian Pomerantz (1):
      UBI: fastmap break out of used PEB search

Mike Frysinger (4):
      UBI: drop redundant "UBI error" string
      UBI: do not abort init when ubi.mtd devices cannot be found
      UBI: document UBI_IOCVOLUP better in user header
      UBI: support ubi_num on mtd.ubi command line

 drivers/mtd/ubi/build.c     | 59 ++++++++++++++++++++++++++++++++++++++++-------------------
 drivers/mtd/ubi/fastmap.c   |  4 +++-
 include/uapi/mtd/ubi-user.h |  5 ++++-

-- 
Best Regards,
Artem Bityutskiy
