Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DD4C6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wDy3ooM3o7RZr7BEKBhiZ8DXX+pDPw6qQetlBeFhJzg=; b=s1b32YJgJbHMPV
	v4i5a5iKCMV0m29amHO8/xYkh1FL2SOM2I6Wnhy+CWZqMTcFUu4c1HZlJGtELYno4b0L1rzVBO0xd
	tYX132nZ3aUdgcCMylMw8TjR1Hh9JsGcMKBM5q+21SvCV+GC53Ui4xaJqhXip5pMkYDmNZ86Oqci5
	aSFAgmmeZWLoYtyM7ogDcmeB5BpclLGP0Zi5nRERfyF1OW7czBHU64tkAUYG+fF4hyZd6VPqFPywm
	ZdDwtKpOsvz7BwSXcGvFaOIK+lWbavdwc0szQkqmp/9LKV2P8rXzcKVmVfVlpLgIm3J8gDC0sdX3q
	PAABzDkIIP6/kb6JWkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfK6-009FEy-3A;
	Fri, 07 Apr 2023 06:11:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfK3-009FDk-2e
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:11:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id c10-20020a17090abf0a00b0023d1bbd9f9eso717945pjs.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680847902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H102Dlk+3Gs110j4qW/CbkdSkP2bXJY4B278RuG2mk8=;
        b=Vgxz7N9WaO5R4fNFkiD2PEazyLdT2NnLcrg0rCawcQ513wkeCMQhrEhl9LkbTj5jKs
         7E6EebK1slQc8h1fx91xZOpYpJn9YR1F26VjR73FexrbxGAno5jPCOLz52cN8Dpl3pMj
         v2B06kJbQQFs1Z68FzOY0YPtQpZXbKA2Gsulj211Isnxf/njEijC98zGzkP3fy6PaLLW
         1oX06SfdPLjU0skaQRzlZ4M7D+nfYttARlfaezIfOI5DEWURGDNF0wdro9KRDc6Zl+M+
         On7lZ9YpSFwuI7JLVdXtibgVRNb/G09FXFQqdUtwZ1DT1Xv8fbblXlfVj7+6N3lBf9vt
         fGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680847902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H102Dlk+3Gs110j4qW/CbkdSkP2bXJY4B278RuG2mk8=;
        b=22c9def6BZhgb6QJlyfD6UVwuFrvIb3QX7W89FTnyqnSM8HJ+9d47bmDGq4DqtywwG
         H0TZe/G8HGWbOj+2hW3qsTxn1+hvfZHm53aoRi1GH/N/+qzESl3OQp/DN3Sd3FBw7A9w
         Zxg7iazmXWxT7jvuiPY5LyZBps6U8dAAMpRPcmD3/lmy6o3L35lHMCKhs9HCgsNwoL4D
         hrumAFQaFjEAULjoQK9SYM0RNSN+6cnviw2YqkAyCrEK7weLQpx2zjfuZgxRAoE+gbHr
         YhAOZNWBUvLgtY0mEurRN1nGcNFJQyTTHu38VKcMsPBnkndLspeVQ9UkYav5evzcLi2p
         SDsQ==
X-Gm-Message-State: AAQBX9fnoKFLqOC995wlnpjK5R152gaRcyxm3HM9XFe13NkbkoyWgT3P
	QxqErzJ/XN2zewNtL/C2X6y08S0m4hE=
X-Google-Smtp-Source: AKy350ZjsIEqgQgCWhQ2W0kYEf69pel/sqx5kEsFXPi63TUJr7PBeaURDq3MlpCoSTUOC3+HPi+N2A==
X-Received: by 2002:a17:902:d4cd:b0:1a2:185d:4eef with SMTP id o13-20020a170902d4cd00b001a2185d4eefmr1788073plg.10.1680847902266;
        Thu, 06 Apr 2023 23:11:42 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id 1-20020a170902c24100b001a2beda73e1sm2272527plg.166.2023.04.06.23.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:11:41 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 0/2] mtd: hyperbus: Add support for Infineon S26Hx-T
Date: Fri,  7 Apr 2023 15:11:25 +0900
Message-Id: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_231143_873974_FB64C7C9 
X-CRM114-Status: GOOD (  11.85  )
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

This sereis adds support for Infineon S26HL-T/S26HS-T flash family.
https://www.infineon.com/dgdl/Infineon-S26HS01GTGABHM020-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7f2a768a017f52f2f5182c91

This family supports two interface modes, SPI mode and Hyperbus mode. The mode
can be switched at rutime. The default mode is selected by ordering option
and non-volatile user configuration. In hyperbus mode, the device is compatible
with S26KL-S/S26KS-S hyperflash family that supports hyperbus only so one of
use cases of S26Hx-T is replacement of (or migration from) S26Kx-S. This patch
set focuses on particular usage that the device is pre-configured as hyperbus
mode for compatibility with S26Kx-S.

Runtime mode switch between SPI and Hyperbus may be added as needed basis with 
spi-mem framework and controller support.

Takahiro Kuwano (2):
  mtd: hyperbus: Introduce SFDP probe
  mtd: chips: cfi_cmdset0002: Fixups for Infineon(Cypress) S26Hx

 drivers/mtd/chips/cfi_cmdset_0002.c  |  25 ++
 drivers/mtd/hyperbus/Makefile        |   4 +-
 drivers/mtd/hyperbus/hyperbus-core.c |  15 +-
 drivers/mtd/hyperbus/hyperbus-sfdp.c | 346 +++++++++++++++++++++++++++
 include/linux/mtd/cfi.h              |   1 +
 5 files changed, 389 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/hyperbus/hyperbus-sfdp.c

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
