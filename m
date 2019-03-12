Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADE8C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 15:14:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF402087C
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 15:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r361O2x8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF402087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZGmMplXXsF1mdLobNDVlOIDmeN0SD+zbS5O6rkuvCOM=; b=r361O2x8nrv/BT
	xZFaMTT1v7pVoal9a4bRizgDf0/O0ZlkHDS/KGG5eMiJ4em+u+MHfvrVz2zLkqeAry1DgZJ/KKQ+e
	LB3DFNsmNFZ5+A66GJ0bKJTzlkqSzkv28rt4h8GoeOg9PGWPxG0SfB/H9E78dPwpNPVkxJCnXBK3U
	qceSrlhJL3+SMq5TW1hjoA3IObbHQ/A5gLcFrvvckoERQESjkrLPtxcj3alJlQDsJq5qp8oZ6TbIJ
	pKTzApdmP1UCk8W/WWABMbQIoIC3ueDrFa5D6OPFxKcf6Xa1F+w5cAda00B4TTIks0djC0jdyZ76a
	j+eh0xNZMAGaVEmuo5/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3j6Z-0006kG-4S; Tue, 12 Mar 2019 15:14:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3j6T-0006fP-LO
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 15:14:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E00416091865;
 Tue, 12 Mar 2019 16:13:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id y9lNEVtk4dgl; Tue, 12 Mar 2019 16:13:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 92692609187B;
 Tue, 12 Mar 2019 16:13:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id koBhCvT6gr9b; Tue, 12 Mar 2019 16:13:54 +0100 (CET)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 596B66091865;
 Tue, 12 Mar 2019 16:13:54 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] UBI/UBIFS updates for 5.1-rc1
Date: Tue, 12 Mar 2019 16:13:53 +0100
Message-ID: <6283638.XALati16HY@blindfold>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_081405_849441_A7422BD6 
X-CRM114-Status: UNSURE (   8.11  )
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

The following changes since commit a3b22b9f11d9fbc48b0291ea92259a5a810e9438:

  Linux 5.0-rc7 (2019-02-17 18:46:40 -0800)

are available in the Git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-5.1-rc1

for you to fetch changes up to 5578e48e5c0bf4684e68ae08caa2293bfb3f5307:

  ubi: wl: Silence uninitialized variable warning (2019-03-05 21:21:07 +0100)

----------------------------------------------------------------
This pull request contains updates for both UBI and UBIFS:

- A new interface for UBI to deal better with read disturb
- Reject unsupported ioctl flags in UBIFS (xfstests found it)

----------------------------------------------------------------
Dan Carpenter (1):
      ubi: wl: Silence uninitialized variable warning

Hou Tao (1):
      ubifs: Reject unsupported ioctl flags explicitly

Richard Weinberger (2):
      ubi: Introduce in_pq()
      ubi: Expose the bitrot interface

 drivers/mtd/ubi/cdev.c      |  30 ++++++++
 drivers/mtd/ubi/ubi.h       |   1 +
 drivers/mtd/ubi/wl.c        | 174 ++++++++++++++++++++++++++++++++++++++++++--
 fs/ubifs/ioctl.c            |   8 ++
 include/uapi/mtd/ubi-user.h |   5 ++
 5 files changed, 211 insertions(+), 7 deletions(-)




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
