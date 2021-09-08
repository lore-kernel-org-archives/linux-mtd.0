Return-Path: <SRS0=xoN1=N6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59770C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 21:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 267C161102
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 21:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 267C161102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9kwApA1bqkwXCxrFg+kwwxOUhsUJ3roah9DtE7cYCcY=; b=g73pnQLQreW/6/
	XZ88raGX4ln+iFs4gsMLyzvrwhddzX7Vzq2CorVW15iyto8eIddxq80iL16lNcZKu96h+mtX1zRFU
	jI3V+zWH3WP9IHDE1S72p/CRZxLZx/zzXX9XrmZWV6KGwo6M6vJiXt2qdUvpQKkvLNEznCTu4qizN
	nlFyzNqjImvuo0ct3R3Tu5hdUkPJsDh0RYKywOHW+pGNyJLwoW6vnlFNwFXm/+ETVhZGsoVrUW2Bn
	MnL/UWkUcO6/rvqw0ouik7HsP8H3+euUmQmSiEVx33mrPZf8DHwAWnhiB1BJnro9tKpnPGWHRxd9P
	yST0YNI6TRUZg+Buzfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO5Tg-007dxp-3W; Wed, 08 Sep 2021 21:51:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO5Td-007dwD-U0
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 21:51:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F27A610FF;
 Wed,  8 Sep 2021 21:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631137888;
 bh=AXEwcqG3tA0z2Pq2CtpORf9Ep9Dl9pqblNnUmHoDhjQ=;
 h=From:To:Cc:Subject:Date:From;
 b=fdmiZxK8ekMOjOCM6rBVyxzrcFHIcCLOdVoQ3mAnT+m5ceEppiXu/2lrEa7c8RzD2
 hNqe+pQBotx+3L9wWQxIzYJRsllAaqTEV5EzpYVjQ0uQ2WIbO5SA0rrkAEJHVOfhx7
 VKQAO5/mqnwHzMUplqvyMrtTOWdjukY29mBNQGzzTohu9hceIQe/zjqU1T+flZcaDQ
 uAAZudkSVSmLk3BKHCyRxn087bIKIK3HtpXoAUWmIUxqQEeD8YhoPpcEaWwBK4nE34
 aB+XN81vV7v+p2u3DuKwIKvv5pLsGislHlkZ7JkrYF3KTaI0pnjtYKTxi+CX35RV92
 lIss4pNBPmkpg==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] backport fscrypt symlink fixes to 4.19
Date: Wed,  8 Sep 2021 14:50:29 -0700
Message-Id: <20210908215033.1122580-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_145130_028624_728C286A 
X-CRM114-Status: UNSURE (   6.62  )
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

This series backports some patches that failed to apply to 4.19-stable
due to the prototype of inode_operations::getattr having changed in
v5.12, as well as several other conflicts.  Please apply to 4.19-stable.

Eric Biggers (4):
  fscrypt: add fscrypt_symlink_getattr() for computing st_size
  ext4: report correct st_size for encrypted symlinks
  f2fs: report correct st_size for encrypted symlinks
  ubifs: report correct st_size for encrypted symlinks

 fs/crypto/hooks.c               | 44 +++++++++++++++++++++++++++++++++
 fs/ext4/symlink.c               | 11 ++++++++-
 fs/f2fs/namei.c                 | 11 ++++++++-
 fs/ubifs/file.c                 | 12 ++++++++-
 include/linux/fscrypt_notsupp.h |  6 +++++
 include/linux/fscrypt_supp.h    |  1 +
 6 files changed, 82 insertions(+), 3 deletions(-)

-- 
2.33.0.153.gba50c8fa24-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
