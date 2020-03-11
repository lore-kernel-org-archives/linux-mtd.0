Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C2AC0044D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F12E520691
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OTkaUcvt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiOKpPfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F12E520691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zhibrLwlPY8nEb2Ljc2qq9aboBlZJPJy7gxxq0BIXrs=; b=OTkaUcvtGxMhxHMrzWBv37ENsL
	TajjG0CNEty3smm7XjeMCLrbCHIxnuNZdT01S8fYknaPSj00spsR4lL9SHA8g01neQrMTY7S970jT
	q5r4jY7cghH8hckBkSVjwfYKN3yCQknn1cPZz/hpfqNV32Pl9Yo4MRAdxM72gCoySkr6gqfzRhOyg
	vE2pSvZq7K0QppSvl/Lkzd3PxDFF72jPtNC9t18Z5h8TB9FiESiHjDlzdSnkPGxNDeiVaDkrG8T+9
	UsI1FDXT06c8EfFfL/2+6gf31XTHsSZdkWGqXOhV62Rr89SEX1+UGUYY6rkCwBv+dH+i5rHYWrNX4
	zgs6b40w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC5ds-00079X-BS; Wed, 11 Mar 2020 17:59:40 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC5d6-0006P1-L8
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 17:58:53 +0000
Received: by mail-wm1-x341.google.com with SMTP id 25so3098674wmk.3
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2020 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N4JCBOx8G3oWdvQfPIJ3DTOnZanq5rcB9mg+1By+2ec=;
 b=OiOKpPfuxffO0meppq6Jf7Aci2vKfdixIxWwDO/s/32LA36YZVqgIbf7ssgFJKFtLE
 hbLnhhPrwUOBb+UZ5eYpqi7aiKkS6519Sbfk0Hara2GzdkEKF8NcmbJ2D9ehD7ncd5wb
 Sj1K2kGytTYhIPM2QDs7kfKJ1WtN6iQR2jcmO91n8R9lLJdaSo4LLwwtiKSGQUiTM602
 eVG15XFqU4A+OOHiRcJdpZwdrT4Bg2SuEO4ujsA857Wos8nBQ6FH4vM8UJKoRE6/NEiK
 nYxvfgIxqKd5txo76X34B1xKnkcn40FXZcdAl4tPWBII5jie85W+RFQhYuq7j6OgUJXp
 Opvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N4JCBOx8G3oWdvQfPIJ3DTOnZanq5rcB9mg+1By+2ec=;
 b=gFSujE9ZC6c+Zz0C+xNof3T6nzQ9TEQ0M6As2LDQ8Xk9T3dn1nxL5JejAbLkXrEAbs
 zqj8WL7j3Ucoh+fje2R7muFGhoVgX7bymVNvhtdCdWtNNIkCCQ6LYNZ592Lg5ldPb/uD
 dDxObgmH/YwCD6YVjhBIjwqnMLFsTPMkrWJti9NgL6SLBydr4Vob0uheGpo1Jy9kHdbH
 XBX6VKtWY7svaut/4t5D/dbYOAN7+MiohwOH6Pf2cueMYZig735HW1LB+ksFLJfUU2ow
 aEP6EaWKuOzyeY7KnCIMPI1TvvcpRlJb7hnRcOvDWyrFKSamvr5bWJA1GJAtjcM3ciL/
 vX1A==
X-Gm-Message-State: ANhLgQ2RUBpw4Ck0ZE/LpXbYYQ96ThzG8nYFwVbqVbHwvcgR3CdnETvm
 0IGdJY8FLf79YDuGkXhe/q0oYsRUbBM=
X-Google-Smtp-Source: ADFU+vtL22sild8eFvtwYgKPKknFimV2k5Ei0QwvYbIltnqvbf8st8VU95tXL5IPkETRlRNhO5AO/A==
X-Received: by 2002:a1c:a502:: with SMTP id o2mr4692129wme.94.1583949531131;
 Wed, 11 Mar 2020 10:58:51 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id l18sm1502107wrr.17.2020.03.11.10.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 10:58:50 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/6] mtd: spinand: micron: Add new Micron SPI NAND devices
Date: Wed, 11 Mar 2020 18:57:32 +0100
Message-Id: <20200311175735.2007-4-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311175735.2007-1-sshivamurthy@micron.com>
References: <20200311175735.2007-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_105852_692019_7A61A653 
X-CRM114-Status: UNSURE (   9.77  )
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
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/spi/micron.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 4727933c894b..26925714a9fb 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -102,6 +102,39 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M79A 2Gb 1.8V */
+	SPINAND_INFO("MT29F2G01ABBGD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M78A 1Gb 3.3V */
+	SPINAND_INFO("MT29F1G01ABAFD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x14),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M78A 1Gb 1.8V */
+	SPINAND_INFO("MT29F1G01ABAFD",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x15),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
