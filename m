Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E671C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 18:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFECA2146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 18:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VhmNGYH0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCLPwNsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFECA2146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wbLvBsgkx+nMWonIJsFUWRkg0xhIEJODNmQwrPmAUtA=; b=VhmNGYH0vpo0A2
	NDcMMJ4T5JceF2YHEoZnD3YavtY3ztrlhvZxuyIKMZYg39Zv4ef5dItmKH56yEVVJSQtfWVEbapuN
	oEfRm2b+jGPpctsNWEbrZIGpneP1XYWlFe7OlJ+LS2i9sgaEszQF5N0NXwGq4NqBGVInbWVvuSH0q
	9q4VGnPcvCspDCdu3m9VI4el2qYMaLBAr+Cpdz419Uk4O7fWi14ilmHI4k27ekPoBEJbMnjVBcm70
	5uHSnrGhOKSDck+QxqbHq3BYxwMOVwtboD4AuOkfpKulPVXurhK6xvVyc+5tyBPDkj2WmQMFIO6px
	jNrYkW8nUMLt17avj03Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6g8f-0000TQ-Sx; Wed, 20 Mar 2019 18:40:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6g8N-0008Ur-7Q
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 18:40:17 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6F812146E;
 Wed, 20 Mar 2019 18:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553107213;
 bh=VLKOyjiTo4zNBcYy+Dh3fGC61v1rZeuQPK7QsXfa/kc=;
 h=From:To:Cc:Subject:Date:From;
 b=kCLPwNsxKjBi1Cf0dZQ8mzosH4wpgpoPRGZIiZ+TJq67qp1EPXw1oJEkLwXC7Qy49
 o8DMUYha//gs3Z1TECuZ2GWGWH11EH2+btPL8IFsMzjiFOgFr+4sNO/3s6MQB+tZkg
 sTY06QYUuiNmrpsIfnD+6V52mI/AEtWWDfsTXja8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 0/5] fscrypt: d_revalidate fixes and cleanups
Date: Wed, 20 Mar 2019 11:39:08 -0700
Message-Id: <20190320183913.12686-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.225.g810b269d1ac-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_114015_386744_958E49FB 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

This patch series improves dentry revalidation in fscrypt.

To recap, fscrypt (aka ext4/f2fs/ubifs encryption) encrypts both file
contents and file names in individual directory trees.  A single
filesystem can contain many encrypted directory trees using many
different encryption keys.  Major users of fscrypt require the ability
to delete encrypted files when their encryption key is unavailable, e.g.
when the system needs to delete a removed user's home directory or free
up space from a logged-out user's cache directory.

Therefore fscrypt allows listing, looking up, and deleting files in
encrypted directories via encoded ciphertext names, but only before the
key is added.  After the key is added, the ciphertext names are
invalidated via ->d_revalidate() and plaintext names are shown instead.

fscrypt isn't a stacked filesystem, and it's explicitly for storage
encryption, not OS-level access control.  Thus, whether each directory
inode has its key or not is a global state, not per-process.  Also, the
inode keeps its key until it's evicted from the inode cache.  So,
plaintext names shouldn't ever get invalidated by ->d_revalidate().

This patch series makes the following improvements:

- Only assign ->d_revalidate() to ciphertext filenames, thus allowing
  overlayfs to use an fscrypt-encrypted upperdir in some cases.
  (Previous discussion: https://lkml.org/lkml/2019/3/13/255)

- Fix cases where plaintext filenames would wrongly be invalidated,
  including a real-world bug recently reported on Chromium OS.

- Fix cases where ciphertext filenames would wrongly not be invalidated.

- Allow rcu-walk lookups in encrypted directories with the key, which
  improves performance.
  (Previous attempt: https://patchwork.kernel.org/patch/10594133/)

- Fix cases where rename() and link() could succeed on ciphertext names.

Changed since v1:

- Fixed comment in fscrypt_d_revalidate() to explain that dget_parent()
  is actually still required.

- Moved clearing DCACHE_ENCRYPTED_NAME into fscrypt.h, to avoid an extra
  #ifdef and cluttering up dcache.c.

Eric Biggers (5):
  fscrypt: clean up and improve dentry revalidation
  fscrypt: fix race allowing rename() and link() of ciphertext dentries
  fs, fscrypt: clear DCACHE_ENCRYPTED_NAME when unaliasing directory
  fscrypt: only set dentry_operations on ciphertext dentries
  fscrypt: fix race where ->lookup() marks plaintext dentry as
    ciphertext

 fs/crypto/crypto.c      | 58 ++++++++++++++++---------------
 fs/crypto/fname.c       |  1 +
 fs/crypto/hooks.c       | 28 ++++++++++-----
 fs/dcache.c             |  2 ++
 fs/ext4/ext4.h          | 62 +++++++++++++++++++++++++--------
 fs/ext4/namei.c         | 76 ++++++++++++++++++++++++++++-------------
 fs/f2fs/namei.c         | 17 +++++----
 fs/ubifs/dir.c          |  8 ++---
 include/linux/dcache.h  |  2 +-
 include/linux/fscrypt.h | 61 +++++++++++++++++++++++----------
 10 files changed, 208 insertions(+), 107 deletions(-)

-- 
2.21.0.225.g810b269d1ac-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
