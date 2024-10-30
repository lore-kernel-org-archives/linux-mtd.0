Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA22D6B6B3
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 17:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Z9dNkdnf7ytykhb/ZIZuwPOzkqdC9H5LiEqsaNyme0=; b=zR0+G9Mo56TlUz
	tnBndwbAjzZqf5vwjhox6ZcUAX2LNMZJF5o2AkyxdNYZhX7oKFKphPXGPCtrdxBc3l/L9pOllaOJC
	dHgfmS8P5HxSZNNzmDbaT4YGvjV9qPSRdQKK0FNI2apHmBt/x8hCbUQmy8X2aO5fjK/FXXCrWH14C
	IIVOW2D+ZsLM1opbQJ5ukOP7YG5FzcEHni4vzP/l7SuN5iBhL0Msj7ye7T2rsDhE3gjNXsPCDcRJM
	AraWBDXvON4VhN/UN07Zw3volpSt9XL96DOT49aJh/AhEE+NpMq3NFW8jPoWHh6sVJVvKM6SO+uaK
	1/bYWJBWe1fgYqze59yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6COK-00000001GLP-251I;
	Wed, 30 Oct 2024 17:21:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6COH-00000001GKv-1OtF
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 17:21:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539e7e73740so55469e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2024 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730308911; x=1730913711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/5UDsxfPHBMQmeRbidybeu9Vy/Aul+tK+2j7/QBWi4=;
        b=NwvvOJHoA4Zu/JZ/BvHh7HITCrLSdAd60LhjrDzkBr+u3sdSUtEScnXmo1SCX0AGQ6
         eVx5iQEnzrY30g/OVCIV1GwlXgjzbtf8WHIeBZOjVy8pl5wEG5/sgNrC8gwKtKfqvUUC
         3QnlTtKq4rBYF2gb3Wp0iuZ68UMMN8kOhdJzSmXVfADyfFRIPl/MJER2V4GOFvE5qkBL
         XtqJfUWtFdw/sLzUWfI6sKsmd2Dsio34tyatFo22YiNlXqMhXqy6CmqdsAeSyc1kPzs3
         pHlA5azofr9Io+nmp8g4+iP3iveGyPqyCrNoBitcA55QHEhJetNcFn394Q+f+NrkkN3r
         WtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308911; x=1730913711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/5UDsxfPHBMQmeRbidybeu9Vy/Aul+tK+2j7/QBWi4=;
        b=aFRr2PlPidjjWsW0Zx5F0hXa5US2cPYd/JES8PqAWrBxgPBrhtpy3bLOHt/oYN59Ma
         gLA4iSS9IqYUUitvOSuCgmHw7pxJml5szmxKJmPmPog+btH4JtorXL7OXcSIq3tCv/N6
         8VFtmpSglf97v35veYDeGZue7NUYntA4rAhCFl4Y+Kh97+KvC9XULDSR/fkTtAFVPjFz
         zJ/NK1D8ZpQEMyNCk+dBbv5x0M4NIiFyeRmGGH8p8k7VVjFSfXZwsz0Es5o9GJO43C8A
         e4nqQIc31OLYBcjUGvHzkQjrhUfFSDgn9WLJ6yAqju5lJSyv0xTLBco12yKJFsBwJgwV
         uhkg==
X-Forwarded-Encrypted: i=1; AJvYcCUrQJ8TALUM0GAIVS4H12H5InVahrtSFZxUXkB0jRiA5Myn15rAnDmJ0cLo1kYeZ9TFEhegRqPRoDA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQoHFr+7Jphs9a5sib5kKkyRFNomGE27uQmEcjT7QVDSDnWKKl
	hr7l4g+LpEVtaNQUT5zFYocp6EoSkxGKgHsIIFYyt2tpRkExGptT
X-Google-Smtp-Source: AGHT+IH8B4T5YJk7NrR1WN+mYuaun5JVU0bH5CjIzvYTTJwdWyO9B1X1VXyvCbiFDw/HjK4C971ORQ==
X-Received: by 2002:a05:6512:2393:b0:539:e3d8:fa33 with SMTP id 2adb3069b0e04-53b85e9ca56mr2145315e87.54.1730308910485;
        Wed, 30 Oct 2024 10:21:50 -0700 (PDT)
Received: from localhost ([194.120.133.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9aa611sm27217225e9.34.2024.10.30.10.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:21:49 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: phram: only call platform_driver_unregister if phram_setup fails
Date: Wed, 30 Oct 2024 17:21:49 +0000
Message-Id: <20241030172149.3101873-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_102153_393679_3DEA9ED6 
X-CRM114-Status: GOOD (  13.12  )
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

The check on ret and call to platform_driver_unregister is only required
in the code path where MODULE is not defined. Fix this by moving this
code into the relevant place after the call to phram_setup.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/devices/phram.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index f756c60a4931..b8bbc7ecbe95 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -415,14 +415,14 @@ static int __init init_phram(void)
 		return ret;
 
 #ifndef MODULE
-	if (phram_paramline[0])
+	if (phram_paramline[0]) {
 		ret = phram_setup(phram_paramline);
+		if (ret)
+			platform_driver_unregister(&phram_driver);
+	}
 	phram_init_called = 1;
 #endif
 
-	if (ret)
-		platform_driver_unregister(&phram_driver);
-
 	return ret;
 }
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
