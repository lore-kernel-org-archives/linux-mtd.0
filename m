Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49E0C369A6
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tcykvz9aSSHReZ13HAFevXDulr1WYNQjO6cBXJ2VVYM=; b=cIw0VGKqbEEQU1
	pQ5FdtDxm6lwmdT/KvW1R0dJGnVKhsAsTeL4tHqHOHCyPWAr4FBjaKyrEmOMzmI8doekiy5pj9bsv
	RqiaciifGTZXsvS/ay7Q9eVjMcd7F9LngsgBO4mUZgk24SKyaX4tBgsSVMM83iTs27+3Vo8HCXL6v
	5+2qhP/0oEKg8pjed27E8PDeHiXMDkN9/fHO2KJTwYvlD1r+2xpSPXTZWwr6VEP1E6x0n1Fapp/VL
	CzlhiIQv7KXgHRFy3V8DjIg5vWOufFscuBH0f+oOxT21H9DP/gb6a7VCb0XbWARBNhkSBLp31cPGQ
	W+Zxk8Pxd9elqOrffP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xdt-00000007lUI-1bXv;
	Wed, 09 Apr 2025 15:47:09 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xdq-00000007lSZ-3gMT;
	Wed, 09 Apr 2025 15:47:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-301cda78d48so6370447a91.0;
        Wed, 09 Apr 2025 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213626; x=1744818426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCEd/+juUKZOFlQ/4SCoGPbjU2jFBlmcZeDTBbgWCik=;
        b=E8odrwhozMW7oF1c1Lsogd3geEuwweqst25wmINNY8uFBX2mW83vjDu2TsWXDsR8uC
         0x8UXHQ6eascEfUjgpu9NpdYjvNSzP/CKxAFp2PUN2j+m9+sdXn6GkZe6sfDSx+Z7Clf
         mNxGXkJgPv9cnYOUbp6NQrmsegMGqS5JCmrONwCtU+0iJ6/ADHHZiL1YIN7xRr/DQE0t
         sR4bc317KdT9ziyMyThioz8FGxCdWi+3Itc4FMg3ZDFG7mQNfPIChXe8iv9NwTK1nJbU
         nuYGZwJ/PHLuglQLXCxfLDPtOxnQjjUP/iSmqeX+XQlldRHxR2ZiiMsAJS7A3LWkkACn
         ImFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213626; x=1744818426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCEd/+juUKZOFlQ/4SCoGPbjU2jFBlmcZeDTBbgWCik=;
        b=hfn4w72zDID9XP4BpMbq5NcmQWEPuvU23/fbfcSTjlkI2iY6VPTQJfvexv5l51hDtT
         SAXt2geWWQZ1/S/kfAqMm5EX/40Jp5SNh+elN4jKWJvcGXse77MXjVtj2f6ljxlWUKKv
         Cvl9C53vVpaXRrkIw+4DPfpgOZm5iZlMgnhcqUni8IAv2aP24ala5ew+6H3Fb/Nj5bQv
         lOtcSwXYMu7pk8vzl5li6eTTimlXXyvQFAGL+TukuAAzYK5EmzHQCHTq1xc9izm2v6ml
         3ykaBbfb+W7306KsWxzmAb61XBF17MSL7iWcPGWSBXeZRydvxhC+Tq+CyqGxtRKvp93G
         17BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDgmM5Nir46cAjQ3RGoBUb6ScJlhjkA595rlq2XkhRoC7zz/DDYVRyLf2oYjCn7C0n1f9JK8/y9yHO@lists.infradead.org, AJvYcCXwJGdaOUimYjpMuO+6Y2wVGW3GPjgF59Q4gLKla16Mcwjvj88m0S+lzMloN8fqoj97LPjnZtnJ0AA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwS9ixSqT6Wlh2ub1KNKJrlbvAkQTOXe3GdL4ouAqCNZPoCsWu3
	3qBewZw9LVmUs/awH4P8j5kZinebSwvQgLUz8iCG2B5gF6YYQqyz
X-Gm-Gg: ASbGnctl12MLlSUk1XiW+2j36/Fqf2p1QQcukL9/HEThHQ1DEJZcqEpmgMNLpdt2mfZ
	K+lF52xDCQyeivYfDGPFBwRB7ZxUKIUVcuiGOcvRfGBkCkkDpNvh7o4sGasdtxykbmbtQdTSH/P
	yLyITAacvqY+E0cvrAdj1TYzgdXjMidIqL/G53ZYy4T63T0pVGvNbZtoJW1AuGaO6+8fIHAL1zP
	iP5RPesW6zGAKBQ1oWqgh+TuZSBV45bztsfGTd82j1D4cjpbq/d963Aqgw7dXd79SxWf3mMEzEz
	THeEprARwDZnE2LzkbzCSAJLwf5AMOlPUGVAh/5+01P/fqzwHKLXEXiMkH2qLsnwFUhsrks=
X-Google-Smtp-Source: AGHT+IF8SQ2JgM5sFunT9Xi0DOo/QXgkDUpLAzWqHE4Pm6PBSNMIs+CrkMQPqWas8YcuXm51yI9Ehg==
X-Received: by 2002:a17:90b:58cf:b0:2f9:9ddd:68b9 with SMTP id 98e67ed59e1d1-306dbc0c8abmr4476592a91.26.1744213625892;
        Wed, 09 Apr 2025 08:47:05 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:47:05 -0700 (PDT)
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
Subject: [PATCH v4 13/13] nfp: bpf: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:56 +0800
Message-Id: <20250409154356.423512-14-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084706_914630_1715F5AA 
X-CRM114-Status: UNSURE (   9.01  )
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
 drivers/net/ethernet/netronome/nfp/nfp_asm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_asm.c b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
index 154399c5453f..2f8f78abb6f5 100644
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
+		ecc |= parity_odd(nfp_ustore_ecc_polynomials[i] & insn) << i;
 
 	return insn | (u64)ecc << NFP_USTORE_OP_BITS;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
