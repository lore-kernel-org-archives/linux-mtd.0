Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3278C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:21:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FD67214D9
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bcj1ENEr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXrdRBNR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FD67214D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yUS5zDkCfj1Th8QzQ3Lv8Txv9U4VQQnGTHUpAGSHccY=; b=bcj1ENErK8MwNpvzYC7zzFtoeU
	MdTvHOI9yVdETa1+G9K+vggoKHGsPe+XemS3asz1Hjjiz7l1v5evRdfwDcL/dIVOWwqU+gpR8QWhY
	5JTtPeGfR6vZUY/y/M1XqvREYQ3mb6v4fUiZlfIQ0bdjR2ZLpwOczBD64lo1VMTL5Z8Ao5ZDnQlcv
	uG+hl9tCVQIoCYTHWYWFv3DoBXUvGutIC3G2nfYj/sdMI5aVVPOe4fEyLJkFtYckdNXztlYHajuSZ
	uVdtYL1ZFTp+ulfnq8cabV39a8l0CJHOFXSZ9FmmBL9Q1y8Q4BnTc2FN7l190rf6YyB4f6yqA3GU1
	EVysaptg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uVs-0006Qn-CX; Thu, 05 Sep 2019 16:21:36 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSk-0001H1-KQ
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:24 +0000
Received: by mail-pg1-x544.google.com with SMTP id p3so1672087pgb.9
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hTEru9Lo54OU309HOwpQ2LAFUsKEGLtu5GnynJbae0I=;
 b=UXrdRBNRv4eBFBI2US9eb56BJw2QFySRmdCdiI/+LAIvG/m2c60c9K3NqHc9JzTcvb
 d8dwqHteqwZIJwmYizpsubVkvO7TeVXDOVTe6aX5zdW2UD3IAtqJ/uiyS9Lx2SPK8Tif
 Ec3qJAS3tr4mZ7bec9KhbwJfgkz2i4i8m38SHu1mvaoBC5wPzGtmlDymSmvre0XS7bbB
 i4Ro8UZZSf2iDGafbRHglF0mzarE9YVWxA+kdHTx/AktvE3YQZ90hkW58NANUCfMxmkq
 vIUoM/uekP6tFp8QDwySUHFho1wZKNrREHBB6M0EcCmSSQ1TR8BMwXKfB/JtNSwWr7kI
 o+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hTEru9Lo54OU309HOwpQ2LAFUsKEGLtu5GnynJbae0I=;
 b=NUz9rMhFKRON1T/V64zdtGa63c0YS4r3AZz6NECGTqfOv+pbbk3Ajj1361ZsfGPsjX
 gCnquDZ6RpW+ulfPpb0QJwzy0UIJ+Rd3fRfgu0vqcIoyxROH4Bqlguqs06Rii/NHe+IO
 BYcxD3JHXBMa+mVN6PevrcV0ZC6Q8jrwu9NpTkS0jc4IgIRtJFwPlcvZPESfJ93jJTHx
 p/ZjExlEGBLNmQQYQ0vj7LGBE9ieU2ToxE4Qb53Etb/dWrfTqtD9Hc4IHIJRSBq0ztBJ
 ywIzmPZZZOd6SAornHYC34SixHvyw5Io03F2H2MF5viLC+WJYVhpv4z+jRRZCqlntc4O
 Q+/A==
X-Gm-Message-State: APjAAAUltj5Qkj+cg3EjOUHJ/D414FyxpbSt44SPw+mVAr4WjVe1Hplm
 +vrawpYe3O66DLHnuRCNUEF8pg==
X-Google-Smtp-Source: APXvYqw5OdtGz9h32B1utEihP+LRew80y2W8OC4yKoEUMG1OkpNOOTrJlR12V0LXuIQ89YtUTd464w==
X-Received: by 2002:a63:a35c:: with SMTP id v28mr3980810pgn.144.1567700301882; 
 Thu, 05 Sep 2019 09:18:21 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:21 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 17/18] i2c: omap: Trigger bus recovery in lockup case
Date: Thu,  5 Sep 2019 10:17:58 -0600
Message-Id: <20190905161759.28036-18-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091822_687031_929FB75B 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Claudio Foellmi <claudio.foellmi@ergon.ch>

commit 93367bfca98f36cece57c01dbce6ea1b4ac58245 upstream

A very conservative check for bus activity (to prevent interference
in multimaster setups) prevented the bus recovery methods from being
triggered in the case that SDA or SCL was stuck low.
This defeats the purpose of the recovery mechanism, which was introduced
for exactly this situation (a slave device keeping SDA pulled down).

Also added a check to make sure SDA is low before attempting recovery.
If SDA is not stuck low, recovery will not help, so we can skip it.

Note that bus lockups can persist across reboots. The only other options
are to reset or power cycle the offending slave device, and many i2c
slaves do not even have a reset pin.

If we see that one of the lines is low for the entire timeout duration,
we can actually be sure that there is no other master driving the bus.
It is therefore save for us to attempt a bus recovery.

Signed-off-by: Claudio Foellmi <claudio.foellmi@ergon.ch>
Tested-by: Vignesh R <vigneshr@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
[wsa: fixed one return code to -EBUSY]
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/i2c/busses/i2c-omap.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 12ba183693d6..a03564f41ad0 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -486,6 +486,22 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
 	return 0;
 }
 
+/*
+ * Try bus recovery, but only if SDA is actually low.
+ */
+static int omap_i2c_recover_bus(struct omap_i2c_dev *omap)
+{
+	u16 systest;
+
+	systest = omap_i2c_read_reg(omap, OMAP_I2C_SYSTEST_REG);
+	if ((systest & OMAP_I2C_SYSTEST_SCL_I_FUNC) &&
+	    (systest & OMAP_I2C_SYSTEST_SDA_I_FUNC))
+		return 0; /* bus seems to already be fine */
+	if (!(systest & OMAP_I2C_SYSTEST_SCL_I_FUNC))
+		return -EBUSY; /* recovery would not fix SCL */
+	return i2c_recover_bus(&omap->adapter);
+}
+
 /*
  * Waiting on Bus Busy
  */
@@ -496,7 +512,7 @@ static int omap_i2c_wait_for_bb(struct omap_i2c_dev *omap)
 	timeout = jiffies + OMAP_I2C_TIMEOUT;
 	while (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG) & OMAP_I2C_STAT_BB) {
 		if (time_after(jiffies, timeout))
-			return i2c_recover_bus(&omap->adapter);
+			return omap_i2c_recover_bus(omap);
 		msleep(1);
 	}
 
@@ -577,8 +593,13 @@ static int omap_i2c_wait_for_bb_valid(struct omap_i2c_dev *omap)
 		}
 
 		if (time_after(jiffies, timeout)) {
+			/*
+			 * SDA or SCL were low for the entire timeout without
+			 * any activity detected. Most likely, a slave is
+			 * locking up the bus with no master driving the clock.
+			 */
 			dev_warn(omap->dev, "timeout waiting for bus ready\n");
-			return -ETIMEDOUT;
+			return omap_i2c_recover_bus(omap);
 		}
 
 		msleep(1);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
