Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8A9C432BE
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:46:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0171A61167
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0171A61167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDoI0KxFZIip0qfSETSTcJJ3rBvP1JXAfqCObX+6pPc=; b=tUZyRkCRYpbJCY
	0tKdni98VnCaaweqO2Wb0ttbQ7GA+fiPA0bs78+3sW/FRduUbs9dlwpxtNFJ4ayVA2ZpmWy4WWG0y
	xYDcmAa0ZH5C7B55DCI9wqNPpyLci0b2voCSmAq/1ju5pRCkMUQFfSo1foiy4xpGn6Vj2JRkXTCgR
	g1SpE8bxoNySs2vh3x5D5qua5uu00C3zki+mIGhU7a58rIkt6hays3pbz5NkFWpJF2z30Z3/wATk6
	RtH/trhkAAVVwXU4Lu+ObGiySzICK22htQ52uVbDfw8RnJGm8Vmlw/p4cE9r5gzi/ZXatwedtyF2J
	VFxDQ+D3TbSCXsGHv3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC5nH-00DLzS-Mt; Fri, 06 Aug 2021 19:46:11 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC5n7-00DLxV-70
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 19:46:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 52BBA1BF203;
 Fri,  6 Aug 2021 19:45:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH] mtd: fix lock hierarchy in deregister_mtd_blktrans
Date: Fri,  6 Aug 2021 21:45:56 +0200
Message-Id: <20210806194556.392389-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210717100719.728829-1-desmondcheongzx@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b7abb051682263e51866bc78762fd0083d64c5ed'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_124601_430716_DCE7C429 
X-CRM114-Status: UNSURE (   7.90  )
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

On Sat, 2021-07-17 at 10:07:19 UTC, Desmond Cheong Zhi Xi wrote:
> There is a lock hierarchy of major_names_lock --> mtd_table_mutex. One
> existing chain is as follows:
> 
> 1. major_names_lock --> loop_ctl_mutex (when blk_request_module calls
> loop_probe)
> 
> 2. loop_ctl_mutex --> bdev->bd_mutex (when loop_control_ioctl calls
> loop_remove, which then calls del_gendisk)
> 
> 3. bdev->bd_mutex --> mtd_table_mutex (when blkdev_get_by_dev calls
> __blkdev_get, which then calls blktrans_open)
> 
> Since unregister_blkdev grabs the major_names_lock, we need to call it
> outside the critical section for mtd_table_mutex, otherwise we invert
> the lock hierarchy.
> 
> Reported-by: Hillf Danton <hdanton@sina.com>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
