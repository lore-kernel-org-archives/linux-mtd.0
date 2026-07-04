Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA06C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLv682IJi5oesb1KFA4dkuiE2RUEgnS0175UBCSEj1Q=; b=s3Y6UNBBoZknRm
	/EOo3sJWl+TJFCJtZBdeFu2oiP9mTiGGs3CKJxsYo1BOiN3y5SLpI4E/OQC5dSydoqeDT2N/4JqDj
	aYgr8Pgt9X9Jfv8+DWJsqgREJDdaWTODdOFFg+8My8t30QcXhDrfXQ2z8RS2wYoWTNbVCXJQ3y0WR
	LNeoJlESvEny2v1iO3qbl1WptBaDgSJGhs1ipdzNbmn75iYg0qgFgvBkeZD+hBuH4g6SWsKDSv2YJ
	hA/uY2Vp7g1pVgz4Y5VV0NzpKSs7FPpw5dogyGLiifYzR7vTorIzBcIeJByreGAFVoUOEBteknqCg
	Wkm+utGDcdObOfP1VK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOU-00000008Cbi-0Qxw;
	Sat, 04 Jul 2026 05:58:26 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftOJ-00000008CLb-1xA0
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:58:22 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso466428a91.0
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144694; x=1783749494; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/05hwWd8d+nbJ2K7TsHjukJa8IrGxWrR/Hgx1jL48II=;
        b=YaFZ2gvCpIV4M/sHwyAKHjvterkHbB3eb1bdKkbsVx3Zqw69RRpljJrUL+NkySe9FV
         yudjltSorGtYIitaV6l5qQFgBn6xCkqB8OzmwATvIQC1tTRtUF6Pcc7TuanoW7anjS9P
         NvBEejcjrT3N57EAoIQNNdNZZI464a6+Nj0gHa9iiXcmlaB4uEuToj+cyz1nNaRHqDGw
         pQFkLSgaS3g2NtiVGZQgry9l3jLOnXZc5X/Y2rFCp0kNM+JwrDS8BygKvcZojeCGy2iT
         k/mmh6vNvNkQK79vCPAIOo4o8Bh7v3Tk3dgUXut0hhOTYrqSrqLayvQgQZ9KDBXo5I38
         a0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144694; x=1783749494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/05hwWd8d+nbJ2K7TsHjukJa8IrGxWrR/Hgx1jL48II=;
        b=bgROLetuJ87VbLmzaXZsjMYUBfFwY2XeqJA7dQgPzMn50yYJRA/dwVVdFqG6R9tlDZ
         NTYzd0/pcZMwKaKZIJJ00G9fVRDmBleOjmTRYBJ+8rmv7doJoImBVl1q99eFVteqf+/6
         FOPP2kLS1Kp9vV3z6N2+JESTvCf0MkMstGB10RQy15Bc1T3mgUt1ZUOGnDDlyUpiasTC
         wuqYpif0beOQ/vqbziIftN8mBI0XZD12oGoIZXbbsECHaQvYrr1Jhz4lWwit4P8FPawi
         kA3uFmA/fr08PrxtqeLe24uIGKB2eo/n2HOj0Z0L+EpfZUrv00XUA9ziKO8Tdq3lohjA
         O6kw==
X-Forwarded-Encrypted: i=1; AHgh+Roblul/s6+DC6rHOH63vvAUOtQ5PWa7iRWmoTL4U9lDg67mlDvTmj94Rm/vRHuDSflaOZRlLertfKE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcj934qJKJPjbwhJoGVo/EjwzAeTw6/rFZHvlAP+HGIxmjp+vu
	KnC0Nnnv6XeUJhY/PaIoTwLEivnqlkIsvm5Yy2zyZzBj/sbJ7Y48gRX5
X-Gm-Gg: AfdE7ckSfUPXw+yhdmhes1RNaDKnBerJ2Hhm7gOMoIqVqyISV4d+FvyczVYYiefDoCD
	frncOJoMEZKwMeeFbL5+QOmGWtMMuo8jK2BI5kt6w020LUWdbZRPiB/pLPt7SDDz3/wAMxoKZbZ
	KX0xA5quNn21rp3hwzhzS7XhAHpme9sCVDcVeLkLKNxfzVALWijwnTPxvFWbBUl67+pg+FTByUA
	FsPc3+cQsjjYnV1CMHVFD32UjicMK2acDAAuuC1cAnmIj5QU7Kv7+LxTBYVzUcs2LgmP6sdxoER
	Q4dwPewBxw/ZCi0dseuZi+arajIN5/itchn9xRGDiM8Y73t6kl0VqOFpvsJRVBtYcelLW1zgweE
	Dzusx2vhw0wEdSCmND7+4NCklxGJtc4OWemnxO8uKxk6I1cWkBZ7hZsmWpCQx2HHUEJrKHfBqTo
	53rxDJAFTFrPiRBOMyH+hYBCBUwqs7uvAz0BtIqICNbz4xNrFFZrO8eA9SU+2IeAOoI1XQTYb5O
	4I=
X-Received: by 2002:a17:90b:57c8:b0:382:1cf1:a0a6 with SMTP id 98e67ed59e1d1-3829f5eadf7mr2306393a91.24.1783144694449;
        Fri, 03 Jul 2026 22:58:14 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:58:13 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:48 -0700
Subject: [PATCH 25/26] Input: maplecontrol - fix style issues
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-25-41e424964da5@gmail.com>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
In-Reply-To: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Florian Fuchs <fuchsfl@gmail.com>, 
 Adrian McMenamin <adrianmcmenamin@gmail.com>, linux-kernel@vger.kernel.org, 
 Dmitry Torokhov <dtor@mail.ru>, linux-input@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_225816_972939_F1D270ED 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

Fix coding style and formatting issues reported by checkpatch.pl and
switch to using BIT(). When reporting D-PAD events avoid conditionals.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/maplecontrol.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
index 3ef6652d40cb..457a73d91239 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -35,22 +35,22 @@ static void dc_pad_callback(struct mapleq *mq)
 	buttons = ~le16_to_cpup((__le16 *)(res + 8));
 
 	input_report_abs(dev, ABS_HAT0Y,
-		(buttons & 0x0010 ? -1 : 0) + (buttons & 0x0020 ? 1 : 0));
+			 !!(buttons & BIT(5)) - !!(buttons & BIT(4)));
 	input_report_abs(dev, ABS_HAT0X,
-		(buttons & 0x0040 ? -1 : 0) + (buttons & 0x0080 ? 1 : 0));
+			 !!(buttons & BIT(7)) - !!(buttons & BIT(6)));
 	input_report_abs(dev, ABS_HAT1Y,
-		(buttons & 0x1000 ? -1 : 0) + (buttons & 0x2000 ? 1 : 0));
+			 !!(buttons & BIT(13)) - !!(buttons & BIT(12)));
 	input_report_abs(dev, ABS_HAT1X,
-		(buttons & 0x4000 ? -1 : 0) + (buttons & 0x8000 ? 1 : 0));
+			 !!(buttons & BIT(15)) - !!(buttons & BIT(14)));
 
-	input_report_key(dev, BTN_C,      buttons & 0x0001);
-	input_report_key(dev, BTN_B,      buttons & 0x0002);
-	input_report_key(dev, BTN_A,      buttons & 0x0004);
-	input_report_key(dev, BTN_START,  buttons & 0x0008);
-	input_report_key(dev, BTN_Z,      buttons & 0x0100);
-	input_report_key(dev, BTN_Y,      buttons & 0x0200);
-	input_report_key(dev, BTN_X,      buttons & 0x0400);
-	input_report_key(dev, BTN_SELECT, buttons & 0x0800);
+	input_report_key(dev, BTN_C,      buttons & BIT(0));
+	input_report_key(dev, BTN_B,      buttons & BIT(1));
+	input_report_key(dev, BTN_A,      buttons & BIT(2));
+	input_report_key(dev, BTN_START,  buttons & BIT(3));
+	input_report_key(dev, BTN_Z,      buttons & BIT(8));
+	input_report_key(dev, BTN_Y,      buttons & BIT(9));
+	input_report_key(dev, BTN_X,      buttons & BIT(10));
+	input_report_key(dev, BTN_SELECT, buttons & BIT(11));
 
 	input_report_abs(dev, ABS_GAS,    res[10]);
 	input_report_abs(dev, ABS_BRAKE,  res[11]);
@@ -138,7 +138,6 @@ static int probe_maple_controller(struct maple_device *mdev)
 		return error;
 
 	return 0;
-
 }
 
 static struct maple_driver dc_pad_driver = {

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
