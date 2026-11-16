Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE3B606A31C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 09:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oy2INsaE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2+7tRLz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hDKImRJOwH185GxJNWFWNrU4Q0a8ZaHVwXHn5TTuwU0=; b=oy2INsaEb8UbTlwWx+ohgTcEUv
	e79xdwYKkiDugy+mqbgZJqCcK0MSQLbOgmsrLx1fY1ZwbK8pcLltdlp+zM9cEzcdjKdItHQGcouky
	PYT4yuFDlWopG6uxmwTNfSS9uw6qkVxxwO748OvsoY6neFol3LraotUE2aV1z3APZgrOj2pcVwMQ2
	qGMUCVI8zRQ2TYlKr/QKnGCc7QYHpMYo3tv13QVCEj6k/KGFvrx8ND9r27jloaepu3vMb7ZYjgiKj
	IAL0xBfhjwdVXYCC0b0i5Cy6K33rpe4bE03UMJZ1od5uQfSr0kxl5bRw6AC7cD6op8uBNKyZN2Ujz
	I7e3Bquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStMd-00000001pxG-2ze2;
	Mon, 16 Nov 2026 09:51:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStMc-00000001px8-2eMW
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 09:51:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A26C4133F;
	Mon, 16 Nov 2026 09:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609D61F000C4;
	Mon, 16 Nov 2026 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794822662;
	bh=8aRGBcpvx8xM7mxQtHaidBWPdNvahzYjZNEX0jkJ1yE=;
	h=From:Subject:Date:To:Cc;
	b=K2+7tRLzUA1vHpSh9Z4eYxrLSWLfx3VxiAtV+I2wsfPNb9ufsZBXDAGRXgVgW5eVT
	 7EPd2127puPa6m8jR0gUbbLngHeCTt0SNmH9jNftFfvciTpnZOwt9ZFB8xaifyNx5I
	 6T4/eGhfCJ4f1ugyPqE8JW8/pgNBj81vq/a0P4QMlvX9rDmpcnRbSLEfn3OZwjS09o
	 Ffj8QthI/KmMMkRMsxQrY2bpnNRJNH0bSetX/pu6Ptvz0r4Eeu9O8UNelZBCix0Dko
	 77WqR1fbWuPXsEef+M7YM+E7QUpfT9xgzJUFuXdxSrgNBt3AgthI6/SanCUbgR5X4y
	 DYCuvs09giVyg==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH 0/3] fs: pre-existing fixes for the SB_RDONLY series
Date: Mon, 16 Nov 2026 10:28:29 +0100
Message-Id: <20261116-work-fs-sb_rdonly-fixes-v1-0-95a25ce917ad@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2M2QrCMBBFf6XMsxOaoK36KyKSZWKjksqMK6X/b
 qLg47nLmUCIEwlsmwmYHknSmAvoRQN+sPlImEJhMK3ptNYdPkc+YxQUd+Aw5ssbY3qRYOiXfmP
 6uG7dCsr7yvQtynm3/7Hc3Yn8rerqwlkhdGyzH2pUxSqK+otVHcA8fwDm31WGpAAAAA==
X-Change-ID: 20261116-work-fs-sb_rdonly-fixes-d74c927f80b5
To: linux-fsdevel@vger.kernel.org
Cc: Jan Kara <jack@suse.com>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=brauner@kernel.org;
 h=from:subject:message-id; bh=jeCsQzF34oL0Arvs8F9B2uJQSCX+EzbT3qRU+Rbsju8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWT9uvi7fE9w7bmpcv5J82/1za9S4FUrcTJtdFY06i+ct
 14hJSyuo5SFQYyLQVZMkcWh3SRcbjlPxWajTA2YOaxMIEMYuDgFYCLiSxn+p61423H1yuqphyNy
 CypNQ07uYf2rs/yuFLtD9f/+bZMLtzEyTOL9teBm7yq3mqbpzbY+BsIR898sTkj0CjXjaTy2tLW
 IFQA=
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

Three fixes for pre-existing bugs that came up during review of the
SB_RDONLY series (cf. [1]). They don't depend on it and are all tagged
for stable. I'll put them in front of the series in vfs-7.5.super.

- gfs2 hits the BUG_ON() in gfs2_quota_cleanup() on a remount to
  read-only after a withdraw during mount. The withdraw work was never
  queued so SDF_JOURNAL_LIVE stays set.

- exfat marks the volume clean at umount or on a remount to read-only
  after a shutdown with EXFAT_GOING_DOWN_NOSYNC although it may be
  inconsistent.

- jfs takes a negative inode size from disk as is. A symlink with one
  is treated as a fast symlink and jfs_iget() writes out of bounds.

[1]: https://patch.msgid.link/20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (3):
      gfs2: don't BUG when remounting read-only after a withdraw during mount
      exfat: keep the volume marked dirty after a shutdown
      jfs: refuse inodes with a negative size

 fs/exfat/super.c     | 3 ++-
 fs/gfs2/incore.h     | 1 +
 fs/gfs2/ops_fstype.c | 5 +++++
 fs/gfs2/util.c       | 9 ++++++++-
 fs/gfs2/util.h       | 1 +
 fs/jfs/jfs_imap.c    | 4 ++++
 6 files changed, 21 insertions(+), 2 deletions(-)
---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261116-work-fs-sb_rdonly-fixes-d74c927f80b5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
