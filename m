Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED1DC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 06:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsujO7ViGBPWeiOUmROrFBR4pBIq4Nrx+v75gk0bkNw=; b=BlQAr1T5xPjbqi
	ipBhaFPLpTH5aeJvFJvyhgAs67t7Nm/nSbPw/CYYIJIAes99b0RVI+XSim4tOxsYsSXPEqkVCiJNp
	qADBIBBs7IB+J/cjd0aKdtdOBczhbTMSCf3gR4Qve5ovDnT2LX0ThnvNHg5PqS88PWk/wmxSp31da
	J9vMwDCRGQvgrfJV1GpkzRCC3dpUVeszIVk61Oxbe5lyghI65pNlTgxoCy9/6mf3ZkMrPu/SLo1c7
	M5dU2+Bn3Omk/n3PhAQDjxzHqn4vqW5dyprnoDuOTMKwpLqjdiEuEjYUthMmJnO6cNSA07BGSp0bq
	DYy4HEy0IIojJmz9fThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neA9N-00Btye-5J; Tue, 12 Apr 2022 06:37:17 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neA9K-00Btvo-0F
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 06:37:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so1835262pjk.4
 for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2022 23:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=z9KCSsSOTorZ297IRaNBlVXKYcv73Yi8iB+F+B3CCNQ=;
 b=JmmcP1AtLg3fbaMnX+VVeF4cZ4XJEHNbYmBA124tHtTaz7JLrPIaoAmVjTv6WwP1lS
 yHVzSeQ4kZSs8V8Jqpvqd74EJ1cs7rdj/0KVQI9eTokFX3y+eBfRPtwSckN1oZgHR3Wl
 RsYgZwIhxmKI3pC0JNARPPOj8y5Vhb9Elxu9Y/nUqFu1dzndBz8f9JSYSC71euSjzFzo
 UObmYrjsaa/q8LknB3BSu0gZQPRp7nUBwgctAZlhxP02pJkORvNLAolvZ8NONJPWCWQ9
 k6aUXTmGfmOMBJ4k61QdA/ZWLd18YoiUIgLQYdXxIrgckWETDQ1ZEdkXVe+2PQJZhChW
 lB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=z9KCSsSOTorZ297IRaNBlVXKYcv73Yi8iB+F+B3CCNQ=;
 b=vmqMGrmQBHcZtGqrIJQG6nhTzE+8gT5VC3/tGdZE8/pxTaIy4XTgTAT0EnNoXsiP2L
 CyYfnutJze6+YBOBWp7cflDSxove1KTebNA/5r4W7X8yVqmQBybhHOT0MTTyrYJRFdfd
 gg1c5PIs45XjG+vbO9V20ELsPNvtUmZp2iHEwrws7XuE6NQYyutcSb/q4MdIyU4JQXRG
 3cgFd38znwzItp/dqPCiVh0CHuMi9ZqaCk2NpEvFCFczi3woIclaRxgTGNuUzEppAItV
 ss1nlGnCyA+ftlwar74WuJPYask3OdKoaMq9WBxDQkFZdQVHeFHkSQUomrOSgWVy2e1V
 dvMA==
X-Gm-Message-State: AOAM5338J2TlY5gBinXrpuVEtMdhrFLgxBeeiDZ+i/VN/QjhlizP/4k5
 eucnif1qrzfrCrxNsWNn6Rc=
X-Google-Smtp-Source: ABdhPJxbRo2HxccOLyjPF69o/uFLKLEC2j4IdcjTAgHfPDXjQ0DQp/HOEXokeWC72a2MvL80rsvHbQ==
X-Received: by 2002:a17:902:8e82:b0:151:6f68:7088 with SMTP id
 bg2-20020a1709028e8200b001516f687088mr37030839plb.11.1649745430901; 
 Mon, 11 Apr 2022 23:37:10 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 nv11-20020a17090b1b4b00b001c71b0bf18bsm1618768pjb.11.2022.04.11.23.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 23:37:10 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miaoqian Lin <linmq006@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bastian Hecht <hechtb@googlemail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: Fix return value check of
 wait_for_completion_timeout
Date: Tue, 12 Apr 2022 06:36:52 +0000
Message-Id: <20220412063703.8537-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <202204121253.NcZifMQi-lkp@intel.com>
References: <202204121253.NcZifMQi-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_233714_081335_1A8DDFA8 
X-CRM114-Status: GOOD (  13.67  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

wait_for_completion_timeout() returns unsigned long not int.
It returns 0 if timed out, and positive if completed.
The check for <= 0 is ambiguous and should be == 0 here
indicating timeout which is the only error case.

Fixes: 83738d87e3a0 ("mtd: sh_flctl: Add DMA capabilty")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
change in v2:
- initialize ret to 1.
---
 drivers/mtd/nand/raw/sh_flctl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index b85b9c6fcc42..2373251f585b 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -384,7 +384,8 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 	dma_addr_t dma_addr;
 	dma_cookie_t cookie;
 	uint32_t reg;
-	int ret;
+	int ret = 1;
+	unsigned long time_left;
 
 	if (dir == DMA_FROM_DEVICE) {
 		chan = flctl->chan_fifo0_rx;
@@ -425,13 +426,14 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 		goto out;
 	}
 
-	ret =
+	time_left =
 	wait_for_completion_timeout(&flctl->dma_complete,
 				msecs_to_jiffies(3000));
 
-	if (ret <= 0) {
+	if (time_left == 0) {
 		dmaengine_terminate_all(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
+		ret = -ETIMEDOUT;
 	}
 
 out:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
