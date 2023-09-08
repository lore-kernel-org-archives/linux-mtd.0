Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F73EE57CA
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 06:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9fM0CcDFyh97fGQJ7fUwt7lJw/eAq9RNol2xqgmCVMQ=; b=Hp1XVa82Uw51jE
	040yt5YLpEbu2sMUdhpVpHZwm+b4JxwwuVh7YBjrEdhbtqG6+wp1r4csOZxzpbmwuv5F2x4VhIYr2
	hMlz+F4RHBFd/CeRY2br2PnK8RyFyN34OKSoH8CPZQHeBE0TZ4Uwjqm/xhZ7Lh0rBCKHnViQ7jvio
	p4O1I5LA9zVK7D/DhNZhIB9T38X9qq3Q3xCZQXkMP7RUEcD0DgxT10dHlwxLFgBq3BXf0tYOsq5Vw
	SOFUzzPdeL7KvLyfqukpV0pMaX0TithKvDVO5teTAcK8GFuROuHISz/PDkgNdR0keUQgZMDO4EMqP
	4s+/sABgLcYztdxlyBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVD0-00DBHy-3D;
	Fri, 08 Sep 2023 06:43:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVCy-00DBGL-0v
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 06:43:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c0bae4da38so12296295ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2023 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694155389; x=1694760189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FFF39j+W4+8TquG8eo0yF0sn0AE1QIr3KEYXx/KzDFI=;
        b=JQJcUSz5ELTXMXXGm7dpZFz+WyuPNwVLaE78T8QM7xfQPfymY9LyzwCoF4Wnrj3ny9
         B5jDT0nH836gtGfOU8Rq8bOY+xkhXfKhgj+YCAgarXDmR5vvKjKwlmjfcb6mS8jVgqB3
         x+c+VPxZFNc8fQWRQoxJ55miIU5IoAkz4/80lzULNCs5WdFsHdSGSMWqzI0w0QdJBtdu
         dnqQGIcLfXNHAecnGQqokPKPRafyk77pWk42J0JY8B8IVkx3+YQbY0Z0ExubqjkSpMgS
         jn3gSSKOjp/p8ON4vIXYjkpVqdaxe/fmUraXHtHij7fIxwh7PGnMS1NE5DNmCX0Vj/Rm
         i2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694155389; x=1694760189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFF39j+W4+8TquG8eo0yF0sn0AE1QIr3KEYXx/KzDFI=;
        b=O7tTgX41nUlmzFsnv3Ur0OeifzuaECkQYhMBTf2DKDF9h/kyt/c2cJ1k++J0SQQiie
         2uNuLcYcymofAphO8pb6Zj0N1gqul1SCNa91Zr/VnojhIbNm6Dl8YmDe+hk112cZtNYT
         ncvMD1Mohm4OlBC95DAm4wh9FZ0bs6BbF+2DHc8X/OJzAfwKYhOhcpK9DmLcnIIp46jb
         s10fPjXagzVbg+/e+u8jxusy3s2Rm8KbIrz+CuY0evyrn0YMUPBKLcLKJwjpb/gKpFzt
         QtFD0FdNcRhjaeX618t4iM4206uGtbqumo/2SYVSB25e6iyMF4+lNyH39txpVzeR25gJ
         Kimw==
X-Gm-Message-State: AOJu0YwcTbmfZ+xghzsxmAPhWqTp7GF+BjO6rBCq00t7xsap67UM91Sq
	dl1AZKeznyqM9xrbh/bSWB4=
X-Google-Smtp-Source: AGHT+IG/3kefXMCJQQKlFUbqfh+XWCSGKibvCF+MvHF/JdIGdOnyuOa80hua70tqVxiCEljAMdDWww==
X-Received: by 2002:a17:903:18b:b0:1b5:522a:1578 with SMTP id z11-20020a170903018b00b001b5522a1578mr6195601plg.29.1694155389410;
        Thu, 07 Sep 2023 23:43:09 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id c17-20020a170903235100b001b9d335223csm817429plh.26.2023.09.07.23.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:43:08 -0700 (PDT)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 1A35680E29;
	Fri,  8 Sep 2023 14:45:06 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v4 0/6] Add octal DTR support for Macronix flash
Date: Fri,  8 Sep 2023 14:42:58 +0800
Message-Id: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_234312_319945_3B1BAE2A 
X-CRM114-Status: UNSURE (   8.73  )
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

Add method for manufacturer read id function.
Add method for Macronix Octal DTR Eable/Disable.
Merge Tudor's patch "Allow specifying the byte order in DTR mode"

v4:
  Add patch for adding manufacturer read id function.
  remove patch "hook manufacturer by checking first byte id"

v3:
  Add patch for hook manufacturer by comparing ID 1st byte.
  Add patches for specifying the byte order in DTR mode by merging
  Tudor's patch.

v2:
  Following exsting rules to re-create Macronix specify Octal DTR method.
  change signature to jaimeliao@mxic.com.tw
  Clear sector size information in flash INFO.

JaimeLiao (6):
  mtd: spi-nor: Add manufacturer read id function
  mtd: spi-nor: add Octal DTR support for Macronix flash
  mtd: spi-nor: add support for Macronix Octal flash
  spi: spi-mem: Allow specifying the byte order in DTR mode
  mtd: spi-nor: core: Allow specifying the byte order in DTR mode
  mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT

 drivers/mtd/spi-nor/core.c     |  38 +++++++-
 drivers/mtd/spi-nor/core.h     |   7 ++
 drivers/mtd/spi-nor/macronix.c | 160 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c     |   4 +
 drivers/mtd/spi-nor/sfdp.h     |   1 +
 drivers/spi/spi-mem.c          |   4 +
 include/linux/spi/spi-mem.h    |   6 ++
 7 files changed, 218 insertions(+), 2 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
