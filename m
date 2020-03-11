Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D16C0044D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:59:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BC1320691
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tNmDTpZe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StDiSJ50"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BC1320691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X84bByhW0HnGq9YShhmahU3wudC4jCsoSOWHT1XaAgM=; b=tNmDTpZePHSCTMVfKBpo5DUN8J
	NAmBI95OXn+e5xevrt4HfEer/4TSrc63/S3hJyolMMuLaDEf9mKsNhW8zLDSHIc/ywJdTXp9XN0IJ
	xHiIgSFCcMIwcTf581YqY5mbgFTVfjz7Jo5t1Yq8iNF3ErbuqvDDO/XRz3uMi2UpZJG1NvadJA2FG
	5XnB7RLq3VRhB8s8X054fKk5piGAIDnLk5j0M55B7z3iXzYI7Rs605HI+8qGwLiIpHptkexoktj85
	+qJyC9QXyvFdipn6FkiEbvb3yn9DNLeH+h8Az9Jsnoz+2qZlqYFVHpTtRZoCoBnas8H0kRLbyzHQX
	2E8TMG+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC5dU-0006p5-Cb; Wed, 11 Mar 2020 17:59:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC5d5-0006OL-By
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 17:58:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id t11so3842014wrw.5
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2020 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YK/2vS7Mstiu0XU04PxOhSKonXRCAES7bjkmRXDeYXo=;
 b=StDiSJ50IJOWu7yyuj5a/ZUXGOOdq2kydVzliPuespbcRB9e4BhXXJm275cy8fSQpM
 s+dVf3OjRl83zbDYN6JeW+B3/WfFxcQsU6xkb9PKFdadUUcpyUcyTqyTX0Y0ojFo0e+5
 Ay0L4myHKUGEIkg9LcAIO5b10u6jylyqgq8dttKmBAMIG8Rxx4EYcwDI/LZ5w77Pezpd
 /6Pc+ZHV6tTADcG/TwYaEEyVcb+krWOJyiYOh9YV6yV3JSx9rJ5ageMeNGFc1Xu3rT0a
 yUdYgvxESwO12QKckb6qj0rsPh8DZQ6rv1UFF/lhMSW/n0LGCMBisy97yktDaJOpg+o3
 GsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YK/2vS7Mstiu0XU04PxOhSKonXRCAES7bjkmRXDeYXo=;
 b=XhrykmnBfT1Ve/9Zdne5egXDGOnrzKsvqivpGBo8dZn5ikHRkI6722JlK3rHijM782
 bnWwHLNeC11xBRxQ9Rf1DMZx2q35Zqq1NzQFLyDjxDo9J69DGh1HHNf1+U/Hl/v1qz1Z
 52LDdEGyhULlqV4A7Yyi8dgJiaBMjMJWfkWFPwq3Mw4BA358LG90lNXwbgXnGTlhjodu
 VWZjXbOUu3vAvTS4C4B13K1iY2Rkvq+jFy3W5Zzd+EmFiZI0dMfm+y+hAw6301Bab9dn
 NVuvjp5Jva98LmV1MWPpVqnPcAHFcjCnK7TwY9CGWHzndmUCvuY9XI+R3Mpw0fMXR318
 YbrA==
X-Gm-Message-State: ANhLgQ2gvUNfeUPsgWXqNzPlH7Di6AcgmmkyCT4o5uKPrrjD2BUnunz8
 at31V6+ZNMX2MbAXY/bHrOU=
X-Google-Smtp-Source: ADFU+vvrXctaSwNXrtjIZS/3rEInfb66mtIugnEC6+BTOYQsMiH79l0bulJTiJklABS+mW3UqdswmA==
X-Received: by 2002:adf:b19e:: with SMTP id q30mr5566934wra.163.1583949529858; 
 Wed, 11 Mar 2020 10:58:49 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id l18sm1502107wrr.17.2020.03.11.10.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 10:58:49 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] mtd: spinand: micron: Describe the SPI NAND device
 MT29F2G01ABAGD
Date: Wed, 11 Mar 2020 18:57:31 +0100
Message-Id: <20200311175735.2007-3-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311175735.2007-1-sshivamurthy@micron.com>
References: <20200311175735.2007-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_105851_403752_BD785F1A 
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Add the SPI NAND device MT29F2G01ABAGD series number, size and voltage
details as a comment.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/spi/micron.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index cc1ee68421c8..4727933c894b 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -91,6 +91,7 @@ static int micron_8_ecc_get_status(struct spinand_device *spinand,
 }
 
 static const struct spinand_info micron_spinand_table[] = {
+	/* M79A 2Gb 3.3V */
 	SPINAND_INFO("MT29F2G01ABAGD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
