Received: from mail-it0-x232.google.com ([2607:f8b0:4001:c0b::232])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXXBN-0001LZ-EI
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 18:57:35 +0000
Received: by mail-it0-x232.google.com with SMTP id u62so2626654ita.2
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2018 10:57:22 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-fscrypt@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH v2 00/11] fscrypt: symlink helpers and fscrypt.h cleanup
Date: Fri,  5 Jan 2018 10:44:51 -0800
Message-Id: <20180105184502.48473-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

This series introduces helper functions in fscrypt that filesystems can
call to simplify handling of encrypted symlinks.  The helpers also fix a
couple subtle bugs, such as incorrectly rejecting symlinks that are very
close to the maximum length, and accidentally leaving the "." and ".."
symlink targets unencrypted (they need to be special in directory
entries, but not in symlink targets).

Patches 1-9 are mostly cleanup to trim down fscrypt.h, moving stuff into
more appropriate places depending on whether it is needed only
internally by fscrypt, or only by filesystems supporting encryption,
etc.  I was going to send these out as a separate series, but there is a
dependency because the symlink helpers depend on
fscrypt_dummy_context_enabled() having been fixed to work correctly in
the "notsupp" case.

Patch 10 introduces the helpers for ->symlink() and patch 11 introduces
a helper for ->get_link().

The patches to switch ext4, f2fs, and ubifs over to use the helper
functions were included in v1 of this patchset
(https://marc.info/?l=linux-ext4&m=151336000031869).  They are not
included now since I'm planning to get them picked up by the individual
filesystem maintainers after this goes in.

Changed since v1:

    - Fixed __fscrypt_prepare_symlink() to work correctly with
      test_dummy_encryption mode in the case where the directory is
      unencrypted and has not yet had its ->i_crypt_info set up.

Eric Biggers (11):
  fscrypt: move fscrypt_has_encryption_key() to supp/notsupp headers
  fscrypt: move fscrypt_control_page() to supp/notsupp headers
  fscrypt: move fscrypt_info_cachep declaration to fscrypt_private.h
  fscrypt: move fscrypt_ctx declaration to fscrypt_supp.h
  fscrypt: split fscrypt_dummy_context_enabled() into supp/notsupp
    versions
  fscrypt: move fscrypt_operations declaration to fscrypt_supp.h
  fscrypt: move fscrypt_valid_enc_modes() to fscrypt_private.h
  fscrypt: move fscrypt_is_dot_dotdot() to fs/crypto/fname.c
  fscrypt: trim down fscrypt.h includes
  fscrypt: new helper functions for ->symlink()
  fscrypt: new helper function - fscrypt_get_symlink()

 fs/crypto/crypto.c              |   1 +
 fs/crypto/fname.c               |  20 ++++-
 fs/crypto/fscrypt_private.h     |  19 +++++
 fs/crypto/hooks.c               | 163 +++++++++++++++++++++++++++++++++++++++
 fs/crypto/keyinfo.c             |   1 +
 include/linux/fscrypt.h         | 165 ++++++++++++++++------------------------
 include/linux/fscrypt_notsupp.h |  39 ++++++++++
 include/linux/fscrypt_supp.h    |  63 ++++++++++++++-
 8 files changed, 369 insertions(+), 102 deletions(-)

-- 
2.16.0.rc0.223.g4a4ac83678-goog
