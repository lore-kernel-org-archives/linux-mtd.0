Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCxs4-0005D0-7a
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 00:40:22 +0000
Received: by mail-pf0-x242.google.com with SMTP id u26so23428608pfd.2
 for <linux-mtd@lists.infradead.org>; Mon, 22 May 2017 17:39:59 -0700 (PDT)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org
Cc: Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: [PATCH 0/4] fscrypt: remove checks for encryption key after file open
Date: Mon, 22 May 2017 17:39:41 -0700
Message-Id: <20170523003945.14279-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

This series removes checks for a regular file's encryption key that occur
after we've already opened the file.  We're guaranteed to already have
the key in such places, since we require it in ->open().  open() fails
with ENOKEY otherwise, and a file descriptor is never made available.

This pertains to regular files only.  (Directories can be opened with or
without their key.)

Eric Biggers (4):
  ext4: don't bother checking for encryption key in ->mmap()
  f2fs: don't bother checking for encryption key in ->mmap()
  ubifs: don't bother checking for encryption key in ->mmap()
  f2fs: don't bother checking for encryption key in ->write_iter()

 fs/ext4/file.c  |  7 -------
 fs/f2fs/file.c  | 13 -------------
 fs/ubifs/file.c |  9 ---------
 3 files changed, 29 deletions(-)

-- 
2.13.0.303.g4ebf302169-goog
