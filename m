Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54543CD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1LkRpeGOAoHh2URqn9JnYUixaO9dT/w7BzMawlQYVY=; b=qgs+gQJnpEvdrf
	ZNADg+WzNT7w4g06hCTR2pMmRdswFJ2XLrPPoB47BsSDwxCZTR/fHivJPpitxE0p8DLdjB3A2+7qi
	ps62Olkce3WRjEHedJ0NGI3fOU0fkg3YQx3/k/jT5Z5z48upDfidRAOupsrU/OWYra1M1W4Ijl++i
	zpfGfRSxB01itM8gP3+Bcc5i+RtJgMVxp6lXJ0dTAycJkp2LbjjqqUWplJJ+tseusXDAjXeDcpLkm
	kFsuT0cvs9mvrjhKzJhOvZHFtfz6LRBV8mei4MzepRihsSJn2y4im+MciL6wW8UhNOcvGcv3asdZY
	aDynIFLJQan36UJXTG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAE5-00000003awD-0SQR;
	Wed, 27 May 2026 09:06:57 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAE2-00000003avJ-3gHv
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:06:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c85067c9ccdso2773571a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 27 May 2026 02:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779872814; x=1780477614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hNnnN9ptbiHG40MsmPrvfUSkalH0Wistv0r2KlHvj8=;
        b=SIurzTRVc5rqYUPlzO9+aHxEGXBLDlDBcyx/p8drs7dmABXvSl4gNQEy1ogVINqTPM
         E1ZsCSivcg41qKNyNzIMnUqJGfl4l3vCx9nRnIcqpR7MM86muedemqWjsFbqKtjoFBVF
         fsqlLglfxppUmIe4VfShR/PA8M15H7mQk22YxGXGho2ZhkGYJLUFHz5lhP3mQjEwqNNV
         /6rGm7DwgYg9pzAVqFGJ3NalMUXNBoSez+Dp1MfvopRomb/8MmA8bnprPQYSszr9KU2v
         v35vjtUb0aSSw3u1ZeSQIPEnYcKUvNX6+Bdp5eVrYHmnCHofKGk+SZ03qcb6UdTbTUVr
         o/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872814; x=1780477614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hNnnN9ptbiHG40MsmPrvfUSkalH0Wistv0r2KlHvj8=;
        b=EqLb6F/olCaqOPi7P9AVpJzyNJn9rkDn0eDtTy0T+Te81nxlr4pEKqK2uhCOzDJP55
         qz85AkNLFFOsVAi6u3IgDxShu4qRQKdfS9mvpwTu3SdqSSm+ko4VFLpEgjWgTzaZTWUq
         WiQc9uAYWU/F3oy1aBeHKJyP3s6vXTXqA9BhYW6S2cjy4xeHAAAYaPyI3+lA9qNnBp6i
         qdUIi5YXAPQLYts6hhj76E5qgwa9vGWXNqP9SUw7fNaVcphZogAI2EifSRJvkw3ouVv+
         uyWwalY1hUI7Ab/BEMEAFGfBrLF7IdRvGAjNrenrcghEobEqh7jrLW0hWyGIouIk/mtE
         b+3w==
X-Gm-Message-State: AOJu0YzV20eMHYlJ3o5dCL1w1YKc4xCTwJGvuJsg0gfWC8e7nGDTISbb
	KlI38lsDVUdc8hZalc9030/3aCDn9aGMAT0i+hARFDoS/Ho9wBuPN1tz
X-Gm-Gg: Acq92OHWz/UP/AFMmMzoz8SUFyEURtVQaRSpIEHLPEFOXc4UVPu74PqzYeQGfq3K2gG
	kCJkV0zjxzMyHD5UL7WrqZAu0i5L0cu/j1mhQPb3Lfy5RzVhpc/JA+nFIYA+oLd/Wfu3X0FWcUJ
	OKuxrhgcKUDdj0kuWB8VpST/v11tcLKbtxX8WmZV/BhSF3V/ggcLiUItYPGnRvPRuSyBd6gHRtc
	cuunJ9AXg3GOUtAg/UYtRBAkPAy/vXcYi/QgKr5+kU9NQeksYM2hTlAIYBC4yW+Lv/wFXr0LoRr
	Cl4PpFtHyJayFJ4P3T1JHIFT6ZmCvbHAiVo3LcpXyexQr6qG8iV13ISAsgLoM4QrGYJoj1Z6Kjs
	2nvk98XVhwPf1qplvIbsRp+BLxrU0sRKtwc99n9yTwWLipbF40PVzXDSSxXFr2LFfAA/CeAbGWD
	B45siNhBXtMwC/OtZmcqfxOQvtkcRhxj19gscs8VHyinjoBuqWVv+otW6QDSHbhT1kXF1sqm7kZ
	mQ+C29KpN4BoHa2rIiSGLgvHSYVAA==
X-Received: by 2002:a05:6300:6cd1:10b0:3b3:65f3:b73 with SMTP id adf61e73a8af0-3b365f32590mr8174069637.30.1779872813967;
        Wed, 27 May 2026 02:06:53 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b91c6sm12065004a12.14.2026.05.27.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:06:53 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: takahiro.kuwano@infineon.com
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	stable@kernel.org
Subject: [PATCH v2 1/2] mtd: spi-nor: spansion: use die erase for multi-die devices only
Date: Wed, 27 May 2026 18:05:39 +0900
Message-ID: <3e0a6329c1fdc40324f847d9758d53eee2036e3c.1779872008.git.takahiro.kuwano@infineon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779872008.git.takahiro.kuwano@infineon.com>
References: <cover.1779872008.git.takahiro.kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_020654_922055_6F239806 
X-CRM114-Status: GOOD (  12.64  )
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

From: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Die erase opcode is supported in multi-die devices only. For single die
devices, default chip erase opcode must be used.

In s25hx_t_late_init(), die erase opcode is set only when the device is
multi-die.

Fixes: 461d0babb544 ("mtd: spi-nor: spansion: enable die erase for multi die flashes")
Cc: stable@kernel.org
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 8498c7003d88..b6023076903a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -674,7 +674,9 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
-	params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
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
