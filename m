Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5806C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EDZrRl6aoon1YnuBWG/IIXF2bNobfrNdrnzZ6dBzoLQ=; b=HXUvlIdbT2pf05
	QO3ABsLmtoLlpglqk5j2skKts2T65f1f3NaU0fXaCosA9q3guZcrTNFbRwjnnFT4KR2nUku6rwh1V
	e6puRquhQO17Q009PzpQFQwqh2va5KOByhdsv0GYLY8QfNNUWNaQ+hnM394yOt6FzJiiYUB/5CI4E
	vnHNmWad8ry+Cd/xaU3CuV+Xjq2k4Sy2NlReI78QezpRcpfVtZbIvZQRAyBChcgV+1fQUKOT5JChM
	5u1FqOCFfNMbg8T7QehoXKxdjAftU28yrkDNIVvQSSaGPh3bfCC+RWYW9ySzdub92/d9zaj432BwP
	9d+3GzJTcLkjPrFMyePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtur-002zAv-1X;
	Thu, 13 Jul 2023 10:51:21 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtuo-002z9C-3A
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 10:51:20 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b74310566cso7728351fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2023 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689245476; x=1691837476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFQVUdMDIi4Gg3YTvnQm83+XiTxr0J1cb2EPYbHJRG0=;
        b=X2euuW0cq+jJLwhxdu6gQ0QULpBkae4eJ8zuopoH9QyCxGna5zfM5Yob5qw4XvEYl7
         aU1IR7vCw493qmgkKGj9SBwhFWw2te/dTm7guWah12/yoz8n60btUvVLZA5cvtl1gumO
         04RHalCSZHTKI6AZXwHi4Aqebm4buzWQhRLn3PIE6+8d8k0mz9gLfork/HFAosXw7K2O
         rZZxz0yNBKAHZyOuY/KO+igWGznDp38HuE+JbPVEOGTX4IGeCx7NvVfr9ylkWJcx2OXT
         gbcIA7Ah60sLDT9xlFa0pXTFZ4AyoiTfqaiXbgxSc3XpWRmmi2M4Ggkl+PCbU6N85f+e
         BjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689245476; x=1691837476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFQVUdMDIi4Gg3YTvnQm83+XiTxr0J1cb2EPYbHJRG0=;
        b=K5bxMY+WraXkmczZYd1fJrbw/8CLpdbQmit/mb6Prz15ap9vguTAizmDFEch5dSNEJ
         0mYHyyCu+3IdUUgxr2/MluKBHYTrjnud1tD6Sv0/v/96DCP3iy3hynbUZYObf48FpKhK
         guqYFx471I5+YWHaOJ5sdeCPAXr6L5IKf2wqDzUKKT4gjv/OyJjsM/W/o787G+GYJ8jv
         zTKzTk2VZwqyS2nU95RwGXmNW6MIrmOdJjDiDewKV9HHYppIc1+phHkAnSSxqF+4HfKy
         syOLvTK45Tuy1S7GxSOv/ukFqv41uXu/St7yq2Ct9lfqO3+JNWb8d9FCKV55o8+jMRk5
         DvJA==
X-Gm-Message-State: ABy/qLbetNlMdNVEzP6wwM6fGjQgbW4rvV0Irc4Hu5miTe+YDM0dW4BN
	8jwqMTnru7XqI53FBo5spIA=
X-Google-Smtp-Source: APBJJlFJvkRz87zLgCl2LfyFxE3f/aHE0bKVMFVTd+tWKWECKOhyZqu//7GBoxdtKpSssED4MwqxAw==
X-Received: by 2002:a2e:9113:0:b0:2b6:d576:a25b with SMTP id m19-20020a2e9113000000b002b6d576a25bmr1058373ljg.28.1689245475943;
        Thu, 13 Jul 2023 03:51:15 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c230b00b003fbaade0735sm17870222wmo.19.2023.07.13.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 03:51:15 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 8321D818B0;
	Thu, 13 Jul 2023 18:50:38 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 0/3] mtd: spi-nor: Modify rule of parse SFDP
Date: Thu, 13 Jul 2023 18:50:55 +0800
Message-Id: <20230713105058.101321-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_035119_024420_3812CC32 
X-CRM114-Status: UNSURE (   6.98  )
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

From: JaimeLiao <jaimeliao.tw@gmail.com>

This series change the rule of parse sfdp for enhance complementary
relationship between SFDP table and ID table.

JaimeLiao (3):
  mtd: spi-nor: Modify rule for parse sfdp
  mtd: spi-nor: Add features support by parse sfdp
  mtd: spi-nor: change MACRO for flash ID tables

 drivers/mtd/spi-nor/atmel.c      |  40 +++++------
 drivers/mtd/spi-nor/core.c       |  82 ++++++++++++----------
 drivers/mtd/spi-nor/core.h       |  39 ++++-------
 drivers/mtd/spi-nor/eon.c        |  15 ++--
 drivers/mtd/spi-nor/esmt.c       |  10 ++-
 drivers/mtd/spi-nor/gigadevice.c |  43 ++++++------
 drivers/mtd/spi-nor/issi.c       |  28 ++++----
 drivers/mtd/spi-nor/macronix.c   |  65 +++++++++--------
 drivers/mtd/spi-nor/micron-st.c  |  68 ++++++++----------
 drivers/mtd/spi-nor/sfdp.c       |  25 +++++++
 drivers/mtd/spi-nor/sfdp.h       |   2 +
 drivers/mtd/spi-nor/spansion.c   |  75 +++++++++-----------
 drivers/mtd/spi-nor/sst.c        |  53 +++++++-------
 drivers/mtd/spi-nor/winbond.c    | 115 +++++++++++++++----------------
 drivers/mtd/spi-nor/xmc.c        |   8 +--
 15 files changed, 329 insertions(+), 339 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
