Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43E8C47258
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 08:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FbCKs//+V5JxrK+/Mc0mWW4rnfh2Ox4Fz0FvCSU6THI=; b=PbnwJpzyhnWYoN
	1FshWYrmjxyyUJYJosX8bvu9dEjEUDqHE7jnG0u9B7sHHKIgI79aFPYt5fHnfv1AqLArL4OJI9Vct
	GbUhlP5XW8x3jUBT/HFMPRHX4A3SsvY8ohjzcv/6GJB4ly+/YpVazm4zFBzHgmoeThMwHxA73HCg3
	/cBTbOo48p9dChwyncJMkCzM6vJLdg/f9iv5YV0/fvf+cJV5SUAtb0kJu/1H7akcqv55JxU6njPD1
	UF4ah7QoSiwzYzdJUHr+Pvqg8m9Mo+Tp6o2AbpRxxmlp8UFNOup+b6Ao2/uDMXp8eqPIuXgI6pIx6
	oIf17sWLYzDsyW9Ywxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSBua-00FUxc-1W;
	Tue, 23 Jan 2024 08:13:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSBuY-00FUvt-1N
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 08:13:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d7354ba334so20642505ad.1
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 00:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705997613; x=1706602413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjdyMne2W0pk3yqCC8GSWAmoom/ahbsO2rgqE8yW4hQ=;
        b=XbBkWxLGaE7IhPNu54ziEEh2T2JKKoAtFd+nXgJg4yTW/55hRm06JT2AI8OLlKRbXh
         isV4ZIEdNMplOL4mm1OCmBmbe1Z4qTEsD76a/pMeGd8yOeLYlRv+1XbdQ9WdNEv00hUA
         E0vnMUCQiLyQ2cRWiS2DyVW8idPj2vJETZdDueySEIFeSkTihiiO5rOiF8aLBqqJllzg
         vAhpT9xRASYgcP8tyS/5UDj5It9nCMaSAHGO07Grdo38AHUYeMXzesVJK1Y5MhyDsZtd
         aOfUVGHoGal5LIzLTFmrAnis0NDK7bJOj6e7ClYcqDy9LNy1gpg3BUYb8ltBeyQ+8Zf1
         1pgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705997613; x=1706602413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjdyMne2W0pk3yqCC8GSWAmoom/ahbsO2rgqE8yW4hQ=;
        b=A757MoO0TxTeTW62hjT2T7ZexOCrL+rfBSGJkR12Qrydr2w/64Dh0VNLNqWDNWSwU9
         JR1dyioggP6HWNmIPM1DBGnZzPXEY9efZ3bhDm7e5OsnFSqFUGs9HkajxTX5mV6gTFom
         yoQ2tOCl4NqcPuRsANVpVk3rreA1I+vhgWFimjCsfDi2DvHXq0b/RpFdThfRHihu76Np
         T+NC0M2po3z9KQzL9q8K6p1dJc6QyRvcdGmYxYBHpakWQH+lw1bDOEyIpJ85JbbRfTF1
         QZ0zzqtgiBwX9XuAhh2z5rFRUtolLPZagWQQjXjyfKpKhu4vExjlArAgEJYj+tmRpzth
         jCHg==
X-Gm-Message-State: AOJu0YywIH+rrKvl/+1fH9Gs3CK8i7I0k+VeL789GNReBAdaw30CafNR
	JZkAWoxBquXEpYJSh6B+f2T1igO3+yyiwXR3kz+ZA+bklfOmlxXWDTTb/b5e
X-Google-Smtp-Source: AGHT+IGbjuRkd2ZCXvaKY2mVL5byDvW5iJ8oSdbGvRUtofl46U82TYNpiqXD7JzyrPyuWK+bwO1Hrw==
X-Received: by 2002:a17:903:445:b0:1d7:338c:a39b with SMTP id iw5-20020a170903044500b001d7338ca39bmr4527741plb.107.1705997613163;
        Tue, 23 Jan 2024 00:13:33 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id u11-20020a170903308b00b001d76e9ce688sm642324plc.114.2024.01.23.00.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:13:32 -0800 (PST)
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
Subject: [PATCH v2 0/2] mtd: spi-nor: core: set mtd->eraseregions for
Date: Tue, 23 Jan 2024 17:13:23 +0900
Message-Id: <cover.1705996635.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_001334_461799_8981F54F 
X-CRM114-Status: UNSURE (   6.47  )
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

In v2, reworked spi_nor_erase_region to stop bitmask encoding in offset.
And added n_regions member to spi_nor_erase_map.

Takahiro Kuwano (2):
  mtd: spi-nor: core: rework struct spi_nor_erase_region
  mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map

 drivers/mtd/spi-nor/core.c | 94 +++++++++++++++++++++++++++++---------
 drivers/mtd/spi-nor/core.h | 30 +++++-------
 drivers/mtd/spi-nor/sfdp.c | 31 ++++++-------
 3 files changed, 98 insertions(+), 57 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
