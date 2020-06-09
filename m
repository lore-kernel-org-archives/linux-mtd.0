Return-Path: <SRS0=GuhJ=7W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FB5C433E1
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 21:02:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 576FB20734
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 21:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dcmb03Yt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 576FB20734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t+reMsW5BN0UIGauja1tirLCw2j8CfvCDyLgoRDBj40=; b=dcmb03Yt5hA5YQ
	sXFd/oLPC1eo8uaaIdb2m6H3HefmBFHrzuobk2yXMWn+7AH0IEu1y4itJ3a70u6Pa/0+mBs/eDF6F
	TM60LktXgyP+m99dSlr+V0S/mkKnj9da9O3sfgV6b54w29bjTCJzh8p2GzAbf0Wi6+3TfhSBWwQx5
	eTTuWn3A0vSCPaYt2LTNxFHAqWAnokac+3UAfSIt9IfqmhxazkkA8NCc4I426WBrt6kneDGtlieh/
	nCo/1WjAG/HHXWc0EIuEqWeQsqAZeHkIHj2wZ1OYSfQauGB4FJKHJ2j4uggimHRXxmmhSOml0b2Nm
	MSt6obwM9oWUP1bRqP/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jilNj-00032x-PG; Tue, 09 Jun 2020 21:02:03 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jilNg-00032W-Bv
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2020 21:02:01 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 316CA607400D;
 Tue,  9 Jun 2020 23:01:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4bIAtOZviiwE; Tue,  9 Jun 2020 23:01:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D2FB16074010;
 Tue,  9 Jun 2020 23:01:58 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jQ3-NoYnJRix; Tue,  9 Jun 2020 23:01:58 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id BAA0B607400D;
 Tue,  9 Jun 2020 23:01:58 +0200 (CEST)
Date: Tue, 9 Jun 2020 23:01:58 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <818706511.351.1591736518682.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI changes for v5.8
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Index: elUTXxzBgxSDBQp23tI4ZRWGqBhMNg==
Thread-Topic: UBI changes for v5.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_140200_550676_46B47A98 
X-CRM114-Status: UNSURE (   5.76  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162:

  Linux 5.7 (2020-05-31 16:49:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.8-rc1

for you to fetch changes up to 4b68bf9a69d22dd512d61d5f0ba01b065b01ede6:

  ubi: Select fastmap anchor PEBs considering wear level rules (2020-06-02 22:53:05 +0200)

----------------------------------------------------------------
This pull request contains a single change for UBI:

- Select fastmap anchor PEBs considering wear level rules

----------------------------------------------------------------
Arne Edholm (1):
      ubi: Select fastmap anchor PEBs considering wear level rules

 drivers/mtd/ubi/fastmap-wl.c | 39 ++++++++++++++++++++++++---------------
 drivers/mtd/ubi/fastmap.c    | 11 +++++++++++
 drivers/mtd/ubi/ubi.h        |  4 +++-
 drivers/mtd/ubi/wl.c         | 28 +++++++++++++++++++---------
 4 files changed, 57 insertions(+), 25 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
