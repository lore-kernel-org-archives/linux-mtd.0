Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71BAE784AF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U3QM75S0UKVPF5VauyUznGYmKb442c6veYNkomiFP2Q=; b=IooASDBNfG0c9w
	87rKQpcmEWX5REoe5OLApiXpHdkyPuN87P/6G6zUAiAGKiIY5Fy4qLK1iwu74LIgWSi5+5N2h6QNx
	LWLTtbERpSJhiEGkFYlqxmBHZeVQNy/FC3shupJMLcrvDWr37UDG+pOSYByYH8tJLPbt/K/QdxamA
	CUyWMBs2YJRcBqo/TStDwcAoy+QhCUZzD5gbECiTHxLHl1NMbWYrBiGvwDBdnXg7mzSJvKKl9P3JK
	qIZzv/x/o5EB6056jgRXSuGzWW27kLqMF+2+2Yt70aPy1OdBUsNxr/jyfajWlD00ZRB6BP63w7knZ
	s5RND6/fnO2DjpDBmpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGZU-00CUsl-2H;
	Mon, 02 Oct 2023 10:54:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGZS-00CUsM-19
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 10:54:39 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C25246340E0F;
	Mon,  2 Oct 2023 12:54:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id auzUsoEp9ASw; Mon,  2 Oct 2023 12:54:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 767576340E0E;
	Mon,  2 Oct 2023 12:54:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K09owi8AKj8W; Mon,  2 Oct 2023 12:54:36 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 590156340DEB;
	Mon,  2 Oct 2023 12:54:36 +0200 (CEST)
Date: Mon, 2 Oct 2023 12:54:36 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <764987343.25592.1696244076263.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI fixes for v6.6-rc5
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: 7nU+P4NwjJl3FRuYxfDJrq7PNmNoIw==
Thread-Topic: UBI fixes for v6.6-rc5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_035438_544067_6909ABAE 
X-CRM114-Status: UNSURE (   4.00  )
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

Linus,

The following changes since commit 4a0fc73da97efd23a383ca839e6fe86410268f6b:

  Merge tag 's390-6.6-2' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux (2023-09-07 10:52:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.6-rc5

for you to fetch changes up to 017c73a34a661a861712f7cc1393a123e5b2208c:

  ubi: Refuse attaching if mtd's erasesize is 0 (2023-09-07 21:59:04 +0200)

----------------------------------------------------------------
This pull request contains the following fix for UBI:

- Don't try to attach MTDs with erase block size 0

----------------------------------------------------------------
Zhihao Cheng (1):
      ubi: Refuse attaching if mtd's erasesize is 0

 drivers/mtd/ubi/build.c | 7 +++++++
 1 file changed, 7 insertions(+)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
