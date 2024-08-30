Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B293CA0EFC
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B6F32iDLHUMCTAqM9+FhaDwTqCuXPhPomLREHwJR3jk=; b=rFS5x0P7XiqxBu
	DeWxZ7wXUQ+MeXP/fH+fQQg5X+hawHHYl27eqyxCk43Prf1oF4untdrWhZAhOAvvNjG24go1zXBcE
	+ad0QykAlPdCjPwQviBZREwT1VGDgI4XUe4UkozUy1X+JfC5xFROc+GPlXQ4a8YeSIwHC/s1rADtA
	KRj5SIG0QC2QYxjILd4blOLzwDOwBi6E83J0+q56gjUou8jg+0scebtJBb5Xm50etPcGV4715C6ti
	Rw16QWxt522C/8L0oqTN7FZdekjW3WIICfhYzuBvy6Td+3EEl5gTxJaFqVzFk8rCGsqcaPgBPdlj7
	YjcHor9gtFrF4qYlMW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyW2-00000005iHA-1ZrI;
	Fri, 30 Aug 2024 10:06:02 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyVI-00000005hx9-2nc2
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 10:05:18 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-714114be925so1325954b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2024 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725012316; x=1725617116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEwk0Qv5fctwHCGMCXlw1m6zjuEjxBtsPH0+hsyXZqM=;
        b=FyTa+44nFFdMZ+a242EJwWjb4TkcxBY59BJwiF57uJLod4YuE3t49UB6QybmYvOt1v
         jnwgdqAqz5FPw4BMHD0S4MUBO43sUo5wZ8IwNFJ+G4OknLFCRQmUEgTJYUKXTsa8UY2a
         6XpZ1lJh3lldNFQ/I3Id3tagcMWJxEAcanrnP9R3QOpfGv2mqbvlKO0CdIstEzUL23cu
         AWcyIHtYJtPNKLp5DRERUAU0+g58/DTbS/Nrgd5FgMSVaf38P7x7n+S+eiFnGd8wZfVI
         xksjfC+PXpkMTa3Q7+OX2g9acY/zrDmZRpckVr27eZycmTk0VC1UAnN7Y96HBNKCv7WB
         48CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725012316; x=1725617116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEwk0Qv5fctwHCGMCXlw1m6zjuEjxBtsPH0+hsyXZqM=;
        b=NOhoTwbcU8viVJ0wADrt2ib0T7fRqYt+sMNolkGHzIGAgSqE/HN0OUBhEyYrWgB8Rt
         BSjsjG5huFmUzPQGw/4TW7YydIf9A6BL274Tt7Dzot5Z3ztgX7THViZO2aIjc+jTqqHP
         +vZNcWDz54pocGucD1TuCNBNXPx8hNvNpMNc5R+K3HXPrILSAwy1vbnE/D5fGUmAwh8f
         ZQswwInzWyqSkhv5+moA0G7UusDMOvhmJgSVRXjPdzEABh72oY6iBolTIY7px4kpdKl1
         uMkjP1Lw3ecpdBqW7jHVONm4RZDsuQEz85fEFjeGWnyFVwRHi1bS9CkxYsaECeLNMGrL
         2ixQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhxpBy43cDSpPPOk2E5k7crniA7/qISHPMUgI5AqwkLo5oWyGwkxedbcWyG5/GMWEHkHBPZAJjJPw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEGu9nKCso6ymbyrXUzhGU4WddASaOFn420OwaVSJRYP9jX4y8
	6yNYwZcEny5kHwlXZRC7sjUMfW/71thmnFj0pYF8JVZ7CUEfIlqJ
X-Google-Smtp-Source: AGHT+IGb5MwPW/rJmnq12eLqUueFK0ah3mtlvAzl0l8OQ1FUegVcXsAx6K5ubVt70MG+YaXfW8UtDw==
X-Received: by 2002:a05:6a00:3e10:b0:70d:22b5:5420 with SMTP id d2e1a72fcca58-715dfb988bamr6911269b3a.15.1725012315500;
        Fri, 30 Aug 2024 03:05:15 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55771ccsm2421702b3a.43.2024.08.30.03.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 03:05:14 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id AD4C8802C7;
	Fri, 30 Aug 2024 18:13:49 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v5 0/2] Add support for two-plane serial NAND flash
Date: Fri, 30 Aug 2024 18:03:08 +0800
Message-Id: <20240830100310.1553675-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_030516_946670_B0097881 
X-CRM114-Status: UNSURE (   7.31  )
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
