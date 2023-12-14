Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541BAC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c+lbS420yOmlDv+k9kcojvrOuf96QvIiNUHaSvmXy+w=; b=JYj4/wQKOu/2b7
	5BrCBJDDWMlWvmr2+wTxKXxJzy7j0uQhipZCl8DBj8eluW1sL6l82BMzkZXf/igb3tV2kTIJckHmz
	W7B0ltdfEOvZ9BH1iEM81WKV9cNFH6WAnWS5cUMjB2kwDcS/LfjjGLd2jSsIhXyfHyFc8QkIaGbMD
	9cSj2yd4yepguewZrXFaEuMMfhNuxrLhAH2d8RFrmKaki2zNWkiH16//QP5Tfjg7oekCNyn7osvCI
	t9rLSnJqmOOGN8D9kVK1EPyW2xspE4UWPUgPiJckggEdNyaOggpP3g/GjlglpcOz6OrkSHV+NYXDq
	qYqQtgOxNqZ8I9SNdPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDgEQ-00H8FX-1j;
	Thu, 14 Dec 2023 07:34:06 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDgEN-00H8E9-2l
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 07:34:05 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6cebcf8a48aso6612975b3a.3
        for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2023 23:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702539238; x=1703144038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRc1x94a/+LKTAPHhSwhA5OLUZLmiVMoOM9TV93EMNw=;
        b=lYlgebi8W4+dj335VPRKiORgRNI7j/1iajzV76gq8IbZf2DmpLPxZj5Gyo8pXh+MVA
         5DuL5F4jE7AaGH9J+9TlRIwB4CwestcNaKbutmXRlLwPr50x9dbPtfWBMmY93861nAr+
         nkLoK9rkBF5oM02LF47sJprVrBOaXAAYyNBYq/9qcEvlyXCuVx5Ibg+Cszgf1LHtoF50
         jYBEoBOLq8A1zct+Ddl/77cU2mDdmmrPv72yJZz+bHE6B3T4LqwfzixAQgVFLmOBv4t0
         QK2HsMRq+52gz7AG/iRumTnlM9Wa1XyH+qdRYM0rEeH/trM2Xg6sQ2M5bJQOy21jfBNK
         /rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702539238; x=1703144038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRc1x94a/+LKTAPHhSwhA5OLUZLmiVMoOM9TV93EMNw=;
        b=ZwFq3z15nZ5fPWMo0VrRzpDgkRAoJSKcScrxhLWerEqjRIlYIgJjm18nbGG6j4pS6t
         3wpbLd8bw+cWdGzuDYi9ifvbZga86Q5StbDWZJshqaYlRrhnXLOV9Jnlaspmb7nEQEML
         cSmHuVKfm4qa+Qu/52ec0qSrc60+gP20tjt+i/LTSgeJwG7+P4gfyJtyevMiTxuiVMpd
         EgkJnC+x6qhNbQKGPmHr6g2ITFSqPtk/rq8p28ZBorlG6RWkK22yvS+gNxYXIqMfwsVN
         x+9oOk7+Ybn4VlHX/yJcuwWha/o7ms8tT2lP5UA528hyA0ikq/egZvLAweLdywX3Yx+3
         ySaw==
X-Gm-Message-State: AOJu0YwNszqJA2PWgBJw/uO3PSzAgn4wSdlMAwaWSg+dhLG+f39IWTaR
	jWgbOmm67QNQcuRnnnHROqND2NaHjMc=
X-Google-Smtp-Source: AGHT+IEvASv+ko6vInoA1gDxGCqYCdjLC16w3bS47KyRtIpVLatduOPd+DD7ILjscHIG9T2vVkqjpw==
X-Received: by 2002:a05:6a00:1806:b0:6cd:e8c3:f733 with SMTP id y6-20020a056a00180600b006cde8c3f733mr11277654pfa.3.1702539237879;
        Wed, 13 Dec 2023 23:33:57 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id q28-20020a056a0002bc00b006ce350d946csm11071159pfs.41.2023.12.13.23.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 23:33:57 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 66BEC802C8;
	Thu, 14 Dec 2023 15:38:17 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw,
	appswa2 <jaimeliao.tw@gmail.com>
Subject: [PATCH v2 0/1] Get the 1-1-8 protocol from BFPT
Date: Thu, 14 Dec 2023 15:33:43 +0800
Message-Id: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_233403_954197_270F2D5F 
X-CRM114-Status: UNSURE (   6.27  )
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

From: appswa2 <jaimeliao.tw@gmail.com>

v2:
  Change unnecessary description in commit log.
  Remove SFDP version judgement.

JaimeLiao (1):
  mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT

 drivers/mtd/spi-nor/sfdp.c | 13 ++++++++++++-
 drivers/mtd/spi-nor/sfdp.h |  3 +++
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
