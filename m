Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4F0C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOvqWpdzMkanoTkS71LPVlxzVZyH1AU/O3V0z0S3Ows=; b=njDDw0T+XC3cly
	+OUzA6a/2mAKuDV5slJtTbpYIl0ytdU2GzyMmPbBORNIFRGGO4th4BaOEi9+2+tnNW2t5eu4DstQD
	URqBWOklqr7U06qT1/vVCrBEqI/3SGBZibLenFWGOsoPzW9XhJbm5h2YW4jNgEnRgKIc3x26+wySG
	X8oFNo1q+Q0awRTeROXL8N+krMFElJ7AYKyTvFNIlEGu/cYqoY/lwP01SZz6yNa519JslfrIU8Q74
	xo8mAcszyivIMoz8s6+ySAGgbowA9NXS5hEQku7x0a1og/AWRNEUQPb7bhN/kItQxGmYq4vRlQEJX
	3pOmEfdbLzERVu2JcwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5x-0000000BQOz-3i9A;
	Sun, 23 Feb 2025 16:44:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5u-0000000BQMg-2pmZ
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:44:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21c2f1b610dso104724325ad.0
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329082; x=1740933882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=DFlW9Ke9m+XzMPjMyr5cLSoK73bpdVrBPJFKmaXTideEgzZaouwrr9sAv6jkvstvtt
         SUAGCFXjuEDmpiRRTlozqYSvdZo81mXVHseV/YIdAfjz9QCUNpMFr4ygfczmMxxazGzz
         8jQRA66lLMLsgQy60S2aXjA7gI8v8Oa9W1X3UQrvP2p+TmQbtbQGS3FTIJY4OjgstFLl
         5l2Zv5KrCZPYIt3ZekH60xxlfNMWYQhzCROOcv5mLvoCN8jGrijwkP487a8Wr+6pukkU
         dEC+Zv/y3aEMr38+xK367MJeSGimAUsPbN8DCGz9bsXyOv/mxhlqW1NaCMx+160nMZkO
         wF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329082; x=1740933882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=BHDka/EyzusYM3LDEP1J0yye++v8SguTPoPFkihLFInBbwPVDEQIYVbCJIbOgP17dH
         ozsLtpIW8pedrJTVe8t0AA2Jf54P3UCPGse/k+BA9Doc8ON1x50P4j77/E68D6RsOMUT
         btpBTdG2+JJb8XC24NKOe5Q4kRLZj8mEpVUOp03ivn6LXgBVaUaT3W7TcsRq/T3L2zOy
         i7TE0Rp1eLBiZ7QXPVEC6TDwbezh4LE5XJWiEmj28WVflkSEL1tS/Ppy6jjw+KjaNVoJ
         D6fJDjpmeZwqfckBvGdG9rfW8dW37Dt7eOL+2XUPdm0ELHPBFb7mxbw6TbbGYDrsGS+H
         aUAg==
X-Forwarded-Encrypted: i=1; AJvYcCUI17KKZ9m/SfSyi2cHOE1gn8iDNCCqSxDlK3gz729sqvvmjhuCB4U0EgODhK7KzJIBmqj0pRp3qwc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEXJb40YDPhFXDn7TVVMbBbuigcl7YXfKIXMqA+T+mmxxpxfPt
	yyO7eLV6ba/jyVRJzsWLOcG8G6BYoB/HQaJ+JENkoM2afxnUF1Tv
X-Gm-Gg: ASbGncsXa5NlLziIJuhFEC4Gi+hrKh9usy59jweuPJE+X0BC1eCw4oy2P0fcsERZ3fo
	DACd3bcd9r9RwY4DUwI5h7Oc3a24UGk44anfQaSCgFJjhxQTpGLNsnXEGq41t2DI2usdEFiUPrN
	Rqc5aTPFj5DEKuSBu0ER7oYeIz60DFYRGR4J8jL7FC2jy4LdsbU7DIEkm7Q3l029Va4vFQggR2J
	EEW5xxtgJzLARvV+XkX0H5FALuyevHenHbAET25hGgUXOQPPBtCriyrmhPySopuLWur4V8kBDSJ
	QjjE7tuYo1HOWaUTXXp45uKqxPu3entrttgBxdNOMV39tmEKvtl79iLJ
X-Google-Smtp-Source: AGHT+IGsE1LtqpOiLzBH/xsJP0qffWffejZOaFdgJ8XT2KOaHV87U7eq24SL1hIn8uNFPIxHHHWZ4w==
X-Received: by 2002:a17:902:d54c:b0:220:e023:8fa6 with SMTP id d9443c01a7336-2219ffd8556mr169735225ad.50.1740329081702;
        Sun, 23 Feb 2025 08:44:41 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:41 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 10/17] net: ethernet: oa_tc6: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:10 +0800
Message-Id: <20250223164217.2139331-11-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084442_721369_30EAEA12 
X-CRM114-Status: UNSURE (   8.61  )
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/net/ethernet/oa_tc6.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index db200e4ec284..f02dba7b89a1 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/iopoll.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
@@ -177,19 +178,6 @@ static int oa_tc6_spi_transfer(struct oa_tc6 *tc6,
 	return spi_sync(tc6->spi, &msg);
 }
 
-static int oa_tc6_get_parity(u32 p)
-{
-	/* Public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	p ^= p >> 1;
-	p ^= p >> 2;
-	p = (p & 0x11111111U) * 0x11111111U;
-
-	/* Odd parity is used here */
-	return !((p >> 28) & 1);
-}
-
 static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,
 					 enum oa_tc6_register_op reg_op)
 {
@@ -202,7 +190,7 @@ static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,
 		 FIELD_PREP(OA_TC6_CTRL_HEADER_ADDR, addr) |
 		 FIELD_PREP(OA_TC6_CTRL_HEADER_LENGTH, length - 1);
 	header |= FIELD_PREP(OA_TC6_CTRL_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+			     !parity32(header));
 
 	return cpu_to_be32(header);
 }
@@ -940,8 +928,7 @@ static __be32 oa_tc6_prepare_data_header(bool data_valid, bool start_valid,
 		     FIELD_PREP(OA_TC6_DATA_HEADER_END_BYTE_OFFSET,
 				end_byte_offset);
 
-	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY, !parity32(header));
 
 	return cpu_to_be32(header);
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
