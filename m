Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C33CD6E75
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 01:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4K5yiTWD36visRaMRotR+5vBqvfyl4eOU2N+hBqeNuQ=; b=0aJ7dmjPDT4wkX
	YPZfgqWZV34jfDvuZVJ1DWu0sUW6J5BmcND5/yVuHBRxbA8REzH5zVLAFKBWZPeC8cBAghzUAJz8N
	Fm9//Sxeq5AJjYyin6ZesmJQorHNN9Vb/fAonUVBw24CD74MKfgKtpuhbRcd9tS5Cu8FW0k5bnMBX
	htCm+9D5EdaBgDRkBmHwtxijkNt/nHZ9wemzpiKQ/MQO1IKa4ccj5Y0V3t1gfTL/j63aviiKBPRhH
	mlYKnRYqAvxD+4qGEm95UcCiSK0/0nNbGq0ZrUnoE5uIxXfkdI3QG8ZvnfS16qp3gvxcCB68sQlns
	x5zBVO8+XVNTdTIA5IpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIuq-0000000HTS5-16QX;
	Fri, 05 Jun 2026 01:00:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIuk-0000000HTQT-45An
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 01:00:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf1f074a12so13607175ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 04 Jun 2026 17:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780621198; x=1781225998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4U7TcvNY33wUvtf1lmh5Y9MjwLa2CwirOOtWB0dKVg=;
        b=rTB/zAOVILn0TYzcBnfltwh0bngkqC5RDIQnpNDO/+jSGTtdXi8+tf79dqxzMgKIdE
         d7WnRXvoMTNDyVa4y+aNv+JiaE9LhIQwbXk0ILnEICfqZUCNdkyXPlrFDr68eKpo3ZlL
         o4KwB2ujjYp649k2LIQSJwXUSwacT8+G9wER95y2Z0Ng7iIvjiFeFj9tAcnEwVxtwLCT
         yPr6GlQzeoVj9vuSI79dZIzxH8DMTz9ToGWd33ih2m4F7+pgOzR6Qilw1x9UtIBvaKoN
         yJilM+WIAp2jwO81pULYoLDYcyEw0QvkQo4+bOeK5OWo8KBgYCSCptRhkSNlL+TEsK2g
         frbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621198; x=1781225998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4U7TcvNY33wUvtf1lmh5Y9MjwLa2CwirOOtWB0dKVg=;
        b=AFDcGiDlCgYuGHA8kMdP/G7Yn/LthiM//z84gYfEGdL8E5ujHPWosusn9gWObHU3UK
         ddoPUkuaZCi092gI/qP6QOCEV9yIKe/cD/zk14YBJ6IMbSz3Ma+2bhIXUDpjkWdRZVcw
         aZxFLUUuPPF85uCCdGfU6gEDn+jFgObrtf8icWaK5zZCTFAsQbZJs4hCipUVIxwo8W9i
         uelVxoIjv+STNtGX18OlPk/HejodWIlNVmX/yfBNj5Qf2hk92yrqIr6OAc+NGTfx4NU0
         oPQu26cjDHmul+VHfDMFQwOWts4pKtcyQFCJigFdLq5qmewFw0cSm/GVqLXusXrF1F4j
         tBiA==
X-Gm-Message-State: AOJu0Yyhs2XDvcBJQ+GfozIpxR0has25XAqevLY35BA1YYbIpm+rQ/vN
	lyd4vIw2751Cs31tsRO3mnaU4iVxBIARuO7djmEd2zIwEjRcrPCXbluD
X-Gm-Gg: Acq92OEQKBO9apNRksuS59YsuH7BOaE1sjq5dVL88BA/p/zaADFle4FqX7GzHeVVEoR
	TrBRlRoocXrNfOA40cF48qKW5CNsDtXZSWpj60OeJt5DfRy6PgC/YOMPJFsOzW0RtzQa/MJXsH4
	DZH4HMqaQ9MZ2t0gg5NUL6p16Mfky3OB8FlaqNseaZKIycDwl9MoVoTp81ws5LnWFd3qrrzYUDd
	5jo4EEjGz4zwYB0SrNl00ZWJCLeq2c+43dJjg/s6mcqUJtTHaLZJfaWJVN/2Z/PzZlw1uehpYFU
	g3l60F6wK9t6vqNmhzW/5eHz4tnH602E2ghx5DjoXVnm7bGdAW4hXlq7Cns0lC1ul4FIUHjRXzM
	yuvQ7hgWisFxup4dRE+F03vhSeKP1h+Bfy62w48ZzDEMdvPxxGkpXIzg7h6kMykoYudIl1FzU1T
	QUwhmlEVwdcz9fONj4MzQfVmEqI0xSquK1uOnk1YCkydhwFu4naCwQ0QlD
X-Received: by 2002:a17:903:90f:b0:2c1:1a22:7c43 with SMTP id d9443c01a7336-2c1e8495360mr9818635ad.24.1780621197526;
        Thu, 04 Jun 2026 17:59:57 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa3a5fsm77310145ad.36.2026.06.04.17.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 17:59:57 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 7100B4163B6F;
	Fri,  5 Jun 2026 08:59:55 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 0/2] mtd: spi-nor: macronix: Add support for MX25L12833F and MX25L12845G
Date: Fri,  5 Jun 2026 08:57:18 +0800
Message-Id: <20260605005720.1857413-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_175959_023222_F92ECF15 
X-CRM114-Status: GOOD (  10.19  )
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

Add support for Macronix MX25L12833F and MX25L12845G SPI NOR flashes.
These parts share the same JEDEC ID (0xc2, 0x20, 0x18) as the legacy
MX25L12805D.

Changes in v2:
- Patch 1: Changed the fixup hook from late_init to post_bfpt. Since
  the legacy MX25L12805D lacks SFDP, it will not execute post_bfpt.
  This safely isolates the newer MX25L12833F/45G (which support SFDP)
  and enables 4PP for them without breaking the legacy part.
- Patch 1: Added detailed comments inside the fixup function explaining
  the ID collision and the rationale behind the hook choice, as
  suggested by reviewers.
- Patch 2 (New): Added a separate patch to restore the missing .size
  and .no_sfdp_flags fallback parameters for the legacy MX25L12805D.
  This fixes a probe failure caused by a previous commit and includes
  the appropriate Fixes and Cc: stable tags.

Cheng Ming Lin (2):
  mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
  mtd: spi-nor: macronix: Restore fallback parameters for MX25L12805D

 drivers/mtd/spi-nor/macronix.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
