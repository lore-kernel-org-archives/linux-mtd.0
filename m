Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F961C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE79F206C0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aWUgWmIc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ToJRou/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE79F206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7exq9FZcK91QKadC7LkoAj/07LRwSH4wl7Rr5Ki/KgE=; b=aWUgWmIcM/74eGPkVqAZZHQFN
	n5gZ+0aHVfLpR88zMPrKLLFbEkzM+KBq7THrTv9EkBHBN+4HOHyqEMqOsvX4HGTq1RZYwN2MTKcii
	ej5EbS2h3nUndlsV5s5reIUFc0fjh2ubQvDiV/MnpUd45bNfdVyvLSrfWntIdkS9VIlHIOE0pVx8Y
	S76Yj+fOdKeK6P+yderEoRslSll4Q/jaeTMwDw0CVk3NfHGBczFnGnpg07pb9Yc2DA6tmU9buog9G
	EfVNXN2duoLGDV8+YVZV+KGccclhzA6ZqRC175tUyYo0IBMFboCV5PGtDbkOl7daCNHIbdJylVeqD
	Kgj79D7rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBq1-0001fs-TE; Mon, 09 Nov 2020 18:24:21 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoJ-0000sx-Dw
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id v5so404365wmh.1
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaSgExpL1nCtBP1Xc6kSLtHGXCrLErSmtz6Y4QPAfFg=;
 b=ToJRou/GY83l76OBzOA3w6EcozYKqJ27Q2TR7tt6LGIQ6blHcsNnvL9ilkDPN1mDhk
 WR1lD8Ai2jcj2p5Zvq8/hoCtpifwJ0crOUSBwh27ZDta9uWV5Hi0d4gd5adiZ/EYvU0A
 lgogovwxBFq+GVsnNpmooRxslu9IMrsVrBx6Bd4YkcTz2WgfvPXRORsaCAb+nTrvOTEE
 EkDX3ucAfnIDqt12fWwV6RSbF9WiAichHRikKcLs97F/dujnuJEqNTWyoTgb4IMJ/5le
 CjQRMDSSQVbSliV3EUvkdbw+1pM6wy4jkGWSgDACPpJ5nmMDWZvLwW3fA+KVMbvI6zCL
 2z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DaSgExpL1nCtBP1Xc6kSLtHGXCrLErSmtz6Y4QPAfFg=;
 b=n6atK8IDJuZBpghdh8/USEQV7TtA0GAF5u0QwspjNU/GkitG7V2XFJV/TgBT+MzF/0
 iXx1da8sS+Ifhqpsg4moEboQmLC8Qa1v0wKAIyfNzur0eCSQeulbs7iU/yrsxpltykxk
 c3hb8n0ggtc7z5nPo22mrQaEZuUA1UeInIF1pqiHD8rJFztdjnKXbrwGEvnm/ads1S6j
 t/GRX/zPTg4ZN/FiJ/m+0/HQxQKYxcduU1dY5Frkn4mHgE/y2o5Yu9IOas9b41sUu43f
 oCyLP1sM9vU8kKlviwLY3rQX8c+OmP3fx8qY3Mbd+B+y458dzNNONBU1B2XH3pJ0YSfC
 yvQQ==
X-Gm-Message-State: AOAM531ugcBY+izjMN/vFdB0V5uNd9pGlZ0JZntRIyQcAtpQfU/iEDfD
 nZ4D8cbgougrdh119fYdBKWDpw==
X-Google-Smtp-Source: ABdhPJwpufBZ2yW4s3uXsteza0ZdpSIpxc+C+KW+uYuuZbu541OjO8nozJyEoKXm5P2A2knRB+Jwag==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr465425wme.51.1604946154476;
 Mon, 09 Nov 2020 10:22:34 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 10/23] mtd: ubi: kapi: Correct documentation for
 'ubi_leb_read_sg's 'sgl' parameter
Date: Mon,  9 Nov 2020 18:21:53 +0000
Message-Id: <20201109182206.3037326-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132235_539139_2CAFC067 
X-CRM114-Status: GOOD (  15.38  )
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
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/ubi/kapi.c:464: warning: Function parameter or member 'sgl' not described in 'ubi_leb_read_sg'
 drivers/mtd/ubi/kapi.c:464: warning: Excess function parameter 'buf' description in 'ubi_leb_read_sg'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/kapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 9718f5aaaf694..0fce99ff29b58 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -450,7 +450,7 @@ EXPORT_SYMBOL_GPL(ubi_leb_read);
  * ubi_leb_read_sg - read data into a scatter gather list.
  * @desc: volume descriptor
  * @lnum: logical eraseblock number to read from
- * @buf: buffer where to store the read data
+ * @sgl: UBI scatter gather list to store the read data
  * @offset: offset within the logical eraseblock to read from
  * @len: how many bytes to read
  * @check: whether UBI has to check the read data's CRC or not.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
