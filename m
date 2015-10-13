Received: from mail-io0-f181.google.com ([209.85.223.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm31E-0001W8-1X
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 17:05:44 +0000
Received: by iow1 with SMTP id 1so28221336iow.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 10:05:22 -0700 (PDT)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>, linux-bcache@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org,
 Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH v2 0/7] User namespace mount updates
Date: Tue, 13 Oct 2015 12:04:13 -0500
Message-Id: <1444755861-54997-1-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Eric,

Here's an update to the last round of patches for mounts in user
namespaces. The only change since last time is to split up the patch to
verify access towards block devices when mounting into several patches,
one to update lookup_bdev and one patch each for the call sites which
require updates.

Thanks,
Seth

Andy Lutomirski (1):
  fs: Treat foreign mounts as nosuid

Seth Forshee (6):
  block_dev: Support checking inode permissions in lookup_bdev()
  block_dev: Check permissions towards block device inode when mounting
  mtd: Check permissions towards mtd block device inode when mounting
  selinux: Add support for unprivileged mounts from user namespaces
  userns: Replace in_userns with current_in_userns
  Smack: Handle labels consistently in untrusted mounts

 drivers/md/bcache/super.c      |  2 +-
 drivers/md/dm-table.c          |  2 +-
 drivers/mtd/mtdsuper.c         |  6 +++++-
 fs/block_dev.c                 | 18 +++++++++++++++---
 fs/exec.c                      |  2 +-
 fs/namespace.c                 | 13 +++++++++++++
 fs/quota/quota.c               |  2 +-
 include/linux/fs.h             |  2 +-
 include/linux/mount.h          |  1 +
 include/linux/user_namespace.h |  6 ++----
 kernel/user_namespace.c        |  6 +++---
 security/commoncap.c           |  4 ++--
 security/selinux/hooks.c       | 25 ++++++++++++++++++++++++-
 security/smack/smack_lsm.c     | 28 ++++++++++++++++++----------
 14 files changed, 88 insertions(+), 29 deletions(-)
