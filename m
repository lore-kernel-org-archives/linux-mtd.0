Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7E9C021A1
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0kfZzMV0GT8pHDBnvmTFhB5DleeneYrMDgraokyo5O4=; b=DJ4NfQWFKFkfRu
	O53UofxDGSrKIHMhca37R2lnEDZXgduLfvpIohuHxBpyaqKbptLtAV3Z06j6R3UBuhru72XmVbz58
	Dh8NIMv+0a3ym0GDGFxeGAr6DiFsHoRU8Niah3sshYexcGPfFRiC48YaBQD1N1lNrfdYMaiI2BMox
	MTU2YylzmYBfPZZJxl99FdKg/Tb05KDXN0Dk7vPwjrYKnCRFrDJoimxCiaO+kSRHaVMOzVs1+h/n+
	PvNCF1kzoJUR50A5JpTDsnrSoCsSBdYCXCiLY7t6fYOE+4y2wn86V/w+JXOo0F//leq51iCEAruzl
	yh2LK4wCZaAICUrcgu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmgG-00000003C53-30Q6;
	Tue, 11 Feb 2025 09:35:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmbZ-00000003Az8-0nvD
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 09:30:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso53249035e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2025 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739266255; x=1739871055; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DiHXPgT+3YQYkd4DdSOCTqE0SnmmwoYH/BXg8DEztU=;
        b=NjWaQop308MlCXWnfleLTLBYolMIXvjpYqZvPBkgeahhymZKJZ4nKkSXE2YiXiyVQH
         oR2P/ZqilvWKz6V2tUmF+irkgLPf7u6lqqhFFGJgLg7FEthUvBZtX/EXxMKtsyQcOYZy
         Bh2affCXSE4IbBaeNmrFmTYxWpK449J8n9tKdbWcyEGviqWNWSE1qJ8sBIO6h5bIfAZr
         wS5MewbXl/MvTfp1SA+H5t7WMc0R9jbJY5HB2PJ172Ha3bAZZgZx+Lvz5+QErrYQe21T
         gmiKu65i8xPQCJBfv8vNgka/l1K7o+khOZDNNZJQiAX3qG3uEg4DVIT5XSjX4MbkL0WT
         rimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266255; x=1739871055;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DiHXPgT+3YQYkd4DdSOCTqE0SnmmwoYH/BXg8DEztU=;
        b=t8vBoAyrYE3yqXUjmpp2WaetcleSuW3RKC5oVykiOydm9qBEzeXlejM7211Ze/ZiJ/
         FrNVrvN6CbMVQ0y2cDL2W3uy/asIKPITp9ze+4A25QRgDXeONTUx+xl8hd40R0fnrJoH
         OsPSZJxSmFYFwzNutkkZsF/gbadlJ1w55r7LlwG+JsMUw/jn+zBW/6cc5fPG+4mRaFOJ
         68hsNHej8kNrybrw4ufoi7mXDGTbJLBh6neE2ErRf+iMcbvI7KiKNwOoICHEczRPOdag
         j8jVmtJC62FFkbsdIlcoA/sqv76z9Gjo1+Edfe8q9VZSwgV6fqODzfXuLFU4UhRmuHzg
         EPUg==
X-Gm-Message-State: AOJu0YwqjCZ9qUla9OUssBDUp9MgON9Q/Ud4llFquz+HPFXS8IJwz772
	UGCfo4d39g3Yc9WNRxqY5P9riT2FqQ0zdZBDi5u+AC3l6AOh1qQ0WD7HAfkMiGo=
X-Gm-Gg: ASbGnctZ6TReitLY2o/tgyFzLBeSBtBNIyOpDlk/GRrwKpAVRKWb3YRS/NVb4/vD8aN
	oNjOcJe0EIrwDBr8utrSrEXDdRV7BUMA1gFfoFNkU/O9XPCqUUN27sL4OrA3bAUzPmy4iiwPgwX
	wOfkC/VYPcIYRqABuBnHJNCrfxjq3FCXNDq/+C7aFyC6ldaZXZx60qL599VxCZCQIBXfwyO5Cq6
	dj2gREKHP/HOupRgLnIOvw46813MHMd+87Iji6bM79NVfkFV4Hh3wjPTPjXEh2TojfTomDyVZLp
	le+m+uSUop82mL5fo3CXL1ER1Wwqy1pLaJe2/XJJDc49yBhgxSRnMJKkpeilhNc7RS81R6g=
X-Google-Smtp-Source: AGHT+IHvp+X+fSiYRW+1aXlB5+kLhOGzNT0eATn29S+MSUUf1w33k5xR/ZKqHe179dbj9iJ2W/rkEg==
X-Received: by 2002:a5d:59a9:0:b0:38d:e02d:5f4b with SMTP id ffacd0b85a97d-38de02d5fc6mr5082245f8f.32.1739266255437;
        Tue, 11 Feb 2025 01:30:55 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc672b55bsm12591296f8f.79.2025.02.11.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:30:54 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/2] mtd: spi-nor: use scope-based mutex cleanup helpers
Date: Tue, 11 Feb 2025 09:30:52 +0000
Message-Id: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMwYq2cC/x3MMQqAMAxA0atIZgNtUYleRRyKRs1glVSlIN7d4
 viG/x+IrMIRuuIB5Vui7CHDlgWMqw8Lo0zZ4IyrjbMW4yEYdsXl8jrhdp2c0FDbEpGvamogl4f
 yLOm/9sP7fl18TA9lAAAA
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739266254; l=570;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=tB9kJkzix8UdmTuptFEyspPiHP1wy3L8TCC/7InfdzE=;
 b=8OZFGRlWl0hO43G2J3e0yhgCef6e270zFNX+Z0P/s3h8aYFvv5kZR2ZbM5zl8ouz3XewXz7yJ
 JQN6aS7xBWhDwm0dEYxzL+b385Lq+vUgRg+sJLDEgAlTaMd6iMCGdFd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_013057_271989_8B1FEB44 
X-CRM114-Status: UNSURE (   5.41  )
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

Use scope-based mutex clenup helpers, it reduces the code size.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (2):
      mtd: spi-nor: sort headers alphabetically
      mtd: spi-nor: use scope-based mutex cleanup helpers

 drivers/mtd/spi-nor/core.c | 75 +++++++++++++++-------------------------------
 1 file changed, 24 insertions(+), 51 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250211-spi-nor-guard-mutex-0899888a4586

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
