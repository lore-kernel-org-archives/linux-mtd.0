Received: from mail-io0-f177.google.com ([209.85.223.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOuGe-0001cw-7S
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 21:06:01 +0000
Received: by iodb91 with SMTP id b91so122857410iod.1
 for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2015 14:05:36 -0700 (PDT)
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@tycho.nsa.gov
Cc: Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org,
 Seth Forshee <seth.forshee@canonical.com>,
 John Johansen <john.johansen@canonical.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Morris <james.l.morris@oracle.com>, Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 0/7] Initial support for user namespace owned mounts
Date: Mon, 10 Aug 2015 16:05:11 -0500
Message-Id: <1439240719-46850-1-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series adds support for the idea of superblocks owned by
unprivileged user namespaces. This is initially used to simplify the
MNT_NODEV handling for unpivileged mounts, and the ultimate goal is to
allow mounting of additional filesystem types from unprivileged
containers. As such these are the first in a larger set of patches, with
the full series (so far) available at:

  git://kernel.ubuntu.com/sforshee/linux.git userns-mounts

The strategy for the series as a whole is to do as much of the heavy
lifting as possible in the vfs to avoid the need to handle any weird
edge cases in the code for individual filesystems. These patches lay the
initial groundwork and fall into a two broad groups:

 1. Patches 1-2 add s_ser_ns and simplify MNT_NODEV handling.

 2. Patches 3-7 tighten down security for mounts with s_user_ns !=
    &init_user_ns. This includes updates to how file caps and suid are
    handled and updates for SELinux and Smack to avoid using security
    labels from untrusted mounts.

Note that no updates are included for the LSMs which do not store
security labels on disk. As far as I can tell these security modules are
not susceptible to attack via unprivileged mounts because no security
metadata can be injected into the system via these mounts. I have cc-ed
the maintainers of these LSMs and would appreciate confirmation that
this is the case.

Also note that this only addresses security at the vfs level. As has
been discussed previously, individual filesystems may still be
vulnerable to attacks via maliciuos metadata in the backing store. The
goal is to find a small set of filesystems that can be hardened against
attacks from below. At minimum fuse has been designed to resist such
attacks.

Changes since v1:
 - Check current_user_ns instead of mount ns owner for MNT_LOCK_NODEV
   check in fs_fully_visible.
 - Add check of s_user_ns in mnt_may_suid.
 - Improve handling of superblocks from unprivileged users in SELinux
   and Smack.
 - Add permission checks for block device paths passed to mount by
   unprivileged users.

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
 security/smack/smack.h         |  6 +++++
 security/smack/smack_lsm.c     | 35 ++++++++++++++++++++-------
 15 files changed, 206 insertions(+), 45 deletions(-)
