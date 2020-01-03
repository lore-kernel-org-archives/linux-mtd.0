Return-Path: <SRS0=eEUd=2Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EADC2D0C2
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2020 16:15:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355E1222C4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2020 16:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VHUdcJew";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="r2+SFDR8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 355E1222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sartura.hr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Nys5noNqjDpYMse1DIHulcANlWsaaXwAL3lkIfKzCs=; b=VHUdcJewj12hXg
	hsmJHiDD7Fx7KB7L/tXFZMeTJOnkx/eCTCbR8G9QyV6DY5OIWOM/qO0icEMmFgK17ccIhKagPbEyj
	SUvaBkPQHdmi7/bV/mWJwWPi75fxeNbJC4zqy1rnhxs/FuYH3biqE3zz1ey9UaQ4DeN23QXbq0BXI
	/nJng9KVVatTa330HG4OGuHuvUcwkrbUioMynRz0XHYr+f2V85vqyDh1Z/lZP57aMo/njaYwZCQTF
	O7wKnSOapQbBMDieCDeolS1EXeERwy4K1N07vjfeSpMbDMI6dGRJD4ylzf1jJkJqkqwSs60YHKIac
	ZjcaxLIP8nxrhGj7rohg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inPb6-0008DK-2Z; Fri, 03 Jan 2020 16:14:48 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inPb3-0008CY-7h
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2020 16:14:46 +0000
Received: by mail-wm1-x341.google.com with SMTP id m24so8826136wmc.3
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2020 08:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CKbRCjOOwdLh1yVcOlbcmzQEg9P0OE5UwhuLw2Fw3o0=;
 b=r2+SFDR8y4ptf1nzWdJHicK454WAO+ZURDmX8Fm0TV3OlxsdY278rTnS8ab5MgB0/F
 8A3wvmqcm2yms1hXyltbcyoRHx6nGpJiyW8mLQ88lc/gd/DcTG0jjAp/MQLUxeXwyZG/
 jkMohj5auYfPrNN27M+TjsXYjDj8YTIUAqoVeQrmOMJZtbQluORXTc4E2emnZMj3GD7w
 zZu/T9YR/YA+vHcWYDUSVK5aMtNYcj+4+o/YBVKOVzgsMQFH3LMt2JkXyKWwKNbJFJei
 PN4DyIyDdVLa0gFNGT/WOrDnjga55DeAUUo9vU3LIG6HDZVG/W7s3Sa36d+aElDcYtbV
 GIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CKbRCjOOwdLh1yVcOlbcmzQEg9P0OE5UwhuLw2Fw3o0=;
 b=NixQb/C0J73WwPEFhyvDkOLXBZZ0CIUHU0HsEqY+QG6OSFIoVKZQKZZJ3FeOLWQn/2
 ccIx9DZNdAL6OT5qTaTLe3Notffn2lni+gFoiKKmgsMDqXJhg3lK/CH/Ec0EjtMtzfew
 s2Hj82pdVJkq5CiaRuV/GmB3+KBw3jUe35ATrvLbL16udVKeXQiDQKnkEY9FVB1maqpW
 8dazg9r8Cubqb8GU5FPm/i8WN4hXoN6RH0lGyA3hWyGXFDlgT145DS0mhL8Exud116CJ
 kUOS3gN9SHfp5Cz/xFjL8dhWzyLoLLC0ll12lkuHMoUF/dRxnA0iDQxZMA6zxfkhpkOI
 9tWQ==
X-Gm-Message-State: APjAAAUCs6nx5erPYwn2tYMulRFtfESdmO2EyvTqHC5SImjTSDeJxx07
 48zCqfRuw4OSjDxhqzdCliZO5w==
X-Google-Smtp-Source: APXvYqwJZEd3ck/IPdXbCAR62mzzm4gUbbUuJ15UsaS7VnpLSgW7BUW6v/ScIjGbFU680d86uLL21Q==
X-Received: by 2002:a1c:5444:: with SMTP id p4mr20162315wmi.33.1578068082239; 
 Fri, 03 Jan 2020 08:14:42 -0800 (PST)
Received: from localhost.localdomain (93-137-233-153.adsl.net.t-com.hr.
 [93.137.233.153])
 by smtp.googlemail.com with ESMTPSA id u24sm12698363wml.10.2020.01.03.08.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:14:41 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com,
 frieder.schrempf@kontron.de, bbrezillon@kernel.org,
 tmcmc-mb-yfuruyama7@ml.toshiba.co.jp, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: spi: add support for Toshiba TC58CVG2S0HRAIJ
Date: Fri,  3 Jan 2020 17:14:27 +0100
Message-Id: <20200103161427.2630067-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_081445_322909_5D0DAD04 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: Robert Marko <robert.marko@sartura.hr>,
 Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Toshiba recently launched new revisions of their serial SLC NAND series.
TC58CVG2S0HRAIJ is a refresh of previous series with minor improvements.
Basic parameters are same so lets add support for this new revision.

Datasheet: https://business.kioxia.com/info/docget.jsp?did=58601&prodName=TC58CVG2S0HRAIJ

Tested under kernel 5.4.7.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 drivers/mtd/nand/spi/toshiba.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 1cb3760ff779..0db5ee4e82af 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -124,6 +124,16 @@ static const struct spinand_info toshiba_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
 				     tc58cxgxsx_ecc_get_status)),
+	/* 3.3V 4Gb */
+	SPINAND_INFO("TC58CVG2S0", 0xED,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
+				     tc58cxgxsx_ecc_get_status)),
 	/* 1.8V 1Gb */
 	SPINAND_INFO("TC58CYG0S3", 0xB2,
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
