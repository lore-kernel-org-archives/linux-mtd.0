Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDE9C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3A0E206C0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a6XIxkF1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FGiuz2Cs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3A0E206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xMq+x52hv0S47USEc6kSR00N4utMwKTqtcqsBq7W4RA=; b=a6XIxkF1ahP0cYPCxqWdnFrw7
	00i7Yt1f8iF6J8BjK6spMK3912o8Ek6Fl9ZCuDsrdkDj//vYqEZTDQO6s2EWWYIMNqu/FGO7d70z7
	h1yes7ECOMBLBDJXMMxpPvrurlHGygIbumupxPOgm1qzmfd/eh80AKnqLXXkxBDpFqiT0NvArxSts
	AOAt/GGe0PA89q1PFezLLoYxsfK+meGpILMYTCIm/MPL8urszRrCPs5nTvx36GEOoRBAqlpGYrULr
	6R9WmichwF+caMrXlawl77PIYwvZO7xOIlOIynG7Y5j2tfGfK1smY48wIKadnKtVMdK9xwsKhLLLX
	KONiX8lKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBqS-0001ss-K5; Mon, 09 Nov 2020 18:24:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoM-0000uH-9F
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id 23so9806283wrc.8
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=93EjZ3Q1Gw8Ho51hZkZvcyMJpfj7h+RPmd54ZDyuP+E=;
 b=FGiuz2Cst7W8YGzjuH7oR/80riR1y3ryV13ErPsnJPIku+MH0/ysQZFcPAyi6Rak30
 A7uyeT+Pv0IY9nd1ybvTN4TTOIXRxo6WyAarJc69qAIgAVWwItf9dE2Xipuv1iDs6PrZ
 8VTA94w7a0qq8YfA8iPwN69GCrDDKsiXEpnuvGsK2Q8x1fo6N5raOMUGb46Kdp8/akPj
 M7cPQ0B3xEAWcsbudiOqaKsqamxeMJEKo93pm8ktcyX3KUUcKcdtzEqbVbAJ6pVplMfw
 SGiLPCC+vSwii8OmWho/PSnPB70IwNmqiRCgM2kfdWrmSgxw2nTZHbNsJgNpO2ILGkXn
 Wqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=93EjZ3Q1Gw8Ho51hZkZvcyMJpfj7h+RPmd54ZDyuP+E=;
 b=iVT1p9EGGsdEnCsVdBqtst8HPx1+s5AiM5hgdIuIG/asbGhrsx5VEaNfCtoar6V6pN
 cKBSa/frQbieN8FozrEIFFrzw0HC7AnNBIom8m8ydlE7L3QzYDRY5G6m1pG9s4YErJE8
 JT75rCricRlL6/fcqj3i9ALOw5OuIIRuO6yJuVrBitmjUuuBRuCCB9QoeD3Qtbfag8AI
 x6rOzzJPfPtRrRJR9eDNtKOMyRw8p5Bx3nBG2JAx/F3EP/Jp6QzJxXGFCWYpzYLD3ina
 gIlDQigGUhTcKnIcyuba069Mj9HA9UhMLwQnuNUokXKjfjYNXrkL2nY5x737tQS2dSFZ
 L50g==
X-Gm-Message-State: AOAM530piEcvcA+ryVEyBk8eh6ZTfyV0g35Ot9eJtvtnX8ifZjKtfFNA
 uLneJjMmkpFG1VgzOj/vPZxEwQ==
X-Google-Smtp-Source: ABdhPJzjA29ReDKoS8meuG3AwVUifiDdGOjuNnliZQ8OcrzScX2JdL+j0w6/+uklVrrqt8pkwQWMfw==
X-Received: by 2002:a5d:670f:: with SMTP id o15mr2175982wru.204.1604946157299; 
 Mon, 09 Nov 2020 10:22:37 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 12/23] mtd: ubi: wl: Fix a couple of kernel-doc issues
Date: Mon,  9 Nov 2020 18:21:55 +0000
Message-Id: <20201109182206.3037326-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132238_418330_C41F414C 
X-CRM114-Status: GOOD (  16.58  )
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

 drivers/mtd/ubi/wl.c:584: warning: Function parameter or member 'nested' not described in 'schedule_erase'
 drivers/mtd/ubi/wl.c:1075: warning: Excess function parameter 'shutdown' description in '__erase_worker'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/wl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 7847de75a74ca..8455f1d47f3c9 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -575,6 +575,7 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
  * @vol_id: the volume ID that last used this PEB
  * @lnum: the last used logical eraseblock number for the PEB
  * @torture: if the physical eraseblock has to be tortured
+ * @nested: denotes whether the work_sem is already held in read mode
  *
  * This function returns zero in case of success and a %-ENOMEM in case of
  * failure.
@@ -1063,8 +1064,6 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
  * __erase_worker - physical eraseblock erase worker function.
  * @ubi: UBI device description object
  * @wl_wrk: the work object
- * @shutdown: non-zero if the worker has to free memory and exit
- * because the WL sub-system is shutting down
  *
  * This function erases a physical eraseblock and perform torture testing if
  * needed. It also takes care about marking the physical eraseblock bad if
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
