Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3B4C021B8
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmVKNh8ggUMmB+pzw8HnMSkIqnKL/11sU3PQlU6tpG4=; b=3brWJwMahT4JC2
	POowaB2m1KVFDZpZfa+EGUVNa62+Kx/mMPDicG10iAyUi7oVHah1RCnXjqyQN2EmOLICxJiKd/ymU
	8LU0Zbar9J+nfKJ+45l9xFIf1dnGkpxF2jOz1gJi+NZqCHjJ5Xr7uZHAirhMZ5uMgDQW4lEW/U+x1
	fd80z0iE9qLMG4UWwkCIeJ7TpjN3JepPjk5NyTmsS3FisxWBfy8L1W6P4IbZuW37DEP9ZPO+FVu5R
	31GWOgahbElRWcgMGapE3h/N2RZO374Xoj6c+aL+FerkdN6wKECUGYSQmY0l8rdaXciSE3idDkXIr
	kPOJSMf9tq4Hw+i7ztQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNp9-0000000ETRN-1bjh;
	Sat, 01 Mar 2025 14:28:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNp6-0000000ETOv-2Do9
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:28:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22339936bbfso46315505ad.1
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839292; x=1741444092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
        b=W/f1mDD3B9OR42NLM1nPuHmUDuhrrHKwlVmgvRCOVVAhWGvv9R6ARR+Y+7QwW5I7tx
         XYXh3yY4zxKUQ15ANisf9uVmHlBGEq1yrxpgVQ3ln/oWbFZAI3sVdmNcErS6N3RC2soJ
         K+j5RCHE+V2i7qXpVoC59VV7AQeBVClGUeQhBFbM3nO/BMOfqGNhBsdMtAV9+Ih9WmrT
         /cPMr109SIjtBYwi8QP0jpDfGWr1z9EuBnVBl9TwgC4dNRKW97SSufI5tLUEHahwmO18
         b/upDGGVXeJRWVMYwRnxsLXAjgZNE1AYaalOmRmewOtwURoxrUgKG3uM219IUb9w635r
         68sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839292; x=1741444092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
        b=CnHzbtqI0KOHjXhDK3tp1jhb2NnwZ/jlkH0Jd+nRu5xldiVNgqu/yJ/EEk2cH29aaW
         A0O+RC2YGHto3m6qliASyvjg1sEO4R9M7lGsd85XW9IIcPuteCDwQRCEG8p1HNMnXdUC
         Sa3wxvcQBSo70q4gJaAvNSkmbX485Tlf1dd3c098N4CcOkYMj5IQU14MRPc9NZS8CVk9
         WZnJyLAtd1vUjl/zhBBgcjvDaM+yVFDWbWQXqsUAwt+EDaZ3qpSqz/LJ5502ymNaD7VF
         6x+0LLiMWO/iIvCdLAJC/QlYc+v3HEBgST+9EcIrxSuxktFmzeNnWjo4yL7umT27l7/B
         55Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUvg35KPddhnklsuAUp+6rxDtbIL8EDTuFXDxzr0ACAiA0BPq3tRS7B3rQq0MEF8ckyfpCYllxgeA0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKjHFU/HlPjvZvcSzoIFFkqJsZawJO4odWrO3nWXuXmqrvx1E2
	wZCCRQ6UVvkUFrcUg1O0B3i27AY+V29LUIzid+XkYHwAUcasbPFg
X-Gm-Gg: ASbGncvmy/j2PoQ2GB0DwKM1AQWNMKClvCq4QOFus6MFw6uDhx6AvNVTGDWDWRPvpjP
	KEN4EMGFqe5vy1vRToswPUKTaevtYO3SONaVzgPI+DlLl9ZnRvPvvqhCkpe9a8bTPT1Zw37JiPj
	XgfU5fiaIOcdrsoPxdYXysHrVh01mJgYkmqrUdQi3u4EPIC+tKtcOXwfaFJp6M7TKkxmUQFacMA
	pO6dvbNpEHCracsC8teAyFVmtY6H+mw3I1RdgFdT1LTYi2trxJiQE8X54Mb94aVnFQHjDW8HB+a
	1r2ipaTz+0BRJ42oMRXUt4QCVsNYb/9dV35uxX3l/YtbigAbH+yLOA+06zIiYThqv0ALQw60eFc
	=
X-Google-Smtp-Source: AGHT+IHOy6Wv/sKHhRUGc/3EBAQcCBF/SI4YUeW7LDGDR7+GStKywND2M264p9e2dxtzneP/WiNrxQ==
X-Received: by 2002:a17:903:fa5:b0:220:f40c:71e9 with SMTP id d9443c01a7336-22368f71f0dmr96371785ad.9.1740839291945;
        Sat, 01 Mar 2025 06:28:11 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:28:11 -0800 (PST)
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
Subject: [PATCH v2 17/18] nfp: bpf: Replace open-coded parity calculation with parity64()
Date: Sat,  1 Mar 2025 22:24:08 +0800
Message-Id: <20250301142409.2513835-18-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062812_564607_DA705577 
X-CRM114-Status: UNSURE (   9.73  )
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/net/ethernet/netronome/nfp/nfp_asm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_asm.c b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
index 154399c5453f..3646f84a6e8c 100644
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
+		ecc |= parity64(nfp_ustore_ecc_polynomials[i] & insn) << i;
 
 	return insn | (u64)ecc << NFP_USTORE_OP_BITS;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
