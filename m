Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EC3C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204EE23B06
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 21:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204EE23B06
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D4KgcDgkny0oSgBqv6surhe86thz6664GadQZh71CkU=; b=xkgYYmczFnRt1TIBCsTAY9eJaZ
	hgX7I3ELu/2o88W4IGzuta9IDXoHRN88hNx9s16SDhei5u20HLeQibcCNONYhpZVuqMtjFKQio7e5
	yPBVotGWxkRY/xxLA/IhpNN7/n08TWRWYRs5Lmi77mqxggmsxE1/5lQ8ebllyDuiTkw8rckqVPZQA
	fFX895OBvYnVa1EItpPK1R2CCT/aszyYSx7mo4EJgxnIfPtdVDaY2353aZ7Z4dNFfUClg/vFUvaNa
	Wmai8wGtiSohj0gMaeWNuKSf9Poqf8Qo8NWJu/IUJIs6bKLhZH/i0gb0Cbg7DLQQUfv3RbOtPL5k4
	rKZQq2Pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l33tD-0002DQ-Cz; Fri, 22 Jan 2021 21:22:43 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l33t9-0002Bq-M4
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 21:22:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id A6841181CBE0B;
 Fri, 22 Jan 2021 22:22:34 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id U7_5uXhhwWfP; Fri, 22 Jan 2021 22:22:34 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CjUuVJcO2lYb; Fri, 22 Jan 2021 22:22:34 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] Assorted UBIFS fixes
Date: Fri, 22 Jan 2021 22:22:25 +0100
Message-Id: <20210122212229.17072-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_162240_104533_B736D974 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, david@sigma-star.at, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I'm currently hunting down a filesystem corruption, while reviewing
various parts of UBIFS I've found some other bugs.
This patches fix these bugs. In another series I'll add a feature to
be able to remove stale fscrypt contexts and wrong directory size counters.

Richard Weinberger (4):
  ubifs: Correctly set inode size in ubifs_link()
  ubifs: Don't add fscrypt context to xattrs
  ubifs: Update directory size when creating whiteouts
  ubifs: Harden ubifs_jnl_write_inode()

 fs/ubifs/dir.c     | 31 ++++++++++++++++++++-----------
 fs/ubifs/journal.c |  6 +++++-
 fs/ubifs/ubifs.h   |  2 +-
 fs/ubifs/xattr.c   |  2 +-
 4 files changed, 27 insertions(+), 14 deletions(-)

-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
