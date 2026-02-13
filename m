Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DDEEEA860
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 17:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rUQgJEWk0jihkI+wobHN0KY2MIbiRGjS326LN6ITJc=; b=bOqLlVD0kPcrMV
	R2q8tWXAg15K8oWVSHK3mErS7Yo9nssYKSs3VoaXn0rkICUWvjErd4CKFbIpuI09/TJxyGn2Ovs+O
	Ousy0BmOWFAKR6IhGYDxS9TAsWnIahLAIRv0rIyYOx1qYETmlBM8w+WRaye9+SQx5WLjNttFV7Wbo
	DP5B0nB7e8nKMSIOEjKxIt3+Sv6Iemc3apDc+h+4lO7Mc14/m2BhpLVGNaGHvfHE3caOpjP45pQb5
	VOdekJA0XMN79iTg1cRKxhiGZkvKv7cvWm9Jbrjo6/1e4TK7/J1H2km29rS4E04Qutm3l9Ws49pPa
	FKLf0T6EqNdu1xJfvvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwZC-00000003hyK-0ZWZ;
	Fri, 13 Feb 2026 17:02:54 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwZ3-00000003hx7-244m
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 17:02:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso9772635e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Feb 2026 09:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771002163; x=1771606963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2YGh4NiP0Nx8j0GHt6YfLNiLNPi/OXDTyfN1j1b2Wc=;
        b=MTh/jhvusM6HDW2Hdq2YcOLP1RoN5oDSTQSUd5F91nfvCGigxaRhSdHT4f+Yf9exf2
         l6916gt5oWwxIRfQ5+DDD+8C4PYOleMgymiXP1Q1xETSyxFKw20z7UIZIfBJFi/FGsYQ
         ZmCaOZedsaI2I6RRhX0inZJZT4X+PGl3iZEVPBq+Xndv9rgwkIXtGD4QeRKM9hyXQQpe
         wASjoU9yCuF42Yo7mWmGg/uZRqdo2CAJE6fODdU5n0yUvMjDcoQVBX8lhwoJLRkyKwmL
         VUBqIPNE0tYCOhbj1/x1X1BsLVN35ZnNQw2jXvXhfju6C7T5ZNmdIGZZfJHds2ZGpkXt
         b9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771002163; x=1771606963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u2YGh4NiP0Nx8j0GHt6YfLNiLNPi/OXDTyfN1j1b2Wc=;
        b=rRk7PdL2YZtZPzlH+fHo60QgFaG1DpJgPa/3vQ25PHlG4vP32EMlnjpjZBzxY7d1J4
         edckGJWrGqTdzccDRKQhO2AvI4ux3Vuhcl+7YRGiLKItZycGJ/jJyJ97m48QjrLcHnhY
         UD3qEcfHYF3GNYGN9tC+XC8gqHGFfVSWMd66/7dsZBrKjUfP5i+sOkeR635uwlk/h8m9
         ISzyvRjR8ZrBBLx+3esHN0myjGq0wJvsj0aRxIdNP51i1q6YHow+919TTwicSCvHEIfE
         MhJpYDwcIZ+80LKSdFpgoC1vTJZENTp/tK5t2Red4AHGjRcpk2jIIGPsia/xYN733VYZ
         +Tyg==
X-Forwarded-Encrypted: i=1; AJvYcCW3RlNa23GMby9ea4Wj0Rnx7ivpFv/IgzHTWkuLYiX82g5euFUCYyIp6E3yUyhFUy3oyo8AzpQkc5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNlctvzvo5i4+B6v6jV1kQ9JMLCt5/fP5rnDq9hFwQCmcMfkdt
	qsD1JIlfv32VAu1PcLqdSs9g8aglkfaduNTgFFLyvOew0+x7BJENDVIx1o7JAl2hnJM=
X-Gm-Gg: AZuq6aJLkIDJAvkGq9d/VwvTdlKhI5B3jlxWkvrgm9Q09KdEpikH2HBOEbaiDP2z1lt
	OaPZduXYMaqfH5z0RZTAXLWeEape0O8qOhwvvaJC5cEA4tuyZ1MLV6i/FK00REsgo7n0l3q5byw
	GkeRk1IQHFnOuhcpE80LTyryxyJlRV1DyiDc8KD2AUkvlLj7RRa3oeTJP7H/BLl/SojsBRC8P9/
	affiS4xFgfbCTxl1G4Fq3XDff4KzC+5PgPfY5e09HUXLp0OqEVONIwPmyauoNAi4f8jUsdHzGal
	vKTgHbIm2N99rszYIHu/PWrcJptnd2QS2SBekQOZaBXLtT2JGQCxGZ9pMOPAR41IgFVvCb1XSOz
	YA2Ik/ncIbDd8s0lXWxMvG7ImscMc8HJrX/CYep50J7SZuaj+18Csh/6TEoTevrIgrYgZTQiTIE
	WnT8F2haK9rETiMM5ZRwjazO+IEGCMD3EzvXLbqZq/R7jqkDlbO6eSPwtz9puQTPtc00iNc3RhU
	OS9euc2kjSzlUS5Bw==
X-Received: by 2002:a05:600c:818c:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-48373a5d56dmr39731925e9.22.1771002162818;
        Fri, 13 Feb 2026 09:02:42 -0800 (PST)
Received: from ta2.c.googlers.com (140.204.78.34.bc.googleusercontent.com. [34.78.204.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a41fd5sm20333245e9.27.2026.02.13.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:02:42 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 13 Feb 2026 17:02:33 +0000
Subject: [PATCH 1/2] MAINTAINERS: remove Tudor Ambarus as SPI NOR
 maintainer
MIME-Version: 1.0
Message-Id: <20260213-remove-tambarus-from-spi-nor-v1-1-6caefb1a63ae@linaro.org>
References: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
In-Reply-To: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
To: pratyush@kernel.org, mwalle@kernel.org
Cc: takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771002160; l=791;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gAv+0Vzeh6NJYqWWZUHu2X0vgP1uUsaCojEV/34abv8=;
 b=yCsfpIPl1CDO2enkGPyWGx5uKbrMf0fGkMl9LC++tnpuqmlUR6jWAq5Z/rnKIVJnl2PU2+Wy1
 4vr8NJhuf6YAX0lVM+WobeYi1L8iPYDGhCh4/U4dhshCqmmynpuCTFI
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_090245_544943_8722AD56 
X-CRM114-Status: UNSURE (   8.15  )
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

I have not been actively involved in SPI NOR development recently and
would like to step down to focus on my current day-to-day work.

The subsystem remains in good hands with Pratyush and Michael.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e4f9260263f1574ee29f5ff0de1c..c6ee223f6c2db2ed5595e19f5fabc098ff767b3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24197,7 +24197,6 @@ F:	drivers/clk/spear/
 F:	drivers/pinctrl/spear/
 
 SPI NOR SUBSYSTEM
-M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 M:	Pratyush Yadav <pratyush@kernel.org>
 M:	Michael Walle <mwalle@kernel.org>
 L:	linux-mtd@lists.infradead.org

-- 
2.53.0.335.g19a08e0c02-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
