Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453D6C369A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPjAJBwb+SPBukikjWOe7JSPwmmTlhZiLJ+NvbY2QEk=; b=MCX7U65JDKXpUW
	/2ExxmgYQsT5iIWpDE9U/4CkerKKUR2p8K9Em6bDVDRPGmTsMYJLazR9xWtNA5Sznaow0TeXYjGOm
	/XvLGbeiSxHKB42GuVAh2hk1xONxszKIMA2icCjgnIAoH1xE0fHskjiBT9aBbRK8M6dvSI3uj2pfQ
	wuMWkdQOmYRxQUQ98AL7xQSUwhROy6kFg22zsaQo+L4DLyv+b1C9P/buDhx4XjpubFr3OQDLTkZG7
	kAOorLfmprYQCRRIOH7MqhjbH0NFWRpZ/3XhitFst2NWaSf+hONR697rwZZYFbVJtVVDxrTYH06Gi
	GGVckwAmhnYdKJVq5cQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xcv-00000007kvl-3fVG;
	Wed, 09 Apr 2025 15:46:09 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xct-00000007ktx-0F06;
	Wed, 09 Apr 2025 15:46:08 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-af93cd64ef3so4766931a12.2;
        Wed, 09 Apr 2025 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213566; x=1744818366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXLi2SRJHleL6i4thZNOgy64MnVVDpLvymelzP4O5VU=;
        b=MCZZWYhqMkyuA+ia0TZ1V78ohZpyEtdx3lNwXtlcCjmgx1OhmfOk0E/kzshR4mFq/r
         lNQSxkY7ulUIgyDjUeLE2TO8oQY5YYCgsMPzX3yYHhZGIDGP1do1m8ez7DFLTq+5JeYb
         IdksVyaihiFOFbiUQY1JODsy8ruYLDinkC8eaqlb3U3sbg6FAhBjEJASPL0gWuQ/iNAa
         ulRDXwzpCvhEwcErz0X27iymvqz6s18i+AKT5aq18MTxm7CTDuYUQab2thuucLiOCMaH
         cyOzEAUjn8m2ChklTtBIgVszrwkOcGcv5Ydv6t8uRMSe1SET4d/9c3EdvslH5czmJr0s
         ToIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213566; x=1744818366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXLi2SRJHleL6i4thZNOgy64MnVVDpLvymelzP4O5VU=;
        b=HmxjVpCzQQeK15VQZOApT0RFY3EpGmsqiCl/5MPKDVvLLCJ+B026lPvvRx1tpc8UHq
         /8uBQ5fKGe1ZAh2z4sT/5SXC9+EZoGRWxJgd+AYGi5HjW75TthCzM7ug7O6EYIPGscaO
         hJminA0vmxqYEfif0KvbNoPggsjBy+QuVgEMOjEZKch4kEzjDAQI1useVy8iaGUIRiu1
         DvILiZDdHJ5C6x0ArN7uaYidhh2KgJN7rOunFzFZv7CE51fBwueD7mkIObC/Bw7/ADoC
         /39dsdFiIwjsssMex592j9V6tmBQ1quUe2C76Mdbysgp7QDHdGCl7qZdBZmK1wk3iRPx
         Xwpg==
X-Forwarded-Encrypted: i=1; AJvYcCUJRLGHGuaa42SXcJ+/sYcTJaga715+y1fqrpvMY2fDN+PNvwxFvsqLt/hjLhvn06za4boN0qk/61A=@lists.infradead.org, AJvYcCX0aDWs1/5tIITIrtc3chphpWiH8UD9zJSAml6ma1pAN0Y30jJxjFgTtnV14Kxsd5pX54XrXOBWdsr4@lists.infradead.org
X-Gm-Message-State: AOJu0YzxKz7TOMYko4AuDNIOLg66FWIQAbO3A0liRdbCjYhUF21I9DN9
	qltqt0G7l80mzHz6bR+PhUR6gHf9i16xvIeX3RVqf0Ob4NSOCAxu
X-Gm-Gg: ASbGncvIGvYIvrQ07LFFcNqnuwVFRbyKvmS9f8wtG71aVqZtiLSCieyMDTeN8k1TaUV
	umWdyzE1LnnBwAZXfoJLKoWcpVcO23Yudp4TqgmSyt/z3d/4Y/m6IvD1DF4Z+nfiPHxphd5XBRT
	tJS/6KBgc4czVw37x+nepX62MHcDXjdXjQ9XXB4wt2V6t0bMeJg8fmgblTmxzeIVsM1J9jB+aCJ
	OpBrpUUlubmvhxQ/UYgs7/keULNlMyS8UOu6DodbBioLiOBJQ2JbWjh0N+pogIt82YJcW+RlYYJ
	pspVpJ/LSUmn5I8aEdFfxFW5ZyhqWBxjtBfyOb41dD+VFD9MXMks0hWW90FApcb3xRaqdAo=
X-Google-Smtp-Source: AGHT+IGweN+KZRMZ3CYcrqcq5iC29qaxOJUe/Q8yFuoByE0YY1D6tXNucvOC/QvWbivmYcNL8OhrUw==
X-Received: by 2002:a17:90b:584b:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-306dd52eaadmr4119633a91.20.1744213565972;
        Wed, 09 Apr 2025 08:46:05 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:05 -0700 (PDT)
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
Subject: [PATCH v4 08/13] net: ethernet: oa_tc6: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:51 +0800
Message-Id: <20250409154356.423512-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084607_095477_0F653FF8 
X-CRM114-Status: UNSURE (   8.53  )
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
 drivers/net/ethernet/oa_tc6.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index db200e4ec284..6734b49357e7 100644
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
+			     !parity_odd(header));
 
 	return cpu_to_be32(header);
 }
@@ -940,8 +928,7 @@ static __be32 oa_tc6_prepare_data_header(bool data_valid, bool start_valid,
 		     FIELD_PREP(OA_TC6_DATA_HEADER_END_BYTE_OFFSET,
 				end_byte_offset);
 
-	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY, !parity_odd(header));
 
 	return cpu_to_be32(header);
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
