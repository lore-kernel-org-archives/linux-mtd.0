Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E664DCA0FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8BmLQbIPVleinmOD17aiHjbt8u8Gv+P3OBkDrCL5WA=; b=Gw7hxwkJYRJ9VC
	XM7Kk6zoLFPJh6cNPzaoJO8MajnptHsrtQmXl2Xf4h1UVe29V3OKxb0Ha+fSu022dldI8hLvlhwyT
	dMOtJgnH2GvzJ5dVQA+/8E1TfasjHRq9gVuxLGWp71NoeJuyaQ3PzRflebDSrvG1oEvh7G/fDJAt8
	O5wf9BOqA4DCAGAsNAM4a5UaMcRoFJrUNXagpH+0qBqLjL5rdIS7ufudtMffZH+GyT6HvFqAbPF9V
	djWoIG4misGctcH5LeLS1LIvO/IQcy1cGY1+7NUElCOlXY1EK1c9XTxohmdXTO+wgad0s4uGlkpk0
	JwJIrgwvGM5DBA4I9DWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7ts-0000000DNG0-261z;
	Mon, 01 Sep 2025 17:01:00 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4YV-0000000CgKH-0jpm
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 13:26:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b04260d72bfso17546466b.3
        for <linux-mtd@lists.infradead.org>; Mon, 01 Sep 2025 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756733201; x=1757338001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICiwcLIU71Izuhu8fP8tVO8odVf8d1Nj7kJu4RHQNHg=;
        b=XR6/oNnSaIQmq20RXglr0Zm8128L8wRqTEyuN82jU+dHXe2XV3ta5MKKING8oXa7vO
         rw08DSY7wFSISWuuJqsjqdbSBizX6PrcMDh6CHRPMvN76K83032eaPvAQh15P9oY69Ii
         7Szvy5zJ6m+eAcMGO6ITtwX1BMV8sOss29K4yCYZwBL++5qByTQlqVXu1/30otGrYxA1
         bmqv4psBajDwnqK7G/nNYInMIeqcsp933sQl5poiCUY2NsnB+n3LxVAnTZHsy4Ii/Gb9
         6kL5z/iVtD2xe4LA7pcMyuqLN+lwPpKcuaOYiKlAvtC4S51OFPmBXrGzwAF5pY19YCMQ
         ZzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733201; x=1757338001;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICiwcLIU71Izuhu8fP8tVO8odVf8d1Nj7kJu4RHQNHg=;
        b=OPwW2McuZJZANh1cMVAhQQ3JBjTvCpQQfJitY4HkUL3P5K6ABnNWHcnt9RMnOeGN/2
         a+d7bLm8JVwb7inAKqqfOmOPKihgPoZ72rDmP3am3VzWNJy/VqZKyUZn105SlVLYSFTD
         RZdVyYku+hiB+8r/0IRZqKX4KtvYecrLu1GEhRl+LlmZKGxge2YCsQ6H0n68+d6idLdK
         uPFGvzUhZ2UaZNqiV35Yc7ERGArjWskbmGdaTCVnDxheYxFp/CLHuZjHxqcKi9xBZ7dR
         MZtRdFhMuHcQjjlYX0K6+NjcGG97gV+HzdecsBDv9TlsZtFJ7VvL9rK7ku5C1Mi4ZzyR
         DTjQ==
X-Gm-Message-State: AOJu0YxwgIzxn9iS+KCNWrWHNa9gtNgnTh4hbEROb54ZTjg9fvVHIUb4
	COFSw5Hc5jA9CicWFPkolLjjARtKHeH6bOr0v2gKwjEjQPqsGx65Ns76Ar9VdYrZdZstfnPLgj+
	8WgL7
X-Gm-Gg: ASbGncv10s7vitEUF9ug1twYdHYExhQl50UPcYED9oALAHhf1ZlPJ6KYokQy9U0ReOg
	Aj2juiWGd3np8lyJc44+Equ5GOZasq4xowZqgW2Oe+ofBKcm2P5YNhgJ0N3wULfKWNKcKM9jpXD
	tvyz0yHHEb+tnX5hx2vJUVKwjI+zSze4vjSGBuHe7yVxR4tio1r70YsbQ5lM9hPpyoVnxAqtoCD
	IcZzQq2ehkWrdBAM3RWb/OSNps8izF1/5X5lj9eY3CCbV7mtv2P3mUPRGC9WRZDRsj6za6NX2Wm
	xspo5ECeWWiWkGJqEHcVlph3ppMkkBlme2Jo4C5H7dtzTo+tDkYD/b3WU1G0oi1BvhSJ0NriunQ
	n+nU2/u0z7Qncjt6YHDDE+MixUgAS0VXuccLqfoI=
X-Google-Smtp-Source: AGHT+IHQTmAvbsKv0D4j4Hvyh4K0kyRVksjF4qrxn2f9tAR+H9KrYnWzvnDmgth3oDHi6jyc4O8txA==
X-Received: by 2002:a17:906:16da:b0:b04:1fc6:1347 with SMTP id a640c23a62f3a-b041fc67c80mr223542566b.0.1756733201076;
        Mon, 01 Sep 2025 06:26:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04241b2e7esm305997566b.43.2025.09.01.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:26:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
 <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
Subject: Re: (subset) [PATCH 4/4] ARM: s3c6400_defconfig: Drop
 MTD_NAND_S3C2410
Message-Id: <175673319874.45844.111501190462962489.b4-ty@linaro.org>
Date: Mon, 01 Sep 2025 15:26:38 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_062643_218076_D00C4331 
X-CRM114-Status: UNSURE (   8.20  )
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


On Sat, 30 Aug 2025 19:01:12 +0200, Krzysztof Kozlowski wrote:
> MTD_NAND_S3C2410 driver was removed from the kernel, so cleanup
> defconfig as well.
> 
> 

Applied, thanks!

[4/4] ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410
      https://git.kernel.org/krzk/linux/c/ae6f637a456c1de75a582afa9cb6169813e89b83

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
