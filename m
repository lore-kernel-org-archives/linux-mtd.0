Return-Path: <SRS0=WX7q=MH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7100AC636C9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F42B613AF
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F42B613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ml8z2RmqQ6q1fUWi+GRgW5rycGXpRo3yufSuFmRsuhc=; b=LQ/syVmTEnBQad
	yZh1sbR6A/cxehLkK7g31oWjc8IgUg9lTPCepxEYXZCpwNID25Z1xb08ErkxgsY/+NsMCvpjOOqy0
	ZF+A5afIm3wNV2bKSAgIeq9fRQsPR5aT9SqQEnFc5DfzRMbbF/x3JcCHdyj4z/tQj8Qi54mfFoFr5
	GVis61Hs4rRHfgdeY+x4yZsupI+CvUlNtAebrdR6e308G2PmOSmx/9S1+IoUpEwyh4PZI/hU15JUH
	N80KTQHl34FL3VT1clk7DLqsvrjfKbtly4x4uOO6HqF6KAVtUywWvs2MH9rVZdmP7STLg7XfgRWov
	Fj3cbdVZdU2GTwAW9tfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4AE8-002ZGD-0J; Thu, 15 Jul 2021 22:53:08 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4ABn-002YRu-P5
 for linux-mtd@lists.infradead.org; Thu, 15 Jul 2021 22:50:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 79FB21BF208;
 Thu, 15 Jul 2021 22:50:40 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] mtd: break circular locks in register_mtd_blktrans
Date: Fri, 16 Jul 2021 00:50:40 +0200
Message-Id: <20210715225040.66117-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210617160904.570111-1-desmondcheongzx@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'962bf783ef65d15b0f8ca9c33342cf3b20bf0d2e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_155044_056260_713C6A80 
X-CRM114-Status: UNSURE (   9.98  )
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

On Thu, 2021-06-17 at 16:09:04 UTC, Desmond Cheong Zhi Xi wrote:
> Syzbot reported a circular locking dependency:
> https://syzkaller.appspot.com/bug?id=7bd106c28e846d1023d4ca915718b1a0905444cb
> 
> This happens because of the following lock dependencies:
> 
> 1. loop_ctl_mutex -> bdev->bd_mutex (when loop_control_ioctl calls
> loop_remove, which then calls del_gendisk; this also happens in
> loop_exit which eventually calls loop_remove)
> 
> 2. bdev->bd_mutex -> mtd_table_mutex (when blkdev_get_by_dev calls
> __blkdev_get, which then calls blktrans_open)
> 
> 3. mtd_table_mutex -> major_names_lock (when register_mtd_blktrans
> calls __register_blkdev)
> 
> 4. major_names_lock -> loop_ctl_mutex (when blk_request_module calls
> loop_probe)
> 
> Hence there's an overall dependency of:
> 
> loop_ctl_mutex   ----------> bdev->bd_mutex
>       ^                            |
>       |                            |
>       |                            v
> major_names_lock <---------  mtd_table_mutex
> 
> We can break this circular dependency by holding mtd_table_mutex only
> for the required critical section in register_mtd_blktrans. This
> avoids the mtd_table_mutex -> major_names_lock dependency.
> 
> Reported-and-tested-by: syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com
> Co-developed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
