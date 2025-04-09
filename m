Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB4EC369A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sefUvD6zyuDclrL3BdBy+KK3RGJeeUMiqatwxWaha7U=; b=C9wkwqixqTETWp
	8NHwEClzEOTd5J++/PihcBgT6BAA+ouKd9C1WKR18cFt3D2gmA+cuQ9rNjo9awU25KTgjZo2Q1dOo
	yLeR8ULEqXQmESmZevuTpmOH4SvLN9yQAAuQcAtU79o43VoJ3Y5IZr3sIH2YVmlXdNcn6VMHL4eIm
	wG+N2NQ34imKw2uIL0saym14lyI3ME59LDBNbbbF5/pYjB/1Xpa4nR7thHvWeS7fq7iCi2aXcKYq6
	LSov6axiiwOo57O03E5perq48DhIDdBSLV2eUAVcp/LjQiDybnBzz3vQxfo7d/zs/nL5GRIb7Ibf6
	O6C4ldn/3rgm0rLfg+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XcH-00000007kXS-26C7;
	Wed, 09 Apr 2025 15:45:29 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XcF-00000007kW9-2vLe;
	Wed, 09 Apr 2025 15:45:28 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3014ae35534so5779235a91.0;
        Wed, 09 Apr 2025 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213527; x=1744818327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUZBDj1ge3+4V9XGnjqkyMjyFYeNbBPtxuQpoO8Pkmo=;
        b=N9NDGJi17F5UmJFvB+29uA39UMjlmNvpJOCbsLinq0PvkMLFKUmZPfJ2ba9nVnVRUd
         ulo6A/9/xjbd18SqdbaauClgCGRPSMvpQrnfPZT7Xndl5JuVTuYQAq0ky3d2cr2JzLtL
         +1YGu8tfKzdLoCgg0pEcGeH3fMnUnz/VthHc81XUBz5qiAAYHqTrtvKXPFwAaEhWAkL4
         WsxR6hlb46ifdCO9ka9rUoTGnHOuaFDE/zvx7PV7mPu7rkXsQyxoV4IbHL40QYGoz6gf
         eQohYCGpQpKb7thFOXkpSh1Zhcp9LWKK5GpF2hZkIfZ/n5yC38IbIeh/JtprQO9Y5z1s
         sXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213527; x=1744818327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUZBDj1ge3+4V9XGnjqkyMjyFYeNbBPtxuQpoO8Pkmo=;
        b=XxJ4nNJsZnApuGDdsMVSrLQ1EsVC40Q6TMvB4qK/ZIcveSHPPd3cqsClBou5k3HxPy
         eMFIuwM6s8NzncHShY7c+EC8p5TF3nU52+HgSlp5Sd1q/7eZtUpYCBaZLL6j6tnYZsUg
         drINqYubx3vawEtwCVkda5SQdKbVwZ7CHUCWvAN4qlYXDUglD9fWB+MMTGELKsUtimVS
         tuvd+8ZZukUYlDa+40WBKtc4ZvyQB75gLn11NbevAf5QHDT6EmHkw7t7/G5g6ddPh4wi
         zghSSd+ce48NkFtRBLPNcUCp5dINxdlZKbY/LSBRLFnpJd/Z6zb1z8dR/2FiSHsKXK/B
         cI4w==
X-Forwarded-Encrypted: i=1; AJvYcCV1HOmDXat1SopZAYjPalOZKmdT09vzCtwDO7ZWFeoudKWVRr1qXM8SHvxSpRJ41RDJVvOUS7mm4vY=@lists.infradead.org, AJvYcCV6t2CR09Rn3WNe25dtJ/UU8Ix70g7sutq3LhIQRc48LGHckneTMl42xaLrD5F9DaYuzgqY2p9aUoWg@lists.infradead.org
X-Gm-Message-State: AOJu0YxM1B/V5cBJLOsuN+citty7V33l6S5Gj1EIvWwFYXum+3V352I4
	J4WvnF5kfKkq5DsWgjrRyifasy5QIeWcRUC/3iVMOX5cfL3qCbY1
X-Gm-Gg: ASbGncvnxjknl3I3QS4TA/xZIFT7xKb+McFOXTNqbh/00WxfVqnDXKJg8Xy8SxSD0Ii
	5/YzFrDSVTZWQrhlnTFlT3foEfOSAMZXx4YARzUTTnvYA9fj7IewENpyLxkdSngBvXs6LZK9p26
	ib0BJVdF4/ZQhey1eJXDnm+LlHXJ33MMhYxfxvATUqZzvFyiFVD3rmxsEVfJaKeb3SCrCdjNFqA
	M6588aLnLOnPBBRPrqOZgev8JezR6jOfLq2wqB/LtYuG+Qd1TN7kbZnpSc4jmUqyP9ppt7g7/Dn
	CuScV/wAh9+EIO7u+n5nM0i17rb5zYsl9pbYBjDkCkZVTH+vZIZEkikWlNxoMzpEfMZPsUQ=
X-Google-Smtp-Source: AGHT+IGnNb2L5TPy8ZRk67DQoWNz3EnKr3D/3b81/wzKSzl4+H+Bebt+R4hGqZaj7Jkg168nL9a84w==
X-Received: by 2002:a17:90b:2e4b:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-306dd3247b3mr3471228a91.1.1744213526748;
        Wed, 09 Apr 2025 08:45:26 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:26 -0700 (PDT)
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
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
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
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 05/13] serial: max3100: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:48 +0800
Message-Id: <20250409154356.423512-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084527_737374_8A415047 
X-CRM114-Status: UNSURE (   9.58  )
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index f2dd83692b2c..36ed41eef7b1 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -16,6 +16,7 @@
 /* 4 MAX3100s should be enough for everyone */
 #define MAX_MAX3100 4
 
+#include <linux/bitops.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
+	parity = parity ^ parity_odd(c);
 	return parity;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
