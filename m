Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaD32-0004d6-IL
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 01:22:43 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>,
 <andreas.gruenbacher@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <yangds.fnst@cn.fujitsu.com>,
 <linux-fsdevel@vger.kernel.org>
Subject: [RFC PATCH v3 0/5] UBIFS: add ACL support
Date: Fri, 11 Sep 2015 09:09:52 +0000
Message-ID: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
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
These patches add ACL support for UBIFS.

UBIFS ACL is based on xattr, which simplifies the implementation without
considering budget and sync.

New kernel/mount options, CONFIG_UBIFS_FS_POSIX_ACL and `-o acl', are
introduced to enable or disable UBIFS ACL.

`acl.c' provides format conversion between in-memory ACL and on-flash ACL.
Each time a new inode is created, the correspondng ACL xattr is built
(except for the inode of an xattr dent). 

Testcases (adjusted to mount an UBI volume) in LTP [1] are passed.

Any comment is appreciated. More test is appreciated.

V3:
* Use POSIX generic ACL structures and functions to do the conversions
  between in-memory and on-flash ACL. Thanks Dongsheng Yang for pointing
  this out.
* Remove ACL if size is 0 when setting ACL.
* Clear cached ACL when ACL xattr is removed.

V2:
* Do not set ACL-xattr-handler, and call generic ACL handler in xattr
  functions.
http://lists.infradead.org/pipermail/linux-mtd/2015-September/061672.html

V1:
http://lists.infradead.org/pipermail/linux-mtd/2015-March/058452.html

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs/acl/tacl_xattr.sh

thanks,
Sheng

Sheng Yong (5):
  UBIFS: ACL: introduce init/set/get functions for ACL
  UBIFS: ACL: set ACL interfaces in inode_operations
  UBIFS: ACL: handle ACL through xattr
  UBIFS: ACL: introduce ACL mount options
  UBIFS: ACL: add ACL config option

 fs/ubifs/Kconfig  |  11 +++
 fs/ubifs/Makefile |   1 +
 fs/ubifs/acl.c    | 141 +++++++++++++++++++++++++++++++
 fs/ubifs/dir.c    |  20 +++++
 fs/ubifs/file.c   |  14 ++++
 fs/ubifs/super.c  |  15 ++++
 fs/ubifs/ubifs.h  |  14 ++++
 fs/ubifs/xattr.c  | 243 ++++++++++++++++++++++++++++++++++--------------------
 8 files changed, 369 insertions(+), 90 deletions(-)
 create mode 100644 fs/ubifs/acl.c

-- 
1.9.1
