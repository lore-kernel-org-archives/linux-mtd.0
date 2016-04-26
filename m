Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auzKb-0003Ht-0z
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 09:30:58 +0000
Received: from nat-ies.mentorg.com ([192.94.31.2]
 helo=SVR-IES-FEM-01.mgc.mentorg.com)
 by relay1.mentorg.com with esmtp
 id 1auzKF-0000qa-6K from Marian_Rotariu@mentor.com
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 02:30:35 -0700
From: Marian Rotariu <marian_rotariu@mentor.com>
To: <linux-mtd@lists.infradead.org>
CC: Marian Rotariu <marian_rotariu@mentor.com>
Subject: [PATCH 0/4] mtd-utils: add basic support for eraseregs
Date: Tue, 26 Apr 2016 12:30:20 +0300
Message-ID: <1461663024-12022-1-git-send-email-marian_rotariu@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch set adds the basic support for multiple eraseregs in userspace.
I chose to add these basic changes first in order to allow others to
modify the utilities as soon as possible.

To validate the changes I modified mtdinfo tool. The patches were tested on
a S25FL128S.

Marian Rotariu (4):
  mtd-utils: add support for erase regions
  mtd-utils: fetch erasereg info through ioctl
  mtd-utils: fetch erasereg in legacy library
  mtd-utils: remove unnecessary ioctl from mtd_info

 include/libmtd.h    |  2 ++
 lib/libmtd.c        | 27 ++++++++++++++++++++++++++-
 lib/libmtd_int.h    |  1 +
 lib/libmtd_legacy.c | 28 +++++++++++++++++++++++++++-
 ubi-utils/mtdinfo.c | 18 +++++++-----------
 5 files changed, 63 insertions(+), 13 deletions(-)

-- 
1.9.1
