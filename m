Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90994C55179
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:37:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328DF2087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWwp4Ywb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZaGgVTC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328DF2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0JPJh5x9sYDiBUOX8A/85x0XQf3tuSTQnmrCnkWyeQU=; b=iWwp4YwbEv9Bv3rK7bgzNHkHl
	KJr4T58PDAOqc4cOnUUCNUoWBcAidUWTSYwV6DLzCAZq9fklC02wsDViF+imIODLkSwX2fQiw9Tw7
	Cc9LBVuASWghSOpVi6XsR0k0mGG5MAWV+yBC+YsoQTN1EUqKtAG1s0d+Y/E7JiPk6GwzsFcS2mlPO
	R8YpoU47Nws78yqAgiOhkapUmQjk/i/bc7mCuWEQYYcOQdjf6H8A9AldQWgsGLMZWvhdRr7qLvdn9
	uUNxpdV7MzsFW5d87m2khcc7y0rz01Op+QHhBpwqzRJ9Ivw1tCUnhg0unYf/UbbNB/xXGXDkP+/XH
	4Usbajf3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9Q7-0002dF-G5; Fri, 06 Nov 2020 21:37:19 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Pu-0002XF-9B
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:09 +0000
Received: by mail-wm1-x343.google.com with SMTP id d142so2813585wmd.4
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kN+nLzLc6b7cOpaWz6eZ4gZDLXqa51d6pByGdFZOfqY=;
 b=fZaGgVTCmG4C5q/nm2wPolvW4omaf6In8+148k3bUqfG0b9+xbgmdoGQJe4JfWa7IG
 kEBE/0YRyWKYZkljpvwdYarXXq7SJHorTHqEXuwVWUnjaWnneUOa+9y/1YfAwHVJ7/ok
 EuiPoxYzoADNR9L2YnGO8Ie4AKlWTVSwWlS23k5ZkE8Sfh8SE2PIN2LdZwCeH1X+Fj/Q
 6GImujez0wtGZdyFlKNSM4xXo0H2tx8UpHVPlp5//LCLmlxqpX93pSd92nv0Ca/MxK6H
 7lsrMjA+ITkI7Z32zXit2my2/GRfjnt/PUdxlsZ8S0dU0I6NhXr6yh8LtUgGfSlkiwha
 QX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kN+nLzLc6b7cOpaWz6eZ4gZDLXqa51d6pByGdFZOfqY=;
 b=QSlkgPss43+ngvwNpMBGR8HEi6+UNlPMOD3Cer8yHtkpKy8/viaVebAeAwqMoWkj3X
 EIgsvAz4CNL4fD5fCVem1/ZwvXJ1Z4vukCMT8tP8OePyBqOC/j+SUQrhFdd7xBIjSgQf
 YtpojXJTGfnXp6RPu1N7Nt9BEic7e1m3Q5XAdl3yQsbwSxEdZwMg8Y+D14+kJlqjZjGS
 KAglwHBkrnUIaiioH0yboMf5TuR/q8+m+Fs5+4C7raOtjsWKGe3kaYAfjO4uGIv2l6DR
 NmErXYcxo/fm0ModIvKTDZwRmQlKoDMDUFUlLY5Tnl5DPmfDShi3epbkLltYsUHRDxoS
 +nww==
X-Gm-Message-State: AOAM532Sv5f8/SKHn04VgjFkm7hgZ/bKi+dEzdLgitNAycaPGagLAEpk
 ys4mP5IUXjCECNHEV+6ONzzEOw==
X-Google-Smtp-Source: ABdhPJxpFXiTiFTvGKQFl417MX1y8IQ9Khsilv+A/5dxWcIJdtyZhGm+p5Q/SQLoqDlSdBt7I92WLQ==
X-Received: by 2002:a1c:6284:: with SMTP id w126mr1597664wmb.145.1604698625105; 
 Fri, 06 Nov 2020 13:37:05 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 04/23] mtd: devices: docg3: Fix kernel-doc 'bad line' and
 'excessive doc' issues
Date: Fri,  6 Nov 2020 21:36:36 +0000
Message-Id: <20201106213655.1838861-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163706_357753_E53C967D 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch also places the descriptions in the correct order.

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/devices/docg3.c:819: warning: bad line:
 drivers/mtd/devices/docg3.c:1799: warning: Excess function parameter 'base' description in 'doc_probe_device'

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/docg3.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index a030792115bc2..5b0ae5ddad745 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -816,7 +816,7 @@ static void doc_read_page_finish(struct docg3 *docg3)
 
 /**
  * calc_block_sector - Calculate blocks, pages and ofs.
-
+ *
  * @from: offset in flash
  * @block0: first plane block index calculated
  * @block1: second plane block index calculated
@@ -1783,10 +1783,9 @@ static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 
 /**
  * doc_probe_device - Check if a device is available
- * @base: the io space where the device is probed
+ * @cascade: the cascade of chips this devices will belong to
  * @floor: the floor of the probed device
  * @dev: the device
- * @cascade: the cascade of chips this devices will belong to
  *
  * Checks whether a device at the specified IO range, and floor is available.
  *
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
