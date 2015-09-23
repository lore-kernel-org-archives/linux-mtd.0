Received: from mail-ig0-f177.google.com ([209.85.213.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeqT1-0000vD-HS
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2015 20:16:40 +0000
Received: by igcpb10 with SMTP id pb10so318609igc.1
 for <linux-mtd@lists.infradead.org>; Wed, 23 Sep 2015 13:16:18 -0700 (PDT)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@tycho.nsa.gov
Cc: Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org,
 Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH v4 0/7] Initial support for user namespace owned mounts
Date: Wed, 23 Sep 2015 15:16:00 -0500
Message-Id: <1443039368-55445-1-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the fourth revision of the patch series introducing the concept
of superblocks owned by user namespaces, containing only trivial changes
from the previous revision.

These are the first in a larger set of patches, with the goal of
eventually allowing some regular filesystem types to be mounted in
unprivileged containers. The full series is available at:

  git://kernel.ubuntu.com/sforshee/linux.git userns-mounts

The strategy for this series is to do as much of the heavy lifting as
possible in the vfs to minimize the need to handle edge cases in
individual filesystems. The patches that follow lay some of the
groundwork and fall into two groups:

 1. Patches 1-2 add s_user_ns to struct superblock and use it to
    simplify MNT_NODEV handling.

 2. Patches 3-7 tighten down security for mounts with s_user_ns !=
    &init_user_ns.

Note that these patches only address security at the vfs level. As has
been discussed previously, individual filesystems may still be
vulnerable to attacks via malicious metadata in the backing store. The
goal is to find a small set of filesystems which can be hardened from
attacks from below. I am initially targeting fuse, which has been
designed to resist such attacks, and ext4, which is so far standing up
quite well to fuzzing.

Changes since v3:
 - Reword commit message for the MNT_NODEV handling changes to better
   emphasize that it results in a user visible change in behavior.
 - Consolidate smk_initialized into smk_flags as requested by Casey.

Andy Lutomirski (1):
  fs: Treat foreign mounts as nosuid

Eric W. Biederman (1):
  userns: Simpilify MNT_NODEV handling.

Seth Forshee (5):
  fs: Add user namesapace member to struct super_block
  fs: Verify access of user towards block device file when mounting
  fs: Limit file caps to the user namespace of the super block
  Smack: Add support for unprivileged mounts from user namespaces
  selinux: Add support for unprivileged mounts from user namespaces

 drivers/mtd/mtdsuper.c         |  7 +++++-
 fs/block_dev.c                 | 54 +++++++++++++++++++++++++++++++++---------
 fs/exec.c                      |  2 +-
 fs/namei.c                     |  9 ++++++-
 fs/namespace.c                 | 34 +++++++++++++++-----------
 fs/proc/root.c                 |  3 ++-
 fs/super.c                     | 38 +++++++++++++++++++++++++----
 include/linux/fs.h             | 11 ++++++++-
 include/linux/mount.h          |  1 +
 include/linux/user_namespace.h |  8 +++++++
 kernel/user_namespace.c        | 14 +++++++++++
 security/commoncap.c           |  4 +++-
 security/selinux/hooks.c       | 25 ++++++++++++++++++-
 security/smack/smack.h         |  8 ++++++-
 security/smack/smack_lsm.c     | 41 +++++++++++++++++++++++---------
 15 files changed, 210 insertions(+), 49 deletions(-)
