Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFDDC0755A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zpEcmB60uMi7XKoQlgL6YSLWn7KYV97BczGIYqCn5ig=; b=wuxBEc5F5RL7tG
	PvHU0/DFzBUuLHnniboMdsl+mRn7uoXtqEr3xZohmuxWkWadfW1pp9esMObgMUH1ZIISkSZcjlqns
	CDXEvyND8/79clWhCxNLtXQgRxN3z7FXXjQWJ12/SbGyKNleZNSL49NdKWPpfZ7mLAVuyKN0teJNz
	VqfBQvX1NMrB0pnLfp4Og0sQ/O421R3B2aJLHxTDO3UlRBApCBb8uGobLXSOzYy00QsyQ2flhAdOM
	N0/XF8Adn4rCa5D2IKKc17sBEk5OXJLu9bvNJBmf1PVVD4nFlt6+lf6W9Gb/4IlzRv79KqMRG6vfr
	AyBMkoUcEyotomL8rowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YXI-00228g-0A;
	Mon, 27 Nov 2023 10:08:16 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YXD-002276-2N
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 10:08:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cfa8f7c356so14755415ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 02:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701079688; x=1701684488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tb1JSZh17lcwZ6X3VCaX86Y0Es47mcZ6riEK4qVoRw=;
        b=WaQaagWyeaPm4tsETtsxev3tIyuNmctZbbVK/IZWACVpi6dOjs9Bv1gUzfcxB7f5aj
         j68gDpP9M0HpM1VdDDxknoyz6WNfAFZzH5niIeRuP/6srpgdYpuE5ZpP6+bqOxyJ/I3I
         6XqApx5a4p2siN+DIZ1w+4wJ67hTU1lGlqi+3y+/4xuAkgxq2dhvi2rV4+JC+mYE0JNh
         Ktgcd6zFO/zC2mgX2auWfrLauXAEZz5KCf+uB5eIRfBFurCQ3CR0XqrN4dQqHyuaVL5P
         AJNCWoze4SP0w7eqGtN6orsLZ33WkTAEJhLvRYqO4J54U8e9Qwy1Ho7i1aL9B8PG+3Xm
         zNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701079688; x=1701684488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tb1JSZh17lcwZ6X3VCaX86Y0Es47mcZ6riEK4qVoRw=;
        b=GqvHxHKVl3TjzIB0KZdQRhIswyMMGRxCJWV4hBo/Ms5PZEgQjCa/143KlL/Ecg51lY
         f9ZMcSh4YGWE2V9FgAhD8HXlsA8jLcGCZtIhU0BGGijBhQOpMIi3h4kh+8NuWOtYuzae
         4AIaxEp14VLWRHvJhVSP2WORHkW4xYfPvXG0ER140WkHhpaR8HRMAG7Nj8ov5xE40zFh
         6MG8kgE5CcSsfKQMGEAWmNIUK110UZ4xU0qnwpxZk9ulLnUVHqWRgefDU9HczNB+L7RU
         Iyp85l55dbK96Eej5CvEifwrKUuTGtXmVEVAOLDAN2zATbrwGWRKBgzFYQsE2r2RM+6M
         I8AA==
X-Gm-Message-State: AOJu0Ywbc4a6MJkrbqW50tw7fNyjmLZ/ciLWP4Ld5aJlsdG4+ohTxgz4
	eAGAf465l3LVEUfRaQFkga8=
X-Google-Smtp-Source: AGHT+IFtG9iAr8WoAa2EByShRVolM0PPOHe3lNOvkq16vgog1Us16NFvUHdSty7A91oeX/f01eEvbg==
X-Received: by 2002:a17:903:1ca:b0:1cf:d754:d7b7 with SMTP id e10-20020a17090301ca00b001cfd754d7b7mr1222732plh.2.1701079688345;
        Mon, 27 Nov 2023 02:08:08 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e5c600b001cfde4c84bcsm240781plf.141.2023.11.27.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:08:08 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 2DA358050C;
	Mon, 27 Nov 2023 18:07:50 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v1 0/2] Hide flash name if it is not set
Date: Mon, 27 Nov 2023 18:07:52 +0800
Message-Id: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_020811_773534_BA0EA96C 
X-CRM114-Status: UNSURE (   8.66  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

hide flash name if it is not set

JaimeLiao (2):
  mtd: spi-nor:sysfs: hide flash name if it is not set
  mtd: spi-nor: hide flash name when the flash name does not exist

 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor | 3 +++
 drivers/mtd/spi-nor/core.c                              | 2 +-
 drivers/mtd/spi-nor/sysfs.c                             | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
