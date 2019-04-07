Return-Path: <SRS0=KvES=SJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989ECC10F0E
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2019 14:38:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67107213F2
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2019 14:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TVGmBa1V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67107213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WkDJca847p9ba722ff/PlgvGNfyTsbGW6P0ICdtmyYU=; b=TVGmBa1VEjbPQJ
	IsuzieUfpZsg1MtszrL64Ano+qefITMDogBd9EDEWK1ZLq375ACGlA/QMX1MGenIo0+H5oaKI9cjG
	1y0M++mP4mbC+UNF/gcGt8dZaIK/ET2ebo7iZ5l/RBRIAHDDhhJESkcZg4xGTeU+4Pggn5DgrqJ0w
	VNXw/F9qrfJ9grW1zARDqH6pfuGMQ122Bj35Ryjc01Zk4DAsQlCJfZz2ZOvp2R7nNCVqmX5wWa+6f
	A31SMpIbEccazsy06VILavWd4hYtlK2wToP17yUjk8cUAD/XrLOfNiNQlAbuW6+YuJz1huuy6tvy2
	Rdoq3Z4hlfhfI0a2q5/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hD8wZ-0005LO-7k; Sun, 07 Apr 2019 14:38:47 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hD8wT-0005Kd-MA
 for linux-mtd@lists.infradead.org; Sun, 07 Apr 2019 14:38:43 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C37D4608A3BD;
 Sun,  7 Apr 2019 16:38:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qpxB1NUzoaBF; Sun,  7 Apr 2019 16:38:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 642FD608A394;
 Sun,  7 Apr 2019 16:38:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Lyek5CjC7P0u; Sun,  7 Apr 2019 16:38:30 +0200 (CEST)
Received: from blindfold.localnet (unknown [195.149.217.187])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 0F3636089E22;
 Sun,  7 Apr 2019 16:38:29 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] MTD fixes for 5.1-rc4
Date: Sun, 07 Apr 2019 16:38:29 +0200
Message-ID: <8693488.C880lHxeKj@blindfold>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_073841_872939_3D4A3F60 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit 8c2ffd9174779014c3fe1f96d9dc3641d9175f00:

  Linux 5.1-rc2 (2019-03-24 14:02:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.1-rc4

for you to fetch changes up to d9b8a67b3b95a5c5aae6422b8113adc1c2485f2b:

  mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer (2019-04-05 00:39:19 +0200)

----------------------------------------------------------------
This pull request contains a single fix for MTD:

- Fix for a possible infinite loop in the cfi_cmdset_0002 driver

----------------------------------------------------------------
Liu Jian (1):
      mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
