Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C50C63682
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ivdf1sffnDH0AypHuWL4VGm3VCwUnYVX3gc8liQCWiA=; b=GaBsKXnWPVwK83
	1ol6ZNL6HHvEwe/nKC4/UkueApP1UbM3OO6fRFvflivnDIFwVNRgfB2FiTBOJ/uW7sc/q6/761QFu
	jcCYdayluFGc556gyV4l/J1Utxn97BNBy4s+DiHUo5WwRd3yibwdylxdCOB6+PKd2Al4fgvqtlS3I
	7wnQGPQzbQQJVaQ1FVZMw/iCQqEkoKCbN+TRoseYhlZ41dY8ntLZ10Eej5GE/qdw4Qn7EW3Vkit6O
	jOeYz5MeAPLHDjKo4DqAVXMUfW1E52PrY+01tfgSQuOlpJHSxC0kyxfYPR6jNGX4LwIMgi+9WFFyU
	oIGhLHkLPQ5a8gk662wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfue-00BKha-3x; Wed, 26 Jan 2022 10:52:28 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfuS-00BKfR-U9
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:52:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE10960012;
 Wed, 26 Jan 2022 10:52:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Decotigny <decot+git@google.com>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, David Decotigny <ddecotig@google.com>
Subject: Re: [PATCH RFC v3 1/1] mtd_blkdevs: avoid soft lockups with some
 mtd/spi devices
Date: Wed, 26 Jan 2022 11:52:14 +0100
Message-Id: <20220126105214.882348-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220126101120.676021-1-decot+git@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ca6263a0c9503d98b5aef04ed9b0f3971c66ec4e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_025217_142024_C73F57F5 
X-CRM114-Status: UNSURE (   9.70  )
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

On Wed, 2022-01-26 at 10:11:20 UTC, David Decotigny wrote:
> From: David Decotigny <ddecotig@google.com>
> 
> With some spi devices, the heavy cpu usage due to polling the spi
> registers may lead to netdev timeouts, RCU complaints, etc. This can
> be acute in the absence of CONFIG_PREEMPT. This patch allows to give
> enough breathing room to avoid those incorrectly detected netdev
> timeouts for example.
> 
> Example splat on 5.10.92:
> [  828.399306] rcu: INFO: rcu_sched self-detected stall on CPU
> ...
> [  828.419245] Task dump for CPU 1:
> [  828.422465] task:kworker/1:1H    state:R  running task on cpu   1   stack:    0 pid:   76 ppid:     2 flags:0x0000002a
> [  828.433132] Workqueue: kblockd blk_mq_run_work_fn
> [  828.437820] Call trace:
> ...
> [  828.512267]  spi_mem_exec_op+0x4d0/0xde0
> [  828.516184]  spi_mem_dirmap_read+0x180/0x39c
> [  828.520443]  spi_nor_read_data+0x428/0x7e8
> [  828.524523]  spi_nor_read+0x154/0x214
> [  828.528172]  mtd_read_oob+0x440/0x714
> [  828.531815]  mtd_read+0xac/0x120
> [  828.535030]  mtdblock_readsect+0x178/0x230
> [  828.539102]  mtd_blktrans_work+0x9fc/0xf28
> [  828.543177]  mtd_queue_rq+0x1ac/0x2e4
> [  828.546827]  blk_mq_dispatch_rq_list+0x2cc/0xa44
> [  828.551419]  blk_mq_do_dispatch_sched+0xb0/0x7cc
> [  828.556010]  __blk_mq_sched_dispatch_requests+0x350/0x494
> [  828.561372]  blk_mq_sched_dispatch_requests+0xac/0xe4
> [  828.566387]  __blk_mq_run_hw_queue+0x130/0x254
> [  828.570806]  blk_mq_run_work_fn+0x50/0x60
> [  828.574814]  process_one_work+0x578/0xf1c
> [  828.578814]  worker_thread+0x5dc/0xea0
> [  828.582547]  kthread+0x270/0x2d4
> [  828.585765]  ret_from_fork+0x10/0x30
> 
> 
> Signed-off-by: David Decotigny <ddecotig@google.com>
> Reviewed-by: Richard Weinberger <richard@nod.at>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
