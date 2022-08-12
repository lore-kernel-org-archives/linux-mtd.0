Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F310EC00140
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Aug 2022 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AjVYSooqm2EktpdVx6SLJUt6+9WdAcZwd8sXPKJhPhk=; b=g+ElvPa8C4CHLZ
	zu0hOxAGfP1/Rx4RRExvwQp7PqkAptXUvt3jcsuburrQQxkWRAsexxXYb5DahxNXOMZ1HH8/+MJL5
	sM5rPXVKvcXgK2Su1LmnzJEnA1xY+f9mBU9DaamGuKz6Mzi9D4FjRLQBHqrX5lVUalz8Yh/i0hvvE
	jSkLyaHcRTC+9pc6/j+5TFb2YvlVwNqbTIt2Ea5Q4eQC+KHySLt6oAFfaklMG4IpJaEglYspPOoSe
	GFm5nGt1uJKL3SOnb2aCvF0YFYuOJvulUlEqgP3CqrtZEsSZa2RiXD2wO77mJjuQ4CgwqC+G/QBe7
	hptGfgPC5I79nbIJEnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPhM-002UXO-Ps; Fri, 12 Aug 2022 08:07:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPhG-002UIZ-Vn
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2022 08:07:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id 17so175777pli.0
        for <linux-mtd@lists.infradead.org>; Fri, 12 Aug 2022 01:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=WHTHCfaC2d1v9CID+6MBM7Icqgmxze/59YKkgnv977k=;
        b=ZlMi0M9q3qLQVFnQC0buLL6wi5aKfZfa49Y3ENhGPkgnMdVfUEDFaLIQQQY4ffFSZm
         rSf0CnoFS8M5K3y01bS2J/o6yHd1j7FHYVDPrIx0Xc/4DlffiNet4Tzl6U+N8m5t0lN+
         zlHV5V4QwLeJedHL5l/NK18jVvlbI4m5c/GJeEzvy73LSCObtcgYkcT2p8ohxj9h4gr0
         Wds9YuXhoNkIGnSxdlKhmwcIezsEFRLJUtxIIlKryUNIdRxHJpBqFNcHBImdPQfSqJu0
         ukLDic//ht5eh99CFCd+5eY3EJUbjqwCe6Z86fd41N81HXTNuwTlZvVUHuLN4x7BobzV
         u2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=WHTHCfaC2d1v9CID+6MBM7Icqgmxze/59YKkgnv977k=;
        b=UKT35GXbuaJOpSoKPHCfZX81O/ZMnA3A3NsAHVKju8Afhaq1dHIl3PrcckkQyqsmOZ
         V8j+HIZftd1Q0V26DS5q4aM1n+yH3eZeb75X7ZzP25JfmaNN9ZHyn8vUq0jLC/h7/0CJ
         JJJds1EaXtykRmFZV/dVret3WQ8edURC9eXbF8vY8RKT6zFL3mZna2zFuLTB5t7NXhKl
         nMf/2hkil099wgaJGCk5+71+7X9v48dWt9VIazbGUq/8luzCY6npK74UNKjKY1Ra9/Nv
         dUSosJSKAUnpxrThEmm8uGGLB6FhM7i7g5jaaPwoxGvy6/pvUKzqLD3+sDqUqaEJs14r
         tdOQ==
X-Gm-Message-State: ACgBeo0CCp62d+mKF17VvNffPv7R+DL8ACvbUKntUlOZXPxv6M9ESXBH
	nsAWBzPmtnK0bKXsql68GiLv1FVVrjk=
X-Google-Smtp-Source: AA6agR4ze8uoGWQvgKwyW+xn3GFEzydfzf/sX9siATOy+vJ91OKArYNcE2fZD9w3ABXMCcqDAaFU6A==
X-Received: by 2002:a17:90a:1b6e:b0:1f5:1902:af92 with SMTP id q101-20020a17090a1b6e00b001f51902af92mr12774699pjq.238.1660291627560;
        Fri, 12 Aug 2022 01:07:07 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id y192-20020a6264c9000000b0052dce4edceesm960013pfb.169.2022.08.12.01.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 01:07:07 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 0/2] Discover current address mode by CRC
Date: Fri, 12 Aug 2022 17:06:31 +0900
Message-Id: <cover.1660291281.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_010711_057690_136B5493 
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Hello,

I introduced this series based on the discussion [0].

Patch#1 is needed to use READ_4B(13h) for offline CRC calculation. This
can replace spi_nor_read_raw() in SFDP, if it is OK.

Path#2 implements address mode discovery by:
  - determine factory default from BFPT DWORD16
  - read 4 bytes from address 0 by 13h opcode
  - calculate CRC from 4 byte data by offline
  - perform data integrity CRC op
  - read data integrity CRC register by Read Any Reg with 3- and/or 4-byte
    address bytes to determine the current address mode

[0] https://patchwork.ozlabs.org/project/linux-mtd/patch/e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com/

Takahiro Kuwano (2):
  mtd: spi-nor: core: Add a helper to read with alternative method
  mtd: spi-nor: spansion: Discover current address mode by CRC

 drivers/mtd/spi-nor/core.c     |  48 ++++++++++++
 drivers/mtd/spi-nor/core.h     |   2 +
 drivers/mtd/spi-nor/sfdp.h     |   1 +
 drivers/mtd/spi-nor/spansion.c | 130 +++++++++++++++++++++++++++++++++
 4 files changed, 181 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
