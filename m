Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CE2C87FCA
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AV0b9BernUYMW4X69l9O1xpv+fjfl8U61TKs2VjB240=; b=09RFD24xFf0B87
	M9xhc7i3516wqTixdHbHaetqN5D40SHF7U9e7pfBU//s4PXP/ZBVaycTUGA6g5OZj36w+GmKBbnI4
	Rhh+E+pjtm0IZ1Zxxm3Xl5w5/Jj2hu+7nzRYHDS/X1uS83UahTggl5HH/gTOFz1OEb/sV19RK/WQ/
	5gq8JjCC52JbJMy3pMFEYK3FQCiO+gWSCV7aJXSvVXOMxeNrGeeuUI2gdCM6qTM874EpAkUiXcHtt
	v9YAJsRK0+LvLGSaR4VL2GQXvLjIg9pNTpmUN9Qc3qY3dlRmQS9py8SSwPjgufPmLrwS865fogaiA
	f9g4I+V0hu3uAIggSU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7Ci-00000005hi9-0UCk;
	Sun, 10 Aug 2025 14:39:20 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7Cg-00000005hhZ-0puJ
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 14:39:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b7892609a5so1954817f8f.1
        for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2025 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754836756; x=1755441556; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LoY0CPX3Mp6Pye3EdbyOcGWTEgfX2frxQgeHIT5DyZ0=;
        b=ExY9FOscIEwkClGSI2Nu3RCu/pBtXMoOOxwaKtiZ4aixq568wNponGsw+uHpNUIFl4
         RdR27PJlJrHbD2my/h/3KovrAXoC5Z4YswJmU0G02yYkD/tS/BqWEaeF/abHmB0k4Hti
         yEM4mljHtwV+9qKPPicAaRRtBsGlEqOIQcykd90I4oePe3CL8r4UVUcogeLrnTt+MjqP
         wV48X/J0VFVzj9yLoSWiogay/Kkv2Z6j+bUu34K7/WdU5yfMb02ovcyBc6+hc+g8RTyR
         ixYIh5vPG96HjlANZaqc1i/AtnITvh9AcCzrNbEbPHozFsLep4/gYvzA2qbkUbm+p90t
         dGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754836756; x=1755441556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoY0CPX3Mp6Pye3EdbyOcGWTEgfX2frxQgeHIT5DyZ0=;
        b=PkOy+2ZiBtHxHqx+iMzwmUXr7bNA81fMeLgGNwycV7airhfWMlLRDhoBjLPYUCQmRT
         03NafoZ5jBTRXqOG1T0uenRMs5B6cMwv7iwNmI77mHJa0gO3BgTnQdI3WDbSoWTYbvtm
         PMFwOPTrIePL2sRbBFykbu/zzCA0LY3cB6YgExdeOFiGhRv2HvU/bbg3YTDvHPOsCrZn
         UxNeXY1SWCtVLy5gTy5G6n7fBeBfpBJ2pZonb/bCsD9OoK13MIRnpTMKpZsmQ7OKkDNC
         37d/IXmyEC+31Nl/vaIZLXtKwlGLyKo6GMlnHv83IRhQGNNyMt+CxUHhpg3bV2c7Dz2d
         I6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPcefT8LTn2oAUo9JiT8pFNsm3Q4NYBjk62osHbPxqcDJOYyS6lkw9voFqMzSdVEK4lp5es3bvLXU=@lists.infradead.org
X-Gm-Message-State: AOJu0YySyUNMvk3+bs1pBz9QXupfF5Z3ce1yE58DxfS0dnzGPMu7/Q5z
	SjlMqsdFQFSANvdSBXNsh6/5UoLqnvXKHENQAwhtZ5EaDQzThECgoIha
X-Gm-Gg: ASbGncusNlRQ8PAktMLDM87/JS5NqbA3DSGU8Rkx106DzsMtgSEcJ0umW6gyncCkCfD
	QXh6UE7KDIAA5oYfxSUV8dPxsJeTnLAr4gkNtfoRXaqbxPC1AO6RnnbXSrz1qW4lRJBZ3ax41LW
	Cj257PuJN7vtLA9+EJe2+pwOLs3ni1RCe1tzUBqecRJ6L3EN2W6+dDIqFLVMutBTuf55Ho+prI3
	jBW6NKSfWaDQDzdY3RD08UaveU1PrmCZCSsQh7ri5d+B6HevgGWninj8R0YEYJuDvD2LVKabWdR
	GHxNu4ru0LGXCGr4yvdrkyJIVSuW+UeLG/aQ4sLFh2RTXz0KVSIH4VhWV0tu4f4fQ/L5khkfGw7
	9iTh/FCDjZThd8lZd1XYq9bN6zMtCZIWu8ure0MXycXhXmVZBeaE=
X-Google-Smtp-Source: AGHT+IFhoUBteOIXdLbP6G3nDlH8fThEqymPt+BorrfMt3eobqFuWPiyuio+qlb4fl+hAUyIoDRqhA==
X-Received: by 2002:a05:6000:2388:b0:3b7:9ae1:eb9 with SMTP id ffacd0b85a97d-3b900b2dbe2mr8626495f8f.23.1754836755948;
        Sun, 10 Aug 2025 07:39:15 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-459dbba5210sm287721715e9.2.2025.08.10.07.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 07:39:15 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/2] spi: spi-qpic-snand: cleanup 'qpic_ecc' structure
Date: Sun, 10 Aug 2025 16:38:49 +0200
Message-Id: <20250810-qpic-snand-qpic_ecc-cleanup-v1-0-33a6b2bcbc67@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPmumGgC/x3MQQqDMBBG4avIrDsQNYJ6lVJKmPy2AzKmCS0F8
 e4Gd+/bvJ0KsqLQ3OyU8dOim1W0t4bkHewF1lhNnesGN7qJP0mFiwWLVz4hwrIi2Dex+DguHn7
 C0FM9pIxF/9f9/jiOE01Wm1dtAAAA
X-Change-ID: 20250809-qpic-snand-qpic_ecc-cleanup-c4d8f4e49e53
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_073918_244328_1E734E57 
X-CRM114-Status: UNSURE (   8.37  )
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

The series consist of two small patches to clean up the qpic_ecc structure
in the spi-qpic-snand driver. The first one removes an unused member from
the structure, whereas the second reduces code duplication and removes
another two members from the same.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (2):
      spi: spi-qpic-snand: remove unused 'dev' member of struct 'qpic_ecc'
      spi: spi-qpic-snand: remove 'clr*status' members of struct 'qpic_ecc'

 drivers/spi/spi-qpic-snand.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)
---
base-commit: 13d0fe84a214658254a7412b2b46ec1507dc51f0
change-id: 20250809-qpic-snand-qpic_ecc-cleanup-c4d8f4e49e53

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
