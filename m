Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFD3C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E53F22137B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="icozxuQF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HL27V+NY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E53F22137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ujin/F6mHGxvcL2DfqcHmQ31LCWaWP2YF5rSWSxALBs=; b=icozxuQFit0jl97TVa1ve065SP
	nhVH5/rvGjvwhj8wAmLsYLepI2sNR2S1IGCow/xPD+JVsAhS+sDttx4iheFMxYCGSaVe1H3HbwSKg
	Cb6L5rscpiuiTKZq2VM1Fw5yawNimoPFEXmSPmDob7vcPY8QEF5o2RqM6G08c+Yq6hX6XGgdaTQC9
	8C6mleV4QrxzdVB3W8rJ0x/7N0L0/QK3sJazaRYsm5T79mU+3oil6I7b1GGqUvBe92SQ4S1pXAucE
	KTUQcgRTVlOlJ19hl1eXloDG8TKcSlt/wqp1apr8DliUlzPDvPRvLc78KN2w+RI5eSJoGfPfI+jnF
	Hjw5BGDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uUy-0005HS-KR; Thu, 05 Sep 2019 16:20:40 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSe-00016P-2b
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:17 +0000
Received: by mail-pl1-x642.google.com with SMTP id 4so1515712pld.10
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8QjjqDFW2as8gsE3MNwHPLPN76USmssxyGkKOBC9D3E=;
 b=HL27V+NYul1f+O0bmc6YkYSMF5euNDbYJl3hh04CdtFtjxmvNCYdhhn4rVKZ4mtbnC
 haoz4ZuRykOa1EVcbKBLOnulQom5g/1qMM4K3pUJqI9gyl8+8M7gUP3hdV27jiyNhaLP
 o/VZfks/pnLsAsEemsNEwt2UAy9aH5QMHPRsXyteaLVX8yuXtIU8Q7J3Kt0GHRGIjeu+
 6uqwAVSO0rrjztAQNUcFDtt/AS9X6aQBAlsAr+yR2VeRxvHvm5f4PTxaab1YLr0ySVHa
 WGR7mnvK9yLWmfNAcVoLZFMGqTS8ZaLoVAcycwWbcXSXF16pUzOt3ohlbzYqLRrORRPt
 DjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8QjjqDFW2as8gsE3MNwHPLPN76USmssxyGkKOBC9D3E=;
 b=Z4Hv3MRtmPkM4VWYG0KvsuWQmOv7H7RldwTB1T5GDdmOmHOz8hoT3NKzAXQki54BLs
 LFeyM58yLOTXLw1cp58L6uQBfJk0V/HC3eBX5N9SsujlIaGIZwykMojhtmfxyAH1m1Lt
 N5vzhBoqclk94moWNSFzbY9SJ/qA6h2juwTxvpK65l3F1+wCgzfpv3pSbqOmtGYbIp7J
 DUp3vWaZBwtVA3uv9LZ5zjMfnYRb3wFcTpTM6Nb+ilt6aXRhT3RxhpRWr/4W+L4ElE18
 WopB3w3Mwd8PzsI3Dm8iWlDXLsM/Z2Zo63ke2shrLCN+BgeE4VZbxOLJ4/xqJ47SBoV9
 JPXw==
X-Gm-Message-State: APjAAAXqpOyg+f4F2ou0C6Zud/+uXfS8DilAuGISt/XlTcYaC22BwJ0m
 io+qtsrH0YXVIhqK+w9h7nqUUg==
X-Google-Smtp-Source: APXvYqyin58dfoGmkrcR+0oj6G4rVylfKjqkSHZX5WE/1JHerRC2GQAUjkfl3U9yKFWbfii5zbbXyA==
X-Received: by 2002:a17:902:8a87:: with SMTP id
 p7mr4384259plo.240.1567700295503; 
 Thu, 05 Sep 2019 09:18:15 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:14 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 12/18] mailbox: reset txdone_method TXDONE_BY_POLL
 if client knows_txdone
Date: Thu,  5 Sep 2019 10:17:53 -0600
Message-Id: <20190905161759.28036-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091816_174867_B7EA9182 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Sudeep Holla <sudeep.holla@arm.com>

commit 33cd7123ac0ba5360656ae27db453de5b9aa711f upstream

Currently the mailbox framework sets txdone_method to TXDONE_BY_POLL if
the controller sets txdone_by_poll. However some clients can have a
mechanism to do TXDONE_BY_ACK which they can specify by knows_txdone.
However, we endup setting both TXDONE_BY_POLL and TXDONE_BY_ACK in that
case. In such scenario, we may end up with below warnings as the tx
ticker is run both by mailbox framework and the client.

WARNING: CPU: 1 PID: 0 at kernel/time/hrtimer.c:805 hrtimer_forward+0x88/0xd8
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.12.0-rc5 #242
Hardware name: ARM LTD ARM Juno Development Platform
task: ffff8009768ca700 task.stack: ffff8009768f8000
PC is at hrtimer_forward+0x88/0xd8
LR is at txdone_hrtimer+0xd4/0xf8
Call trace:
 hrtimer_forward+0x88/0xd8
 __hrtimer_run_queues+0xe4/0x158
 hrtimer_interrupt+0xa4/0x220
 arch_timer_handler_phys+0x30/0x40
 handle_percpu_devid_irq+0x78/0x130
 generic_handle_irq+0x24/0x38
 __handle_domain_irq+0x5c/0xb8
 gic_handle_irq+0x54/0xa8

This patch fixes the issue by resetting TXDONE_BY_POLL if client has set
knows_txdone.

Cc: Alexey Klimov <alexey.klimov@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/mailbox/mailbox.c | 4 ++--
 drivers/mailbox/pcc.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 44b49a2676f0..055c90b8253c 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -351,7 +351,7 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 	init_completion(&chan->tx_complete);
 
 	if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
-		chan->txdone_method |= TXDONE_BY_ACK;
+		chan->txdone_method = TXDONE_BY_ACK;
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
@@ -420,7 +420,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->cl = NULL;
 	chan->active_req = NULL;
-	if (chan->txdone_method == (TXDONE_BY_POLL | TXDONE_BY_ACK))
+	if (chan->txdone_method == TXDONE_BY_ACK)
 		chan->txdone_method = TXDONE_BY_POLL;
 
 	module_put(chan->mbox->dev->driver->owner);
diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 9b7005e1345e..27c2294be51a 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -266,7 +266,7 @@ struct mbox_chan *pcc_mbox_request_channel(struct mbox_client *cl,
 	init_completion(&chan->tx_complete);
 
 	if (chan->txdone_method == TXDONE_BY_POLL && cl->knows_txdone)
-		chan->txdone_method |= TXDONE_BY_ACK;
+		chan->txdone_method = TXDONE_BY_ACK;
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
@@ -312,7 +312,7 @@ void pcc_mbox_free_channel(struct mbox_chan *chan)
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->cl = NULL;
 	chan->active_req = NULL;
-	if (chan->txdone_method == (TXDONE_BY_POLL | TXDONE_BY_ACK))
+	if (chan->txdone_method == TXDONE_BY_ACK)
 		chan->txdone_method = TXDONE_BY_POLL;
 
 	spin_unlock_irqrestore(&chan->lock, flags);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
