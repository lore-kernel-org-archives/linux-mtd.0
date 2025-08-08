Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB732C87FD2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M8UeHjoq2I6ylh9qNzgnQnrU7LmnAHdSIyD8GvQeRh0=; b=AFh8qPQGYdXkHI
	x9o9f/tZMsIZWeBSLQVW4M58H99XNahf+lrRbxoLUPl5BUhE8vfGE4R5X5+FOhTRKjim+50KVSwYC
	CfHHNoJ+ZJQ7bDG7aJPZvWTNZpIyW910z3BYTtxuM9LqlXBS9+G4FENNC67T0hlNY4LNOgjMqB9M8
	s75aDQHNA2PUF7uRkAt9U3lk1ganKtab+6lNPOdwN1rXg4uH+2RM9SwWZtssFaiw2UeZ+61RlgwRO
	a6eIwcAhQODY8xrDC8XpdlAHIQIUwRP8ADTfxF2s1C34+s0M+jJULNP4mgYaFA4RAhpz1432JxEXt
	yZmZTsg6JUJBVu+v7lYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJqW-00000002VBU-3q30;
	Fri, 08 Aug 2025 09:57:08 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJqU-00000002VAl-0Kml
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 09:57:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32138e0d9adso1743906a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2025 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754647025; x=1755251825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QbdZ8L3bxOL7zSlL59yv1WRZeyeO7nmFpcHH29wFdjE=;
        b=h7F5qS93d/NebMqonb0A2C1ZMz7VLJcb8vJrJSSKskgIKce3dZR1Fn+I7CSFbVkFw7
         zilhMIiRBL2m/igbf5wJ2K8+jTUh0GNEYXJOUWwGwCJzqdJdOKiGV+YVCPwcLpdpDL56
         +bzUthTyDzKJ7oEj04sVxqHXlklIwCpUnR5No0rt9VkwcnWC3P4y0twxs/J5c/NZEbiE
         W62NPyRm4sOWj27FWZSynS2FvDFfIo+9tOrPj8a2zuNMmSiIM8v8DvoeTUMA96LE+JdG
         6luLnjiyRjPdkRah0RdBcwpUW0Gu9/kPu+7fkBcr2MamHEUA+TLt3xt/wc2eMLipcubP
         o4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754647025; x=1755251825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbdZ8L3bxOL7zSlL59yv1WRZeyeO7nmFpcHH29wFdjE=;
        b=rkCNbY49S+Wk5wHIjQogKdfHJ22HavXjo/VuE6TWWUbWVGUX/CVasPZMs9HA3z4qhH
         ckKijNU1ZmDxJ3PiIcTsmqJQVcykxlKysa5ztrtG53v2TO8i/p3p14yykus2rMVu6ykx
         Wbuffm1CgQ794cTleBIKA74XYY7BVOx5lvPudkVbIQEay8gDjy1og96n8LEhh/iburTV
         RZ9dS2iegTcJE4YCoAigA54Jjz27CD3IeMMr2tI77D3xdaoyUkMx8naiA03A6NRkcppv
         L5Gjm7wbNBPuXSj/ZHjbdHE31MC180IqzdnQyNaXfNAaUjafydYcDTO2b4m9K7xPRoGs
         OaCA==
X-Forwarded-Encrypted: i=1; AJvYcCWCCYc4Tfx0/yQZx8rjEOwLTS3ly666CyLkMG+G8Q6lfobnHMOXGU4/ssLzq2X/iMJKQSDz8XX7r1I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKYw+cBitXigJjdTywseLGKZbr0ZA7ezv7314T41xoVVrL9WoO
	CM6hDTwTWf+kfMKjHsZ3WzFiq9MpiEn1hfJb4NA2H2tSoX9Rg9rWRrxt
X-Gm-Gg: ASbGncu18UNBi2WIrGhsc1m7lDeyUPO6n99jsf0DD4YT20FY7VHziwevZiFnMFEnOaW
	8grj3wqV/K+Mr/mnzyPnhuaXakq567P8npEEMjTUNzT5NgLfw5E7dMy2ZwvlX8lGNjjv7p55P6+
	kZuFu78VeL84O8r3cORuMw0oNKDnTkoE34Ip6E9sGDdCiimK61VgXgbcEVXbqdGpD+rsxrNv1XR
	diDy2MsmsrziZEdEqYyuKpzWp6c0CpgsRFrihuxCn9BA3YUvtQIdagsWvtdW4G292d33G9pCKmk
	zUZ0nMhefYgRl5prSlwyJPzJ5ZLb+Ule/UrokPyqaX7U9zjE/ymOROfGy/ek5G0HGE7ZkBOHosR
	gFvyvMkQEgHbgVpa6enj8VLpPXYkL4V04OOZ59pyfMIvtn1nskHZlStoh
X-Google-Smtp-Source: AGHT+IHu8dab8Vf9acP5TrYabIiLe5Tn4x32dlayXH4i2KpOKl7+vHDWdmGiQLqh6OwHns+3QBqCEQ==
X-Received: by 2002:a17:90b:530f:b0:31e:fac5:5d3f with SMTP id 98e67ed59e1d1-32183b3f09cmr3867750a91.16.1754647024933;
        Fri, 08 Aug 2025 02:57:04 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63dc4ea9sm24286964a91.15.2025.08.08.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 02:57:04 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id D3109801D4;
	Fri,  8 Aug 2025 18:02:33 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 0/2] Add support for randomizer
Date: Fri,  8 Aug 2025 17:55:01 +0800
Message-Id: <20250808095503.906244-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_025706_119300_29B8402C 
X-CRM114-Status: UNSURE (   6.22  )
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

Enable randomizer support for high-reliability.

Cheng Ming Lin (2):
  mtd: spi-nand: Add support for randomizer
  mtd: spi-nand: macronix: Add randomizer support

 drivers/mtd/nand/spi/core.c     | 18 +++++++
 drivers/mtd/nand/spi/macronix.c | 94 +++++++++++++++++++++++++++++----
 include/linux/mtd/spinand.h     |  7 +++
 3 files changed, 109 insertions(+), 10 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
