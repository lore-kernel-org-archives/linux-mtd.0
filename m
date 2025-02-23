Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5D9C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLiJZ863BHqoZLbYCEw7dolTx04cDvMH/CHmS2Zak7M=; b=hiIeSuDhZpXVP/
	ux92IRpLJ/gDTEYewW7nNgMUgflQtDap79MOSvTzwparm5PfpZp+DDAVxFYfbIgBBJWFXL3nHJ39x
	pKSxwzB0r8Ng8y533G36AXwfqYzzClOMA+MHASk7NrEWKn0Bqkk3PSkpS74IrQ5tdxAh5Aun645Lw
	CNeSBKAJmcxj/HnKx93GCw6p6Kh7275bPb2yEHuB3xFVQ5b2NtmHP3tAW5QpTDX/8VOVNpxgHcRyT
	mgqLS+r5+qGs5qKupahGSX83bNgy+ptMlo9tMQb7CtPFgA62dT6r0WnPBWD2e/3GY/Z7A0pHsQrgS
	nT+b73wsZ1oxk5kDsaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF6T-0000000BQfy-1was;
	Sun, 23 Feb 2025 16:45:17 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF6R-0000000BQev-2jiL
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:45:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso5531134a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329115; x=1740933915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
        b=d0lVvGlAEA7T/YoG4g0hYV2BzM2Uj5n4advVzjAvZDnVxBnTmWJlVb+HypGR0F6pdY
         HLziPHoGrYYJENAPNmblU90TT8j3X04C1tPkEsJqkJ0wIbYW/0krIBoEizANjIsHvDsy
         Rh7+oAFLtKcSHjARaLEGpfTt1hZhgiaQnpPXvTPYrgo4UW++FQOnutyBsadCnyzkjCmF
         YWPv1C9rTbiQiQNhDo5uxSVKUBqhF/MZNFRIpETV+Pjc/sQYBydvVlUWxPtarifm+hHz
         ZxIhTH/sD3IFKd8vs1aiScJqow/m4s3rayjLUuEXXNc19E4s9HdmQmd2dzSg/lvlqz6R
         YRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329115; x=1740933915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
        b=ewYUtqoCRtCnh2/e8P64X/UWZiKRVBx6nt5eNi1/SXc4rBthVoCYQZK0AdYyWvIGZf
         8uDkJDk2hv7LPCVat3XZRptLNEny2Ipj4NWCc0wnJxBgjLfJSm6toUoqr8dBMVFTIYrc
         0CpEbPcajR5gKKNJXLnfxZfsgtbEeBl9D78/cYPcZUpjFXr/aPelJtlWAV7qmkmKvV8E
         6F8jqRrRZxCZWDSk8CfKGrcpk3w+dHRehQO4D+hnuPzs18IfLZdt0jC7GdLgnHc8XQP2
         jeTeaZWqe7KA3nvL2pQq/UNroYwe27jN6HBiD9zaEh17OBl7C0jSy3TIR6PZv863gsHg
         NrHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF1kiSRGxxiugvdE3OFidkXY8kdX76YMXpviujUMtuZkUg0a8l72R5QBe/C0orWaKcSTpgioWVmHk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmpzrmdvEECh0t5PM5Why3GzNod75BtAtu7q6iaAVK9m4PlmZc
	sYEg1JmLu59JRPdy6xUxn4DV/eRBB46qbMag5qp6Li+x5vGmVwXR
X-Gm-Gg: ASbGncuGAUSjc0vG6OASqMoFne6r5wGhEZl9X/kmZBcA/ppBABw5A5+8mqEDUQF4ACB
	ajQVNtGuY/GJZV9kBLnSrxdAbKBZariJmcKA0zhUncPVXrqHVWlm0vNdxjo/O3Oys/fLy5nN/ij
	DcGZHLvk47eQoN4aeacy7b+kyCHg4WrQnlVDr1IrilCDbZXQeCy85iHR3weZAK5V4MGTl9niVlT
	JMA76Nvry9rNhl+7MhmpKXQy+xRkIdYu52uGWfPa7CL0R69vLm0vrR0dnr7RRCuf5NpJe1L3KIY
	6dVQIqU/PO7ilt09Zc6+twl4xHh48Vus50nDoKxhi2OJu7PEZpYPOrIO
X-Google-Smtp-Source: AGHT+IGRfmJ1JykXVI/nOn1hWPryN6XcmSxHhj3JPmFZZoIcxcyuC/O0UeP8Z39VhK9JcSyFdzE6jQ==
X-Received: by 2002:a17:90b:548c:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-2fce77a4863mr16234632a91.5.1740329114693;
        Sun, 23 Feb 2025 08:45:14 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:14 -0800 (PST)
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
Subject: [PATCH 13/17] mtd: ssfdc: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:13 +0800
Message-Id: <20250223164217.2139331-14-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084515_693335_28439865 
X-CRM114-Status: GOOD (  11.06  )
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
 drivers/mtd/ssfdc.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..e7f9e73da644 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -7,6 +7,7 @@
  * Based on NTFL and MTDBLOCK_RO drivers
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -178,20 +179,6 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
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
@@ -215,7 +202,7 @@ static int get_logical_address(uint8_t *oob_buf)
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
