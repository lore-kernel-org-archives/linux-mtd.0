Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD1CC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 15:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zkYGyAQuOKZBI0PpfDcm0ksNJGqNDKkbbDy92XXCm0=; b=lYdImf7Y6Mkxz9
	3RTRtoBLo/5QYZnYqSWSMkEwyV1wj2DrQnYR2xHdjkGt8yGYbGZ3PgkdRnrx6Pm6boMOn6HWF7Cz7
	+wkvQDBjHBGu1tXU2gYd4ts5VuBUqrrdrJlqvs0coo4J/ijLKqNAJdnlktBSFl/63UxBcuhTPmXhW
	F+/phxCOLHvsh5d5i4EVGheAsYVngksMXWUrIOggsuXrKC1ywjukyJZo5z/SPYUKEJ1YxKDiG4gI5
	M63gkx2k0c9CN/fVDFdAnxGHLGsAPBcANYf6RtB5GQ9O7KW2wtdAc7SLgTh/cSSfa1QGHjqpDbfsn
	4l0qmHGcaiViPDUU+Urg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVzp-00Dezk-1A; Wed, 16 Mar 2022 15:55:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVzX-00Deu4-RY
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 15:55:17 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so2817243pjb.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2022 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TguvRSq9Uu2G86yRoz63evaiO4HI8reTSU45QiNijTg=;
 b=BE1xikM69iSlUQAxTnK4SKfT6oPG2KW744Z9Kjk/z3FrO8y/vl19/AgNqSPBtP7LUd
 X/6c7dOVdQxr1W5sCJt/qLV5kLi32ECgWXpVrmLsF8s4V1pgpKKCVpNWfJcutnyBVLen
 5j7XmhFzmi+uI1Hv8qeJyg361Da1hGmwS8yFJWApElmK00eWlOEdmd/a/bNbQejb+Qfn
 OJF6dj9bUqeML3LNaFcVwk0pinJEXU2c68lC3pHpzjuUa4i6YEBtgVNkCh40euv0nm5q
 t/rfgQIS1wy9Wv4HEAKQMBhedLrIMSd34MZtsaRXB072GHFires2rmjoCvmz+n0+ZkH1
 rrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TguvRSq9Uu2G86yRoz63evaiO4HI8reTSU45QiNijTg=;
 b=pml20M8Dzw4iPrg5pA0QEgMnO04w0p1+3SNkId3G98K3Wp85jbHZnpo2bavnp326IQ
 dZiRdOcNDfkkrXVLx/X87zBsjToiE7KZsFHMSc41+yrWh6D22nx7g4a5UqgwaFHWfH1B
 E1W4sK3Q73bPanbe3EhmoVEl0HlNyDEU2XT3hQBgbVvl1dJStUWv2061L/82TXt1ToIe
 DzwOxMs8hyhMl2UJZ5y5FyqiaaRg6Xb5WZX7EbVKXRKFQdWjifTUK5aLv4TB8B49fNV2
 VDZRQZuyty8n3exmHNBeM4AF1h+ftNx1Ebp9/OWWC2xDxXZrKgmXLautVcZQXprLQsBZ
 PdSw==
X-Gm-Message-State: AOAM531tuKFxfCfcjyV2wC0Bz3KBOfCSePHpjXE8btspGWYC60zNR54b
 JU0xeZSrXubk1jFqBeWgN4iq2oMdCcLf6Q==
X-Google-Smtp-Source: ABdhPJwM0XPnsJi93p00218/PX+tQi5MvazW74YLvkHSFqCOaS6K2/6JQDSeh8sfYidGRBF+E7Yhfw==
X-Received: by 2002:a17:90b:17c2:b0:1c1:66a5:4f9e with SMTP id
 me2-20020a17090b17c200b001c166a54f9emr10900409pjb.188.1647446114604; 
 Wed, 16 Mar 2022 08:55:14 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:9500:ad27:b03f:5499])
 by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm3427852pfj.128.2022.03.16.08.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:55:14 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, stable@vger.kernel.org
Subject: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Date: Thu, 17 Mar 2022 00:54:54 +0900
Message-Id: <20220316155455.162362-3-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316155455.162362-1-ikegami.t@gmail.com>
References: <20220316155455.162362-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_085515_916991_CD9C660F 
X-CRM114-Status: GOOD (  12.03  )
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

As pointed out by this bug report [1], buffered writes are now broken on
S29GL064N. This issue comes from a rework which switched from using chip_good()
to chip_ready(), because DQ true data 0xFF is read on S29GL064N and an error
returned by chip_good(). One way to solve the issue is to revert the change
partially to use chip_ready for S29GL064N.

[1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: stable@vger.kernel.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index e68ddf0f7fc0..6c57f85e1b8e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -866,6 +866,23 @@ static int __xipram chip_check(struct map_info *map, struct flchip *chip,
 		chip_check(map, chip, addr, &datum); \
 	})
 
+static bool __xipram cfi_use_chip_ready_for_write(struct map_info *map)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	return cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01;
+}
+
+static int __xipram chip_good_for_write(struct map_info *map,
+					struct flchip *chip, unsigned long addr,
+					map_word expected)
+{
+	if (cfi_use_chip_ready_for_write(map))
+		return chip_ready(map, chip, addr);
+
+	return chip_good(map, chip, addr, expected);
+}
+
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
 {
 	DECLARE_WAITQUEUE(wait, current);
@@ -1686,7 +1703,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 		 * "chip_good" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_good(map, chip, adr, datum)) {
+		    !chip_good_for_write(map, chip, adr, datum)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
@@ -1694,7 +1711,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum)) {
+		if (chip_good_for_write(map, chip, adr, datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
@@ -1966,14 +1983,14 @@ static int __xipram do_write_buffer_wait(struct map_info *map,
 		 * "chip_good" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_good(map, chip, adr, datum)) {
+		    !chip_good_for_write(map, chip, adr, datum)) {
 			pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
 			       __func__, adr);
 			ret = -EIO;
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum)) {
+		if (chip_good_for_write(map, chip, adr, datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
