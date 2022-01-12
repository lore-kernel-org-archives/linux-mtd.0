Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1C9C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jan 2022 18:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2dRk7ZhJiP6Bhrlxl5lb3xXxs41pa4rsce54Pq79S3o=; b=GOvZFEyKMv7ZK7
	QlOzOcxd/JxzXwgIklVFhy94A1sxvPWTWTTTtfRMiwML64+W+6NKJPB42ZyTanUS2BNpGb1hI4zUD
	DXrN1nMMCTZyFsiVe/MZnM/tJrmjy25FSEJ3gwEsnEiKIKoLTNf4gEdnHxPVjzzvFX1PCfXR04O1t
	4uoJTOWV/WA3Bmwo00tvOW3Z/eELCiam4gZouNcNXyQgoo7DV4cKilOuVpNK1rr2HyfC+Ih5i2yQr
	WQPoUXDbPF0Qvu2p7mtklnSmUzj2P0cxUN4yEZne3trmRfc+SXU4YgntzOcTVD+A8qUCaIseQ88Yc
	WUhM4nDVv635s6EyXbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7iGj-003SAj-I5; Wed, 12 Jan 2022 18:22:45 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1n7iGe-003S9a-QI
 for linux-mtd@lists.infradead.org; Wed, 12 Jan 2022 18:22:43 +0000
Received: by smtp.gentoo.org (Postfix, from userid 559)
 id 24CBF3430A5; Wed, 12 Jan 2022 18:22:38 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils] fix test bashism
Date: Wed, 12 Jan 2022 13:22:34 -0500
Message-Id: <20220112182234.13231-1-vapier@gentoo.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_102240_897259_4172650E 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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

From: Mike Frysinger <vapier@chromium.org>

Using == with `test` is a bashism.  POSIX shell only supports =.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 configure.ac | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index 262b69e85e15..93d97026dabd 100644
--- a/configure.ac
+++ b/configure.ac
@@ -341,9 +341,9 @@ fi
 AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"])
 AM_CONDITIONAL([WITHOUT_ZSTD], [test "x$need_zstd" != "xyes"])
 AM_CONDITIONAL([WITHOUT_XATTR], [test "x$need_xattr" != "xyes"])
-AM_CONDITIONAL([WITH_SELINUX], [test "x$need_selinux" == "xyes"])
-AM_CONDITIONAL([WITH_CRYPTO], [test "x$need_openssl" == "xyes"])
-AM_CONDITIONAL([WITH_GETRANDOM], [test "x$need_getrandom" == "xyes"])
+AM_CONDITIONAL([WITH_SELINUX], [test "x$need_selinux" = "xyes"])
+AM_CONDITIONAL([WITH_CRYPTO], [test "x$need_openssl" = "xyes"])
+AM_CONDITIONAL([WITH_GETRANDOM], [test "x$need_getrandom" = "xyes"])
 
 AC_CHECK_SIZEOF([off_t])
 AC_CHECK_SIZEOF([loff_t])
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
