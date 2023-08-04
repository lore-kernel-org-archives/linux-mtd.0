Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CFBC001DF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KLFMvZYReAkZCYDP4oOybgA6L/UZrJWKA2ATlHpOW8A=; b=4TQFyhMDfHSZdP
	2CHcSP82iHqmY3J2sDnFKSlOeImWbCil+tZDLOqGGdaQIOnSexMeRMFg+WWsD5AF9lbFzUrAasqZd
	7KUdkKffYQ+OuorcW2Meo2lBuou2LQpMS388qrhwtX5qGB8vP/PxWWPMYiyXvz4rJbTthF4OZa/wz
	WfCFeBfGXIBcM3Pj21U+MhgogLxIsJ3FIgkpz8TtBq3WJwC6NB2H/HNVPpuOS4epW7nnBBKPHdQYi
	vBehMdu3M4pfdmbrI8HfqSpm8N9XBZsrWAzSpTJylvBVx5+LcES5hxBR/yhBps+CZX6jJ9w6KK/dP
	1/BIEg00Ms67ehV5AucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWP-00C47H-1D;
	Fri, 04 Aug 2023 09:55:01 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWM-00C45O-0x
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 09:54:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b8b2b60731so12863205ad.2
        for <linux-mtd@lists.infradead.org>; Fri, 04 Aug 2023 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691142895; x=1691747695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8NMwdzeymJoJolzF9zGEkyjh2xz4X49SCdJxbOiWBA=;
        b=rs+Ybw002zNmzU9WlPGGNiWLLgKXkSja1SLcx+Fm0Y83Cbur7nYDjpdWcw/Va5YF0M
         lHytpYnN2vPNw9ue9f2oVlbEpWNUJRTv217nKQVq8iVWSw/ocjaNAMajyCdZCv3prEPd
         ZWAmvvP/dbDaHqeTeMqDDNkGulspNJ0Cs9Tf2Ew3+6VobX8EzcwbL1AWstnhOj22ZvXZ
         U0eItO6T2YtDXPKOrE9uaQi8M+boHf6owotssN2rxHNlk1wRAagS89lThsOWBsW53gYB
         64eqOVr18RArtpqDwIS6vRze6oR3jUtomSoanFLgqjQgN1DsyOTrkxGYZwZ/aWPd9ni+
         WeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142895; x=1691747695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8NMwdzeymJoJolzF9zGEkyjh2xz4X49SCdJxbOiWBA=;
        b=SPaa5z2Y/rdlW+r0OtDtxWe2ee8sSKOUvcgCeRUZYb0NtxTvfw7JZUhLishL9tIJ9x
         forSeeunpVvFhgWfb2M53l5YpgnMhxVmV3ty2AIoVBLr1tyIgZs5hBz6ZCTweeorpBmS
         sFmh7v46WYpxMGJfM+QcTGjaH4CLkinMSsEFyLr4EjrTz0p+yB11OPksr1ftTE9bU6sj
         NGxm68Rp194U5JTetMXjvpBmsFbhO1BYZlFtPZi9h+7q8sbyBLdp4cKNicvFiWO1JMdq
         31SwWbV3Et2wZLvtIvu4/Eec3jMJC6eD/DOkgtB0rsX2C+CBDvMUVpRjzcQ4sL7USFF/
         uDlg==
X-Gm-Message-State: AOJu0YwVIjtLK0pmysYbtz+7l31U1JHQQiw4er7ooa7a/G9ko238b4zp
	CfUXiNKTzvs2wSIDhhqIBsY=
X-Google-Smtp-Source: AGHT+IExmnhobNd1ymuf6Q7+mBF8IRXIELIBnN9J6HlMzujz0Ta9Q4VgW6bSp52Tt7T6N2ScS42gig==
X-Received: by 2002:a17:902:8c88:b0:1bb:bc6d:457 with SMTP id t8-20020a1709028c8800b001bbbc6d0457mr875958plo.36.1691142894902;
        Fri, 04 Aug 2023 02:54:54 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id r14-20020a170902be0e00b001bb99ea5d02sm1341520pls.4.2023.08.04.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:54:54 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 6ACC0804EC;
	Fri,  4 Aug 2023 17:53:42 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v3 0/5] Add octal DTR support for Macronix flash
Date: Fri,  4 Aug 2023 17:54:04 +0800
Message-Id: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_025458_332804_ABF72572 
X-CRM114-Status: UNSURE (   7.88  )
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

Add method for Macronix Octal DTR Eable/Disable.
Hook manufacture by comparing ID 1st byte.
Merge Tudor's patch "Allow specifying the byte order in DTR mode"
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=290014&state=*

v3:
  Add patch for hook manufacturer by comparing ID 1st byte.
  Add patches for specifying the byte order in DTR mode by merging
  Tudor's patch.

v2:
  Following exsting rules to re-create Macronix specify Octal DTR method.
  change signature to jaimeliao@mxic.com.tw
  Clear sector size information in flash INFO.


JaimeLiao (5):
  mtd: spi-nor: add Octal DTR support for Macronix flash
  mtd: spi-nor: core: Hook manufacture by checking first byte ID
  spi: spi-mem: Allow specifying the byte order in DTR mode
  mtd: spi-nor: core: Allow specifying the byte order in DTR mode
  mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT

 drivers/mtd/spi-nor/core.c     | 19 +++++--
 drivers/mtd/spi-nor/core.h     |  1 +
 drivers/mtd/spi-nor/macronix.c | 99 ++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c     |  4 ++
 drivers/mtd/spi-nor/sfdp.h     |  1 +
 drivers/spi/spi-mem.c          |  3 ++
 include/linux/spi/spi-mem.h    |  6 +++
 7 files changed, 129 insertions(+), 4 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
