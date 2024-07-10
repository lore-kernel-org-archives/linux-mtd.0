Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E4C2BD09
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 01:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iKkU55rt1Yy9QEg7qjcpp8JCZIzeaUOzwcQ9EdcG09E=; b=gM+Nw+LeMUYPxi
	O/Y4F3rEyCA9XmLhHYnHv4W/ff85H9qIjsOu781GlqG3r1JyFOyeqbSTjKO17YaR8TYjqW3cB3DQJ
	r9KElshDWNwxLNYRdajQVcKWvcvWPZ69btxVO70lxuDnTUk2Tk68NnxoZmLdzOsggBSmZWp+vcHX7
	r1OvD2Bl9G6gZGyDrLnQ2bmQMBPN4NjuK1go5LeoFovc5huYNu4814VEe1ur4BUGH0qhJj/b5Rcbb
	Ckycy8ogiAbccrDdHWuCO8/dwQVDQS8lEIf8GN7wiHTA0KfBBtf3kjh+W6i+VR8eHHkGqDv5PU8gp
	xT67fjXt+FHPB5MBEJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRLx2-000000093OD-23hG;
	Wed, 10 Jul 2024 01:16:56 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRLwz-000000093Nd-2kg4
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 01:16:55 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2c96170d23eso3567231a91.0
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2024 18:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720574209; x=1721179009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3njM0FEW3UtBZycSVpdIBD2yfZfAl+1hpFSCVAeh3Y=;
        b=RHurIJiyODbj78IiEekJKVLXt2ECt/Q6d6260m2VghpOVu7fTE2Jp96krZgnMirbMs
         lMRSklSRmTNBYbYea38rKcWcKvEix4Oh+bT7Qo16eaPib1FXxBs1Yk7rsgs2orz+Mqku
         PZdiSyU9Wm53f+hngWTIRMxRP5lcnqfKf1YAhuQpgNq5VTNwzFx3reMgbjKyQ0qJmr3u
         gcRgTQoJwwF5YAriTl+IAXSSKgLiawb4bGi+p7z7rZJnD9kAJicugA7xgD4a7mhDcdyP
         kN37RcZJ/DM/8kvYxhCuzFiv6O27zk+IjRDg2zEwq5eSul9Xj7jRHzLQoGSP0r4qQoq4
         7HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720574209; x=1721179009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3njM0FEW3UtBZycSVpdIBD2yfZfAl+1hpFSCVAeh3Y=;
        b=QHkya9XFEosV5HaOeoAdQPTvUyQp97A7yieh2SVge3zt11FMaygAbCiBL9TGwrDzAU
         85YfXEDYxKxkuqneJE/ADJhIVt8E869kDhVxhmmLDsx435XNeZu0QEa8y63xl/6F648x
         DbkQuDCsNHA2d8c/RVV8grl6OMTzFXDyMvNwsEvk7zhxcTkFrkIioexrPM62PFA3FNa1
         n1r1AnTBI9NCSP8dmbLfLAGuPBRkhDtzeYFEHnEK5fvPUTLa53a4YWxTAafdY0Oahx4f
         MVskm2+7kyIjI5mAyiVJgWKjcTH2N4tmIOEU+5xudVf71m5knzQ96tBTFp35A6NPKAUT
         1WRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHKo0CEn9/F+h5KE7U1YABzrcv2KttWyYm0fFl9XaZeGKivhibZr/d3V1ZZXgHSbSVJ4FdBVMSA2340m6F96npV0/5Wj/rdzyooik0DA==
X-Gm-Message-State: AOJu0YwXUUW7kikqeCtHMsPfSBQyE8TRW0p8tkMhvfXXpco/B9yuyFbY
	e0HTYpTlBAgEg1sTUSidLZ5ju1Cn8Z5z6pqd43t/HsFM88xBmk1m
X-Google-Smtp-Source: AGHT+IFj3ohK/qKnVGJPwpuwa41E1V1AfWL5q5n3zwa1A52vKNtv1TGwfj0kxHnRr8ppFOdgQZsKgQ==
X-Received: by 2002:a17:90a:fa8d:b0:2c9:6f53:1f44 with SMTP id 98e67ed59e1d1-2ca35be8b8cmr3206106a91.3.1720574209121;
        Tue, 09 Jul 2024 18:16:49 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a95197asm10732198a91.16.2024.07.09.18.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 18:16:48 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id F398980B36;
	Wed, 10 Jul 2024 09:26:13 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 0/3] Add fixups for two-plane serial NAND flash
Date: Wed, 10 Jul 2024 09:15:38 +0800
Message-Id: <20240710011541.342682-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_181653_724800_7457F163 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Macronix serial NAND flash with a two-plane structure
requires insertion of Plane Select bit into the column
address during the write_to_cache operation.

Additionally, for MX35{U,F}2G14AC, insertion of Plane
Select bit into the column address is required during
the read_from_cache operation.

In spinand.h, add struct spi_nand_fixups as SPI NAND
fixup hooks.

In macronix.c, add fixup functions and update ID table.

In core.c, add an if statement to determine whether to
insert the Plane Select bit for the column address.

These flashes have been validated on Xilinx zynq-picozed
board which included Macronix SPI Host.

Cheng Ming Lin (3):
  include/linux/mtd/spinand.h: Add fixups for spinand
  mtd: spinand: macronix: Fixups for PLANE_SELECT_BIT
  mtd: spinand: Insert Plane Select bit for the column address

 drivers/mtd/nand/spi/core.c     |  7 +++++
 drivers/mtd/nand/spi/macronix.c | 51 +++++++++++++++++++++++++++++----
 include/linux/mtd/spinand.h     | 17 +++++++++++
 3 files changed, 69 insertions(+), 6 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
