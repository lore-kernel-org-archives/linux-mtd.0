Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E45C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmVKNh8ggUMmB+pzw8HnMSkIqnKL/11sU3PQlU6tpG4=; b=hlvbdPXw1NJwaR
	IRHHa8muI6IDwhQj7Ov9v3ilkq98ggsptvcyU3V9wxCoknFsE64z9j1oKTvmWLCCVZ0AyeGHiLBi5
	xhxyZ88tdPLEmuUcjVp9opHOjbH8c/AIZVqhjE0x9f4CZeHtqAcgdIMUIaO3J5IbN7A9SfFgtj8x5
	Q9rKJw6EKTFc6JmWk8yplqJX7pqq2N5UwO0PGH6XSkjmyIqOYlWMRIXk9QM1bM9jY+HGBWMh0FG8z
	SX0EONMu9aHjP6O5ShpeX2OVem9LeI+69z1zC/wnEBMGjlkQ6qQyo7E13GlUL8hhhkEIR9fSUtd/q
	z/7bQRiuDQlYUZbKRQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF7C-0000000BR4p-14dN;
	Sun, 23 Feb 2025 16:46:02 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF78-0000000BR2N-42Wa
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:46:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2fa48404207so7516118a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329158; x=1740933958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
        b=DQww0mSX+mItD27KR0KsgPCoMA+jZztVMfAkesRemcmiw2KDEiHAbfEHJqJM1gZKBa
         LJlG3ykfNXCqqmSQTh3ZbcnuHARuBexEJ5LLrHCm8jFhRiDYtJ1x7AIQYaQk+Zwm+kTX
         MSnRhNrX1AxB2bWW35xl1HKT+Nl5iwNOIRjRL2G9n+EZPNjOQZrzzds6pm9sF71GEAr3
         9j8agC9u+ExvI1iy9qo0d9jQeFzp9PbPVOJMYqZffc9gwBfgGWyq8lZ7DZHWZgtDFdQE
         gfWUDzWd/yn5087zhasAO4xZCF+VVhCP+1cEDKO42x7NxdkSOfr4Q8a7GevSyiiW0gQS
         qDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329158; x=1740933958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzBrmzWckDIJwY51QBb0mQJ5Dqo6Ldx+jMH0V0Ck8/w=;
        b=LD4okooGHGT7Vhqpzhna4mi6/oiTWnVitHw694kFL6XEUtryJgTav5wGKAn/8nBrH7
         ypHj3ABKNKvRbZXjwvDWtpbUUJ4qi94CalCivCqOlHpPo1i71VFoRmtZKCE99j9u4XFv
         5XEPjcTOTpxLxgGpwdtDUxQZX9uXy+uYvrl/v9XraeVbRHtROOueUkKTnb4AMvSHISJI
         t+b3Vs2A5XK/36LTXw+nzpbTKTN06FTzwohhW8U6PmbBMHB8rveKhLrdEmU2Wbk4927N
         r2aVrZWkFXN4qd01HmIFkRsAvZCZcV6WvdAbt+woTaL7lzQM2+AR12mzbx9tv+0teSFN
         4NaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuLka/IYxEDh0LZDvw9qhgcm83V/OrKsXdtAD/CsE70U3vGISyX48N0Q0qUW/M1w2dlj+LF/KaagA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3cu9Fp3Ktg6FhDeo46VpdkuYxQmUGSGh4h4ypRtsYtxVl3uHM
	UR8dROkBbUEKuJ/dpJCQFNh5TwQPFLDUOjPaJJV09NPcowKVevlB
X-Gm-Gg: ASbGncts0EbzlCicy/7QfPfvFxGj9YOtzaDJhnWOC26K7Pffej8YEegwgVY0RC85Hrk
	BdOx5kjam9+zcHPl6fgKfCWuMuPpkz1coEdCfPFqxWE0KUBSYKDPh4U5Sz7LhcrNybowI8o0zRv
	Mgr1qt5SXz63b4iLAFXlG2W/lq+7KyoTYoQSCkmJJucjeFEr9rWNL2D7gudLgBoF+L6FLndtBrj
	ESqn2KkYC5TM9NiAWAlVZ+pscZYdx0tRQdK7CPoH2vyEvsRuWLUvX5qu5qTneX42QSvx7/uKRlX
	4JXuUO3qNjCHu+5dA/h2ZNc4cSgB/mYEouEuLeOPd4039tk/b3/KgV1P
X-Google-Smtp-Source: AGHT+IF16AG7QV3yDJH/B6gDeFm18hoNJMWrJMQH/o1eQGkDQfNTajRN2mVaQtR8BSlGLJjsCZspog==
X-Received: by 2002:a17:90b:2e44:b0:2f5:63a:44f9 with SMTP id 98e67ed59e1d1-2fce7b0acaamr15082851a91.23.1740329158110;
        Sun, 23 Feb 2025 08:45:58 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:57 -0800 (PST)
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
Subject: [PATCH 17/17] nfp: bpf: Replace open-coded parity calculation with parity64()
Date: Mon, 24 Feb 2025 00:42:17 +0800
Message-Id: <20250223164217.2139331-18-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084559_007360_A36475A1 
X-CRM114-Status: UNSURE (   8.99  )
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
