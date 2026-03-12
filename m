Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD84E106703C
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=10U5gRJCcAw/ytn9dU2+x2GTe0/2efkVZS8d1aSNYA8=; b=AL22fAOIxkWw8p
	6bRI4ebgJL4xKQRD7nbSU8m1CCe6Gy5Et7GHLIH6F+wGbSCAnXgyP1yM7I1ZDV3FbmOD9GjdqTRSi
	DWRBfiJK/Z0oSuPE9mpGHshsYhw4aCOOy9zVyMUyOWZjN9gvspTeGEKPY/b/XVDDukKi4ev8XwbY1
	0hHVWlhFesnCWtikOlRrPeoXJQkTpay2VPfvI5nyFe8H9HkHw7koefVqEw1EpQVmqguWKU823CVMm
	znjrCwTS+RLtQj8fO0x7W1vh4ojVzkOCV+eG/AxC3ftVW8edo0h2akWVk8lfUiZPUqn81xTOthVKm
	y3l++dEEWsxlGt2fXUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hHD-0000000EEZg-1xvX;
	Thu, 12 Mar 2026 14:44:39 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hHB-0000000EEVg-1gyZ
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 14:44:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so6385925e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2026 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773326675; x=1773931475; darn=lists.infradead.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6tbwg7jIPlVn43vEtDrerdp8Sucm9BuiML4a+qkWNHU=;
        b=Zy12OsdBIykUPTpFc7uVysEbRpfQWv7KUBo6BAsPf3SXj/vuctc/N4y+Cv+YcGuLUz
         rVLxy65OJ5TuPChS3/9TBIOVKLhrrlgbB0AeliYi1W4jB9Y4U7stEdO7TsGj7WOnHObN
         OaNY8IaxZVo48zEKNO1nmJ0nNrAi21QNDxHv/3zcxLjtTaQi2xTZC9mG6yKOzF/VBGLn
         CSvn5vDM0l9d4g1yCgo2zMNv2maVnHTr4+jLdrfKKu5jYcAjCwVsYjcTj8JokKbI8mUS
         0fLTw6GYaCMpqwqnGbnMqADRUyVUDT9uy16MA4ll4wmW890aATdOmqo6NTkZ7pJIEHhq
         YslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773326675; x=1773931475;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tbwg7jIPlVn43vEtDrerdp8Sucm9BuiML4a+qkWNHU=;
        b=lOP2s802N97tRu8ayKOPMyCJS0WiokJZtS6pMq10IOeJ//sd+JnFdUpjypneY/RpsM
         1+9Yvx8u/7BAsjXf8ZDBy0avhKPFgIB4tWlSjlWNgCzXJpzi/gBumFoYxFnDf8XligiE
         yPGXoYZ+PnIa9/ZxA62qFs8ZEKP8Gb1+mj0o20CTj19xZF1L3qXXnzey9qONwUItWQfB
         ajKKhaBnxOKiPdgX91fRSXpaiLzuGl1UOXEtFHsIGTrPZFHlMIBPnMYLURZH1Z9bBrNw
         6x1UCQmirzZV9u8QsYEl84p5Qm4GjejtBCz4dRv5Jp9nm6hTEmhBeCwrk4byEV4Djpv5
         zUdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkgPnJjIsGYQOpLJoGevxqQYZq2Hr9ibCXpRAAHoKnsbwcBSEpal4sZwNjgFeR3EE/6AqM1cs04sg=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc/HbHcRFfUHqt7GY+o2Hlf2hpFuA7GEm+DrvGwr69RcEFOGiJ
	+mEcRwm4AcpJvT99MrlCSoqLREJkwF9JWvPRlf4G76fYQ8F7jAcKuf6BqT7Iwa262Ts=
X-Gm-Gg: ATEYQzzirUFVUOHFaHcsFgOG6K/Pa5W8U9HqvebVMjLrnOqfmfjNiEH5pEI6YcCot4M
	uQ98upHA1b8qiBtW9K3elrtaml7dmCZXXbC2Sb3Gm8EmLisHm7EVCzgr+ePkAcHtZbdEJdEx/pT
	HKD+p06RFfY9Ng5ud7Hkck3zbib0FJ1OmefhHHU5QevIB+0is3kZkvKynB8syhurdge9VHuNeE2
	V4FkFlbmKYlKUuT+XePp730mOCbUrbl0HRcJ8GlI0paMEd+11b0tUzJ/7nAKZelLQqsWJ7iTLz4
	SOpPUaNZRCxDL1xTW+jajTXKDJEc/vVgCjberrxTZ24oXm+4I32sC2t0TY+Fbon3K/PFtajUQOw
	sGCWC2qixe8HgmXYfw4PLYSFedfjdJta752nsMYc8tNKE+vTxgGUKPKkFy3sagYjRTH2rfSbdiq
	morzEWGyg4r9H49qhbHZZONKDgFZJ8wOnUjjoaN8DCt/UAXs3qAA==
X-Received: by 2002:a05:600c:4710:b0:485:3b00:f939 with SMTP id 5b1f17b1804b1-4854b0bafa5mr115152145e9.8.1773326674810;
        Thu, 12 Mar 2026 07:44:34 -0700 (PDT)
Received: from r1chard (1-164-69-22.dynamic-ip.hinet.net. [1.164.69.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fed7sm128019995e9.11.2026.03.12.07.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:44:34 -0700 (PDT)
Date: Thu, 12 Mar 2026 22:44:25 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Lyu <richard.lyu@suse.com>,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Thomas Gleixner <tglx@kernel.org>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Kees Cook <kees@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: Use guard for mutex in nand_suspend
Message-ID: <20260312144408.489659-1-richard.lyu@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_074437_475282_5CDC3C4F 
X-CRM114-Status: GOOD (  11.77  )
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

Refactor nand_suspend() to use the guard(mutex) macro instead of explicit
mutex_lock() and mutex_unlock() calls. This simplifies the code and
improves safety by ensuring the mutex is always released via the
RAII-based cleanup infrastructure when the function returns.

No functional changes intended.

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
 drivers/mtd/nand/raw/nand_base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 9e3561f34ea8..93ba5dec1669 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4687,12 +4687,11 @@ static int nand_suspend(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	int ret = 0;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	if (chip->ops.suspend)
 		ret = chip->ops.suspend(chip);
 	if (!ret)
 		chip->suspended = 1;
-	mutex_unlock(&chip->lock);
 
 	return ret;
 }
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
