Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE6DC2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F24206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jbMgMX52";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pISmdvdS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89F24206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RlXXchyRQEZZcaZqSiooFaDc8K98hvNj5TPVnE7Pr3g=; b=jbMgMX52vFg6gbzfcJCdcA8Wa
	SvasrBOcPEXqTzHuo4c8oAFU+exvn2jU4uSGWt1nMz0qZUBdZ2gcyRsK9UW9QzqRwtmpRTKlrTKlo
	+v5ZvPgiEeHHvGI1C/ZlAiBdnil6O1xuXpu2SuJ8cHV9BoaBAN1ojUA2/Mth0ILTcYSUzCwnFSGFM
	v6zkaac4KcTJ+brJK/pxCvHyONh+7HUKc9xVxD3BGJUkeAgeYXnmkk1DUlYuVSghVPsTqSqSnhA1m
	NweCjqS5qE066UnGMxdp89c6yubdxb48vqrD0YINgeOYHh5109YHuqoW4ZIq/eez8PJ8txDjCl2ES
	BvFQkY94A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBqF-0001mF-0B; Mon, 09 Nov 2020 18:24:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoK-0000tT-OE
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:43 +0000
Received: by mail-wm1-x341.google.com with SMTP id d142so390549wmd.4
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWKR6uPZUpsHw9fLiQN+tCUhIOQtuUG869jNO4i86ZY=;
 b=pISmdvdSsAGV1QIK8I4/nXbvzV4BpyRg4zyUJt09AIUwDnQOACl7kVRWIlyZmqQFmu
 h8mZCjA7ExEBqY7UPobPGH36uZeALUfjlSpsODuSdTwFYMaHv5sYNEOJTALE1KEutu+C
 RgDy4EZwHHKM+WM3pVjJOo4C9KfPKSll+pNQfBMJy2sz3DSOjb8zpvjYBt2ntpWUWyVL
 aP28CxDBuNZ2Z4vI1+SivZCt0x7e5sXUTDaoGqw+OlhpZygKYwKxsQjw2348oRFE0DWy
 KO2TPj52VpVqlNk5H8ho0v0+f1qb2m/Leb1RXjg+uMmaNMiF9wqWvSzbQIq+phKexoxY
 ty8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWKR6uPZUpsHw9fLiQN+tCUhIOQtuUG869jNO4i86ZY=;
 b=IhQJ+3igtt999Gye7kbehBGR1eVlaPEG3u4Ds/VmXHYrUe+R1p0m1IAN+lbrUf6hpa
 iBr0TdNQhS4RE2evzddoN5fdW2wmlQblZlEqfw6JrzzpgfQhV0TznNIkK3p5QF6avxZK
 lVWpMHn9Uhfjv9JRfw5Brvy+gTJFRWmaBPBbBiV+sMuFOawFpODFn31YizyzibQtdL7k
 7u/032RVhgqNmK8Des+gcuyg7VZUmPHoZIi5P2gz+d19/LL6PiuaQfR4IqMOZoemI0BS
 +41cVkjUM3TAV2XIZk/qKzhlvjFw+vQtW6A1LudhQgwcXKL5k/iKpkCS95odCDCNBqDT
 ybog==
X-Gm-Message-State: AOAM531zRwdC7nK5NoaJ1aNtwpOKXb/wlSyxG9/TTmsJioggy7HBcnZ4
 o5WF/1CQ9TjsO1YH2zl52/WkoIsC8LxaVw7z
X-Google-Smtp-Source: ABdhPJzVFDmrznnhXXVDaVtytN/m1ApIQJ9IObX0ZNMZx+35FLITCYT7SzrOgTW0NRH8EaemRS2Omg==
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr433586wmb.181.1604946155646;
 Mon, 09 Nov 2020 10:22:35 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 11/23] mtd: ubi: eba: Fix a couple of misdocumentation
 issues
Date: Mon,  9 Nov 2020 18:21:54 +0000
Message-Id: <20201109182206.3037326-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132236_877094_AFADAC90 
X-CRM114-Status: GOOD (  16.01  )
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

 drivers/mtd/ubi/eba.c:1304: warning: Function parameter or member 'vidb' not described in 'ubi_eba_copy_leb'
 drivers/mtd/ubi/eba.c:1304: warning: Excess function parameter 'vid_hdr' description in 'ubi_eba_copy_leb'
 drivers/mtd/ubi/eba.c:1483: warning: Function parameter or member 'ai' not described in 'print_rsvd_warning'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/eba.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 0edecfdbd01f3..892494c8cb7c7 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1290,7 +1290,7 @@ static int is_error_sane(int err)
  * @ubi: UBI device description object
  * @from: physical eraseblock number from where to copy
  * @to: physical eraseblock number where to copy
- * @vid_hdr: VID header of the @from physical eraseblock
+ * @vidb: data structure from where the VID header is derived
  *
  * This function copies logical eraseblock from physical eraseblock @from to
  * physical eraseblock @to. The @vid_hdr buffer may be changed by this
@@ -1463,6 +1463,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 /**
  * print_rsvd_warning - warn about not having enough reserved PEBs.
  * @ubi: UBI device description object
+ * @ai: UBI attach info object
  *
  * This is a helper function for 'ubi_eba_init()' which is called when UBI
  * cannot reserve enough PEBs for bad block handling. This function makes a
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
