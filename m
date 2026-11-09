Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899F3606D830
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 01:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tnNxb687;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfcZnoWO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AY/r6p6SozdHeU0h93R1XgixlXz/yuUuihJ3GS1XYLc=; b=tnNxb687l8b5BgVz+SztpPV7IJ
	CzI2fRveUQ9WRD67TCrHuJA1PlWEPWZDQvM0E9SQlMVhZf+sXEqI4u/aSylTRFL2baQ64SxVgD06b
	DR4PrWgAWTVg6XQJswGZ+nMkC1B06R4CrxebNZAHqp66uJpg9YpKG9wdSWBNMvFcueCk1q8doh+a0
	c9lVrMcvPJHRoCQMcRaZpI7x2ZII03FNZjTPhsbuwePCzMm6OQ9WP37UksjyClF4udLj4loWpq4+I
	k5DmHjw4WfRGRRjkZXA0OgEHZpw9pEm89HNG2l0ZII7nlRq3s8KU83s75t7OVpYk5ltUhSi/cXjYf
	xU6aKUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECR-0000000H3JC-1FcY;
	Mon, 09 Nov 2026 01:29:31 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECP-0000000H3IA-0CHK
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 01:29:30 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-85ac281604dso229645a34.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 17:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187768; x=1794792568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muo/8VOQynEi/OPHvo7a1ZNTOIrWbQuTUTCZGRNs7Fw=;
        b=BfcZnoWObzLsUwgaAADRgPQdrMu94E0kQcHA8NxmF2YDlED9MAWDA5CDENb07Bqor1
         OgTyZczWGAAhbTeivDahF0LfIB5j3u+/FLF8jJWKzg7UbiAKYbXIqumImsZbHkAi7aoN
         swnY2zzMhbIR2BF1LMNGcNybA3JDO3AKBQd0qOxhKoTTxCX4K+lCwQ7zgWuNRV/eovdf
         ZwHB0JFK1c0rXgtNFWlQQ4QEcVZ78mq9w9c7xVyRYOUrJN5CGtQYCNdGebRGldVslsSY
         t59tCNUK/rrpC8u8WP8oihaLjsnp5Yrh+1JjoT6Yq2yH1O3svLSLuHeEaLpUVzlXwsTI
         vKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187768; x=1794792568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muo/8VOQynEi/OPHvo7a1ZNTOIrWbQuTUTCZGRNs7Fw=;
        b=Cd2AGCC757KGUeaHDr5ObkmMmoVqnjr/tM5nO0EEsHn0nN4O/O2eSBTaMjaPmc26Ul
         5XpmYyyv9JJKHhT99Ali/vsYYHBgb57LR5giwC1lyO+fb+rTijvdXYVUCsMtJ3CH/eQC
         2ThF7GxnHR0h7Kr6tocEZOQQRKz0UVbby/xHr36xYdvpQ9H399lmEzMxuAH1ikgm1x3V
         Yojtp/qB3OyYIp/+Zg0sgREG1r2bb9GyTMsEHOIM76KKpSvIx2ajfTYz3nB5Bfow05f1
         OrmNbKDh2jPFxMHMelOXpkXmVBfiXMcXW+UMLPhWPvp0tl+2Qv8A8oB3vlVjjfzz8G6k
         qqlQ==
X-Forwarded-Encrypted: i=1; AL+hErEK5xyFg2CVz/veasZsZbzcsFpp7euFTGm8rZruqBzx7NyhKuvA6BTgMvFJQllHI/fLreRnTiNoIgw=@lists.infradead.org
X-Gm-Message-State: APuU4Z/gt8uc5JGEG8Ooh08ddBOKLx6MyegQ+eq4BpcbZEhqgKG6ewDU
	7kmnhuWn+0ju4qKo33AlJTCb1+DwAT0eRwtKV8J33AD+zFWxVWF0VSCR
X-Gm-Gg: AYBFou1QPnDwPxtgAyvI/2G958hGc+k0scIpBCdGRNLoRJDu+6qvilrjDd1R0yr7wiz
	vHYCoJiKINXw8jI3pwmZ8fudQ70mFhgeoguw49mAiNZQxCORZwW3QL0pKhJP4B5vK7Gvtl0A3Tq
	cZ5fO2UHZxGcAOfNhykO8omaFCtNv0GAeptsC9D/zZ6kf4HPqOyxFFQkwxKNyx9akWIoeS0ygZA
	c/jSMkbpNLw+efwS/GdpMIgn8REwlw0wrUxxm+WLEx0EwQL3/7qOS6Xtx1YmOgoZrSIVVOPUNMv
	zp+QZ89mgybkHHxQp740DT3hUun5xWumR5uYBJhnnh8TZpn3oPGdYmOO1C1uyKU2g1PXelGYOOk
	r0uqsQuxb02nZJHBUAyNR6mcKpYf11niz1yYg8RUV018gnqDQjBmkecUswiP/bU/kChWYWaD31U
	jEhCnDZB9zhJb9di71NolADOC6V+ATwyEn9GdaXWWr8FrvsHAwn1Rg1c7/ob2LOxkIxESG7rsMJ
	cFGM0Ww3Hd/4K4gTiYs0B5QdDHUbLd+ZpVAD0ry0nuA531DnkOH2U1wpR1rKuys/sMM69iYlcug
	QGqMLX1b9UpzzxvnKyMwDsK8ViMm6up/Yb9AVMrvTP9Aqe7guw1tBCNvulh8/ugyRyHX5CPe3Ck
	2OaBP4jhCF2WI4aP4XmhogE0h+/16E5SD1oCfkrpLr9uVV52PXIrRkmBE/p9tnQR7qD5Z/fEj20
	zRi4Ekdeg32sgnh9EeTiZ6rpQ+1qa3/8kztHmYgyBpMhbI5ugsDaDk
X-Received: by 2002:a05:6808:11c7:b0:538:d44:aaaa with SMTP id 5614622812f47-56814428c0bmr1663265b6e.63.1794187767780;
        Sun, 08 Nov 2026 17:29:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 18:29:20 -0700
Subject: [PATCH 1/4] mtd: rawnand: sm_common: restore the first ECC region
 offset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-1-56d08c0571a2@gmail.com>
References: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
In-Reply-To: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_172929_094204_9C1DA928 
X-CRM114-Status: GOOD (  12.22  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The conversion to mtd_ooblayout_ops moved the first ECC region from bytes
8-10 to bytes 5-7. Those bytes contain the bad-block marker and the first
logical-block address, so software ECC writes can overwrite them and ECC
reads use the wrong bytes.

Derive both ECC region offsets from struct sm_oob, restoring the original
8-10 and 13-15 layout without overlapping the metadata.

Fixes: 987b913c2b7e ("mtd: nand: sm_common: switch to mtd_ooblayout_ops")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sm_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index e238784c8c3e..a3a3a05cc5a4 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -16,7 +16,8 @@ static int oob_sm_ooblayout_ecc(struct mtd_info *mtd, int section,
 		return -ERANGE;
 
 	oobregion->length = 3;
-	oobregion->offset = ((section + 1) * 8) - 3;
+	oobregion->offset = section ? offsetof(struct sm_oob, ecc1) :
+				      offsetof(struct sm_oob, ecc2);
 
 	return 0;
 }

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
