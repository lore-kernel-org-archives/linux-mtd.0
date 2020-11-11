Return-Path: <SRS0=6UFQ=ER=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1BEC388F7
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 01:49:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC590216C4
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 01:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dT5NIDAS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPE/AdD6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC590216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YIALPF4r/bJaPdSVuCNo4XJLtPYalE+/Jj1ilK8NP/U=; b=dT5NIDASWeExAaaHGTooJeuKJw
	3TGC27t0xC+Tr0/wE7oHOJk8NrX8U3TA0xfT5xAadmZrbuqLxakZ4JWnNXrsiVwG7aNSgMsEnO19j
	N6eoj1aCxI5IgtPwyK53xSSF8JWNoyxGUmeyhHdu4IkliE7r/2/5g9MEVqVUqI/bE9/b3SDYqcvFl
	D2WVE/TtJ2Y1rB2/4fxD01ydDa6vwahvbSvOsZWtZCrUSlPhyHT3AboNDnAvgUlTkjTWPzFEzwcM4
	aMIDJQYpvjOKEEU65KCrfnT0T6l0lVlLZXYzbj325Ph80NHaJLD+JXMPU3ZmoVzkQD/vqGpQGA0eJ
	2cIRb4UQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcfEz-0002XF-4K; Wed, 11 Nov 2020 01:48:05 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcfEw-0002Wi-Tb
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2020 01:48:03 +0000
Received: by mail-pg1-x542.google.com with SMTP id r10so339710pgb.10
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2020 17:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r4fd3/0dSgTj2lugodXzs5/n1QFxRdS/bwvccHsHQoc=;
 b=nPE/AdD6ajgJFs/N7AzAkgYmtKO/jsdhXq+aBSQWNVJmQjZyRX92FO88ftRroK87jX
 5Jvm8gnR2dOEpqQJKwsLYMkctjhbCPltjCCSV1zI5Zf2X4m64aDm1ZUANKF+0TYoaBww
 fQraSzelm7y6vLyAnKbIVSx39IeyVExPCkx4wpfsYIqbeOS+QXaJKP1cA7OtrAeUEvz9
 QKBOet/+5g8Qy8/5UJCwOj6QTxpHDHMAJPt1LN8s2R1zqcjIiho6n7BfSqDoEZXvKzuy
 QKoxeNvupXnbxDxYYW/5M3Kb8/PBQCVh64Z/6IouXtq2V1eSvinX+1LyXFV0T8RFqpeN
 Tytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r4fd3/0dSgTj2lugodXzs5/n1QFxRdS/bwvccHsHQoc=;
 b=HsUcYpfvP3N38W0RblDZVz6D8RYr97+49mEcJA56d4O/9yczw97cvCI2Z7YDY5RMlK
 gQB6Sptti39RBQ9TR/5Z75sSw3B8y4o4LFl2qMT2PwjuAL9yeEcpSoVStVjgSiSnN7mE
 Mv/h3S3uUFc/TuSdpclaxaO5VcrGKoryRTGHdY5PVML4Str3XWKf+HwtE+6noGAuw4lI
 6guJBu7cKPt/j/5/dqLxFeYtKBkB1/2zKsbKk9rDVdw//3Oz32F5NTnDLWt18DzvOPt3
 igS8wAvZKjV22rvGq6QG70xYRu7micLEcmIJfIfHds3sHcj5hwqN9wSv7keb2kPG73tB
 nJPA==
X-Gm-Message-State: AOAM530VwX++OaTBDKGj7G5v1zWf6r7FXPSQKdPKwvZ51hosxhzCA54f
 tEVZROZbT2It/BFGWpZHC4kiInziHsr7Ag==
X-Google-Smtp-Source: ABdhPJya8KqKuFlvVUGAEwIVGIIkQbMQ59JIIeT3iDixXmxmhjRPBGndp3pcXSb4EGkEPk6rVvRiIA==
X-Received: by 2002:a17:90b:180a:: with SMTP id
 lw10mr1247573pjb.106.1605059280006; 
 Tue, 10 Nov 2020 17:48:00 -0800 (PST)
Received: from an990131127 (114-137-93-71.emome-ip.hinet.net. [114.137.93.71])
 by smtp.gmail.com with ESMTPSA id
 v3sm365858pfn.215.2020.11.10.17.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:47:59 -0800 (PST)
From: Shuhao Mai <shuhao.mai.1990@gmail.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: winbond: Add support for w25q512jv
Date: Wed, 11 Nov 2020 09:45:58 +0800
Message-Id: <20201111014556.6579-1-shuhao.mai.1990@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_204802_974154_F8C9C8C2 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: Shuhao Mai <shuhao.mai.1990@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for w25q512jv. This is of the same series chip with
w25q256jv, which is already supported, but with size doubled and
different JEDEC ID.

Signed-off-by: Shuhao Mai <shuhao.mai.1990@gmail.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index e5dfa786f190..beaa6389e2dc 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -97,6 +97,8 @@ static const struct flash_info winbond_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
 			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
+	{ "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024,
+			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
 };
 
 /**
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
