Return-Path: <SRS0=nDBX=5X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F60DC2D0EC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 20:57:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C33F20730
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 20:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFi5598n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="mIDQq153"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C33F20730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w4033Lo90Ay1JeCMGx8q/b2hPMRnhMgCf6PN1mBgPDk=; b=gFi5598nOesclC
	p2I/XGmTWkCJ22SwsMKgzCQockI3jKKFc0O2i4Er/keL+sWhmo4U7X0afV/g/NFMKMUTbz3FKdVtv
	oe53EuwRm6ibrLcVnDY5UrrKU99RzAFTNj/+W3HbXPLTa9fSiyz+pPsz+lPvfTkt1uwSv1tK5+bpj
	W2L1+zfHt6YTozfp/Ud9QZGZf9VfdiESkXFPFhBSQOkmRbybijl01wVGxAq288pnKY6bk8DFKnW4H
	xDxsFgFHG2sqv4V4Eo06kvKxJ8A84QMh7Yfr4BgTbMeQA2mL1G5isnTV1+tMr9efyxdkORzHUxVVV
	S6meyziPqfUo59Dl0EQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLvHC-0000mM-D9; Tue, 07 Apr 2020 20:56:54 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLvH9-0000lb-7w
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2020 20:56:52 +0000
Received: by mail-lj1-x22a.google.com with SMTP id k21so5350776ljh.2
 for <linux-mtd@lists.infradead.org>; Tue, 07 Apr 2020 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=8E93RqiJT1IY400var7NpMxIbsOq13mEa5fUe2tKz8Q=;
 b=mIDQq153Gmp6hMrzCiAqGZH4sh0kuCClO4pM6pdKeq6bCxpLLXK9tJ/vw9Ua2TZGgH
 v0TSkbyRzPsvv4eN3Dy+7Wo0/pAsItVsJ09TuksydQBiMspJDFVDKKAQWt2/aw6+YBjh
 032uzwKzQmxgodRrLijDrRU/R/ywQv2/DUACKc80m6Wqnxv7xiiFYw8pCvlV/JZDbL8+
 qGhRBqeP6soe64iWJ6fkdfoOEPLXGY30WGkakc+JjO+u/umEPlrRB4WYLz16t7M5r2N9
 QRh8wlIl036eiPbK1CWWYlLw+yudVVnL3Separ+7uZS1TpN4AQAcF51URhG0SSt6FeMB
 IiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=8E93RqiJT1IY400var7NpMxIbsOq13mEa5fUe2tKz8Q=;
 b=pKbYNNl2EQPJsSlUvT7sU/hQmGRwNpZt87fTYOe00/Qzlu+usoXP3zHJEhJ0ctkldQ
 0LTh4JqcdbGR+DJ98XNyoA90r5aBuqYlgAedaHMy5PCDOZpYQL6VSdenn1kXyVsWsmcj
 VP8+RCIGBXEXv5dglhHu/LfwJEqQdH9jLH6hYff2UQM7kRBL4RJVQUHUvl8tPdK83ul7
 LVKw3kNlGm27CFTxDtpTIh/ZJFY+0PvhugaXta1TDWR3TrqxDDHo580qcmwVBhN9bHi6
 odB4vhfxDOfZjp9Ub0n79gKb8L738jdmHVvSC0OT3dUVS/uFjubTdxK9DS+44ExypX0m
 SUEg==
X-Gm-Message-State: AGi0PuY+2QhDI8k0AZEg+PRHgOxDPU1CBYlSufrpfa9IPJ0erALddqTB
 MXyp+xN1Cn3BvjKpYbNrzJAnNw==
X-Google-Smtp-Source: APiQypIY7Icxm7M6C768LEBnjwJ6UhkoKdnoF2cESvl03F/BD7+QPJnSCGmRzQEMDQREgguEdTMQLg==
X-Received: by 2002:a05:651c:200c:: with SMTP id
 s12mr2666235ljo.30.1586293004846; 
 Tue, 07 Apr 2020 13:56:44 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:44c8:4ead:6627:2c4b:d1ac:b6e2])
 by smtp.gmail.com with ESMTPSA id u4sm12152339ljj.44.2020.04.07.13.56.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 13:56:44 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] mtd: spi-nor: move #define SPINOR_OP_WRDI
To: Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org
Organization: Cogent Embedded
Message-ID: <9f654612-54a5-41d1-01dc-8196f334bffd@cogentembedded.com>
Date: Tue, 7 Apr 2020 23:56:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_135651_282160_3BBDD641 
X-CRM114-Status: GOOD (  15.03  )
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
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The write disable (WRDI) opcode is not really specific to the SST flashes
(anymore?) -- move the #define to the main opcode group, just before WREN.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is atop of the 'spi-nor/next' branch of the MTD 'linux.git' repo
plus 5 kernel-doc fixes posted last week...

Changes in version 2:
- Fixed up the patch description to match the code.

 include/linux/mtd/spi-nor.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/include/linux/mtd/spi-nor.h
===================================================================
--- linux.orig/include/linux/mtd/spi-nor.h
+++ linux/include/linux/mtd/spi-nor.h
@@ -20,6 +20,7 @@
  */
 
 /* Flash opcodes. */
+#define SPINOR_OP_WRDI		0x04	/* Write disable */
 #define SPINOR_OP_WREN		0x06	/* Write enable */
 #define SPINOR_OP_RDSR		0x05	/* Read status register */
 #define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
@@ -80,7 +81,6 @@
 
 /* Used for SST flashes only. */
 #define SPINOR_OP_BP		0x02	/* Byte program */
-#define SPINOR_OP_WRDI		0x04	/* Write disable */
 #define SPINOR_OP_AAI_WP	0xad	/* Auto address increment word program */
 
 /* Used for S3AN flashes only */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
