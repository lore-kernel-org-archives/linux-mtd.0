Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17917C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:13:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8AE422204
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CSKKdYsk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOK1Phyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8AE422204
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DGD5cWbjrwGOQ46YjUZtRlmC8/rvLYcrR3Lvf8TbEBo=; b=CSKKdYskn9+220C3HmEuVXWPc9
	OOBwnEpsNtnIzF/nAmpT1litnK9Cq+mhf6hehVZqMXkDG0/oz+a9E/vPu4h1R7pCTIjh/PPbVveVs
	007jRtQvM/G24PowmrDsZmardmz0jcFGtbUY4wv4F3sad/ux80aUScIRENYzvJ04BsnNJrUAbcmeH
	xT0zwlkYOWzb8qqbbUC+b8CtTNaU/wk2BqTVsFAnM7+ahd9Bgf6DOYp65Bhu9cAVPpHl0LrQfynk0
	JiVAlqazUKvoAO5sGsT27GbI9plAcLal6e1V2TmLbTRb42CTXx0nXs9+KWNpuY9+rdOoqLcOvRnsl
	/ShPgjDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIlIG-0001Fs-8h; Thu, 17 Sep 2020 04:13:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIlID-0001DL-2S
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 04:13:10 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2A412074B;
 Thu, 17 Sep 2020 04:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600315988;
 bh=tM/vVKpgIq/1E/c7scgrL37P+3enf/GVwfCXmp+Qo8Q=;
 h=From:To:Cc:Subject:Date:From;
 b=aOK1PhygiTi9wUZF8AW5bf7XQaiWHY70xLWcdjs/iUgFVpU9gqRwuzZbiVuk7AtBi
 B2NqUu4X6lglthhCtvW3oOX7A0+0La/otShJwsVcyQZEDOZPwfQ1DaevY6r+cGNDNn
 hNDwgQ+tusdACi9w+UAOmem3muqIGfgD5mdFkFnE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v3 00/13] fscrypt: improve file creation flow
Date: Wed, 16 Sep 2020 21:11:23 -0700
Message-Id: <20200917041136.178600-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_001309_273708_8DE12E6A 
X-CRM114-Status: GOOD (  15.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This series reworks the implementation of creating new encrypted files
by introducing new helper functions that allow filesystems to set up the
inodes' keys earlier, prior to taking too many filesystem locks.

This fixes deadlocks that are possible during memory reclaim because
fscrypt_get_encryption_info() isn't GFP_NOFS-safe, yet it's called
during an ext4 transaction or under f2fs_lock_op().  It also fixes a
similar deadlock where f2fs can try to recursively lock a page when the
test_dummy_encryption mount option is in use.

It also solves an ordering problem that the ceph support for fscrypt
will have.  For more details about this ordering problem, see the
discussion on Jeff Layton's RFC patchsets for ceph fscrypt support
(v1: https://lkml.kernel.org/linux-fscrypt/20200821182813.52570-1-jlayton@kernel.org/T/#u
 v2: https://lkml.kernel.org/linux-fscrypt/20200904160537.76663-1-jlayton@kernel.org/T/#u
 v3: https://lkml.kernel.org/linux-fscrypt/20200914191707.380444-1-jlayton@kernel.org/T/#u)
Note that v3 of the ceph patchset is based on v2 of this patchset.

Patch 1 adds the above-mentioned new helper functions.  Patches 2-5
convert ext4, f2fs, and ubifs to use them, and patches 6-9 clean up a
few things afterwards.

Finally, patches 10-13 change the implementation of
test_dummy_encryption to no longer set up an encryption key for
unencrypted directories, which was confusing and was causing problems.

This patchset applies to the master branch of
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git.
It can also be retrieved from tag "fscrypt-file-creation-v3" of
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git.

I'm looking to apply this for 5.10; reviews are greatly appreciated!

Changed v2 => v3:
  - Added patch that changes fscrypt_set_test_dummy_encryption() to take
    a 'const char *'.  (Needed by ceph.)
  - Fixed bug where fscrypt_prepare_new_inode() succeeded even if the
    new inode's key couldn't be set up.
  - Fixed bug where fscrypt_prepare_new_inode() wouldn't derive the
    dirhash key for new casefolded directories.
  - Made warning messages account for i_ino possibly being 0 now.

Changed v1 => v2:
  - Added mention of another deadlock this fixes.
  - Added patches to improve the test_dummy_encryption implementation.
  - Dropped an ext4 cleanup patch that can be done separately later.
  - Lots of small cleanups, and a couple small fixes.

Eric Biggers (13):
  fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()
  ext4: factor out ext4_xattr_credits_for_new_inode()
  ext4: use fscrypt_prepare_new_inode() and fscrypt_set_context()
  f2fs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
  ubifs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
  fscrypt: adjust logging for in-creation inodes
  fscrypt: remove fscrypt_inherit_context()
  fscrypt: require that fscrypt_encrypt_symlink() already has key
  fscrypt: stop pretending that key setup is nofs-safe
  fscrypt: make "#define fscrypt_policy" user-only
  fscrypt: move fscrypt_prepare_symlink() out-of-line
  fscrypt: handle test_dummy_encryption in more logical way
  fscrypt: make fscrypt_set_test_dummy_encryption() take a 'const char
    *'

 fs/crypto/crypto.c           |   4 +-
 fs/crypto/fname.c            |  11 +-
 fs/crypto/fscrypt_private.h  |  10 +-
 fs/crypto/hooks.c            |  65 ++++++++----
 fs/crypto/inline_crypt.c     |   7 +-
 fs/crypto/keyring.c          |   9 +-
 fs/crypto/keysetup.c         | 182 +++++++++++++++++++++++--------
 fs/crypto/keysetup_v1.c      |   8 +-
 fs/crypto/policy.c           | 200 ++++++++++++++++++++---------------
 fs/ext4/ext4.h               |   6 +-
 fs/ext4/ialloc.c             | 119 +++++++++++----------
 fs/ext4/super.c              |  17 +--
 fs/f2fs/dir.c                |   2 +-
 fs/f2fs/f2fs.h               |  25 +----
 fs/f2fs/namei.c              |   7 +-
 fs/f2fs/super.c              |  16 +--
 fs/ubifs/dir.c               |  38 +++----
 include/linux/fscrypt.h      | 120 +++++++--------------
 include/uapi/linux/fscrypt.h |   6 +-
 19 files changed, 474 insertions(+), 378 deletions(-)


base-commit: 5e895bd4d5233cb054447d0491d4e63c8496d419
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
