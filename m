Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBC5C282DE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZI5LsSx1WVI9w1GmaqHiRbhGeR1/CqX5s2i1GM4oIsk=; b=QF2fwp1ntNMJ0h
	PT/WMSAR9kU1yAAgzwgkFzmF+r1N9a6Mu56fUEChvFAqozrx1BCXFficsNz6B98IgRp9rp0Rz0uC6
	OG95DdFtTN/R/sPtg/T6NbC8tVVRJwr9dn/Z0SsogWu4Oh1ABtlSoYvyk1bygbDtLX7KPFhGZHq9h
	QsqtdhE8BoYAYXd37KtS3xDch7BENL7SZcJNiEYlV1NStx0Ht/1OrNEkMLA0+tTnShS6dTv409UpJ
	XT4kuWaUz5GT8u5J/wdzRG2AoejtQC6Ec2XSGySPXte3uCuj9XJfkslnHIrkb8orfjS9iR8GwtJ6G
	K5jvv0K3iWiZipmu1isg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF6e-0000000BhZI-3hWH;
	Thu, 06 Mar 2025 17:34:00 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4k-0000000BTxS-0o8E
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:27:59 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso1660530a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278477; x=1741883277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAZ6yehSc4MEYrK/rteyLhLjWQGTSbLYrKbJr1roEME=;
        b=N8HapZE+C2ZaWbLxvC/zXI1ftMiKp3m53w1CkdjdDZuHLfVQua3Ga4sktwoee+dwTc
         BeCESoux8WIHerfJ3nNB8a5EzblAMNqwqVoVo9ZsOTWozcMfIU4/Rv5fYoiY/8mTf9FY
         zLMn9aO2FhLYS04vogsFBO1Vo6P85lTNfY8ajsEWSGVAYbbwOb9OtlTYzM1wPxXoYrhs
         0ko3NSTsY7GVZaaTm+FJx0O6hLSsgG6nIwT0nBGgHv6/DO4Ib7hmvTInfnScg2hUQfcX
         MDx8YgAaLdPL7/DxZ0zfQqYZYg/6T75WDRAM/EZqXEQxpoyG9pJqcLOphsNm66KBiSpY
         /kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278477; x=1741883277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAZ6yehSc4MEYrK/rteyLhLjWQGTSbLYrKbJr1roEME=;
        b=Hns947l/g3KE+S8ZQWiNPQpkc5kWKhWE0G9QVsKKUb85l1WtMgMZ1WbuvX0yHm4Cau
         LbxKmfnDQ0r6qt4qFQ0NEgF4IFPgHEwL99RHzSdvVJG7MVjikW75Jv5RZn6GhdXKar18
         H52yKU3Y+OmN45/wuD5tkjL1sPsmdFX6IDAlgfaQ5MMtGLNkTuDZjIVtds8Fc4CBtD5S
         idZylWn8ePYdb1QzkiPaC+t+ShejSoEklC5ZCvzVQnCgcXfJ7m9e4YV9KKzY2YboTIzR
         /OSztAE/eMyACG1U0pgKH+IiTxqeqc1/V5QsHTlSnT5L9ZZ++MX5+Lc/C4KyXeCFEMXm
         8Jcw==
X-Forwarded-Encrypted: i=1; AJvYcCVwaVjWmDhQ0Yw/+R+4eKBk0mDmEzA7FQRpiQGNHHz3X/MJugi6CJn85ZG/Xa9q8hh4oZqEKiGa0SU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLJSzPDP/8vLytl7H4FiTeI5cwN1lT8t+FCm8eZTeHNW/ch8iY
	gVcoP52MUI24iF32pX9BMKbunbYg8m0GeX9EeRv63QTtpzQt6yoG
X-Gm-Gg: ASbGncsqxVwTl2k3ltRX5MojFAXFW37QpEEMrfrMjAUftCEaChAedEOK/IfNHXTCjXj
	AC41GrrVsY0I8ZDkxnL7zot86ZfHADCGzu5vaPO2wIrLXOPopP9o9UoPJ+65Rl1eBdqLJ6LXAjg
	u2wLtY17bac5ntC59jMMGzcDfkvORMJxV4XtimCFcamGO3Kw0MHY0AED8NU8EC0Gzq+qVPsiqa9
	4Bh/RosqEnKWgI4auuM0O9LEsrTpFSbnnxrIk4rZgly6MrgOG2UfQZOamZ8J4zMchYCviw/wrNA
	YY+JY5krIyUseVDxFh+BIjRLwR8XUArGZPkMjUhD4s/C2DHPHKAKqRfWVXD2ihHb1AIYuT3gx5A
	=
X-Google-Smtp-Source: AGHT+IGSTp6IoXEU2YpG6BXR34TKK6tsBmlfHVAOxv0eBhCn0t3RdyPBa0hZZRnTXXw4e83qNulrtA==
X-Received: by 2002:a17:90a:e707:b0:2fa:1d9f:c80 with SMTP id 98e67ed59e1d1-2ff618003c5mr6206329a91.17.1741278477310;
        Thu, 06 Mar 2025 08:27:57 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:56 -0800 (PST)
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
Subject: [PATCH v3 12/16] mtd: ssfdc: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:37 +0800
Message-Id: <20250306162541.2633025-13-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082758_229553_7020D539 
X-CRM114-Status: GOOD (  12.26  )
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
Changes in v3:
- Change variable 'parity' type from int to bool.

 drivers/mtd/ssfdc.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..53a72576a646 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -7,6 +7,7 @@
  * Based on NTFL and MTDBLOCK_RO drivers
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -178,24 +179,11 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	return 0;
 }
 
-/* Parity calculator on a word of n bit size */
-static int get_parity(int number, int size)
-{
- 	int k;
-	int parity;
-
-	parity = 1;
-	for (k = 0; k < size; k++) {
-		parity += (number >> k);
-		parity &= 1;
-	}
-	return parity;
-}
-
 /* Read and validate the logical block address field stored in the OOB */
 static int get_logical_address(uint8_t *oob_buf)
 {
-	int block_address, parity;
+	int block_address;
+	bool parity;
 	int offset[2] = {6, 11}; /* offset of the 2 address fields within OOB */
 	int j;
 	int ok = 0;
@@ -215,7 +203,7 @@ static int get_logical_address(uint8_t *oob_buf)
 			block_address &= 0x7FF;
 			block_address >>= 1;
 
-			if (get_parity(block_address, 10) != parity) {
+			if (parity32(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
