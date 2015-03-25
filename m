Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YajmL-0002Wy-Mn
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 11:47:23 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <adrian.hunter@intel.com>
Subject: [RFC PATCH 0/3] UBIFS: add ACL support
Date: Wed, 25 Mar 2015 11:46:02 +0000
Message-ID: <1427283965-86137-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: miaoxie@huawei.com, linux-mtd@lists.infradead.org, hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS ACL is based on xattr. Three structures, ubifs_acl_header,
ubifs_acl_entry, and ubifs_acl_entry_short are used to format the ACL
value on flash.

ACL format between in-memory and on-flash is switched before writting
it to flash and after reading it from flash. The writting and reading
operations are implemented by generic set/get xattr functions. ACL of
a new file is inheritted from the parent directory when creating new
inode.

For xattr, generic functions of setting and getting xattr are splited
from original ubifs_setxattr and ubifs_getxattr so that ACL could use
them.

Thanks,
Sheng

Sheng Yong (3):
  UBIFS: xattr: splite generic set/get xattr functions from
    ubifs_set/getxattr
  UBIFS: ACL: add ACL support
  UBIFS: ACL: add ACL config option

 fs/ubifs/Kconfig  |  11 ++
 fs/ubifs/Makefile |   1 +
 fs/ubifs/acl.c    | 316 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/dir.c    |   7 ++
 fs/ubifs/file.c   |  14 +++
 fs/ubifs/super.c  |  15 +++
 fs/ubifs/ubifs.h  |   7 ++
 fs/ubifs/xattr.c  |  52 +++++++--
 8 files changed, 413 insertions(+), 10 deletions(-)
 create mode 100644 fs/ubifs/acl.c

-- 
1.8.3.4
