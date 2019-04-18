Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ECAC282DF
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 23:30:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C99D214DA
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 23:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dKz7xsXX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWetfSG2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C99D214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N0rncZ5PsgnicZefehf3KqldHkyYETQPGBTkntrIDaY=; b=dKz7xsXXLJFtkP
	+NMkP0IMyZyDRwr4Vs5K2JDQPi4SfQREp8KAX1gSyvIvvzQ2pxbkeqnD8y+9OXP4zrAtpUFCv0B7D
	qheXAMYZAsAj5JeGsGrV5yIzaxdaRpX8dVtXY1eSC5q3qwPKEIWFdyFs4PHlRcY5MzGJ8IXEkl4NB
	OS92Znx0sAORRauiR392INDZzy/BdCNeTCEveTVeyR8jlqASD5szWE/Druk5QMG0xo7g2y39Adg3R
	onKVWWY1MsgUgf3ohov/M5wBHnXtQzOSdT90BRiqGFz3V84eLcRR7lsSg9otTND4y4Mht+1b+WAjA
	yqrjriM3JR7M0L0vd48Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHGUI-0006cd-As; Thu, 18 Apr 2019 23:30:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHGU5-0006ME-D7
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 23:30:27 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77FD8214DA;
 Thu, 18 Apr 2019 23:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555630224;
 bh=hQSbgXdPN1jKdvOoXqPyTOeeeGiJCJPzArhQyDxDc/4=;
 h=From:To:Cc:Subject:Date:From;
 b=VWetfSG2f9LNCp4isk6+Dzq633enA777XqvJsPYsSTkotg+2dwH1ckZCqnozT0Muo
 slSWM2bthyGTPOnIgxfBQ+qY2Mtr3ynAbzTEEvDaAbpa0yXcH2HVS5wxKoN35hC+7p
 MSW/bTB3vb5jBstZKXr+ETGb0pp/ztXzKv+D4fXI=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v5 00/16] fscrypt: key management improvements
Date: Thu, 18 Apr 2019 16:29:07 -0700
Message-Id: <20190418232923.250800-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_163025_484443_2A696293 
X-CRM114-Status: GOOD (  21.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This patchset makes major improvements to how keys are added, removed,
and derived in fscrypt, aka ext4/f2fs/ubifs encryption.  It does this by
adding new ioctls that add and remove encryption keys directly to/from
the filesystem, and by adding a new encryption policy version ("v2")
where the user-provided keys are only used as input to HKDF-SHA512 and
are identified by their cryptographic hash.

All new APIs and all cryptosystem changes are documented in
Documentation/filesystems/fscrypt.rst.  Userspace can use the new key
management ioctls with existing encrypted directories, but migrating to
v2 encryption policies is needed for the full benefits.

These changes solve four interrelated problems:

(1) Providing fscrypt keys via process-subscribed keyrings is abusing
    encryption as an OS-level access control mechanism, causing many
    bugs where processes don't get access to the keys they need -- e.g.,
    when a 'sudo' command or a system service needs to access encrypted
    files.  It's also inconsistent with the filesystem/VFS "view" of
    encrypted files which is global, so sometimes things randomly happen
    to work anyway due to caching.  Regardless, currently almost all
    fscrypt users actually do need global keys, so they're having to use
    workarounds that heavily abuse the session or user keyrings, e.g.
    Android and Chromium OS both use a systemwide "session keyring" and
    the 'fscrypt' tool links all user keyrings into root's user keyring.

(2) Currently there's no way to securely and efficiently remove a
    fscrypt key such that not only is the original key wiped, but also
    all files and directories protected by that key are "locked" and
    their per-file keys wiped.  Many users want this and are using
    'echo 2 > /proc/sys/vm/drop_caches' as a workaround, but this is
    root-only, and also is overkill so can be a performance disaster.

(3) The key derivation function (KDF) that fscrypt uses to derive
    per-file keys is nonstandard, inflexible, and has some weaknesses
    such as being reversible and not evenly distributing the entropy
    from the user-provided keys.

(4) fscrypt doesn't check that the correct key was supplied.  This can
    be a security vulnerability, since it allows malicious local users
    to associate the wrong key with files to which they have read-only
    access, causing other users' processes to read/write the wrong data.

Ultimately, the solutions to these problems all tie into each other.  By
adding a filesystem-level encryption keyring with ioctls to add/remove
keys to/from it, the keys are made usable filesystem-wide (solves
problem #1).  It also becomes easy to track the inodes that were
"unlocked" with each key, so they can be evicted when the key is removed
(solves problem #2).  Moreover, the filesystem-level keyring is a
natural place to store an HMAC transform keyed by each key, thus making
it easy and efficient to switch the KDF to HKDF (solves problem #3).

Finally, to check that the correct key was supplied, I use HKDF to
derive a cryptographically secure key_identifier for each key (solves
problem #4).  This in combination with key quotas and other careful
precautions also makes it safe to allow non-root users to add and remove
keys to/from the filesystem-level keyring.  Thus, all problems are
solved without having to restrict the fscrypt API to root only.

The patchset is organized as follows:

- Patches 1-8 add new ioctls FS_IOC_ADD_ENCRYPTION_KEY,
  FS_IOC_REMOVE_ENCRYPTION_KEY, and FS_IOC_GET_ENCRYPTION_KEY_STATUS.
  Adding a key logically "unlocks" all files on the filesystem that are
  protected by that key; removing a key "locks" them again.

- Patches 9-12 add support for v2 encryption policies.

- Patches 13-15 wire up the new ioctls to ext4, f2fs, and ubifs.

- Patch 16 updates the fscrypt documentation for all the changes.

Changes v4 => v5:
    - Simplify shrink_dcache_inode(), as suggested by Al Viro.
      Also move it into fs/crypto/.
    - Fix a build error on some architectures by calling
      copy_from_user() rather than get_user() with a __u64 pointer.

Changes v3 => v4:
    - Introduce fscrypt_sb_free() to avoid an extra #ifdef.
    - Fix UBIFS's ->drop_inode().
    - Add 'version' to union fscrypt_policy and union fscrypt_context.

Changes v2 => v3:
    - Use ->drop_inode() to trigger the inode eviction during/after
      FS_IOC_REMOVE_ENCRYPTION_KEY, as suggested by Dave Chinner.
    - A few small cleanups.

v1 of this patchset was sent in October 2017 with title "fscrypt:
filesystem-level keyring and v2 policy support".  This revived version
follows the same basic design but incorporates numerous improvements,
such as splitting keyinfo.c into multiple files for much better
understandability, and introducing "per-mode" encryption keys to
implement the semantics of the DIRECT_KEY encryption policy flag.

This patchset applies to the fscrypt tree with the additional patch
"[PATCH v2 2/2] fscrypt: cache decrypted symlink target in ->i_link"
(https://patchwork.kernel.org/patch/10894743/) applied.  You can also
get this patchset from git at:

	Repository:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
	Branch:       fscrypt-key-mgmt-improvements-v5

I've started writing xfstests for the new APIs.  So far they cover basic
functionality.  They can be found at:

	Repository:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git
	Branch:       fscrypt-key-mgmt-improvements

The xfstests depend on new xfs_io commands which can be found at:

	Repository:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfsprogs-dev.git
	Branch:       fscrypt-key-mgmt-improvements

I've also made proof-of-concept changes to the 'fscrypt' userspace
program (https://github.com/google/fscrypt) to make it support v2
encryption policies.  You can find these changes in git at:

	Repository:   https://github.com/ebiggers/fscrypt.git
	Branch:       fscrypt-key-mgmt-improvements

To make the 'fscrypt' userspace program experimentally use v2 encryption
policies on new encrypted directories, add the following to
/etc/fscrypt.conf within the "options" section:

	"policy_version": "2"

It's also planned for Android and Chromium OS to switch to the new
ioctls and eventually to v2 encryption policies.  Work-in-progress,
proof-of-concept changes by Satya Tangirala for AOSP can be found at
https://android-review.googlesource.com/q/topic:fscrypt-key-mgmt-improvements

Eric Biggers (16):
  fs, fscrypt: move uapi definitions to new header <linux/fscrypt.h>
  fscrypt: use FSCRYPT_ prefix for uapi constants
  fscrypt: use FSCRYPT_* definitions, not FS_*
  fscrypt: add ->ci_inode to fscrypt_info
  fscrypt: refactor v1 policy key setup into keysetup_legacy.c
  fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
  fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
  fscrypt: add FS_IOC_GET_ENCRYPTION_KEY_STATUS ioctl
  fscrypt: add an HKDF-SHA512 implementation
  fscrypt: v2 encryption policy support
  fscrypt: allow unprivileged users to add/remove keys for v2 policies
  fscrypt: require that key be added when setting a v2 encryption policy
  ext4: wire up new fscrypt ioctls
  f2fs: wire up new fscrypt ioctls
  ubifs: wire up new fscrypt ioctls
  fscrypt: document the new ioctls and policy version

 Documentation/filesystems/fscrypt.rst | 670 ++++++++++++++----
 MAINTAINERS                           |   1 +
 fs/crypto/Kconfig                     |   2 +
 fs/crypto/Makefile                    |  10 +-
 fs/crypto/crypto.c                    |  14 +-
 fs/crypto/fname.c                     |   5 +-
 fs/crypto/fscrypt_private.h           | 366 ++++++++--
 fs/crypto/hkdf.c                      | 188 ++++++
 fs/crypto/keyinfo.c                   | 613 -----------------
 fs/crypto/keyring.c                   | 931 ++++++++++++++++++++++++++
 fs/crypto/keysetup.c                  | 561 ++++++++++++++++
 fs/crypto/keysetup_legacy.c           | 340 ++++++++++
 fs/crypto/policy.c                    | 392 ++++++++---
 fs/ext4/ioctl.c                       |  24 +
 fs/ext4/super.c                       |   3 +
 fs/f2fs/file.c                        |  46 ++
 fs/f2fs/super.c                       |   2 +
 fs/super.c                            |   2 +
 fs/ubifs/ioctl.c                      |  16 +
 fs/ubifs/super.c                      |  11 +
 include/linux/fs.h                    |   1 +
 include/linux/fscrypt.h               |  49 +-
 include/uapi/linux/fs.h               |  54 +-
 include/uapi/linux/fscrypt.h          | 163 +++++
 24 files changed, 3521 insertions(+), 943 deletions(-)
 create mode 100644 fs/crypto/hkdf.c
 delete mode 100644 fs/crypto/keyinfo.c
 create mode 100644 fs/crypto/keyring.c
 create mode 100644 fs/crypto/keysetup.c
 create mode 100644 fs/crypto/keysetup_legacy.c
 create mode 100644 include/uapi/linux/fscrypt.h

-- 
2.21.0.392.gf8f6787159e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
