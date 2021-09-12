Return-Path: <SRS0=3X/b=OC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33649C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:18:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC90E60F6D
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC90E60F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6VI5Dz75SNh2JFmbLZBt5Yn4fe8/73Iu2RGUp5DlMM=; b=hXbVnJJMlbr4h/
	IhOeATfxuMLVe8nhyJVhO3qBjtK2NwLEqi2QdiVvJuIMmqnaEsRJM/aPTnsVMJmf8ot33+13NQANH
	GXAuk39pVhFM0X70AsCQrYgRe4tHtXLKe5N4r8d6AaLOIfiBDRRBJLWoo641A0AdPvCfE/rQ2QVna
	ku9mZQg3pdRFXw/bhzuWN7ezPCLcyUwI90WxxeWyXmxJCbqnnMENoVPpGCBz/9d7JMi4xY3TrqkCc
	jszOjS1gpJAIJHgR1yiZWhPGoTteSexyizcFlgtYXSqQmtugnbhvy7Na4q2wuPohAkTrrmUk306Q6
	vjO86M2LqXEEFtafmJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPVul-00H9Kf-4F; Sun, 12 Sep 2021 20:17:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVna-00H6XM-JJ
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:10:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id g16so11354348wrb.3
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yDP03amDwCEY6IiivIbDG+60+C+xV/Pv6sR1LEywSYo=;
 b=dXryPcSyGs3gzqsQTrY9mpA3DCXsy1qtI2Vvgch/dp73DtqX/mRKKohmX0tDJDjEOb
 22eZzlRqGiaRAQuj5VWO6OdZhB1UwhaliLlSF6kBqXnQg/4+Fuf/F5e840PG8sqkGkL6
 NdloQJP+NoMUcO7pKodski58EDi76tukzL2Ac9XOWI2ntWI78R17gAoFQwioVnd/FJKd
 NgO/oxnqYcdVDXiVxkLyt0OfVHo9DhWSvnvh6MZbPy4nse0+Tq07s0ygP2TuTBeMLeVR
 XmQ3fBl6Xb7JwQuAcAO8vvl3U1To8moeCJGd2IOe0JyjZs//LOlsgy8at16gazH3aoWl
 oieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yDP03amDwCEY6IiivIbDG+60+C+xV/Pv6sR1LEywSYo=;
 b=wcJy2wYw9j1cHG6E1IKXznYRW1u0kNsm3bg/Cc6OjqlY66Ijqf+pqLFSW2o5kAOP1F
 adZFL+18S0q3dBbG03mRKtTnar0XVOZLBQx43++ZSU3+DhG1KDPdiQSivq/+MIT6Gia4
 1eYQ/4MI/DNb0EKhJIq4d832rzAjvh5rHdOWBGZ4IjTE+CHYGdNBsnY/gFAd04xeNs4Q
 2ZfwyoFnwcxPuomKwpMFlduA74DEvJA8ZK/3olhSSiFyZ8NIbUMyq1xtyuQv5jxLA1vY
 hzjN6PgtbdxEV34UmkTulGrVaN9/kTIKMu3SITLA30HRJ1mv72deUFNNb9l28yFZO0fs
 BJ9Q==
X-Gm-Message-State: AOAM5320WC3d15bqlD/iCZduyjdOrvdGKXFsOSgohLYLuaK7fwbE+IaA
 iu0R7uwgSjzU4gM1Reom9vw=
X-Google-Smtp-Source: ABdhPJwCDhWxV3BpnNX9q3XBX8a/PuihzY2Q6a3tghpwSk7A8GTITDQME8kLH5hVUhZ2lKp57c3mQQ==
X-Received: by 2002:adf:8170:: with SMTP id 103mr9106701wrm.167.1631477397224; 
 Sun, 12 Sep 2021 13:09:57 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:57 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v11 10/34] gpu: host1x: Add host1x_channel_stop()
Date: Sun, 12 Sep 2021 23:08:08 +0300
Message-Id: <20210912200832.12312-11-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_130958_682800_58CBC6CE 
X-CRM114-Status: GOOD (  12.28  )
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

Add host1x_channel_stop() which waits till channel becomes idle and then
stops the channel hardware. This is needed for supporting suspend/resume
by host1x drivers since the hardware state is lost after power-gating,
thus the channel needs to be stopped before client enters into suspend.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/channel.c | 8 ++++++++
 include/linux/host1x.h       | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 4cd212bb570d..2a9a3a8d5931 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -75,6 +75,14 @@ struct host1x_channel *host1x_channel_get_index(struct host1x *host,
 	return ch;
 }
 
+void host1x_channel_stop(struct host1x_channel *channel)
+{
+	struct host1x *host = dev_get_drvdata(channel->dev->parent);
+
+	host1x_hw_cdma_stop(host, &channel->cdma);
+}
+EXPORT_SYMBOL(host1x_channel_stop);
+
 static void release_channel(struct kref *kref)
 {
 	struct host1x_channel *channel =
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 7bccf589aba7..66473b5be0af 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -181,6 +181,7 @@ struct host1x_job;
 
 struct host1x_channel *host1x_channel_request(struct host1x_client *client);
 struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
+void host1x_channel_stop(struct host1x_channel *channel);
 void host1x_channel_put(struct host1x_channel *channel);
 int host1x_job_submit(struct host1x_job *job);
 
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
