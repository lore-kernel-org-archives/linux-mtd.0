Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E3DC35247
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 20:25:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6955021927
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 20:25:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D40xcngb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeYNlxjz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6955021927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/oeQOCUR3H7PryJqMJXjxY/f7aBXxkeparTVfip1tbQ=; b=D40xcngbS/YSAwEDaxog2SATmj
	Bows+s3dp2LJTF5Yn41ARtX1F6vKkgghbimrnQX4Yku+iT6/LiUl0YXeYbV7bq1ETyHYaNB/oLwQT
	Vz0/q9h9nxjiYuPZsF8HL1telgK46hwtMPMQx+hMlZ04HKY0qXXq8GUJjbhfS2pIGvHN2peIb99xs
	hIE46b+BaiT5IPzr6dGdk5sgthyYxJRgU6qfVjACT/OAYoZvo3k6+nDgKeQwmwFKvZ9hrvIT4eRFH
	zyEtv9g00U3Dgrs06oFjL4qDCeDu30cVnRkLSO08Ewlt1xvIEmYxA6/fwjwplw6jiPWJDPbK6OFVP
	VOgYPlSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iznhl-0007Bc-ST; Thu, 06 Feb 2020 20:24:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iznhS-0006k5-Ux
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 20:24:36 +0000
Received: by mail-wm1-x341.google.com with SMTP id t23so267133wmi.1
 for <linux-mtd@lists.infradead.org>; Thu, 06 Feb 2020 12:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WK+KzBfTuQqE2Bcx0psUGki6jAtzDkPOrrhY+kNzNrw=;
 b=CeYNlxjzHtIWZg/vY47dPxarMHCWklh6vMfP//hs7swnQZfcEmSvk7siiadZno6el+
 cY92Zqet6v7EfYdQIPJClnI7JqiMm38lY1E/mm/WLEXEIjnvmec4OFfzFG66rRaySZRr
 LgzRakLQjea3vek1U7u4Lb+YvTh80JeaLtDxMZXFQnqBuDPV6GQCT+IUzRB1YIueKr6b
 p4WdZ/ESKPVBx93tVok4cW2zrqhfAapALEnSeWgYqYCCo4Lu124nke0C6HtHAs4nqHSL
 BEex2iyuVCPz1mAg8+6PxuFF/BbJfL68ktSu/TuYYu8NXAqdfZ2ExGRhHbm5dLmfIiur
 MI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WK+KzBfTuQqE2Bcx0psUGki6jAtzDkPOrrhY+kNzNrw=;
 b=AS2193+ZgWdMZYNEi4wPgwZT3K0gfFLMXp8VjaFIWQ1as+j+kP3Hwyj2VILWwY+AuD
 S4Ug5b8scDivpDL+/9hi9H1QgUrf8DHnx4ETXKKskODoUEeHOV5qin0ssKzQ9nRCpOC7
 2svHmzxJAxa3CmN09hDuEzvQ3oSc56YOFTwEqT55bUfR580U6VrlLCy7Q1mV1s70VL5/
 xCV2V/SnPGxSEIVUHmoS+7HTcnHqI3gHCyo1lJlMG2V/fH/c7zwzvTGi9Ji5bCneECtS
 7J5W/umFnH3yIqAKAf8/7hmYN/6T0Vx8OQ4x9PUn2XDeRv48xx4WGmb6SV8WhrQ6qf+v
 sLAw==
X-Gm-Message-State: APjAAAXlxuG+suJ1q3vv29eGwdq5LaYiutSxsK8E+PhV9COlrFf5Hvcv
 6i3Fab4sJHBiWrlts3W/qiA=
X-Google-Smtp-Source: APXvYqwJHnB1/JUbJWR3PS09nalAM3wop5u4zJscsuPs6GYDb2BIyh1yEJhadIt0O2IBggxqTKYnGA==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr6356293wme.82.1581020673255;
 Thu, 06 Feb 2020 12:24:33 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id c13sm539929wrx.9.2020.02.06.12.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:24:32 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] mtd: spinand: micron: Add new Micron SPI NAND devices
Date: Thu,  6 Feb 2020 21:22:03 +0100
Message-Id: <20200206202206.14770-3-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206202206.14770-1-sshivamurthy@micron.com>
References: <20200206202206.14770-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_122435_018387_68A9623E 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Add device table for M79A and M78A series Micron SPI NAND devices.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index c028d0d7e236..5fd1f921ef12 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -91,6 +91,7 @@ static int micron_8_ecc_get_status(struct spinand_device *spinand,
 }
 
 static const struct spinand_info micron_spinand_table[] = {
+	/* M79A 2Gb 3.3V */
 	SPINAND_INFO("MT29F2G01ABAGD", 0x24,
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
 		     NAND_ECCREQ(8, 512),
@@ -100,6 +101,36 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M79A 2Gb 1.8V */
+	SPINAND_INFO("MT29F2G01ABBGD", 0x25,
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M78A 1Gb 3.3V */
+	SPINAND_INFO("MT29F1G01ABAFD", 0x14,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M78A 1Gb 1.8V */
+	SPINAND_INFO("MT29F1G01ABAFD", 0x15,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
