Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA5606A322
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I/VKWUyF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENLdlQBC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ogD9DVMSXncOd1rADjrZ6SvKQfVS+/0HwezIfMXrzD4=; b=I/VKWUyF7THjumRgdPji4dpZ87
	Xa9pK96KdQE0U2vvJJsCRPwIVaULlCZEyHO7PYxxSxGGmGvL1PBLR2ml25hinB/v57UZUM8gD0fIk
	WXZuoziq65sASeaJ/7IOiBvq3socVj+VGBRkKxywF666oDtvpibPSeAekho/m4hdX/ieVTwm2PTrk
	q1Ir37lYxlZ+UUQ7R59IxUv8h0ZSK3NdsmJb96D436eCeRWvR2mdvYV34Tcex17P408Ej2xr9sm7b
	+uo4pvTa6Xc1rYenR9nkmsSgYS0UD4u8TU2uwWu8gFvHFzErX/E18V7/tqldl94rvtEJf3gr+3ypV
	RYetlTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSex-00000009jnX-0j6c;
	Thu, 29 Oct 2026 16:07:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSew-00000009jnP-0rUB
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:07:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E84C56061D;
	Thu, 29 Oct 2026 16:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1FB1F031E1;
	Thu, 29 Oct 2026 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290040;
	bh=0kfa1+o/kOQJpCjWspPvluOo3G7XtKdfcqBY5eBQo5Y=;
	h=From:Subject:Date:To:Cc;
	b=ENLdlQBCOxcvXYZ9732gRlp7GWhde/z2/AbncGNhVadmd7mCXF6V+cOPRvs1GhjDu
	 ken0PrYzQBe4IO1MchCBV6yu4Cl64rgfSKBkmMQmnpkcmRUclZrD5u3GP4j8fDbIXW
	 tL5+HUCMtjkqGfYAqVZxqPpZCbOU0hz3cpFjbwGZA3DX8s5imLeVfLSROTUijoBrwu
	 TLqT3kVrmBJyWo05wA+dNSOGvwyDY//v4VfTF2ksoShUVTjjLymL1VTAMTM2Av0e8F
	 gqysEcjNyRy+c3NAOiXlmJg+zCuC/p+M5DOt8se2WEYDvC2omSJLK7t0UfGYs1HQgk
	 C5RZNQVdwBUtQ==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH v2 00/34] fs: don't set SB_RDONLY after filesystem errors
Date: Thu, 29 Oct 2026 17:06:51 +0100
Message-Id: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQ6CMBBFr0K6tqQtpkZX3sMQ05YBKqQ1M4gSw
 t2lGF25fJM/L29mBOiB2CmbGcLoycewgtplzLUmNMB9tTJTQmkppOTPiB2viZO9YhVDP/H6WIB
 W2lbCKbb+3RFq/9qcl/LD9LA3cEMSpYU1BNyiCa5Np6TMa8p/yjwN0rD1NESctrpRJuE3RP0JG
 SUXXIvDvjBF5Qqlzx1ggD6P2LByWZY3Wd2/Ze4AAAA=
X-Change-ID: 20261011-work-fs-sb_rdonly-f93e626bd0c2
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org, 
 Farhad Alemi <farhad.alemi@berkeley.edu>, Tyler Hicks <code@tyhicks.com>, 
 Jan Kara <jack@suse.cz>, Karl Mehltretter <kmehltretter@gmail.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=18142; i=brauner@kernel.org;
 h=from:subject:message-id; bh=MHX3uX4Z7tanio9rdiFDGmpLw2bGfkflZBNxCLxl1+c=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9ztfzWsI54x5bH2fFj6XR2jaGN778rxJmc3kUF/cxJ
 sO++6J4RykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwESuyjEyLAiOnxIlxfr+w4QL
 E94UpT3sY9R/GiTUvfxG/QyLgmaeT4wM33t/VUZueHbmSlru2uXPE80fJFVISbzx4OJJXzrzT/B
 7HgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A lot of filesystems handle errors by setting SB_RDONLY on the
superblock. They do that from whatever context found the error and
without holding s_umount. That's never been okay. SB_RDONLY is supposed
to only change under s_umount through a proper remount and the unlocked
update of sb->s_flags races with everyone else who writes it.

And it breaks freezing. freeze_super() and thaw_super() decide from
sb_rdonly() whether the s_writers rwsems need to be taken or released.
So if an error sets SB_RDONLY while the filesystem is frozen
thaw_super() leaves the rwsems write-locked and marks the superblock
unfrozen. Every writer after that hangs in sb_start_write() and umount
warns when it frees the locked rwsems. jfs even oopses on umount.

Karl noticed and proposed teaching thaw_super() to remember whether the
freeze took the rwsems (cf. [1]). But a filesystem changing SB_RDONLY
behind the VFS' back causes more problems than confused freezing. Jan
preferred fixing the filesystems instead (cf. [2]) and I agree. ext4
and f2fs already stopped doing it.

v1 converted all the others to what ext4 does and every one of them grew
the same checks in ->open, ->setattr, ->fsync, the directory operations,
the quota operations and ->reconfigure. Jan suggested a generic flag in
the superblock instead so the VFS can do that once (cf. [3]). So that's
what this version does:

- a new sb->s_state word with SB_STATE_EMERGENCY_RO. It's only ever set
  and never cleared. SB_RDONLY stays untouched so freeze_super() and
  thaw_super() keep seeing a consistent superblock
- a filesystem calls sb_set_emergency_ro() where it used to set
  SB_RDONLY
- the VFS refuses modifications with EROFS wherever sb_rdonly() does,
  also for files that were opened before the error, and it refuses the
  remount to read-write
- /proc/mounts, statmount() and statfs() report the superblock as
  read-only like they did when SB_RDONLY was set
- a remount to read-only works so emergency remount (sysrq u) doesn't
  WARN, and it doesn't mark the filesystem clean

What the VFS doesn't do is stop writeback. ext4 refuses to write back
anything in that state but jfs has to commit the allocations that were
under way when the error hit, otherwise evicting those inodes BUGs. So
->write_inode(), ->writepages() and ->sync_fs() keep being called and
every filesystem decides for itself. The same goes for what reaches a
filesystem without passing through the VFS: its allocators, its
journal, the deletion of unlinked inodes and the xattr and ACL setters
that ecryptfs and friends call without taking write access on the lower
mount. That's about a third of the checks v1 had.

The fixes that are tagged for stable stay self-contained so they can be
backported without the VFS patch. A small follow-up patch converts each
of exfat, hfs, ntfs, zonefs and ext4 to the generic state. fat, exfat,
hpfs, ntfs and ubifs keep setting SB_RDONLY for errors while the
filesystem is still being mounted. Nothing can freeze the superblock
before SB_BORN so that's fine.

A few patches make the read-only remount work in the first place. exfat
and ocfs2 didn't inherit their mount options on remount so emergency
remount, which passes none, could fail on them. gfs2 has a BUG_ON() when
it's remounted read-only while a withdraw is still pending. ext4 refused
to go read-only in its emergency state at all and a shut down xfs
couldn't be remounted read-only either. So sysrq u WARNed for every ext4
that hit an error and for every shut down xfs.

ecryptfs opens its lower files read-write unless the lower superblock is
read-only. On top of one of these filesystems every lookup of a regular
file would fail with EROFS after an error and leak the inode. The first
two patches make ecryptfs fall back to a read-only lower file and plug
the leak.

There are user-visible changes but I think they're all fine. The big one
is that "mount -o remount,rw" doesn't make the filesystem writable again
after an error. That's how ext4 behaves since commit d3476f3dad4a
("ext4: don't set SB_RDONLY after filesystem errors"). Writes through
file descriptors opened before the error fail with EROFS now, so does
fsync(), and stores through shared mappings get SIGBUS once they fault.
A second read-only mount of the device fails with EBUSY. And ext4 shows
"ro" in /proc/mounts and reports ST_RDONLY again after an error, which
it stopped doing with that commit.

This has some dependency on vfs-7.5.super:

  super: don't put the remount context under s_umount
  super: keep the read-only state if a reconfiguration doesn't change it
  nilfs2: don't reconfigure a frozen superblock on mount

The first two are from [5]. The first one matters most. This series
makes errored filesystems reachable for sysrq u and without it a
concurrent umount deadlocks on s_umount. The second one makes
fc->sb_flags carry the current read-only state for fspick()
reconfigurations, which ->reconfigure() of fat, affs, hfs, ufs, hpfs and
btrfs rely on. The third one closes the last way nilfs2 changes
SB_RDONLY on a frozen superblock, through a mount that reconfigures it.

With this no filesystem changes SB_RDONLY outside of mount and remount
anymore.

[1]: https://lore.kernel.org/r/20260903060855.4610-1-kmehltretter@gmail.com
[2]: https://lore.kernel.org/r/hyhuckyohsabx2suvq3z7uy3pbgmihva6wgzxr3op7pzcrlu33@p7zzlgp2ehjf
[3]: https://lore.kernel.org/r/my2k7257m265fp5ad77n5hfndl23i56gsog3jwnsyocp3yxbnj@aphfqdiej2hs
[4]: https://lore.kernel.org/r/CAHc6FU5JuYU8R4=agxgWBoEKrUGyWiitzRn5MwXiV7NZYt=_ag@mail.gmail.com
[5]: https://lore.kernel.org/r/20261011-work-super-fixes-core-v1-0-c727176c5b53@kernel.org

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Changes in v2:
- Generic SB_STATE_EMERGENCY_RO in the superblock, the VFS refuses
  modifications. The checks at the VFS entry points of every filesystem
  are gone (Jan).
- The VFS patch from the v1 thread also hooked write_inode() and
  sync_filesystem(). Dropped, jfs still has to commit queued allocations
  after the error.
- /proc/mounts shows "ro" and statfs() reports ST_RDONLY again in the
  emergency state.
- The stable-tagged fixes stay self-contained, follow-up patches convert
  exfat, hfs, ntfs, zonefs and ext4 to the generic state.
- hfsplus checks the b-tree map records in hfsplus_fill_super() (Slava).
- Selftests expect ST_RDONLY and EROFS from fsync() on jfs too.
- ecryptfs refuses writes through a read-only lower file with EROFS.
  truncate(2) and creating a file ran into the WARN_ON_ONCE() in
  __kernel_write_iter() (sashiko).
- gfs2: bail out of the freeze loop when the filesystem withdrew in the
  meantime, keep the EIO from gfs2_make_fs_rw() for a remount to
  read-write and don't show "withdrawn" in the mount options (Andreas).
- Don't show "emergency_ro" and "ro_ops" in the mount options. Remount
  helpers that pass the shown options back trip over them. ext4 keeps
  showing "emergency_ro" like it does now (Andreas).
- Rebased onto current mainline. ntfs persists its error state itself
  since commit 521978c4f444, the error work uses that now, and the new
  named stream paths refuse modifications in the emergency state too.
- statmount() reports the emergency state as read-only too and
  remap_verify_area() refuses FICLONE and friends in that state.
- nilfs2 refuses going read-write in the emergency state itself because
  nilfs_get_tree() reconfigures the superblock without
  reconfigure_super(). zonefs keeps its check in ->write_iter() because
  the loop driver and others call it without rw_verify_area().
- ntfs runs a pending error work before umount persists the error
  state, hfsplus says which b-tree header node it couldn't load again.
- The reproducers moved out of the commit messages into git notes.
- Link to v1: https://patch.msgid.link/20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org

---
Christian Brauner (34):
      ecryptfs: don't leak the inode when a lookup can't open the lower file
      ecryptfs: fall back to a read-only lower file
      fs: add a generic emergency read-only state
      ext2: don't set SB_RDONLY after filesystem errors
      jfs: don't set SB_RDONLY after filesystem errors
      nilfs2: don't set SB_RDONLY after filesystem errors
      fat: don't set SB_RDONLY after filesystem errors
      exfat: keep the current mount options on remount
      exfat: don't set SB_RDONLY after filesystem errors
      exfat: use the generic emergency read-only state
      hfs: don't set SB_RDONLY after MDB write errors
      hfs: use the generic emergency read-only state
      hfsplus: don't set SB_RDONLY when creating the attributes tree
      affs: don't set SB_RDONLY after filesystem errors
      ufs: don't set SB_RDONLY after filesystem errors
      hpfs: don't set SB_RDONLY after filesystem errors
      ntfs: don't set SB_RDONLY after filesystem errors
      ntfs: use the generic emergency read-only state
      ocfs2: keep the current mount options on remount
      ocfs2: don't set SB_RDONLY after filesystem errors
      zonefs: don't set SB_RDONLY after I/O errors
      zonefs: use the generic emergency read-only state
      btrfs: check BTRFS_FS_STATE_RO instead of SB_RDONLY at runtime
      btrfs: don't set SB_RDONLY after filesystem errors
      gfs2: wait for a pending withdraw before remounting read-only
      gfs2: don't set SB_RDONLY on withdraw
      efivarfs: stop using SB_RDONLY for read-only efivar ops
      ubifs: don't set SB_RDONLY after errors
      selftests/filesystems: test filesystem errors while frozen
      ext4: allow remounting read-only in the emergency state
      ext4: use the generic emergency read-only state
      selftests/filesystems: test ext4 remounts in the emergency state
      xfs: allow remounting read-only after a shutdown
      selftests/filesystems: test xfs remounts after a shutdown

 Documentation/filesystems/porting.rst              |  16 +
 Documentation/filesystems/zonefs.rst               |   4 +-
 fs/affs/amigaffs.c                                 |   4 +-
 fs/affs/inode.c                                    |   2 +
 fs/affs/super.c                                    |  14 +-
 fs/attr.c                                          |   4 +
 fs/btrfs/acl.c                                     |   3 +-
 fs/btrfs/bio.c                                     |   2 +-
 fs/btrfs/block-group.c                             |   2 +-
 fs/btrfs/dev-replace.c                             |   2 +-
 fs/btrfs/discard.c                                 |   2 +-
 fs/btrfs/disk-io.c                                 |   4 +-
 fs/btrfs/fs.h                                      |   9 +
 fs/btrfs/inode.c                                   |   8 +-
 fs/btrfs/ioctl.c                                   |   8 +-
 fs/btrfs/messages.c                                |  16 +-
 fs/btrfs/qgroup.c                                  |   4 +-
 fs/btrfs/reflink.c                                 |   3 +-
 fs/btrfs/super.c                                   |  35 +-
 fs/btrfs/sysfs.c                                   |   4 +-
 fs/btrfs/tree-checker.c                            |   2 +-
 fs/btrfs/volumes.c                                 |   4 +-
 fs/btrfs/xattr.c                                   |   8 +-
 fs/ecryptfs/inode.c                                |  13 +-
 fs/ecryptfs/kthread.c                              |  15 +-
 fs/ecryptfs/read_write.c                           |   3 +
 fs/efivarfs/file.c                                 |   6 +
 fs/efivarfs/inode.c                                |  15 +
 fs/efivarfs/internal.h                             |  14 +-
 fs/efivarfs/super.c                                |  26 +-
 fs/exfat/exfat_fs.h                                |  10 +
 fs/exfat/file.c                                    |  54 +-
 fs/exfat/inode.c                                   |  11 +-
 fs/exfat/misc.c                                    |  16 +-
 fs/exfat/namei.c                                   |  27 +-
 fs/exfat/super.c                                   |  36 +-
 fs/ext2/balloc.c                                   |   5 +
 fs/ext2/dir.c                                      |   3 +
 fs/ext2/ialloc.c                                   |   2 +
 fs/ext2/inode.c                                    |  10 +-
 fs/ext2/super.c                                    |  24 +-
 fs/ext2/xattr.c                                    |   2 +
 fs/ext4/super.c                                    |  19 +-
 fs/fat/dir.c                                       |   3 +
 fs/fat/fatent.c                                    |  11 +-
 fs/fat/file.c                                      |   4 +
 fs/fat/inode.c                                     |  19 +-
 fs/fat/misc.c                                      |  19 +-
 fs/gfs2/quota.c                                    |   2 +-
 fs/gfs2/super.c                                    |  40 +-
 fs/gfs2/util.c                                     |   7 +-
 fs/hfs/attr.c                                      |   3 +
 fs/hfs/extent.c                                    |   5 +
 fs/hfs/inode.c                                     |  18 +
 fs/hfs/mdb.c                                       |  16 +-
 fs/hfs/super.c                                     |   2 +-
 fs/hfsplus/btree.c                                 |  42 +-
 fs/hfsplus/hfsplus_fs.h                            |   1 +
 fs/hfsplus/super.c                                 |   5 +
 fs/hpfs/alloc.c                                    |   4 +-
 fs/hpfs/dir.c                                      |   3 +-
 fs/hpfs/map.c                                      |   3 +-
 fs/hpfs/super.c                                    |  11 +-
 fs/jfs/acl.c                                       |   3 +
 fs/jfs/inode.c                                     |   6 +-
 fs/jfs/ioctl.c                                     |   4 +
 fs/jfs/jfs_dtree.c                                 |   3 +-
 fs/jfs/jfs_extent.c                                |  10 +
 fs/jfs/jfs_incore.h                                |   6 +
 fs/jfs/jfs_inode.c                                 |   3 +
 fs/jfs/super.c                                     |  35 +-
 fs/jfs/xattr.c                                     |   3 +
 fs/namei.c                                         |   3 +-
 fs/namespace.c                                     |   6 +-
 fs/nilfs2/inode.c                                  |   4 +-
 fs/nilfs2/ioctl.c                                  |   4 +
 fs/nilfs2/mdt.c                                    |   2 +-
 fs/nilfs2/page.c                                   |   2 +-
 fs/nilfs2/segment.c                                |  13 +-
 fs/nilfs2/sufile.h                                 |   2 +-
 fs/nilfs2/super.c                                  |  29 +-
 fs/nilfs2/the_nilfs.h                              |   6 +
 fs/ntfs/aops.c                                     |   5 +-
 fs/ntfs/dir.c                                      |   5 +-
 fs/ntfs/ea.c                                       |  10 +-
 fs/ntfs/file.c                                     |  63 ++-
 fs/ntfs/inode.c                                    |  15 +-
 fs/ntfs/iomap.c                                    |   6 +-
 fs/ntfs/mft.c                                      |  10 +-
 fs/ntfs/named_stream.c                             |  43 +-
 fs/ntfs/namei.c                                    |  40 +-
 fs/ntfs/super.c                                    |  51 +-
 fs/ntfs/volume.h                                   |  13 +
 fs/ocfs2/acl.c                                     |   3 +
 fs/ocfs2/super.c                                   |  31 +-
 fs/ocfs2/xattr.c                                   |   8 +
 fs/open.c                                          |   4 +
 fs/proc_namespace.c                                |   2 +-
 fs/quota/dquot.c                                   |  23 +-
 fs/quota/quota.c                                   |  13 +
 fs/read_write.c                                    |   5 +
 fs/remap_range.c                                   |   4 +
 fs/statfs.c                                        |   9 +-
 fs/super.c                                         |   4 +
 fs/sync.c                                          |   4 +
 fs/ubifs/io.c                                      |   9 +-
 fs/ubifs/super.c                                   |   5 +-
 fs/ubifs/xattr.c                                   |   6 +
 fs/ufs/cylinder.c                                  |  12 +-
 fs/ufs/dir.c                                       |   3 +
 fs/ufs/inode.c                                     |   2 +
 fs/ufs/super.c                                     |  56 ++-
 fs/xfs/xfs_super.c                                 |  13 +-
 fs/zonefs/file.c                                   |  13 +-
 fs/zonefs/super.c                                  |  25 +-
 fs/zonefs/zonefs.h                                 |   1 +
 include/linux/fs/super.h                           |  17 +
 include/linux/fs/super_types.h                     |  19 +
 mm/memory.c                                        |   6 +
 tools/testing/selftests/Makefile                   |   1 +
 .../selftests/filesystems/sb_rdonly/.gitignore     |   5 +
 .../selftests/filesystems/sb_rdonly/Makefile       |   7 +
 .../testing/selftests/filesystems/sb_rdonly/config |   8 +
 .../filesystems/sb_rdonly/emergency_ro_test.c      | 560 +++++++++++++++++++++
 .../sb_rdonly/ext4_emergency_remount_test.c        | 305 +++++++++++
 .../filesystems/sb_rdonly/gfs2_withdraw_test.c     | 318 ++++++++++++
 .../selftests/filesystems/sb_rdonly/settings       |   1 +
 .../sb_rdonly/xfs_shutdown_remount_test.c          | 299 +++++++++++
 128 files changed, 2573 insertions(+), 322 deletions(-)
---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261011-work-fs-sb_rdonly-f93e626bd0c2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
