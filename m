Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E87C5B552
	for <linux-mtd@archiver.kernel.org>; Thu, 29 May 2025 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FT+rbEldnuoEOOlYPhEPsd0PuqjoWyRNvWDi25LXgQE=; b=Ow6VtJi9ypUCsU
	UUeGmsemJ0pqSX80OzB1HVaOcpluyCv/ZIQan54SJF3HB7yo+0n4CYfo7HOKcTGQ4kXD+OqhLpodD
	G+L93Wv+a2iPMpsgbxFxTEAoLuW0v5x3M22HQU7hkmCOeCEP+BN72/Fr3bCx8Q33moXcjJbKBooZV
	V7w0ezXGnw3qVKIgh3uk0LAqgal52XGKZJeWOdFjD1E+SNafSAS/Y80DQCH1hMdua7o/Mf0jyyU0h
	fafnl6AwWsbTDjxHEU993vLu7dYOzp2BVX/veSbQLFPnDNXiJU9InZ2bYMjIF9TjStH/tglEbOgS8
	+Ep5g3rgz+MiLMhi+LvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh2X-0000000GHbV-25SW;
	Thu, 29 May 2025 17:27:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh0N-0000000GHKd-1ZE4
	for linux-mtd@lists.infradead.org;
	Thu, 29 May 2025 17:25:25 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-adb2e9fd208so69412666b.3
        for <linux-mtd@lists.infradead.org>; Thu, 29 May 2025 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748539521; x=1749144321; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuDRW6dNj0IOWTOPcp8s+afnvWue4+ReSENfxrc7Ikc=;
        b=EebTDus0m2EeCEVZMJ89qQKHHQNjaPGsFHeET1aPUiaBZBHpQNQhqZfu4XXpxRKqd9
         wGCZ2MNR1lRenVHm1HZUwRuj+56HP+BSVhRIbBFegDHkpukLEuEdeawDBEviEgJXlmA4
         2wK1B9NY7Y85UpYlAmnpSGdnA8+BsyeQebTlNCY7FcAf+G3s9qR4KZGlS8bjIhMPnejE
         9r4LwcMz0GU6OvZ45hpjHUsw+lpQi882pg6OPfLjxcBBQDyNPUf15Wah/vIOtx9AeLjr
         XXow5Ar3BoTLVJynGeC7Vg/I7aj1Ck1zJIhFKAxRXHRkfNbljOpPsbfLnECGhRCggSTW
         z/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539521; x=1749144321;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuDRW6dNj0IOWTOPcp8s+afnvWue4+ReSENfxrc7Ikc=;
        b=j7sZoG4TF561Vj+rl2WD7ILk9zQggs7QaUnoRPDVzD7PQ0fKuzV5sUgHNETaaN5dIm
         NjGTonSae/C5sbEX457JRoHy8Ad4ZYv2tuUHWoIBDVG+YuVrzMzd75XLWKCvypQUKCOa
         QCWXGRtTGMTm8xP9m79B/DWMHrPH2v1zeIMa8ohrAet8SLt0YGBkGxxd1oT02Zvwd+ZD
         7AhMYAKVTK6BpoZZwL9DcgO9IoUyH1esTgRDJJyoIjcK3NoYTyyTftGRZ+ClqbMkNa6w
         zEEu3t58fbDav8SsX0K9yAVH1iHVCOrUesnPLz7eatHDJd+8Hv9T7n8rdxsOFRVw1vxE
         dzYw==
X-Forwarded-Encrypted: i=1; AJvYcCWUCrMWy1Pf4QrhwPdiQSzZtMluWXgnyxfWdHfZaqYnwuu8wseUG2nGfEgGAQyPjspig7JxOCjkimY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvE9Zcu24yuxBpP9I5NPnKO6vp0luA4H3YxESRicBvYBqdsZp/
	QchXS/qlc7UP8DM4kkz+SQl1CtmaMRSxCXt7egIgs65YaNBjSKWyC8ke
X-Gm-Gg: ASbGnct19qCmGhJpJ/pTalVZsqek0nruIhFqYVQJo2O749S5gcRGbLCANvn2GPb1DSm
	w8E37xp3a3i61NfKC+rFyXtyUIXd8PLkPyw0v98H07MoNEqirO5dNE7hUBcuQIdSQeWmg583y/v
	8EQyhAYM5R0cu8nI/RNY8VSEzRO48ucibcOzgHfmsUQsvaK3IP6B3sJSrfQqui0mBFf02gd1GO/
	iDWdi5fPkT0U7HZLUQLvWEM7u9GTZRu8nk/eABg9/20dPPwA9gPr9cPzXtS8YVqtIXg00UKLbuy
	KTVnCmXHfi7KUKCFEKiB4EYtZmDMA4iw2L4uktRPBP3RMf3c9orCyau38F3tOIdWKobZG/zgNYi
	AzoWZ
X-Google-Smtp-Source: AGHT+IE3tPbHzEot+7hFeyg0S5+wiBWgftUOvAeih6bJHDPmAVbEJrAG1T10BSS9j25nPX/oPKWAMA==
X-Received: by 2002:a17:907:9405:b0:ad5:a2d0:567 with SMTP id a640c23a62f3a-adb32450330mr21988666b.51.1748539520911;
        Thu, 29 May 2025 10:25:20 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ada5d82d95bsm177793366b.57.2025.05.29.10.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:25:20 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v2 0/2] spi: spi-qpic-snand: avoid memory corruption
Date: Thu, 29 May 2025 19:25:09 +0200
Message-Id: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHWYOGgC/4WNywrCMBBFf6Vk7UiaEhRX/od0kcekHTBJTWpQS
 v7dWHDt8ly452wsYyLM7NJtLGGhTDE0EIeOmVmFCYFsYya4kFyKAR4LGchBBQuqRLLg0YOJKT2
 XtX1h4L1ySqPmqFmzLAkdvfbCbWw8U15jeu/B0n/Xn1v+dZceOEiHUpwtupPT18kruh9N9Gyst
 X4AeksKj84AAAA=
X-Change-ID: 20250523-qpic-snand-avoid-mem-corruption-301afabeb0eb
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Lakshmi Sowjanya D <quic_laksd@quicinc.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_102523_417765_E95884AF 
X-CRM114-Status: GOOD (  14.61  )
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

The 'spi-qpic-nand' driver may cause memory corruption under some
circumstances. The first patch in the series changes the driver to
avoid that, whereas the second adds some sanity checks to the common
QPIC code in order to make detecting such errors easier in the future.

Preferably, the two patches should go along in via the SPI tree.
It is not a strict requirement though, in the case the second patch
gets included separately through the MTD tree it reveals the bug
which is fixed in the first patch.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - collect offered tags
  - reduce kernel log spam in commit description of patch 1
  - remove inline error printing function from patch 2, and adjust the
    commit message of the patch
  - Link to v1: https://lore.kernel.org/r/20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com

---
Gabor Juhos (2):
      spi: spi-qpic-snand: reallocate BAM transactions
      mtd: nand: qpic_common: prevent out of bounds access of BAM arrays

 drivers/mtd/nand/qpic_common.c       | 30 ++++++++++++++++++++++++++----
 drivers/spi/spi-qpic-snand.c         | 16 ++++++++++++++++
 include/linux/mtd/nand-qpic-common.h |  8 ++++++++
 3 files changed, 50 insertions(+), 4 deletions(-)
---
base-commit: b00d6864a4c948529dc6ddd2df76bf175bf27c63
change-id: 20250523-qpic-snand-avoid-mem-corruption-301afabeb0eb

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
