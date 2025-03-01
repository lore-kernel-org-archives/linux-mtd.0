Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FEFC282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOvqWpdzMkanoTkS71LPVlxzVZyH1AU/O3V0z0S3Ows=; b=kxbvO4W5savqby
	vQmTLWZAJnvnEn/zdsYz8SN6fy1fg0k17hgUnCDci4768uCahcxolnNYP+D4nx1oAW/66MrvsYQNA
	zWVv+39XpjWpFohzLdpkOAFz88yuugUxon2Q+pd/ce45M+bAGYkqmYDo6FKmZ56Ikg3Cp1kkIcPiU
	TwKxaaWWxZqsvv9xIFboPfc4r5NK7uBYRRUIuGJ2ZdNa/8mPj4z5rRHjX1/ZVUyRVX9m7tdgGwWx/
	1MIBmU2EA8AoDf0WGXyCx3wmBdmGRCRHTaRfVbXOtkTwhfCKQg7vC7YXagLOMYzAX8rvBMBTh4CpC
	khGMzMTM5UXJ7Hlp/KWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNnz-0000000ESfs-0T3L;
	Sat, 01 Mar 2025 14:27:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNnw-0000000EScx-0P3Z
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:27:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2239aa5da08so1668915ad.3
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839219; x=1741444019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=kb/dVjpw8o1gMS0MsRMVRGTPZtGd9HsD7v1xROjOoe/sUDykydZrIV7bXxXJw29yuu
         UBiChgr+x4eMULcCma2gXFsweGkF9NcVaQWAzOFRojsjZkc3Te9M7QMezbWiPPhh16C1
         1r46vDsYs2+rysNHtNJWEW3HbCBdWjWuFNQniWzJWvI3AWcq3hBD/XvXBIoxcCpTdmXA
         AqtpjajrTxOivXUcbAuhfHCfsSQmFwULSyM/l4gjkH1Hc/KE04t/B/jAS84FwyMoFsLD
         bX7R/uDYdns+sIKmxMEzhskiZ50exVvo5T9rSjfTRdafliYkO0qVPO+0h82Ms3jGpDDU
         zh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839219; x=1741444019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqxvpgZHoGiLr6YH8sD6RZa4e3r1mx+K51Pz7JFmQwA=;
        b=fu/EYgCwd5O4vjc5lfh0qcQLf7/FhcJWPHC0inyYiXHYC71SPWp0htzAmAUBkG5OJk
         sSPbC2ysoDOp/d5TwXVXOO5ue55yVKc6PW9SY7kQL4fVFxM1RWPfVKB22HGPbqd+e5xn
         8yyrIh6uHRBmnj84F54qOYUx3KgUPIDSTV9U5m0HL+JzCAqtk+6GcOFaEIfNklbDaCX4
         OAqmWzQ7nkOy2gzOKei8tpcpR1IBjdmAeMlZLeaR0He9jOAj5HeE4AwBPf2t6rhDBNsw
         qEbemD2zAQ8d7PzT3VS1Mzw5MQO9Pba1pnF4Clv47DUf6817ITdAm97xPOBvmf9qTBu2
         xFiw==
X-Forwarded-Encrypted: i=1; AJvYcCUxpeBZ0IJgMffB/pVX5RcIabCc6K62gYY+yjizwI6V9gNgBBEv7U84Ul/1t63Xy7VQB1xZgTjH1i4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrkSrpH+C2HNearX9Kt0vdjsoYCWM1Bj09CwA4AdxT/Nv0cihv
	KwOLITsPPtHHuQw9X3sKUfey9eDS1LVIGeF+y3nGYSAi0YlW/Fq3
X-Gm-Gg: ASbGncv5TEM0lnY2xipz+FKpsmkGyNkWqq03CeQ14aZ0o4kD2qsJC3Jp5SlV1BFnlzA
	DW3gGy3KgnE4eH39mdU4vTJWteLyKcY+5RqeyLfP37s0GU9hprLVuUFKFydUTXjuMwJ0T7mC7B0
	+1qQPyBdDbGsLAJpMz2KB5gkSIFw6nwy2kDd22xkG6YfBzwUiekiB6c2ICQ4lFNuGm5NCwnXjYs
	gNR+wUAvx+KeXrGQznpNrYMQ24v7jjprjAtrY04gELbETai+vMtUbKLfqHZa9G7hUzWu2T1PgWH
	xsb6Xy/flU3r+ONLLsy+Xt/C3leK9joeSjk2eHAV55qvjzLMl2B6ZdBprXXX5RQhH4tr7XUfyuI
	=
X-Google-Smtp-Source: AGHT+IGwTX1zwhWAXU1AZVXFy1OzhL7kB0zYwA4xHDy3bfQBeELXGyOD8jSe52YiMtbVSQB6FlE4Fg==
X-Received: by 2002:a17:902:ce0d:b0:223:4b8d:32f7 with SMTP id d9443c01a7336-22368fa9062mr110269565ad.19.1740839219506;
        Sat, 01 Mar 2025 06:26:59 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:58 -0800 (PST)
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
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 10/18] net: ethernet: oa_tc6: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:01 +0800
Message-Id: <20250301142409.2513835-11-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062700_136370_D67DEF9E 
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
