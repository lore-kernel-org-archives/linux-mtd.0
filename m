Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BCBC3F2D2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4173424699
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hvA/pecx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yt7bhk+E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4173424699
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HHTyvKu7EgXUwjrQfl0KoxUVzyGFTLN6sx1aCjueD6Q=; b=hvA/pecx1zor/ib/LFtNvKLxvF
	D6Gf04H4SzQK0vof4hCAmwxUdc95UhA5ImXrKMUD3weNxcqXecljDilCT2sRpgmthNxsbqXbVzp4A
	Lj1Wv3/aX51XAHJpzFCxxLD7NSf1ThLMXeVvDWLWitf7o5mkpguNbK1GlihFGzeepGsDfUaRdTiJ4
	wvALPkqE4nfQRuIekvvSXVMCX3XEgVfEjXsPVgmKoXT2ZfiVfcLmZiE/ar8XEtTlCJBxSNs/QDzsK
	mNX61DJlbfLzR7Iqfa64Epv3AhJOmS8Ch4iJqNfXv9/vyj79PX5hJsvNsnbn2Nc/zsEN/jpxuyeW0
	0HC64cYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7hBy-0003h5-Bk; Fri, 28 Feb 2020 15:04:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7hAo-0002Zc-BP
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 15:03:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id a141so3532258wme.2
 for <linux-mtd@lists.infradead.org>; Fri, 28 Feb 2020 07:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7lXgaGBU6RYi6U6zxTiRxw0HA/EAYgc0JnTYQzLHUZg=;
 b=Yt7bhk+ENJ0+20JWOjeP07IHp6/l2GaI7OAAmy+wWxJelVnwHkVGJEeZKhp3uMOAlo
 q7h99wMHcYifGhVKjZhcHS7SYPprreZHm8Q3WirytJbBe0/7tUf/VgSxoc0wD3QUF2B3
 LHQOMgRrZ1/p6hxjO2YLEbfCLsMjt/JSF1UkfMCHZoftUoace7tMq75YF87sa+5HgXvG
 0qKH+Hf19+P3rNRPfgE6W9uFhs4HSeBO9Ce4teUIvWj+dfrdCJHpwlhan5hQapuM6/Q0
 K553+xHU/CCwaqg8NbCI4TRp2Jho7GJnz9W+XeqPGLEFu25pjo3BZllZcafRCLI6vg0k
 6KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7lXgaGBU6RYi6U6zxTiRxw0HA/EAYgc0JnTYQzLHUZg=;
 b=R+hhJ3h0d7K+1sbj1YZduR+m07eWubWDGr4oDRdpzU8uVBZ3PFFW//5m17BtqR1u1N
 xHTLjT2v2dylaFb32IEgMo4FlukylBEMJHTy7cKfKo3BW5Fj2XilxF7QGbdstGjk6dJg
 aVP0TQK9vUZkPDkPid7WFEJS80n8/doNHinFQW5m0nSG8LDQ9sdT1OYcz+6CcwYf1PBY
 qE5cTl6NAvDiYAXsKpEVBUVtZ3rnILD+r5UWGGmngK/FAw2+9W0xRYCyPZlb6xMVtt2F
 Qbo+aCd56nRHPGklFE26OjYL1W8pYRqeGjr9lhWgrG4VaWebcEhdqE34gooUSpcqrVte
 gPrQ==
X-Gm-Message-State: APjAAAW2KFsq4cpkVA59SLBR+d/pEIgSroBqApuzNtOD9eM2Wibh8Pv/
 N/HFCHVSi6++iuckSOBOHc8=
X-Google-Smtp-Source: APXvYqwLtcbwsuxCNxlsNHVIzG6exxjFIwXn6oqPLoldfp0vfOpewiIda5EYmi6CMdBe26/w6qJHWQ==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr5182676wmb.0.1582902208311; 
 Fri, 28 Feb 2020 07:03:28 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id m125sm2540235wmf.8.2020.02.28.07.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:03:27 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] mtd: spinand: micron: Add M70A series Micron SPI NAND
 devices
Date: Fri, 28 Feb 2020 16:03:10 +0100
Message-Id: <20200228150311.12184-6-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150311.12184-1-sshivamurthy@micron.com>
References: <20200228150311.12184-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_070330_409830_2AA4D8A7 
X-CRM114-Status: UNSURE (   9.57  )
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

Add device table for M70A series Micron SPI NAND devices.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/spi/micron.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index ff0a3c01441d..9db1ab71fcae 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -133,6 +133,26 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 3.3V */
+	SPINAND_INFO("MT29F4G01ABAFD", 0x34,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 1.8V */
+	SPINAND_INFO("MT29F4G01ABBFD", 0x35,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
