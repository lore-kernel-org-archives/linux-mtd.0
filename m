Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F73C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 10:20:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F75261BAA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 10:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F75261BAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DaAvZ/5+2RmuN7nmcxeZmq5O+mhehCCrirMUmDQm7o=; b=TtgTEyrgxnUM9X
	TWdi5EHHs/CQBiJMFetyp9bEHjiriWqvt6By3ZHOmOWh1AHCm2Psrv8H2gKrYLeZ664//6MYc8QZ3
	AYIVp0l3/xaysQLb8ve4Gkb/Wpnx3P39teTuN8VNqOLqJzG7rSYJ6s5ouqSucWC/IU+spkfhA2/0M
	g+I8cfwDySM23r6bxtzG8SVEJr6s7lbAKgPeRw+bNhUt5kveZtvSbGhg61WWQvHYGhgjcLsZA5Gea
	bDGswNoKTKcmkxMr4OPRty7L0H1jr2+3nDmZAG9PfjcAmKSFvyfrMHhLOp1F9ik4zDwyzeQdwIqPr
	uOO2rqFoTqH3ev876ThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnI2k-004QFB-BN; Wed, 17 Nov 2021 10:19:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnI2h-004QEP-Gj
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 10:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637144390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iKe2mE7c3MFaKZJJkx5RnwvPm+0OFhFwmWEBATWZjlU=;
 b=L8MOk3DOaG1Mdygeyugerwfe2ULJB/+MKv+iWD50ozyXPrLZwmP75d0b9R9kf1TuG8Vq99
 sTSYN88z5aXjuaYc96HBvCCXwrbax6y5KL0p9dlXO9bwc78kBm9FlFPi06UPdV20KS/0So
 erZ+lXoUVrpfd3sY8xcNtZVA3OsH9po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-HLZTN7yAO6WuHuzwrqJWWw-1; Wed, 17 Nov 2021 05:19:46 -0500
X-MC-Unique: HLZTN7yAO6WuHuzwrqJWWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5C901023F4E;
 Wed, 17 Nov 2021 10:19:44 +0000 (UTC)
Received: from T590 (ovpn-8-24.pek2.redhat.com [10.72.8.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7025E19E7E;
 Wed, 17 Nov 2021 10:19:33 +0000 (UTC)
Date: Wed, 17 Nov 2021 18:19:29 +0800
From: Ming Lei <ming.lei@redhat.com>
To: yangerkun <yangerkun@huawei.com>
Cc: damien.lemoal@wdc.com, axboe@kernel.dk, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, yi.zhang@huawei.com,
 yebin10@huawei.com, houtao1@huawei.com, ming.lei@redhat.com
Subject: Re: [QUESTION] blk_mq_freeze_queue in elevator_init_mq
Message-ID: <YZTXMZRxvb5Orsdo@T590>
References: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
 <YZS4FYxtxYAXjtFJ@T590>
 <d9ca8e57-55b8-96f8-e5fd-6103c8b1fa4b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9ca8e57-55b8-96f8-e5fd-6103c8b1fa4b@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_021951_652886_1A0D48D2 
X-CRM114-Status: GOOD (  15.90  )
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

On Wed, Nov 17, 2021 at 05:00:22PM +0800, yangerkun wrote:
> 
> 
> On 2021/11/17 16:06, Ming Lei wrote:
> > On Wed, Nov 17, 2021 at 11:37:13AM +0800, yangerkun wrote:
> > > Nowdays we meet the boot regression while enable lots of mtdblock
> > 
> > What is your boot regression? Any dmesg log?
> 
> The result is that when boot with 5.10 kernel compare with 4.4, 5.10
> will consume about 1.6s more...

OK, I understand the issue now, and please try the attached patch
which depends on the following one:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=block-5.16&id=2a19b28f7929866e1cec92a3619f4de9f2d20005


diff --git a/block/elevator.c b/block/elevator.c
index 1f39f6e8ebb9..19a78d5516ba 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -694,12 +694,18 @@ void elevator_init_mq(struct request_queue *q)
 	if (!e)
 		return;
 
+	/*
+	 * We are called before adding disk, when there isn't any FS I/O,
+	 * so freezing queue plus canceling dispatch work is enough to
+	 * drain any dispatch activities originated from passthrough
+	 * requests, then no need to quiesce queue which may add long boot
+	 * latency, especially when lots of disks are involved.
+	 */
 	blk_mq_freeze_queue(q);
-	blk_mq_quiesce_queue(q);
+	blk_mq_cancel_work_sync(q);
 
 	err = blk_mq_init_sched(q, e);
 
-	blk_mq_unquiesce_queue(q);
 	blk_mq_unfreeze_queue(q);
 
 	if (err) {



thanks,
Ming


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
