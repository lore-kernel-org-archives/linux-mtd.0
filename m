Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKvYq-0005BQ-2x
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 23:49:28 +0000
Received: by mail-pf0-x243.google.com with SMTP id d5so11698109pfe.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 16:49:03 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 0/3] fscrypt: forbid truncate(2) without key
Date: Tue, 13 Jun 2017 16:47:52 -0700
Message-Id: <20170613234755.111167-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

These patches update the various filesystems to forbid userspace from
truncating encrypted files without the encryption key, as it's not
possible to handle this correctly in general.  I believe this may have
been missed because truncate() doesn't require opening the file first,
and therefore it's not prevented by the existing requirement that open()
is only allowed with the encryption key.

It probably makes sense to take this series through the fscrypt tree, as
the changes for each filesystem are basically identical.  (Eventually it
might make sense to add an S_ENCRYPTED flag to struct inode and move
some of these "hooks" up into the VFS; this one might fit nicely into
setattr_prepare(), for example.)

Eric Biggers (3):
  ext4: require key for truncate(2) of encrypted file
  f2fs: require key for truncate(2) of encrypted file
  ubifs: require key for truncate(2) of encrypted file

 fs/ext4/inode.c |  8 ++++++++
 fs/f2fs/file.c  | 10 +++++++---
 fs/ubifs/file.c |  8 ++++++++
 3 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.13.1.508.gb3defc5cc-goog
