Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3659AC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Dec 2022 04:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3f+m0OyPAf/fxmJzK8097aMWuikf1OD2CCJmOraA2jk=; b=wQziVlfDFUL18C
	3OdH2qsYWiQbDjMXnEP8ica6emTT3tO4cotdxNca0/VMWIbsGM/31hVTaBx1uagJPrI4nTIxFo2Pn
	egz++jPa4lYXQPkoqC5KVuS3WnBfUVm1o+4+nG27xVE6ZgfQxbycPWTi75jPan12WTUkT6Soezeef
	DZp2ftbyMyHH+nvV9y4Syew5YBOA9yDXrccQ9rNM1U2rn2eur+fR2dBLZBftLPFk4G9HVa/Lk4fS7
	NQjbqojnCtfrnbiftyi91HEOt2OuVUpEC0vmRzG2UiP9iyksWYALe9RV9e3Y2Ye4Gygu/v3jJnQge
	VwKUQPUGoFmtca1ZY2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ahc-007qdB-SJ; Mon, 12 Dec 2022 04:46:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ahV-007qYG-TO
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2022 04:46:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C8C14B80B72;
	Mon, 12 Dec 2022 04:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4021DC433D2;
	Mon, 12 Dec 2022 04:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670820356;
	bh=ZiPqywrfVYJKyTMOBz5ADrSOCtd+XOKFfeu5S1nMah4=;
	h=Date:From:To:Cc:Subject:From;
	b=HHl82Mya2ZR0wKm/58rpz/ANETzs4T9/LlUcAtG6Jj/kdDcSPMy3nUSluiVp8JwXG
	 5Zx/BL/ckxlDkCXUPLL9ML9luXQVYAs6fZ+ytcqXBYsADAqzIE7i3GKmkbTrSW/Kw2
	 3XWKMbBePAmK7rN4+xXQ8ZaI0tsddiJh0pnmP8PZueq0XoVAbGF6TIgTBuagMf3cb6
	 Lct0ctXRuaxw6z9+1GJaxO70Dsudj2HbinzikLEoff2C/Ux+gZAKDKEfXZsivs/eKS
	 MgwgMj5QowZcxObgBI0FlnIbym4sDn6ocMgkng+dpntHP+WBUO09whZTmB+UJ6+foK
	 l2I392lOG5/3w==
Date: Sun, 11 Dec 2022 20:45:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [GIT PULL] fscrypt updates for 6.2
Message-ID: <Y5ayAsXkTF3jK13s@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_204602_139850_ACF4A4A0 
X-CRM114-Status: GOOD (  11.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The following changes since commit f0c4d9fc9cc9462659728d168387191387e903cc:

  Linux 6.1-rc4 (2022-11-06 15:07:11 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 41952551acb405080726aa38a8a7ce317d9de4bb:

  fscrypt: add additional documentation for SM4 support (2022-12-02 10:43:00 -0800)

----------------------------------------------------------------

This release adds SM4 encryption support, contributed by Tianjia Zhang.
SM4 is a Chinese block cipher that is an alternative to AES.

I recommend against using SM4, but (according to Tianjia) some people
are being required to use it.  Since SM4 has been turning up in many
other places (crypto API, wireless, TLS, OpenSSL, ARMv8 CPUs, etc.), it
hasn't been very controversial, and some people have to use it, I don't
think it would be fair for me to reject this optional feature.

Besides the above, there are a couple cleanups.

----------------------------------------------------------------
Eric Biggers (4):
      fscrypt: pass super_block to fscrypt_put_master_key_activeref()
      fscrypt: add comment for fscrypt_valid_enc_modes_v1()
      fscrypt: remove unused Speck definitions
      fscrypt: add additional documentation for SM4 support

Tianjia Zhang (2):
      blk-crypto: Add support for SM4-XTS blk crypto mode
      fscrypt: Add SM4 XTS/CTS symmetric algorithm support

 Documentation/filesystems/fscrypt.rst |  7 +++++++
 block/blk-crypto.c                    |  6 ++++++
 fs/crypto/fscrypt_private.h           | 13 ++++---------
 fs/crypto/keyring.c                   | 14 ++++++--------
 fs/crypto/keysetup.c                  | 17 ++++++++++++++++-
 fs/crypto/policy.c                    | 12 ++++++++++++
 include/linux/blk-crypto.h            |  1 +
 include/uapi/linux/fscrypt.h          |  4 ++--
 8 files changed, 54 insertions(+), 20 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
