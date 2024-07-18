Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AE4C3DA60
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=35/vugMER2+39ort7dnqb7HbTcWQ+uvp6wQoLDjYJOQ=; b=hHg8k7p70QyPGi
	WphoAAnc191PQqlXkG6VD21Yn/OlR6J251cyM1DDM9vXXhZ+jQNHPnxxko7Vi+dOM932O/RetNIY6
	RlEylfS78KoVjiWPWealCKx4qv4FmR7ohJMCnEbHfatCh3vMOCbq3khw/9F5leiKlUnV430kP7csN
	UESADWDe0exvkz9K322DS+5OtXvOgBlvgSEnnHsP+HlUVipa6aptXpfaZAQsoZ0KbcKWa9nxIws+J
	WwVLtU9TFlHz3KOPpmVooPvrHBX2U+tcCaBV6bUFCDjpn+oGcVjjJEYE6GYBQky4tCiD5MaRpOv8H
	jprdISQsU98++Cj8zvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULyo-0000000GIi6-24jC;
	Thu, 18 Jul 2024 07:55:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULyl-0000000GIhZ-18hW
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 07:55:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fb8781ef1bso5099245ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jul 2024 00:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721289305; x=1721894105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZA5IPLmrPdo1khB/bNRcx/2WhOlf5P673XgW+aShrs=;
        b=VhT5BzZdW4ukHmRpht7JYBbl9aZpqpzZsaBXHecpIKZJ8A5P8w/tehsUwtd4V6ZxY2
         7LhJ5m/XjAFDRCdwaBtdub0zJESdIj1JbV8XJCi8+BrxPl1ErZCHLl07Ds3Lgo5MOJBr
         vQkRNzSR/s6zAGm8hj3FNX5w6WhARDoTrM9nLhOURvbEJaZlQGBHlWQpxuoqTwgIQ2Vw
         dA2lQbbqN9nEDhG/9kg6tXInc34Hb2EujggUDjgukrOvopO4yy80jwwguoep53eN9E1+
         A1AB9ncZCibIUH7A4VCHj6f9NTD0JWCl8orIWrAnRxRcojSr326DxbJ7Q1nj2Gf0PWs7
         Qghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721289305; x=1721894105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZA5IPLmrPdo1khB/bNRcx/2WhOlf5P673XgW+aShrs=;
        b=tBe7rexPOqHBhK9yx9pd09NnpkYgnIbRj3ZJf3wxFi/wsg7mLEs6O1UtDgiMJG7Bqm
         mo0kVvTf/afYsKWGQpK/80qq686NNeNL5ZpX1P1hv98hZ0mW7ociKXxaBN2tRNy0dhls
         x7wmBXJWLwniQ4uvsDgBWhjrI5nj1keSk+I1m0hgwUkxFbpqdgXpf90WaUqJgi+TRvm1
         4b2tUfmM9HUGJ7Hr/xbHSRy1C3e2m5dgFr7IZS0sVlLGUuthuFFQlQ34vXnHTcrxMo88
         2+Y7VONWa75KvGQWQkMgQ7b0Xgq2GsyzZKONJYK4jwhismZOrmRf4cSjkyN0Z+Vr5vbq
         vopA==
X-Forwarded-Encrypted: i=1; AJvYcCVI7zCjJezYeM1nqBUDAGh12keh+89xYlJLI2NKtn8BDGdKAdV6HIm15E331inwZ0DE9U04UHVZ97zJLaOFCxg9gOb//+3QmG0tL5sq6Q==
X-Gm-Message-State: AOJu0Yz7IKx5/rVFNIzk8WD+T+xw5JdiXT6pT5Mt+5fhrd+drg1h/JM0
	3OftiKldar2Nt1mzYq/liLenDYZIw4fN20b2dOpZKq6I+0NYitg4
X-Google-Smtp-Source: AGHT+IEbsSUG6Tl4S9fs21p9y8/LyN8sXplN/4SY9rbtGmpj7qnhhT0h61oCSCHp1J3h7zx1E0OpUw==
X-Received: by 2002:a17:902:ce8d:b0:1fc:4b4f:68aa with SMTP id d9443c01a7336-1fc4e1361f5mr37321515ad.1.1721289305522;
        Thu, 18 Jul 2024 00:55:05 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc62e57bd9sm6187295ad.39.2024.07.18.00.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 00:55:05 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B9F5580483;
	Thu, 18 Jul 2024 16:04:15 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 0/2] Add fixups for two-plane serial NAND flash 
Date: Thu, 18 Jul 2024 15:53:54 +0800
Message-Id: <20240718075356.488253-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_005507_339136_261F82D3 
X-CRM114-Status: UNSURE (   7.54  )
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

These flashes have been validated on Xilinx zynq-picozed
board which included Macronix SPI Host.

Cheng Ming Lin (2):
  mtd: spinand: Add fixups for spinand
  mtd: spinand: macronix: Fixups for Plane Select bit

 drivers/mtd/nand/spi/core.c     |  7 ++++
 drivers/mtd/nand/spi/macronix.c | 66 ++++++++++++++++++++++++++++++---
 include/linux/mtd/spinand.h     | 17 +++++++++
 3 files changed, 84 insertions(+), 6 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
