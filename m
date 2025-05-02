Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750DCC3ABAC
	for <linux-mtd@archiver.kernel.org>; Fri,  2 May 2025 19:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EM0WhEW2t0OpmMAcXIkSR6QriQQCWdYkTt/kL5zOcI8=; b=KkxzHWbIwOmVll
	SE6KLy34LwlZCpdQ7G3U4CKc8agtDz8ODBmuey31MvK5xfuJqQVuKvMg16Dg0ilmvg8McPdObh0a/
	J4LAwMBz2lPV9FkJN/17mxjjRpBMmJBc/swOMybAlofjcmcatphEEdNMYlOfkORZYrw8qC9Uc9UiY
	BrdVSw2K+5pEmhnRuqyUEV40qJA6YsE6nHJnyDG8cnDrwOjaFkIatUVkDuN09eubQwzn8fZOkfOaE
	xw+0BINj2mCOxTcDu/r/sn4y51ejbK9oNNQ0rJZYbBIsEnaIG1uhWfoPP91lmKJeLV86aw0aBz2Es
	Vhr/tgWoIkAfkAwrWt6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAw7f-00000002tF9-0L7t;
	Fri, 02 May 2025 19:32:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAw6i-00000002t7U-1n08
	for linux-mtd@lists.infradead.org;
	Fri, 02 May 2025 19:31:37 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso387915866b.3
        for <linux-mtd@lists.infradead.org>; Fri, 02 May 2025 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746214294; x=1746819094; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gZpvwlgFSLmiwWzkOrn/YxYzEW5jmXin3hp9eGRugQ=;
        b=Ni3Ga0V9Wr7/a3OHTLldwX8MsWjV4pEAR6ZQuIp9BOIPi8f8o/ly+XaN1lskcvDwRQ
         RNzwEB+1S9CXQk3uxlbKZXDBaTO3KcFY/w4oDyPwEkkI8YDc/GmlaF8UazMRbNOBbzFo
         WBXZBWJH5/sdW5iGKTiG6nYF7DtqEuHDc4x/y41pQHulCPtbOWhOkmTdmUuEbqcz8vjj
         j2+5gncaYY6kgxoSoGTXMw2TjVDzpmNTBDNHDasm3QEbms0rXrUXJrZjtdnYPcN/YiNR
         F4vYFwJKvH3PlpTi9lRgbACbbJp9YA7gk6YLB9YX3G3jCyMzrLXTIyqVojUwnYUAsPGV
         aaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746214294; x=1746819094;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gZpvwlgFSLmiwWzkOrn/YxYzEW5jmXin3hp9eGRugQ=;
        b=Kx9NymHyLqN5X60gQC4ZGfSgz3epH/ofMZm8buxblktQ+EU5+rONgyZg3ISTAAKZIA
         BRYt5ymb4TMDdQCuiuaGOU08gdtC4QEWs/HA+uuumQJn37n8j+24zDTyp/ru4doQ9z5t
         1OrlU3XRotRLOAK/u+ztgImFBttrMocpRBuwP7H8WAugby7b/Xsfa//8FfxWD+mcU9kR
         1XQ4+kVIRmR8tQnX55PFrR+K58AmtjMgpuqDuMGRnGduaYPIu4upCATLXrup66KUe1IP
         UadE2tLc7rF3XMfypg4oK/HWIctClbaDgXmhWl8HLVVce/3hCyVYnuLesLLx5vTHl4aH
         5OfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr/rtj/I+bNhgyxqz+v+HRDej/1Fq5jRSD87YC98JA9WWTV9LI2b66avaUV5ASnITRlr1bBQQGr+E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpWDh0OjECFbL2+FlJ3t/PCtIZhhHh+HowRSj5pDDIO/LwXNOI
	c85nsdFG+fB/I9xfuUHTG18QeyncSC08vMU2PNSAGbtlNhnXoXf0
X-Gm-Gg: ASbGncvLP6t7umU5Accu2GroBIvA5udjponoksvJyQldeg+BWXjyF20JDBxtBcqnYIT
	hdGQUbivDkdH99+bH45TAVQBZNxBeL1avUd/O83gYfZxpcrR1ZQmcsFd/ZtMlC9goBqV+FnqD+7
	S/x8HgXWw8na0VhnfGq0QsnxuhSkdM3ujz7NQ7VfM1/ImTYgSHtRp2X2oq0BF016Jh0ZWOdZxtx
	gfeeHZf+IP62IcFnNiN00958HoYLXmefgfmpmHrvOI03KD9oT4llqaDvGDJpnL686CVqE6XApfk
	KgcUmQe9oRWkxSlbLSMA44bzwd8zYiNN6vy/vwAulZUu9EpGIbmJoicApR4JF6HELwPaVA==
X-Google-Smtp-Source: AGHT+IFc3Ur95DNTkNHIKLCZ43haAEzHVjbUdImB5kP9fas4dW9nGVrmS3nnfQ77GgSrzq8fbH6FjA==
X-Received: by 2002:a17:907:868c:b0:aca:a162:67bb with SMTP id a640c23a62f3a-ad17b4708fbmr469455666b.4.1746214294085;
        Fri, 02 May 2025 12:31:34 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad1894c025esm87824266b.114.2025.05.02.12.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 12:31:33 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH next 0/2] spi: spi-qpic-snand: enable 8 bits ECC strength
 support
Date: Fri, 02 May 2025 21:31:15 +0200
Message-Id: <20250502-qpic-snand-8bit-ecc-v1-0-95f3cd08bbc5@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIQdFWgC/02OQY6DMAxFr4K8rkdJXGjKVUZdBMfMRIXQJhlUq
 erdiygasfy23vv/CVlSkAxt9YQkc8hhikvQhwr418UfweCXDEaZWhll8X4LjDm66NF2oaAwo2e
 rjr1Xtj4bWMhbkj48Vus3RHkUuHyuSe5/S0XZXv8NbbX6yai9/zq6YZgYqW9Y913D9kTtrGG/b
 SNrpffk7IbgXZF1HVnqSIjEkN3wzmVBnsYxlLaamy9dY+IjXF6vN0ZGgukRAQAA
X-Change-ID: 20250208-qpic-snand-8bit-ecc-dc804fd08592
To: Mark Brown <broonie@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_123136_469620_77806302 
X-CRM114-Status: UNSURE (   9.70  )
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

This small patch set adds support for 8 bits ECC strength, which widens
the range of the usable SPI NAND chips with the driver.

The series should be integrated via the SPI tree, as that contains
prerequisite changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (2):
      mtd: nand: qpic-common: add defines for ECC_MODE values
      spi: spi-qpic-snand: add support for 8 bits ECC strength

 drivers/mtd/nand/raw/qcom_nandc.c    |  6 +++---
 drivers/spi/spi-qpic-snand.c         | 21 ++++++++++++++++-----
 include/linux/mtd/nand-qpic-common.h |  2 ++
 3 files changed, 21 insertions(+), 8 deletions(-)
---
base-commit: 39d6783f6488786301f36b0e7c619f220c3e8d2c
change-id: 20250208-qpic-snand-8bit-ecc-dc804fd08592
prerequisite-change-id: 20250320-qpic-snand-kmalloc-3f6c1fb6c873:v1
prerequisite-patch-id: ec9e9786ca59fcddf9502d0ba5b0f4e6593aab62
prerequisite-change-id: 20250501-qpic-snand-validate-ecc-383b3e33e238:v1
prerequisite-patch-id: 7a549e08b3075d20c5014bb3d2151643aa956f5c

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
