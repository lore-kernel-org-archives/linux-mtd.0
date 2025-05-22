Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D83C54E90
	for <linux-mtd@archiver.kernel.org>; Thu, 22 May 2025 17:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rWO5w9RkmKMVW18pHzes4metlEPabYOYc2oCBzWub9Q=; b=M1idn9TGEUSH/T
	2/Xeet6FRPjMXbtSTCyfqaT5MXt/Ww9bJvuEN4L3vmqy3+eUE4BFlzot0vA3tUW/VPO77Cp988C/k
	yEVpSNGJJ2F0NQGp0oTX9lBn0/3fmAmp4BqYz37HwHnmxEkzbr3KqABZfUyXrd9hURLatlJjzMKFF
	fI4VYKTGankWs6rmm/os+BelmXx5KRst7HAKLt3V0Tlv4eqG1co65kEHuodousynEg06SZzybIjJC
	ylgSdAk8guEP6wqKSK/aqqquDK59eFf+DzVBrlDQ2NQcKBZJE8nvVk3ADbQ+8ChM3Z0U/5nlPHhI+
	TV4x1zuMzU7iEOZsO5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9fp-00000001jTl-390N;
	Thu, 22 May 2025 17:25:41 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9fn-00000001jTP-3jgN
	for linux-mtd@lists.infradead.org;
	Thu, 22 May 2025 17:25:41 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-231ba912ba1so8293505ad.2
        for <linux-mtd@lists.infradead.org>; Thu, 22 May 2025 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747934738; x=1748539538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw7FWHJTHoTxSyh8sMffr2afOmlsN99OAoBlNLmMnx8=;
        b=MbtXahARrV5GAA/xGeDfC52dYDVNAqWVVyyPXCAVEU5CLfTZAJtuVjRbHbfwRGW6IJ
         F72ZsqELYjX+WR+uSjf9+iZ3w0wEutHjvDw5ag6n0RNuS7NTxKab8+pExbdyzs5Pz+pW
         TXBD1R/1wRznt7xGCPD7TYuTsPMaKaTJz2Cf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934738; x=1748539538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw7FWHJTHoTxSyh8sMffr2afOmlsN99OAoBlNLmMnx8=;
        b=V2KmgxLF/V9r+i4s6R3MrG9T4Fg/FaO1VgOQAyI7CKsdpQYrWuwvBVCMJV6hgX8g0K
         Oim3jagNbLEEDg4NkL8/UYoP+/ACpYBoAxaWWdM4Y3RtM39UISlX0LgMt+VQ/20U34Ah
         8WWOiRfGImGhkBcwqA7OoRDGUlL1lcMipHq4FChTS86DfK+VA4h0uRfsGc2HlWcpVdbJ
         t8rNQ2Uqp5UkxPnsYlsoxlqkAlEQF0Dw8wY93HX8+Qrlt99iAdDuseeYVzgqwmADxzDf
         DC1qVZcjF3MBfGaGR6fMsZ/gKHuFAytcSIpnYgIg3NMuJclO3fB2sUoWPieBDbMPNZ+g
         wlvA==
X-Forwarded-Encrypted: i=1; AJvYcCVoZKP6yyRZyEbsLfPSblmptZlXV5wZYE88zodgebyEQIjmKck1Vvx+rnkJ6Ex309SauUjJJHRkOJ4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZMfOWAv/6mWFSttBKmRXx3rprY+YXBTibrpFARsEiCq0cs0Ca
	9CHXzPh9gTfWKTyTc8yUVRrsxz42JDiIk/b9iT1dIHRCbYj3oU8RduMXWNIJnw37n6Mb2tIdkM2
	FOuVVbe+KOQsQidr2mp0bcvXdb/MnBShkHA==
X-Gm-Gg: ASbGncuHdlLG6gtgqYSW3MBMSzyHrglqpNBRJ+jOpkARdXaYdvtarjI6hxDcqlfk5nW
	8aTtHjp96qV0dKXHWy66mr3uqiA9brxLg+SCZxeHN3VEP1bXfNUcN2WikFeizF4gHDNlbXYLKcK
	VDtnYdj1QRzDiS9CYgQysgtjZJPTw0QLz1or6qswy8Zqm3zHqV40heGEtwifu+/DBhDaRbnO80p
	YaYHWJzkTNQgOcLMqoVhyLK4F+DAADqPuHsrWcjnkStvH91t0Byvd151DWSb3/TcLczrCOvGLC4
	r30oOXZQtArL2pndORhRVQP06iydzv18WFRpmbQ2QhD8iJcdd53gjdX14iuRvw==
X-Google-Smtp-Source: AGHT+IHJRMdwimLeCFUPqWI2Rz4/IgYjieooyfaDdhQuq5+G3kUl29ETHlRAzYPjvkWQrpX2AalOKef/KwWh
X-Received: by 2002:a17:903:1987:b0:22f:b902:fa87 with SMTP id d9443c01a7336-231d450f7b1mr141844165ad.10.1747934738495;
        Thu, 22 May 2025 10:25:38 -0700 (PDT)
Received: from bcacpedev-irv-2.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-231d4e97810sm7175875ad.75.2025.05.22.10.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:25:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
From: dregan@broadcom.com
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	florian.fainelli@broadcom.com,
	kamal.dasu@broadcom.com,
	dan.beygelman@broadcom.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	rafal@milecki.pl,
	computersforpeace@gmail.com,
	frieder.schrempf@kontron.de,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	jaimeliao.tw@gmail.com,
	kilobyte@angband.pl,
	jonas.gorski@gmail.com,
	dgcbueu@gmail.com,
	dregan@broadcom.com,
	dregan@mail.com
Subject: [PATCH] mtd: nand: brcmnand: fix NAND timeout when accessing eMMC
Date: Thu, 22 May 2025 10:25:17 -0700
Message-ID: <20250522172526.3926633-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_102539_957773_3B72D70C 
X-CRM114-Status: GOOD (  11.19  )
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

From: David Regan <dregan@broadcom.com>

When booting a board to NAND and accessing NAND while eMMC
transactions are occurring the NAND will sometimes timeout. This
is due to both NAND and eMMC controller sharing the same data bus
on BCMBCA chips. Fix is to extend NAND timeout to allow eMMC
transactions time to complete.

Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 17f6d9723df9..1e9d56a315da 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -101,7 +101,7 @@ struct brcm_nand_dma_desc {
 #define BRCMNAND_MIN_DEVSIZE	(4ULL * 1024 * 1024)
 
 #define NAND_CTRL_RDY			(INTFC_CTLR_READY | INTFC_FLASH_READY)
-#define NAND_POLL_STATUS_TIMEOUT_MS	100
+#define NAND_POLL_STATUS_TIMEOUT_MS	500
 
 #define EDU_CMD_WRITE          0x00
 #define EDU_CMD_READ           0x01
-- 
2.43.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
