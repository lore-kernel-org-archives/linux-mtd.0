Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578EFC87FCC
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bk5/UDnK5F6yJnTQGBIaJX3uwjrBzay9Gm5OzdLhrLU=; b=5AeWvKSl6gwe+0
	gzfyOlU06Z7lRBFSnb6lcwprsTEwqQwLjXJamNf9hKA+TX0AEckFpeEncNyZuf0CloR4/DscQCu1q
	1mGxOkrAmO0JcJgx8DxGZ49fWKa8PRPDD43aLfoOoYAg1B9vCdL4maQmluY2z5EFNfd+SWaueheCU
	pGbFSpO1JDP2mWao1t1eq5PFUxEAJ4Qaw+qXrFycMRI6KD+cNT8+P9zKqJBDPR03zVcFX4wmWdkla
	Zie7rhHjdCOVbhlfKfaiSlrhNAEVgXjy5QF/RMng1GT+jmZrnX+ddazDyEJQJzmC+A8UfJly2oVda
	s4E02cRh8TKAC7TrVn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPsE-00000003JFw-3KYK;
	Thu, 31 Jul 2025 09:46:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPsC-00000003JFc-0Xk8
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 09:46:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so2670555e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2025 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753955210; x=1754560010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7FvYfWmJZ20gWyOT8n3+HXUa94Fj4Gkd8CfUCWJIkuY=;
        b=H8m0WBnTn7QAqrKEMNiZPU2DcaEdNedetZCU/k3S0VxwrjAd/KwCFpKUpQy82GD0ex
         EmiNAS7CfT8wjBPqoJ7keolxkbHQYHywOk+AaFqPbmVDZtG2hBT4hoShGu1K414VMlYq
         Yzp49GKMQnKAVMiLJ24ZUm5Ey6gCZrQuiNnmJB+oGzOQjXg8y++ZeCz0C8yOd2SWQcJG
         zjI27/lwd7rmOVeNqPFgc4QPOdAdCm1WdZ5j2FRnVm1tJSavGMbBXW0hWGb7S6NgDMAZ
         2U8hnSZlDfTrStU97wAa0GVC3vulAJTSDiIB19fPdlx30BBwcuCeHKq33ZnC2J4RKi6s
         IDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753955210; x=1754560010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FvYfWmJZ20gWyOT8n3+HXUa94Fj4Gkd8CfUCWJIkuY=;
        b=lUAeJeq547ZXnfQuFaaNPGR6LqFfvcK3SCU1XxgMqpJA7HarguXvPAbnV4XLW8/vd8
         +vrV2c0SqEiekpL1zwpOS+ID7muXtPDYTQRcCBfQMwwhaB/NXhHYepxAK5FIg0jDPt0F
         jcVJr4r+YM8usqPTIFJTFU13UbaRy+NIASIvLJKzAMGHAd9dEycJx8C+1x4ppRGwJ54N
         Fr3fVjnRX1E7wQrBTmR8lRzPALCAI4YSrjRNEfvqm9W5zhlClYhOTiizQ8+FH1uYnJ+1
         uGeUjc1Z0ez0U28o0CBV+i0ESD8a+vJt6C/FmcAuWN4ig2Ps3wVCzUL6PIdkfO7l6pVD
         y+yw==
X-Forwarded-Encrypted: i=1; AJvYcCU2Dbc+WN7BV8+ALNuGwGEfak8NS0xBjDv8f70zDoaFY4S0/1rk1ATfDKvDr1A81DZbf0kHEYCB63M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5RO1yYxguHj1eyOQeNtH83XViqYQJOmlQIVKLe1Xk6nw5ycgc
	uAAaNAz7BZio0mCCUGFSPFuRA6XaVLxf5XvoDxb5PV3nxFZifuXo4dBrHR9h82Ll25b0wA==
X-Gm-Gg: ASbGncui9H4TrChuKDORAJ5O/+/Ts0eEaGu/Ak1EdcV8mjW5YfTbVV4aTpCb4yA868L
	/DYGi6JaRd3O6w1CkgNUfJCTqSygZMH8GpBR2M7OVC6fBd9o0XtDtAlY09F0dCnqF4oAA5CPVdS
	NVS2hXUqIOD4a1HLJN+SeEVtVr3ymoXI/Pln6FCSlUo1QAc7+LmkLsK9G75Y1VsoFPW1WqP7umg
	iNBFGa47X1Ntjdz+KQNMyzWcyEnFqMB5rsXpgelJvRzuYQQWGLIz3BtKFr6z5UCUAbDPahhx/NK
	yI7ZTW7moRDmPZwka86HdU3p2QQP69b+fotCkmk5Tvi79XDK4xSiyQhvVUK4kNcVva/ayp8yclM
	I3emKH3gOF51dq6Eor55wGokzU4qAPI0=
X-Google-Smtp-Source: AGHT+IECIlKob6XVGKXqPkIouz4B7PwUNLICavEgKGFiyCNrN7e+75j3b8k5cwiFz9G2EqNmg5hHVw==
X-Received: by 2002:a05:600c:8b81:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-45892ba3686mr67809105e9.15.1753955210391;
        Thu, 31 Jul 2025 02:46:50 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458981d0b06sm60091895e9.5.2025.07.31.02.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 02:46:49 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: jedec_probe: Remove space before newline
Date: Thu, 31 Jul 2025 10:46:13 +0100
Message-ID: <20250731094613.2164604-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_024652_173194_F06F1503 
X-CRM114-Status: GOOD (  12.57  )
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

There is a extraneous space before a newline in a pr_debug message.
Remove the space and remove a space after ( and before literal string
to clean up checkpatch warning.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/chips/jedec_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 23c32fe584b7..6a583418788d 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1953,7 +1953,7 @@ static void jedec_reset(u32 base, struct map_info *map, struct cfi_private *cfi)
 	 * as they will ignore the writes and don't care what address
 	 * the F0 is written to */
 	if (cfi->addr_unlock1) {
-		pr_debug( "reset unlock called %x %x \n",
+		pr_debug("reset unlock called %x %x\n",
 		       cfi->addr_unlock1,cfi->addr_unlock2);
 		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
 		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
-- 
2.50.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
