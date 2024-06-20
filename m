Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC002C27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74Un/jcddyu25VOjYT+c8Jlp3hU2a9JiPvuoEir5Y4M=; b=C3UjCNQ7aHh+zv
	TwGn1n/DLDWCObcq9vevkdSj5+oL1t8QzS47v+bgVxiAWfUq1FzXZMy/K4MWg1zxACP0meaZEQawG
	H21JKSAtcqnHlsSSfy7rAXuR/ERf+PPXnnGQzDnS5UUXWAKe9sdV+/ZHujRqzhKqWJEgM82Q9uWLw
	9+Rt38i66hUxvGtWotVC3keA9d21FLdhrWsnGax9xH9r3Quq9cJA507+uvLYhb8YUIgumVaBPTg7V
	HPLXtqcuxGLXdBjzt5EJ2Fy15GGmigDtVBxiR98Y+xd4HSf6gj9fEODwjx0vjcqONYtntz+FQ4ceI
	YzJ7NxGihE0o271Ssa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM62-00000006Cwi-0Grn;
	Thu, 20 Jun 2024 18:01:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM5t-00000006CpH-38qU
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 18:01:14 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a6ef46d25efso137121466b.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2024 11:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906468; x=1719511268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qz8kTOxdaIm1u93eV0Is+4r0vyFAn21pP7Hjv/L4wvo=;
        b=wjS3Zv9boVUPBcY5fjDKRhgvkMoeP2FUgSwoegaG9VgGHSCxIbDeI0s4yKVRh46Kiu
         VVtp24JCxome5S8vSVPjJ2KqcdgqRAwC7mT5dGazRJMlrJU8EQd6l1rpUiZt+OoMYGOR
         HqedjCrilu4NgYlVZzgsRRyAgJBxkY81w7CBF8uwhUwI1GmNPlZxlPH8VUEHTVCiRHDU
         8jva+5KMk4Px8a4qtCs3I2C1fc1gZSMeWT81c8Kj89mpYfd4794WVetPpC5kG2VC6CM2
         sxvlYtsGk0fu4r2HaCCP155qH0ZpzEcIDurWOp/5EJxT4wvdZ2HmigCbJex2SCnih9vk
         kP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906468; x=1719511268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qz8kTOxdaIm1u93eV0Is+4r0vyFAn21pP7Hjv/L4wvo=;
        b=I2RCAOBHTDS+poN0QOwUHI3cmdOvZOsoSIju9CnXVv4zUGp+rfTCgOVLzl5b+fYOhA
         dKLnDAG7CidY8hgBEnQwVqgi3d/Kh12HRnimHN9S8LkhTYCpI2e5K8xMlhwPU1FaNmaH
         pscKGsQiz7fOeBYnVHOF9D65bV2c2o3lqMUB8yMMdpZJRSauKQUdF4LeUTV48o7SxrBd
         vcB6NbPydPivS+y2oNQ8GTiG4QaS/wutf1zSUtTmf7WybVVg37EqRZEK9/g9QsASoonL
         AmVUqD1HnLzQmQHqGoG7ZAZa54O6OPDJfIv4LDfwqs7tSrYC9ReqjrUIRfPr+7mtLOuh
         ITCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Sr4zzY9wJ2+zYrhHsRE24GZML3ggd89VxSdo7imiakuspHWAEPh8WH8MNJgWMl+HMpJqq2uC7g/rQc1PZCq0ggyS5isHm5aMw0ZDNA==
X-Gm-Message-State: AOJu0YwWgG7VxczlziHWjSqZKwup4pr0fqV8H6sZFmwOfEIDvMbouS68
	Hh0Gapf0BwdxyyvUkiGkFDTqo+N/bd5gj61EGPB7kqTd/RxVXtjolqIRSz6uqwg=
X-Google-Smtp-Source: AGHT+IG8eY8d/PSntzHXSfPtqV/wO9neoC+Na07hB+VY1pAoMYT9SP6YNE1GHB/rvuCByUpgceEg7w==
X-Received: by 2002:a17:907:a80f:b0:a6f:b67d:959e with SMTP id a640c23a62f3a-a6fb67d9870mr344459666b.53.1718906468099;
        Thu, 20 Jun 2024 11:01:08 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.11.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 11:01:07 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from del_timer_sync()
Date: Thu, 20 Jun 2024 19:56:41 +0200
Message-Id: <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_110110_153651_DE7DD180 
X-CRM114-Status: GOOD (  14.46  )
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

When del_timer_sync() is called in an interrupt context it throws a warning
because of potential deadlock. Threaded irq handler fixes the potential
problem.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
 drivers/i2c/busses/i2c-pnx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index a12525b3186b..b2ab6fb168bf 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -718,8 +718,8 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 		ret = alg_data->irq;
 		goto out_clock;
 	}
-	ret = devm_request_irq(&pdev->dev, alg_data->irq, i2c_pnx_interrupt,
-			       0, pdev->name, alg_data);
+	ret = devm_request_threaded_irq(&pdev->dev, alg_data->irq, NULL, i2c_pnx_interrupt,
+					IRQF_ONESHOT, pdev->name, alg_data);
 	if (ret)
 		goto out_clock;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
