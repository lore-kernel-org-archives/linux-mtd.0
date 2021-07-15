Return-Path: <SRS0=WX7q=MH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7404C636C9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:55:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFC21613AF
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFC21613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwTwdxnwzXlTknmSOQ9VE9sNDShvRHd98qbh2w5spLU=; b=UC8D6/xcXN7peV
	wJetRiqF1qHXJ7CCJCK7UWu77NwSqxn/RVKLPNTKIjAm4BMHESCxEyyJdPMY/GTzQqAm9BNX1w9Kp
	NueQf8gJDPtuzrQOMCglLsgyc+rokeaGUhiTNGOd9C73vPkHc0bYYzur/v81x1ckzZx+TGjZsAOr8
	z+JhLd/rnqWlb2ZDK38byytx3CoewZBxWKKXZXfw6Su4Lc3PS5G233WgZ1Rmr7MaaUgg8+7vEB7Eb
	+Dg/bpol7CDX+VLSp+INcye3uLC/s31HQ86GZK1sR/mNn2e8amSsY5+sd02oHxWDH5AM7TeFGIIEZ
	vv4uoGmgBaAw8g6fSHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4AFj-002Zi6-07; Thu, 15 Jul 2021 22:54:47 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4ABx-002YVt-2o
 for linux-mtd@lists.infradead.org; Thu, 15 Jul 2021 22:50:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CBB8E1C0002;
 Thu, 15 Jul 2021 22:50:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yukuai3@huawei.com
Subject: Re: [PATCH v2] mtd: mtd_blkdevs: Initialize
 rq.limits.discard_granularity
Date: Fri, 16 Jul 2021 00:50:49 +0200
Message-Id: <20210715225049.66252-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210615093905.3473709-1-chengzhihao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2b6d2833cd1d8a43a837a45da65860ef086443dc'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_155053_358737_B1955756 
X-CRM114-Status: UNSURE (   6.98  )
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

On Tue, 2021-06-15 at 09:39:05 UTC, Zhihao Cheng wrote:
> Since commit b35fd7422c2f8("block: check queue's limits.discard_granularity
> in __blkdev_issue_discard()") checks rq.limits.discard_granularity in
> __blkdev_issue_discard(), we may get following warnings on formatted ftl:
> 
>   WARNING: CPU: 2 PID: 7313 at block/blk-lib.c:51
>   __blkdev_issue_discard+0x2a7/0x390
> 
> Reproducer:
>   1. ftl_format /dev/mtd0
>   2. modprobe ftl
>   3. mkfs.vfat /dev/ftla
>   4. mount -odiscard /dev/ftla temp
>   5. dd if=/dev/zero of=temp/tst bs=1M count=10 oflag=direct
>   6. dd if=/dev/zero of=temp/tst bs=1M count=10 oflag=direct
> 
> Fix it by initializing rq.limits.discard_granularity if device supports
> discard operation.
> 
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
