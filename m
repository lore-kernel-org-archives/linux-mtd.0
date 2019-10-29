Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D8CCA9EC0
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 03:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0217020717
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 03:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s7u9m1Si";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVACzUz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0217020717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+YIhaLwBceWUa1J/b8PANps7NouxTycnSdmYwwyKm7w=; b=s7u9m1SiSdhria
	olbz98aicC1MLfKpP5HSAa4OK4cSTa3vcy5/KcEHCqwPAcF/RNHhTlK3ifcE2gVI/Mdrgg5kXztN9
	L2rw+fb3eweuJRTkv+Fqg8b4mwbnoKuX+Eg6A97Xlxe9c/cbMGC8k8vbGXcKyJVOkf9tBbQ+jSily
	yOaDWDEMqa/WUEpQdpmD/X77IBixDWk1jdBcyCaLrj7x16uIVbYzNbc5JTK7ASv3gXYTX7SMKU8Xz
	jZUWpDQ4Z2rhYmef/qW2LxMgujAbSvVgLWEyrmiyB9pwaqOxcVg2TQyeLk9+5ul1snJpaBsBeRk8b
	7/oZNXbmc2l/44Fg+ySg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPI56-0007SV-O9; Tue, 29 Oct 2019 03:22:04 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPI4u-0007Gt-Ss; Tue, 29 Oct 2019 03:21:54 +0000
Received: by mail-pf1-x444.google.com with SMTP id c13so8483897pfp.5;
 Mon, 28 Oct 2019 20:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=LR/aUnBa1iOG11/R57xuvDj2bw8xBBwQLIyehox+hYQ=;
 b=fVACzUz62yAgAZzCMpuE+qtQ6Z0iCAc0Y7g+Nnqh5pg83Kh9rzxW8l2GI7qN2LiUWO
 3Gr8YM+gVikDS/RVHO9gaEx3czDXHRuO8qV91Bh4CG3jJNFxave6xYRfYnVZf94T6geh
 FYwaVkkHTYbkZaWDYW0eeMvB8l5IDJR4BrxLLFrR3A+swfiD8NJnvOhH4Mt9P4huHHoJ
 h1Fu4pFIWAE3jcGUEro6fhXOkEjFuAWKDoU7tTXSnU6kS4NMjGOt7X0nKS+t/+kj/qLx
 H5fkojw/KDrTM3VpfB6Wl57SuifZoGqv1/7YsBzrehxW1eLzM1QBWtYaXicDFa2XI9fI
 lRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=LR/aUnBa1iOG11/R57xuvDj2bw8xBBwQLIyehox+hYQ=;
 b=Vh7xLu2RTdCVqy2jsb73Ir3l/219m0Q07AYyH917Ar++KSu0N0mf4cbxB1ekZ1gUov
 Rbtq70mnSRWMd2pXqYpRFAL6sWfwj/oBzaGZqeJIhT7HmbfBa/jkMANP97ZY4zLdpnwW
 hWyWkAoxI4ZxSPXbjJAWcg4fLt2+cfW2Zj/UZK6GZLtPgkb06gqYYdvz82dAXGUvcvvN
 uER5fwkLBixbrHiC4ZP0IujCJe1m60skOYEYnpBSqYwEwHb0ohBPP7DALQz1EgmrAAEx
 X7th0OO2B9V2mx24aIjXibog0lpI46vwBkWUNsiJ7HSvpue4NVpTTyfQsrJ5DAaL2Hwc
 MOzg==
X-Gm-Message-State: APjAAAWAEW3h3jm1ZiZD22vJnV/TcFgsEe1uwJZmfiHK5PF55nX2GF8Z
 HVYvPnEIMBXVua74A2GojpU=
X-Google-Smtp-Source: APXvYqyIAsC+K9MsUK+66FRnvbVhq/0Ce7vcczJhLyl13Eg7tdplx+xI5xpMotaKwEsxbbXZBCamkw==
X-Received: by 2002:a17:90a:a598:: with SMTP id
 b24mr3409701pjq.46.1572319311860; 
 Mon, 28 Oct 2019 20:21:51 -0700 (PDT)
Received: from saurav ([27.62.167.137])
 by smtp.gmail.com with ESMTPSA id j126sm13359276pfb.186.2019.10.28.20.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 20:21:51 -0700 (PDT)
Date: Tue, 29 Oct 2019 08:51:42 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: linux@armlinux.org.uk, joern@lazybastard.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 saurav.girepunje@gmail.com, gregkh@linuxfoundation.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: devices: phram.c: Fix use true/false for bool type
Message-ID: <20191029032142.GA6758@saurav>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_202152_934654_572FADFA 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Return type for security_extensions_enabled() is bool
so use true/false.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 arch/arm/mm/nommu.c         |  2 +-
 drivers/mtd/devices/phram.c | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mm/nommu.c b/arch/arm/mm/nommu.c
index 24ecf8d30a1e..1fed74f93c66 100644
--- a/arch/arm/mm/nommu.c
+++ b/arch/arm/mm/nommu.c
@@ -56,7 +56,7 @@ static inline bool security_extensions_enabled(void)
 	if ((read_cpuid_id() & 0x000f0000) == 0x000f0000)
 		return cpuid_feature_extract(CPUID_EXT_PFR1, 4) ||
 			cpuid_feature_extract(CPUID_EXT_PFR1, 20);
-	return 0;
+	return true;
 }
 
 unsigned long setup_vectors_base(void)
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 86ae13b756b5..931e5c2481b5 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -239,27 +239,26 @@ static int phram_setup(const char *val)
 
 	ret = parse_name(&name, token[0]);
 	if (ret)
-		goto exit;
+		return ret;
 
 	ret = parse_num64(&start, token[1]);
 	if (ret) {
+		kfree(name);
 		parse_err("illegal start address\n");
-		goto parse_err;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
+		kfree(name);
 		parse_err("illegal device length\n");
-		goto parse_err;
 	}
 
 	ret = register_device(name, start, len);
 	if (!ret)
 		pr_info("%s device: %#llx at %#llx\n", name, len, start);
+	else
+		kfree(name);
 
-parse_err:
-	kfree(name);
-exit:
 	return ret;
 }
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
