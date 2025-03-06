Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126BCC282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOvqWpdzMkanoTkS71LPVlxzVZyH1AU/O3V0z0S3Ows=; b=3//zX89f4qGLYU
	DZU+BfNSD6fZ9l+9Qyx0w5ULWH8MsTFzMMoFkiqh37mg+hWunL0suKfQpGO1UaC34xVaC5gBaD2ct
	kcxyoiNjD2bRkVYo7dQ4vNiPizD/mOoWWjN9IC5OcKibgBy9N0m5r+pSZH0xTXbbDZ9A43PI+YUFc
	WAaXelY0OK92ljsIMrAQ/p6ywWUo/jX5k0iZ/4gc/RPRPMJVMTodWSF6uDufD7sOey7Al0dazTBYC
	iqvvHrtmK+bWf4T2raGtFk/CK/xVJcwPB+ov9Rl458AZfZSf9pXcnrQN3eKsglpIOp/xW3h/+PhEe
	ZHDR6N2ZhxECPgstNkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4w-0000000BU9r-46L0;
	Thu, 06 Mar 2025 16:28:10 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4H-0000000BTmI-0ZGn
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:27:30 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2fef5c978ccso1515128a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278448; x=1741883248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=Gq0JjlTxc92TsKcyQBKiZGxqw+a7f9OpEwTpPkMc43kiaOrMRYPKwdfIdKGAECgtXN
         IUNitIsezFO+wRqS19zrqWNeIHLwB2V5UK+SqT6OB5qiVDze/MlWnRVRc01QXpucg7qY
         fWRGelD8PG/TF91jfHd+KP5DZnX228IEKEzTqeNCIC3INiCd6nAuYKCKuxspTbZH2/Pz
         nqBFATZjc5b4ohlNoQcwkk3PcDNR1fi+RyIWGgYxxctjReGdErtlDK5rKW+Xxyw9GnBh
         wvoXvXhu4xpbW5pviGfwdZs+toWtrCWLYVWx+rBW9WS2tU1d3tRpOUnozZ8J+g5BptZx
         jSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278448; x=1741883248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=C3vMhglT/T9fP5Tn54TObpoGWuBOXdKCMeFq2+QJw38dZYKuouCZ4/1h+3Vk7+RQn7
         sRoa9g7GQVOaL97KyyIT4zB58kuskYM9xYP8FZyvfsD4mRBRXzb78uf0DW2HUsWr4nGT
         +UuL/LAxo2GtKobVPBcqDXiZo5oaMlhv56yXEFsy6CH3zeUqQOOtI84mDLjDzwStjHpV
         i+ku/o6XpNUptmz/HY/EI2ff2ldRlMsBge6+7wKJdsmdm68L1bNPWB6ky6i6adMBsGyu
         DRpPDShJncV8avk2ch3g4cOiojOzEKuy63Q0NesoP9fi0HZVhp1cK61ODr253bASSm/A
         kl7w==
X-Forwarded-Encrypted: i=1; AJvYcCWvRXyQPNUotDtD0b9J1DS/qxKLPl+k+/JTdZOjdcETv03EyOKcVtJGbfobwPLdqw4jgagGK1/Kvc4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu5FOjF5EVvcR/f+J5ycseILp4f+GULhTWpcmMNzUXXwF4R+k0
	f54vaU3Xq6xptvno5Mw+3c82uYodpJdjlKYT9lb/Ii+KAVCHk/EQ
X-Gm-Gg: ASbGnctJtQOnYV/BZW5PE0P/RF+sIpGoAPK62DFSChqoggpyJ/840PLzEE7ivN8W051
	agDrA8H+E0NDbzIAAaUUvg6N39ksY8j+yuupIGxU8oHiG9q0h2LwC+kSSJl8wMyJNbE+s7NOluI
	5qklUwlBLKsxsQxfDMAAzvO6aM0lGYvwTsiu6BkdjbClZixbrZbkmYtxS/DBT2COIQPNjl38hAj
	EUjbr0R5CGgCrjgzlTJnpkPIYCl0OzR4mAL8iXXwxPlZ2RfwPmAvjF/dr+rCttb6UkLse/CDJuX
	yfbzH//S+gWqzrfbRDx4zdAxVJ0cIHH+uVko7CrTtINliJb5vaEBJv4MR5ZEMkp+DG8JcQ51izI
	=
X-Google-Smtp-Source: AGHT+IHUo1VQ1LAiyQ9UXLap7uh1jhPtCUcmwdFlNac3xPKGa9S5gSb9W1skAcfvxZCU/ssK4wuDpg==
X-Received: by 2002:a17:90b:17d1:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-2ff497cd4b3mr11755081a91.15.1741278448219;
        Thu, 06 Mar 2025 08:27:28 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:27 -0800 (PST)
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
Subject: [PATCH v3 09/16] net: ethernet: oa_tc6: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:34 +0800
Message-Id: <20250306162541.2633025-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082729_172681_0B25DB08 
X-CRM114-Status: UNSURE (   9.36  )
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
