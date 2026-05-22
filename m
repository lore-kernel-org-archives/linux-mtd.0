Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B9CCD5BAC
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wr9wIWY26mhWUtt/S7FwtoDlvKAy2KYHJ0Pgih2z/lU=; b=jWHb495XV/cuvc
	LPpwc2qA/r0367trvB8qpkoPNjxHnH+CL1jRGTfh6w5PIWI1sIamqFZzij5ZpqtYslyU0mYqoRjeH
	tIyAoNlvaNbMLuA719qtSgCISwNsyihzeeYOTe1UJT+6mWLAbK2RiTEeQNMGIjCA85D1bThtLjv7E
	B22RvHk/UfxMHvW6tgNg+eEySeLFlEU8gVhFh4xySja4r/wP2ndQRDQgrX9vkvf0Ab0vlAzbdnVZs
	LU35MJ5F7H0XlqzWL984vbXEJr/FGommwA+dBuN05NlfZMvfCwKEUCm6/F/IY+kb8doUQ8x8SvQIT
	kx7eX81aS6hMbvSJoxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLYi-0000000AEZs-3Nl9;
	Fri, 22 May 2026 08:48:44 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLYg-0000000AEYF-2TWl
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 08:48:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bccb978bd9so47883285ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 01:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779439722; x=1780044522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98m2sdL1pCMyEhLzfr61EEjsneVRiFvAHpBj+Kg/WNg=;
        b=B9Ts1R/+t4k6vWKhmjHX56XxjJufv/9mz+FZmQzz5VSWho6BNNrym1knqfgH2uxCGe
         t+5AlMGNBuS9LyUKWMKSINf3RGqOVXaptkzsQoMnnxToXI1ZvN2YV0IoMX9XuNJ0tC5b
         sc/KVLWZ4ItrISYMJqTmNNbUd68H24yIz74vljUOpi+PKLTEOUBUuqQMhsQ2pv8Lx2qs
         QMaIi8QawsKncdWWtK8w4VvZ0fSr0m0Qq3QfGI2Y4P+xIWI2mJc8YsP/EjMTtG7ZHUpR
         Ze2nerKbfRZEGg62QAG+ZrNRa5u649oOE8X8GtFhfbV0mUlGpv7vs6i1ZqBF4yY4qGBP
         e2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779439722; x=1780044522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98m2sdL1pCMyEhLzfr61EEjsneVRiFvAHpBj+Kg/WNg=;
        b=VeVcNtMzgIk+53yQTOsF1V8yfU1bBs3HzUhHHBDQ+uLoSCqvt3KK21jexkXp/vTV5K
         Z592JB8HiVIdhyjUXLylpyeCoblU3EJnjFElBFuDGSJEFGPsKrWPQjIqOfsfkLUG+mZk
         IlCmqJOwfQ9347ntYul2XbnI45bgIsnM0wLiBD/+K7697G5iNx5iAaAIuuq6NWTAtAAZ
         ShHnUsnqJ85HQclrlRlMBT9oSc0dX9SPO9cN8J1ok/wUH2FHkt0KCluo4CCjTlnJQYVU
         wLW+ePp2p5efixDtCxBaRH4qN/Zv8malVvXTy4We/9QKip+mZZNFLnJsJzWOiDodBBWj
         UQBw==
X-Gm-Message-State: AOJu0YwY/tbdx26pF1Kk2/vHWICbeqPzNt/w0JyMIyvVUTisDErZtSTw
	HzWztTl8bcKjkzznzkIQBdE0+7gOgEgFW7MDGp8LRYxqvrxvhhgl6mKz
X-Gm-Gg: Acq92OEQMfNBzHD9NEf2/9tKOypZThP+0pip/jDt8Q12DQkdY4K1mWtMAwxIsJsqsYz
	7WjP/5IPxRuZA3je48U11ivPifSgrfy8XHYZNyn6MgD+P6CJ3BAvKyhkSIY3UzBKRrXK4IIStw8
	k2puMMf701R22heNzLr51I8UcsBoZage81YW9hdRipJCzDFFhaEI7AvHTEZ38POmbpBBirooYhL
	lcBMF+kh8tHunrRZVJfJ4yparZF7/cohoaDyOx17O8fTZont8qFt60NdXenXt6Gh9t8dDF7vgnq
	upgC9Icdn9XTomSZQBG1OUDD6tuEa2gRJBOZsS3HIVX4WBJtDv1vmDVfcPoIgoZddeM11emYyp2
	YAqalvXKZPtXi1U2yeqXOUKKONT/LCKOiV8KzF29cUDXND/gpkOAjoLeJCAziUnBylt96/5hTsB
	aLO0fTNK0UtfYde/k6/nBoW8pAjxH/N/rrmuElPG+OrjyrqepPAZNF269d+UzgYeD7ExzUhm2Yt
	gTLI8b+4hhetIYZxsSWSVRKRW7rsAuHFJZKsOmV
X-Received: by 2002:a17:902:f546:b0:2bc:8e7d:3dce with SMTP id d9443c01a7336-2bea23e2057mr58810435ad.27.1779439721785;
        Fri, 22 May 2026 01:48:41 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm9937795ad.71.2026.05.22.01.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:48:41 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Date: Fri, 22 May 2026 17:48:11 +0900
Subject: [PATCH RESEND 2/2] mtd: spi-nor: spansion: add die erase support
 in s28hx-t
MIME-Version: 1.0
Message-Id: <20260522-die-erase-fix-v1-2-733ac8967df1@infineon.com>
References: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
In-Reply-To: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779439709; l=746;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=fJ3XJdKAMzgKAP1CSAH85n0sw5JeoeSHoGHGEGt2Q7M=;
 b=BleH5Ol1gffbAtv6w5FEMvArLEDFLIMWWEa3I8J0QRgD0MswfjyxiM1hW6LDIkCiElVTDXDWX
 NAPDUOfPSWjCaXImtqE3LzLVxtyzqMZleoK6yVPXMnoyNMtxkpCw3M4
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_014842_638135_F94A1E29 
X-CRM114-Status: UNSURE (   9.53  )
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

S28Hx-T family has multi-die devices that support die erase opcode.
Update die erase opcode when the device is multi-die.

Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b6023076903a..65227d989de1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -762,6 +762,9 @@ static int s28hx_t_late_init(struct spi_nor *nor)
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
+	if (params->n_dice > 1)
+		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+
 	return 0;
 }
 

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
