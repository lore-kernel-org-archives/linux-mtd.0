Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F1BC25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=utEbZ85CUvtUwAwcrmshZ9UDUyzIulNHACba3acDnlQ=; b=TBVwcpRvsOpNFmCSPKxxeXtP29
	sIxtlfOkfjhNCmUTcIHE7MwIdaVon6E5e9tv4SwxUI2mZFtu9D4xD92WMRdCdnoOmDMa3oAtmgMcm
	UYtKxZsjQY5YL7/LPSGdNVh8aIKGrT6gVDJdTioK+QiCpaJRSbNuClgeSn3XLp5uw7ExoOcmJjqbz
	O+7Jrd6VOL5tMN+LpNiz+KNvF1dUuSMIiDo+ayRunXSz/XH84xMTwSSlGsJVEqGOAWpgoj86JVU5D
	2nBgm84RWD/9ZHU/n7uZ9bbPWP5sJo4/U0HunXS6AfyWSyG1yyzNtNiRga0GOZLnkjNVSllq85QY4
	3qE+NI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyY-000000074i1-0K4V;
	Wed, 05 Jun 2024 18:03:06 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyP-000000074Xh-1omR
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 18:02:59 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-627e9a500faso436207b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2024 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610573; x=1718215373; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDI8h7ZoQYy75CqD6I2McYIto2hpIA5emU6fq1I3LPI=;
        b=Yjbi3QJZibdkUbW2N3vMMC1ImMtHZv/d3JfO3j+oCvyP/qglVa+uAZWcBkmHlryH5c
         KcPmcdbGEVxC6SMPM8PA9mpTSlW37t/Mxb3injMfRd2pJ1QFf7DmQgv+k2GJBDrk7dAp
         tQw4HQpa5I9SYXAptjJtuOdl0I+0Dn0HqaX5jPuS8L9xKI69cWuL7awMsweA/9k6yg3Q
         AsINBnzLKdg9r+nXdzwMCBdTaSVlgaHRZUx5IMhCE8KXHfKxppzjn/CDJksoCUA3JaPf
         If1lkhy6BHRL794wjNU/VZghIWrg9TfOXsS6xZqJcNfrcVChYeG7jMnVNmJGHk5YH5EW
         q3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610573; x=1718215373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDI8h7ZoQYy75CqD6I2McYIto2hpIA5emU6fq1I3LPI=;
        b=hJmfr02WVa9kvCX9FILpFz22KYcfPcqI0u7k6s3zfH5/F5OWhSiaZCmebTXX/PuVkF
         lLaTt/NGNvQQxNcsuOJJmsQSQfQOiYJi4o+NSj9Jsu3qJkJUnEfhunLaGWSIZ3w35yOG
         76s8dcLt61MwreravgnmmK2S3BtBaFvANMv6d7bH3DbRr2rouI108L7bNi8fDaL3WHuk
         INDdHJ1DQrkCYVj6FE+u2gPDkox12TxbBy8AMlVpHD7e4W3hjEpqldzqPqD4/KHmU+2M
         rihzN6BfrPZnj4JE4OqHpyhl4UqDszy7YwB04YE0MA8Ui/31yYFrrdilDUUOueTnjX1J
         ChVg==
X-Forwarded-Encrypted: i=1; AJvYcCVhjfLgIKwpysRlabL0ImWwSYHtJ6MSWs+gznmrnoJKdWd96eqvDihCDMFA28OSiP7fhprJ6GOGOJ++AvA9WQMX8HbkwNWn7nJD5iIxOQ==
X-Gm-Message-State: AOJu0YySxY5SMJUFIMustpznpFbTJYOYpqb9mz3k74Vbbu1NqylczLtP
	/tkZt2hg/78u60O7uYqfSfsyiGzsoiiHGZ7y7DHNW+z2EzSSmPlB/71MLrkSWoYxCCEVAzK+skO
	XAGuzlhp1Hg==
X-Google-Smtp-Source: AGHT+IHsHtY+bAgPNOkcmVi64EeRKQimO371NMHALyHppPPqEXYX97pSerbED4x3JFp6tor3148MLJe9OAqS8w==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:39c:b0:627:96bd:b2b with SMTP id
 00721157ae682-62cbb596fc6mr8780427b3.6.1717610573043; Wed, 05 Jun 2024
 11:02:53 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:33 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-3-joychakr@google.com>
Subject: [PATCH v1 12/17] soc: atmel: sfr: Change nvmem reg_read/write return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_110257_605133_D8B2185E 
X-CRM114-Status: GOOD (  10.79  )
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

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/soc/atmel/sfr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/atmel/sfr.c b/drivers/soc/atmel/sfr.c
index cc94ca1b494c..c1c8e59cf6fc 100644
--- a/drivers/soc/atmel/sfr.c
+++ b/drivers/soc/atmel/sfr.c
@@ -20,13 +20,16 @@ struct atmel_sfr_priv {
 	struct regmap			*regmap;
 };
 
-static int atmel_sfr_read(void *context, unsigned int offset,
-			  void *buf, size_t bytes)
+static ssize_t atmel_sfr_read(void *context, unsigned int offset,
+			      void *buf, size_t bytes)
 {
 	struct atmel_sfr_priv *priv = context;
+	int ret;
+
+	ret = regmap_bulk_read(priv->regmap, SFR_SN0 + offset,
+			       buf, bytes / 4);
 
-	return regmap_bulk_read(priv->regmap, SFR_SN0 + offset,
-				buf, bytes / 4);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config atmel_sfr_nvmem_config = {
-- 
2.45.1.467.gbab1589fc0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
