Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48568ECE579
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rD9M2MaWDgfoueUgKar6eM/d9BkU4bDauFCB1818fIA=; b=tyC8pJTl8Kf0uX
	yAbl1jq4kEUAj3dE9U87dSNhin+D/SjdYOHudjYxd03a7WkXjg81DiPOPF6Oe3caFXyRdTLR7rVvB
	H+qs1U+VFhwZ8zNKD59b5yMqHA8uT37C2aFpaQ+24nMKrD329PMdEYlGSnJfO3hyLQFC3OE+E2xnp
	2NgV1TzLxAfTjqchm7N6xNL2OjQEkBWLfBWkPjcrECbqz+YEa2wlXn49TMQmlWRneRMw37ihnjhmy
	EDoCV5vIErD6f9m0U+Tc36/lJ0iHHLotMnyzVcCWEToX++oOrCSBrxjUdslO+GjuRS/DpD8tEaHic
	1xYCq7fPvVIZqQ3HUHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snahm-00000001JPM-2dmR;
	Mon, 09 Sep 2024 09:29:06 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snahk-00000001JNN-1QwH
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 09:29:06 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7cf5e179b68so3157613a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725874143; x=1726478943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufYMBg9rYDJ/MRvcfwgLYFZVNK9eVr8z78byql8J+6I=;
        b=RsUu4VYrCtBi2Ze0UQXof7PRds1W6iZG9SJho5JWZbjKi+29Z9pt6f4CkJTOn/n9b9
         9irsCgypFgMwKIjHez66CWeC3uHpboiGy/W5nGKBYDuFk3DcoYXVsMlAm9CDKYmpIqbv
         OXY1NmS8xsZxn0e0WHo8DOSpcAlVtYpY+Zwd3dB/udiN4qhmSicSJf8JNsqEQ4rhtn2K
         II0cIl/YLOVhHSj76iuLbdG1evrZ3cdQYd8zUvhwq8z5qpcSgWHqCu5vwOBTAzj6FqW5
         ifjhCJPLeYii3CXv/j7Ha+ilORNYOeU+erYnQx+J3UzGD1K7aflN1w8TIw9xOYOPmO2X
         MgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725874143; x=1726478943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufYMBg9rYDJ/MRvcfwgLYFZVNK9eVr8z78byql8J+6I=;
        b=IIZY+Z1BPotD8yAYpinxKP53uThokaPDjLRpA0FOXi1zpWFYt0miYgUJiP7nQZZLPA
         MTIv2wRaFlx5GNo5fJ3MqCXAaDXDvWvdPStt4g/jG8B0OgL+A89CXf2PWuGtwnMWaKD2
         U9DXJaL7o3IrSpHlv6piXF+0LktFay53VrfLnY3Jap0FIcmTm66RIiTljQ9YbGpTf96J
         8mxQ46JWZKPqwg0U+a36tHiAXlkS2DrIU//xqY6I5v8Qq8bM//g7XxN46E5++g2nXLpf
         AwWbWBrTQstWh1P4lyrXvaJF3c8Eh0A746c2owqAq6i7jWKC11YjXiX2e/3WAhbeFZiD
         U0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXQrkzBBGyzkmejjd8fUjBWmWTNjxFRJpOGQVylLZveh8MI2Og/AIGt9hwKk/st1NU3N2S6JBERPuY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx63SwFBeI6V4TKQopDFUEeREq7XGNFIYP8M4tT6IsG3KglTOQH
	Tt7+3PlSzkTiYNNCdm/H65jL6DDHPj7ojfFEjCHHOerM/DdlUWO7
X-Google-Smtp-Source: AGHT+IEP7o1/p8nkYZjYIgBrnR++Pzg0myiDU20VDe4aF86wA0+UK0CQ7McMvAb15/gLizCv1ThFQw==
X-Received: by 2002:a17:902:f54d:b0:206:b618:1d96 with SMTP id d9443c01a7336-206ee75720fmr152957265ad.0.1725874143208;
        Mon, 09 Sep 2024 02:29:03 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e34f32sm30420185ad.109.2024.09.09.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:29:02 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id AF40580152;
	Mon,  9 Sep 2024 17:37:20 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v7 0/2] Add support for two-plane serial NAND flash
Date: Mon,  9 Sep 2024 17:26:41 +0800
Message-Id: <20240909092643.2434479-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_022904_406560_4E1E0C3E 
X-CRM114-Status: UNSURE (   8.96  )
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

Add support for Macronix serial NAND flash with a two-plane structure.

Insert the Plane Select bit during the read_from_cache and the
write_to_cache operation.

v7:
  Rebase to spi-nand continuous read series

v6:
  Fix the name of the flag in changelog

v5:
  Update the commit titles

v4:
  Separate the core changes and Macronix changes

v3:
  Add flags for the Plane Select bit
  Remove fixups and corresponding function

v2:
  Squash patches 1 and 3 and come before patch 2

Cheng Ming Lin (2):
  mtd: spinand: Add support for setting plane select bits
  mtd: spinand: macronix: Flag parts needing explicit plane select

 drivers/mtd/nand/spi/core.c     |  6 ++++++
 drivers/mtd/nand/spi/macronix.c | 24 +++++++++++++++++-------
 include/linux/mtd/spinand.h     |  2 ++
 3 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
