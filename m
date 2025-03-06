Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B41C28B26
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5oxU9sPY0L0cTRhZo3Y9VJ9M/a3SnvW5P9+oIM2bwM=; b=TtU7+KamR+8rGr
	ZRwB6SOJuaHFYx4DR/V6dq7l5d1nmK33n3AE7kxvFHNNmuL/NbPoohw/uL0AC8YWTIlbkqGfCByHL
	DAeo3LGPNV6B41umIK9qBrtt0FhKRpRGp1ZFxj04kAUmCctFqdZ7wtF4YX/XXIRE8IAiv9k51VjMd
	VdRe/aHisM8QEAmSGeCbsEJtDmIXK8xnmn5NDsBTr1Bl76ZiLCHV+JnAWxvaUz8VVxJwBqZgha2ii
	HBpprj0B+43cLsOVQPzYbOKFxUbVv5EhJjg+hnd7gVFyY1iypVs4MyYNZlAxGJRd+Qetmao7RPrJE
	HSpgLjPTfgsfSshQcLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF6h-0000000Bhaw-13rJ;
	Thu, 06 Mar 2025 17:34:03 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE5N-0000000BUnE-2ABo
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:28:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f44353649aso1509502a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278517; x=1741883317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlCo47pw1I/mq/I7vHIVVBFEFMdGZP7EQcov25MLW34=;
        b=XMLIdWAKKNBzruW6V/jI0rlNcUx/lc/eHkYvxVyrWWmtC+nc8vCvhrB37gyISb5Lz2
         yQxxcm5g+rYRrHdVczfncPrWN+231H+Be4489L2hCaoh54STcS7is1fgQuVJF6vNDK65
         rZx9Ai8GD/0Hnss9iN6RAs9/h4yNO32VcuccfPJOFfCSAJ++Jcw4I8AKeVWBV0xqowaR
         /Ez0sbEY0F7/pDf5doUIWziBHibSTY6zd92IdW2nLPVT0RASlLrQFypA/40jYN+UysaL
         OKy1/+ETCo+mUtvsBdiiqO235SQbbV6r7ZCTA3BURec+IFclkpnKroXavqxqX9ILEvoP
         bKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278517; x=1741883317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlCo47pw1I/mq/I7vHIVVBFEFMdGZP7EQcov25MLW34=;
        b=b3iBYmk6OQB75kiut8KkydWa4e7EQbZKceV7Fz03kC/rcGOMYlVd8zKxYfrNMPdMgT
         e7TgLlhfyGWxH1hcunmhXPCVt5sStP1qk07fRMHOVuzaCOQrWTkl+V+lUyTFO1N8wH5F
         1jJtlmi9c9ju/Guh2Niap4OD+VaNb80zQeWmTbhni8mHKHmHBJy7845YCSdPTHKkeNag
         X1lWt8M9Fc+l+JDutvtCNNGJj8AgLZJmcMHrL5PwmRxH1pBm1Kp6ijx1Aayb62tQOqfK
         FAvRRpoZMHu9NKrmySru0pC9zkiTPkfnr85ZXI6pvmmOdLruzAPlTCYoQDUvNIZYmCEA
         X9BA==
X-Forwarded-Encrypted: i=1; AJvYcCUZpDuqoRxh475f8qdYD3tb6N0RnyeaWRgXdeFnHQcvxd4BWh4we8CIhoKqS7sBWWN0duZU+vJXouc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyny4USUoZtRgYxWebDUL36tobNIFjcIKrHDyqmunrI7Yq2SiWh
	lKuX/T1jC7oVggoD9BfierkL58Dz1FIL/564nIWyt8Hd6TU1G4EF
X-Gm-Gg: ASbGncufBnvuFhyVK/NpjIEfOidtLOoe9tlBukDNcJz5qcWn8MHGPldQIPF3W+LbkAd
	ilsm98InLSrAiGdg8XqhuWFPihrk881Qm4C3jgJGGTsPE73fQX3EJDsA82GluGKw7i+a7VQ4qbS
	ho6vxa9hKab+y8WaYngoE8zOsx5RCHRrR32j6PLkSLQe2yM+3AqdkGseEtvTsmhOSJqzFBqupzT
	EkNZadS/TveJbtVpjT5TzrkMNA7Txp/XNYH3+0pdWSOOdkBkaZfjC5PO5x+18VlDejCTMsICUkj
	VOFjj5hJDlwcocBM/0pmJKjvUM0W4yfc7O5iU3XmUX1eMN9LZvKt8La4XPK7dzLgFGDXj9wqozc
	=
X-Google-Smtp-Source: AGHT+IEEoNncBZARV2kGM5Yy+T23A5PpEPT2NiyzW+biIXJ8M18fImFLR3KC2etUuhFwV9KdupSQZw==
X-Received: by 2002:a17:90b:1f88:b0:2fe:68a5:d84b with SMTP id 98e67ed59e1d1-2ff49716658mr11420319a91.1.1741278516777;
        Thu, 06 Mar 2025 08:28:36 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:28:36 -0800 (PST)
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
Subject: [PATCH v3 16/16] nfp: bpf: Replace open-coded parity calculation with parity64()
Date: Fri,  7 Mar 2025 00:25:41 +0800
Message-Id: <20250306162541.2633025-17-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082837_598904_3FCBDC36 
X-CRM114-Status: GOOD (  10.01  )
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
- Change parity64() to !!parity64().

 drivers/net/ethernet/netronome/nfp/nfp_asm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_asm.c b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
index 154399c5453f..14306f128497 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_asm.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
@@ -295,11 +295,6 @@ static const u64 nfp_ustore_ecc_polynomials[NFP_USTORE_ECC_POLY_WORDS] = {
 	0x0daf69a46910ULL,
 };
 
-static bool parity(u64 value)
-{
-	return hweight64(value) & 1;
-}
-
 int nfp_ustore_check_valid_no_ecc(u64 insn)
 {
 	if (insn & ~GENMASK_ULL(NFP_USTORE_OP_BITS, 0))
@@ -314,7 +309,7 @@ u64 nfp_ustore_calc_ecc_insn(u64 insn)
 	int i;
 
 	for (i = 0; i < NFP_USTORE_ECC_POLY_WORDS; i++)
-		ecc |= parity(nfp_ustore_ecc_polynomials[i] & insn) << i;
+		ecc |= !!parity64(nfp_ustore_ecc_polynomials[i] & insn) << i;
 
 	return insn | (u64)ecc << NFP_USTORE_OP_BITS;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
