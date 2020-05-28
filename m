Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEF2C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:12:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 350ED2088E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFEWiIBU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYFrV6hn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 350ED2088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eV596mcWc4x7JgdROAAWb500jvYBj1hB3nF/ReDZb4o=; b=fFEWiIBUvb43K9
	cgsAKQpbiRyUiuVZXxoDwwXdhZC3OFilKmpzGqZIq5g67wRl4PXUZ3PVfi3H6TzSUywcCvwDldF/U
	xmDt6jIQVevtQ0kmi31isKO4l3VjKrGtam/CW0I8OijX5GAp82at9Aw46E3Yqv7Q069kZpKLdxnPN
	s1NZh26UEYHdkJZLivQKqIimEMVGUnkgOxY7DjPrbbfD5DduOcGx9JZVJ0088i94ShV5IbiVCg+Od
	z/ohDeq1ML+hrt9odtMmp9NrVqOuHqZo1Dh5ExdANaMMUgIG/0LOdmxypSUkVbJRCH44M312R2rsH
	GvJYMxah1dm0JVx5bXlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDeJ-0006DK-EI; Thu, 28 May 2020 08:12:23 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDe5-00062A-Q4
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 08:12:11 +0000
Received: by mail-lf1-x144.google.com with SMTP id w15so16001898lfe.11
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2020 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RQk00OdF5LpL5xlOXSrSDqS1InuSH/j3c3d+RMcDSME=;
 b=hYFrV6hnyOyM0TqXYVyo29Mpe9PYRzNEp8rLaIglftrYmaU+1sviJPkAq8BJWc6y/w
 yhY1Pk1ezuwKQRUlNTJu5vNwOoExi7sUy5E0WVr5C/E5gWVz3Z/4o/hfAXYgt35nHeuC
 SWR+WWvBvCn3CoQ2xvQkyWd7+dQ4Jo0vw+Y1bJMTH07IzG6E5b5HNh0umWhC0XM09eUV
 Q6BxXW2N0LtoPpjqx8yJP2DrA+XVGsjEho2ebLZJmUCz1oQuS7vw7/BqumbbtQ1PJMZH
 A81KtK5cZOOvqgdlm0Zzvjm6iSxyfZ1/wEGXgqe7waJEyfZG91NLA/B9SY6hsl34z0Wg
 8HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RQk00OdF5LpL5xlOXSrSDqS1InuSH/j3c3d+RMcDSME=;
 b=ExQ5tQ4ZjtoEYMNHLbZMhQD4bo417oO5jSm9ndgZbMMFY8nhO6KwXReAxBLutqwQHj
 1QI+bseQihtEXlmUH6+0AU60syLhx1XbkDjIlIEWwiLbUrff+R2ijdABYitIC87NyXlp
 5T4UkWUpJFVxHdXEeFlHc6n8soLXE4EJ5jnd/8mPYgi8MRJ/J0GqIJBQryLuDCi4f7my
 XdWqMI8ssAnTfOscaNXa40VJH+vFGSJFLbhWDgXcYxBoWADIBYGOnTeciGbAgBPuXqTk
 W2QS9nFKkXdqpHgFXVsux+W2mMZPtfyTql4crPWpXQwA1JyC50xY8wyIJRepNKLjlmyP
 wujQ==
X-Gm-Message-State: AOAM533AIB8RHcId+JHBzqP/Cz0CsTlgNJ4WycZ9ezTXfeRbuFlGi9Et
 +Va+uBIMhLc6VIapRRXsaf9SuA==
X-Google-Smtp-Source: ABdhPJyrtOTFzXqWYpVxK2jNQGKv40aIylKXBy4gz7zT5WSPDOADC9e2YRecvBb+8sPOeIrhFdhHPA==
X-Received: by 2002:a19:c616:: with SMTP id w22mr1020281lff.123.1590653527967; 
 Thu, 28 May 2020 01:12:07 -0700 (PDT)
Received: from localhost.localdomain
 (c-8cdb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.219.140])
 by smtp.gmail.com with ESMTPSA id y11sm1289351lji.52.2020.05.28.01.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 01:12:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: linux-block@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] block: Flag elevators suitable for single queue
Date: Thu, 28 May 2020 10:10:03 +0200
Message-Id: <20200528081003.238804-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_011209_910096_343A1BDC 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Paolo Valente <paolo.valente@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Ming Lei <ming.lei@redhat.com>, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <jthumshirn@suse.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Kyber block scheduler is not suitable for single hardware
queue devices, so add a new flag for single hardware queue
devices and add that to the deadline and BFQ schedulers
so the Kyber scheduler will not be selected for single queue
devices.

Deadline and BFQ are applicable to single HW queues so flag
each of these as single HW queue-friendly.

Cc: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Paolo Valente <paolo.valente@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 block/bfq-iosched.c      | 1 +
 block/elevator.c         | 3 +++
 block/mq-deadline.c      | 3 ++-
 include/linux/elevator.h | 2 ++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index 3d411716d7ee..7bf99fd83472 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -6812,6 +6812,7 @@ static struct elevator_type iosched_bfq_mq = {
 	.icq_align =		__alignof__(struct bfq_io_cq),
 	.elevator_attrs =	bfq_attrs,
 	.elevator_name =	"bfq",
+	.elevator_features =	ELEVATOR_F_SINGLE_HW_QUEUE,
 	.elevator_owner =	THIS_MODULE,
 };
 MODULE_ALIAS("bfq-iosched");
diff --git a/block/elevator.c b/block/elevator.c
index 4eab3d70e880..ebb4fc875b86 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -678,6 +678,9 @@ void elevator_init_mq(struct request_queue *q)
 	if (unlikely(q->elevator))
 		return;
 
+	if (q->nr_hw_queues == 1)
+		q->required_elevator_features |= ELEVATOR_F_SINGLE_HW_QUEUE;
+
 	if (!q->required_elevator_features)
 		e = elevator_get_default(q);
 	else
diff --git a/block/mq-deadline.c b/block/mq-deadline.c
index b490f47fd553..324047add271 100644
--- a/block/mq-deadline.c
+++ b/block/mq-deadline.c
@@ -794,7 +794,8 @@ static struct elevator_type mq_deadline = {
 	.elevator_attrs = deadline_attrs,
 	.elevator_name = "mq-deadline",
 	.elevator_alias = "deadline",
-	.elevator_features = ELEVATOR_F_ZBD_SEQ_WRITE,
+	.elevator_features = ELEVATOR_F_ZBD_SEQ_WRITE |
+	ELEVATOR_F_SINGLE_HW_QUEUE,
 	.elevator_owner = THIS_MODULE,
 };
 MODULE_ALIAS("mq-deadline-iosched");
diff --git a/include/linux/elevator.h b/include/linux/elevator.h
index 901bda352dcb..03057fa2f569 100644
--- a/include/linux/elevator.h
+++ b/include/linux/elevator.h
@@ -172,6 +172,8 @@ extern struct request *elv_rb_find(struct rb_root *, sector_t);
 
 /* Supports zoned block devices sequential write constraint */
 #define ELEVATOR_F_ZBD_SEQ_WRITE	(1U << 0)
+/* Elevator is suitable for single hardware queue devices */
+#define ELEVATOR_F_SINGLE_HW_QUEUE	(1U << 1)
 
 #endif /* CONFIG_BLOCK */
 #endif
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
