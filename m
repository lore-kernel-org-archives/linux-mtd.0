Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYWeM-0007q8-4o
 for linux-mtd@lists.infradead.org; Sun, 06 Sep 2015 09:54:17 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <agruen@suse.de>
CC: <linux-mtd@lists.infradead.org>, <yangds.fnst@cn.fujitsu.com>,
 <linux-fsdevel@vger.kernel.org>
Subject: [RFC PATCH v2 0/3] UBIFS: add ACL support
Date: Sun, 6 Sep 2015 17:40:18 +0000
Message-ID: <1441561221-18899-1-git-send-email-shengyong1@huawei.com>
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

Hi, folks,
These 3 patches add ACL support for UBIFS.

UBIFS ACL is based on xattr, which simplifies the implementation without
considering budget and sync.

New kernel/mount options, CONFIG_UBIFS_FS_POSIX_ACL and `-o acl', are
introduced to enable or disable UBIFS ACL.

`acl.c' provides format conversion between in-memory ACL and on-flash ACL.
Each time a new inode is created, the correspondng ACL xattr is built
(except for the inode of an xattr dent). 

Testcases (adjusted to mount an UBI volume) in LTP [1] are passed.

Any comment is appreciated. 

V2:
* Do not set ACL-xattr-handler, and call generic ACL handler in xattr
  functions.

V1:
http://lists.infradead.org/pipermail/linux-mtd/2015-March/058452.html

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs/acl/tacl_xattr.sh

thanks,
Sheng

Sheng Yong (3):
  UBIFS: xattr: add generic helper functions for set/get xattr
  UBIFS: ACL: add ACL support
  UBIFS: ACL: add ACL config option

 fs/ubifs/Kconfig  |  11 ++
 fs/ubifs/Makefile |   1 +
 fs/ubifs/acl.c    | 312 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/dir.c    |  20 ++++
 fs/ubifs/file.c   |  14 +++
 fs/ubifs/super.c  |  15 +++
 fs/ubifs/ubifs.h  |  18 ++++
 fs/ubifs/xattr.c  | 115 +++++++++++++++-----
 8 files changed, 482 insertions(+), 24 deletions(-)
 create mode 100644 fs/ubifs/acl.c

-- 
1.9.1
