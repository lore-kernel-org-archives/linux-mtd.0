Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A857EC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:10:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577CC60EFE
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 577CC60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+H4qoEbD/mHX2oDw1CTyX3uIO7tv3mZgGk6ASmxkYZM=; b=RpyiMqaxzNzuVe
	qakT+AqOWeDUWtrr4Op4flMlfPFYE7ncdcsLUZ0IvkX1dJTYnokp9QgjrVoIGoPozIcldLtNEaH2x
	M+JTXj8vCL3WqBw2MuGCq6fD6reuFZd5TuJtDfWJ3lOftElD4os94nfQ7tuE/0sfHsFkm3SOrpfOz
	3RuUO3XZwDsV9XBKVDfs1b86n8Q3Z+lJVSkqPjRnTiQtqNfrqbPdplZ8HqyMj6g7gfF+he39jqCsF
	t25Odfp0amNt0RigCBq/UOpivpG2mCMQN1XHocnCxsQfqUia0ttU0ZcuMC0/5SdLSTEorCebh7UqB
	X3VrN5GfTqEb3rbozYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ5Ye-005Dvp-1a; Sat, 09 Oct 2021 06:10:08 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ5Ya-005DvS-Kl
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 06:10:05 +0000
Received: by mail-lf1-x136.google.com with SMTP id y15so47957339lfk.7
 for <linux-mtd@lists.infradead.org>; Fri, 08 Oct 2021 23:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=WZITJA5RDQBykPHHs3oi35nNcLkeeid2R2sUia/aXA8=;
 b=PK3Sn5XC44U5Od+faaqn9axaO+WtLzPOm6jE5V0i5LVhG3I1tjM9BRFdWo03RQfbXh
 i+DOj32bEAzo2C7Cy4t3wNIRy0P0Eqzip+wLD6GMIW0EC5L8wuJkenngJs8QN7q96gGr
 MzA6X8aicGnYDxVpLOKoaTcIuj1aGhjheF6Mesdj4EZp8CHXPnftW6M4pBu/9pbRgpdW
 wlkZiMczOBEmw9omBMSD2059jlWjhegoQYMTn0/KIaBKLn56QFPkjiSqtGUmixV9fwVw
 oIPTOsRX7UMm1NruOZvlg41o5qiX6kCGaG3GBVE7pchiQ9zfA1HHgMP+ICEIJrO0fmLC
 rznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=WZITJA5RDQBykPHHs3oi35nNcLkeeid2R2sUia/aXA8=;
 b=UznTbXPZlplWCkuhk3UZif2s43joEjDpCgKD8VHjRTL1R95SCRTjp4ntSttI8UtJEK
 cPc6fl+cSs4vyfE+1mxceVZL05xas0k/Jgs1dpIGeMlsG2xwREXj0snSGUYN3AvkKtbR
 id+EA6eLGSq7WG+s9CxfHZjmOqWTv8pK8ah5sPTjoQzzSt4vPk5FxvNgmY9EGAZiGfdi
 X8ZwnCBbzwLMLs4+SYkQuKII9QO0YxErku5UI0UFnkwSnuYOhO71uJ7DV+5DKfmCvOsd
 uDtkJOH3zCfDYr1aRJuwE0pCJt/NB/IcxHPq6aqBsStUz31ef8bCqXEJVzBy+WQlHL3E
 HPQQ==
X-Gm-Message-State: AOAM530eFV++ZY4Dmzj6DvCD8mBEVEKEtH+0fBZ1ATK4Ka2oRIbsoe9H
 7Xj8M/bea5EhjWqodQo4WgNX6z0bofc=
X-Google-Smtp-Source: ABdhPJz+N4r4rWHBJn89hmqcWRA6YvLIgMy4aHyKQNp04z9n+8lAuHCBP8ZcDDtc1QfDkbuExnqW3g==
X-Received: by 2002:a05:6512:3993:: with SMTP id
 j19mr10132975lfu.647.1633759802331; 
 Fri, 08 Oct 2021 23:10:02 -0700 (PDT)
Received: from wbg.labs.westermo.se (h-158-174-22-41.NA.cust.bahnhof.se.
 [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id q7sm123340lfc.159.2021.10.08.23.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 23:10:01 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Joachim Wiberg <troglobit@gmail.com>
Subject: [PATCH v3 0/2] mtd: block2mtd: support for custom MTD label
Date: Sat,  9 Oct 2021 08:09:53 +0200
Message-Id: <20211009060955.552636-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_231004_723380_A521CDC0 
X-CRM114-Status: UNSURE (   8.67  )
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

This series contains a refactor and feature extension to the block2mtd
driver.  First we factor out the hard coded constant for number of
module arguments, then we add the new label argument,

Best regards
 /Joachim

v3:
  * split v2 in two separate patches
v2:
  * Variables and arguments on their own lines
  * Add comment to explain why we need strlen()
  * Refactor hard coded constants with a define
  * Spell and grammar check commit message

Joachim Wiberg (2):
  mtd: block2mtd: minor refactor to avoid hard coded constant
  mtd: block2mtd: add support for an optional custom MTD label

 drivers/mtd/devices/block2mtd.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
