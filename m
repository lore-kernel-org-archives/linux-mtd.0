Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FE2C48286
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Feb 2024 04:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CjmCbzOhkUG26MzBuNcORjgQ8LAMw18CGQHwMBICU0k=; b=K5wG7JRwjOYSjP
	4enhwZYj5HVCkw7tvyGC+GqFxtAVpPG0zPAzwlSeFwX6VQLnOjdKIOpcxfjhLQYijshnaF7W5bVBZ
	dBy8IwV37WnIZpt2CI6t3bu2MxJ3Q6cCcMQW84z19vxrMFBfs2prq62fQ6ATKhqYl+xHQZcu+O7/V
	CrXED88Cqm9xy4NMODY33kVngoqlqgBEtCos2z20PUbXsQ1QXnv9i/SvJh9OukUSrqGweufACnthw
	ZWw8dCmq6djM2C1Cowk9qgU0cW8Huvmd6Cc27tEeM9k3Ia4NBNSd6VDRh71SNEbqzlX36SzYZ8/mS
	7NXncF4e7xktSvkRe5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXDDH-000000062VK-0KUG;
	Tue, 06 Feb 2024 04:37:39 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXDDE-000000062Up-3zYn
	for linux-mtd@lists.infradead.org;
	Tue, 06 Feb 2024 04:37:38 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5d8df34835aso164597a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 05 Feb 2024 20:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707194255; x=1707799055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MH5fvFRIuYDfJbJyWUwUaBR6eY500VTSrQVMrp4aRh0=;
        b=eOc5wQB8cnygIdWbO4h542vrQ8X9fzAyXiWWdgK1zEUxJe2QF82ZR/WqDsUICzGxpZ
         fjk9xK4Y7kTSRczo8ouMT0nuHwSz0fcSOsBqaI043YWRpzvoSGHz9SYvGSpDMKHscyY1
         Jzp69ghRhCLhSr+xbY4pbQPYdtiaCr624PFo/O6E4dsNYnoTtUD3bZ/k/vAGFhdEfARB
         CMwn4h6NXDH7SRMHcMI0J81BpMU0iK+uL/SZR3Dwe5OKaw3nLBFVwhZh+HPk7gVS6VuH
         6d3AFfo1HUQd/pdGT6F/rYJW9eEqXCq4qd9Q9GEF7rWj4KzonEoxUT+QsfmGR7OKu8FE
         j2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707194255; x=1707799055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MH5fvFRIuYDfJbJyWUwUaBR6eY500VTSrQVMrp4aRh0=;
        b=NbC1puMPGMf3aw6eLdVauaMV2g/nN9+UO7ujL+3x0+r8ulyB9stxuwsfqXoaQ2AuRX
         Atj/geVHUhRAGXYeSYLYTZSH4dJDgqPdf7/xdruNTzWGIEIG/rx6JJNIgX3pOH2ZiE84
         2QYD61VeuReqAHvlL/bNMiBQe5XQEtWR6ICb3a1N0j6ZPS1e31JyAkNIDAmTL7PHwJLN
         FAzKj8iV/56Yehr4zeMDm0RBtY8uH0Lr++DMSJgTnhD5HV3yeEsw/tQM6IXZHp64OWCC
         O97BYSEtRzutayighqRYVvOAf4G2QvShPD3Z1gpOirh2bZ1OcLmMOtWk8Kyo878U18yL
         ucQw==
X-Gm-Message-State: AOJu0YyRUuqw+xEMGXDq7Hs+atv9BVRzL/4wQ5MHdDx+IheQtHpsAfOE
	zA3mOh7t0Mg0SheVKN3FOMC8oK8ADkgyGLQHebAnQ9sB2RXv6+z4AS4NCz2z
X-Google-Smtp-Source: AGHT+IEdu3pWOw6PTReSbdLtiODaLQI+rwW4WDuBWz02aXXvO7NO0DYCIDwBWSCzPfXzO9FnQVd0hA==
X-Received: by 2002:a05:6a20:e10e:b0:19e:947c:20cc with SMTP id kr14-20020a056a20e10e00b0019e947c20ccmr840716pzb.9.1707194254813;
        Mon, 05 Feb 2024 20:37:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWtJJ610/oJHZP5EoktAq6g7iwEqg8hEduG+7tsfBRUQAWbub0SPDEt/a8k1wU4zlCRK4kHakOVRDeomUpBQm7+l2RvmI4AQ4PY3UGVhrqo8n6cnUSVNF3itkJOVIrhDWw1vUZJnunANQc5FdFeRNEblzk096N++IFRUaUL+ot6IUs22MaIpMaAvZkq2LEDrW+vTg7s6VZQCvaR/XVa5XJjAlyawOw5DAByO+GcjMRNJ2ptqxM5OF50bEgOTWYs64+w2qafhUr384+NvyaajQ+eTzZ+UZPfnKMiNXVmp9WNzg==
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id c19-20020a631c53000000b005d6b5934deesm945466pgm.48.2024.02.05.20.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 20:37:34 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 0/2] mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map
Date: Tue,  6 Feb 2024 13:37:24 +0900
Message-Id: <cover.1707193538.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_203737_011494_20922CAE 
X-CRM114-Status: UNSURE (   7.02  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

In v3, reworked to remove LAST_REGION and OVERLAID_REGION flags. Updated
and tested debugfs.

In v2, reworked spi_nor_erase_region to stop bitmask encoding in offset.
And added n_regions member to spi_nor_erase_map.

*** BLURB HERE ***

Takahiro Kuwano (2):
  Subject: [PATCH] mtd: spi-nor: core: rework erase map and erase region
     structures
  mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map

 drivers/mtd/spi-nor/core.c    | 109 ++++++++++++++++++++++++----------
 drivers/mtd/spi-nor/core.h    |  31 ++++------
 drivers/mtd/spi-nor/debugfs.c |  18 +++---
 drivers/mtd/spi-nor/sfdp.c    |  42 +++++--------
 4 files changed, 112 insertions(+), 88 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
