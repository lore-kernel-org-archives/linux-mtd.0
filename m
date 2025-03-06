Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D894DC3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqPSOjhXE3ktw9gcrLjTeCsZbTSnnlKuHqARwTdiuhM=; b=jYGcbPXdmxdpmS
	aV0J5FQ1HN64efwP58SJAm5qvk+CjiWun8RVHNowZLVkwshCFl4fbTjx32AWbcH9j1v5OR7Z9xTw1
	uMf8ncTQpO58d2guw9J0cmQU49mqffmBHAv1tdS5IAv09TpHF1qtwIKvsWfBojlvnXm0u99G/Koxl
	wpQSUBbFp+WAm0HvC1mKpHBW3xa0ErUIG9eDPUbvrUaKxYef9tqN07w3WknAQTiOZCuDsc4OHV0GV
	iMzwlwpc7jr+mlnRMmGnWwICtmtB2qBUP33+qH0B/MVQJABmKDmxYfm7TSco4Zz/IKfin+9GICwhe
	Km/lsvKBRCSn4Ed3TD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF6g-0000000BhZt-0i4O;
	Thu, 06 Mar 2025 17:34:02 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE53-0000000BUKz-25N2
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:28:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso1661272a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278496; x=1741883296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BS9Ngq0ErapA9ho16k90z8id/zApcMAPWGpuMTc0x9A=;
        b=kqP+TR44nJM3h0N5a+s3nfEdfKMkSS3GsMD3bEhPEQ63+ZKhckreHCuBEy1/gTdec/
         5rXDEgIJnC85t9eKan2CRq+C4BnYOVHS98QxULiXilYJnf955TnXd5OiK5fV4HMh59aJ
         xcphl3svz9RYCRtFIDn53IKnRSi3t4tw73d/qRniV6vy1tP2MnWEewo6XmvSqEHyC0Dn
         ZknE/IxJTMUl7df6S2f2Z4BJHqtzpomeSdM1+uS+4ufzv8xo16mst4ndZPsccGs9dwds
         Vgr0hAffn3yAIOz00hCCuJ0XtjsDeMnDWCMhLjwU8H6JwH8xaMLXzWepLlMv+/krs8q3
         cgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278496; x=1741883296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BS9Ngq0ErapA9ho16k90z8id/zApcMAPWGpuMTc0x9A=;
        b=XQdYDZVdRkLqx+OwK7+/TrSoYcjFXOdUyDBhsNIEBLRLerZGfdcEv5j0ie1ck7V3Y4
         2+0eQw0cO7YjdbV4HuskkxIcJuZsvALOH4g/x1w7G2At0VDeDAbmi5yQGKOgzm7XZqp6
         M3TRfjQCEqlQ55+E5aNtrlb19NtvtjVolxmNf5e4CUVu/IekQ3RYAEl2CRV5t8t6oZ/m
         YhuRifQpcghRP2NiRTt+KCvGqZ/dpfU097wHS6J1SkUhhMcSEhhwpqdY/XTxGPgzIVv0
         Jy5qS6C249yxnFDN2aoO6Zr4f8UwymSopAeqTPbuEDdm67Yn6yt9PVw5PJi7MzMQJAq/
         mEnA==
X-Forwarded-Encrypted: i=1; AJvYcCX/nSrfuqPgYAg//UGC//64be3E6Q58bejGkM6V2hL7Vl8TKHJ2Lf1Q7GB1FjQAYC8z6GdVcEB91nk=@lists.infradead.org
X-Gm-Message-State: AOJu0YznpMl8LPbE5WHLRV+PEgCFffORPuAVFYX0lXLkrqZsfNhY+ItJ
	MUQ9Lzolt+fZ1vaCCZUfY4eG6Livh9FfXAu7/Ej52tjtGszqK2s2
X-Gm-Gg: ASbGncsEhVgCq84d43/ca6MfNRWC/AXAMXz6Jbft6jIKtIxRIWFELSQDrMgUAoCWkMA
	WEuyURFtFZMHTNsH6UUAZWSSLoDUwixmh34tu/wnQ4wZdFkU2Hane2T6unjgopUb2h4lMY4Tp93
	tz5uQfWbLq/bun2OCIXCU6zRvxYjNLgbXh9GaUhW4H5Wl/18IGm62QBuKznZ+r6lrhRPbBBztjX
	2xpUxb+UNhUonlDIAzsWgJyIZ3W8Cw0MghHw/XSyUrejK+D1nYd0aLV7mMhQvvDoRFsD4lDTGS7
	qRK5d23QXmHwzo5fGxWd2gF9PKamhjNahcwzDBumJmpPkQy0TrzIUyTJrPV0vOBLDmKSn216ycA
	=
X-Google-Smtp-Source: AGHT+IFnMh654YdQkj0YFSRHf+ssdwCg9qa/rMgaUesbiD2om2YrQrVL25CKfgP6tloqN6SwFoBXOA==
X-Received: by 2002:a17:90b:4c4f:b0:2fa:6793:e860 with SMTP id 98e67ed59e1d1-2ff6162ec0fmr6970693a91.0.1741278496344;
        Thu, 06 Mar 2025 08:28:16 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:28:15 -0800 (PST)
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
Subject: [PATCH v3 14/16] fsi: i2cr: Replace open-coded parity calculation with parity64()
Date: Fri,  7 Mar 2025 00:25:39 +0800
Message-Id: <20250306162541.2633025-15-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082817_569422_CACCA4A0 
X-CRM114-Status: GOOD (  10.09  )
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Change parity ^= parity64(v) to parity != parity64(v).

 drivers/fsi/fsi-master-i2cr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 46511236bbca..3356c478e395 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -44,15 +44,9 @@ static bool i2cr_check_parity32(u32 v, bool parity)
 
 static bool i2cr_check_parity64(u64 v)
 {
-	u32 i;
 	bool parity = I2CR_INITIAL_PARITY;
 
-	for (i = 0; i < 64; ++i) {
-		if (v & (1llu << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity != parity64(v);
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
