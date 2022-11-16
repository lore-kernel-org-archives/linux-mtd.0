Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D94C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Nov 2022 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wz9cDs+IkurHU3vz2z165KUWZRF3O0wfr/KJZExFSd0=; b=Xlmj1mQw/T+yeq
	6MLgAUNZaskfYxNNHtsAQxXulBLXhfQl+zbdy9tbTpdpxCwRC8Zq+SpGJRnApLZS+Z5F4vUmBAkzM
	qEgW5kFzqJzwpJUs3Q81SL8grYUJNOwUo1WuOl8U9goyeF0lZuZM/ulqY9laD/0jjXCry3ttjWRq6
	g7Dx9g7mjdYwWWK6YnmJLK+7iW96brph80GDA50xH6EgehlztspdZEQmzrcwFbdyf99aT0RasiD9Z
	nvE79C+gavPnivzVNlPYECjwcxrZG6lgJLsT08Q4ZP9Izfd7lU6KaHymvlk8L5/vJ/YPpsViFe27C
	Si1M+w2LVHS3L0f3Yb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHsF-003acm-PH; Wed, 16 Nov 2022 12:50:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHs1-003aVp-64
	for linux-mtd@lists.infradead.org; Wed, 16 Nov 2022 12:50:26 +0000
Received: by mail-ed1-x532.google.com with SMTP id u24so26341042edd.13
        for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2022 04:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiGro6ozvASLxm710qclktaIhbfsoyOS4Qzb18JkaHI=;
        b=fxTvvyRqzMF0aRrGwb85R8pbPp8jXrXXb0R6XLrj8JyUCHFjzuH4cFvn7e/Yk6zCXC
         jZvmUvnw5aTeS7TxqqcuuZrOtw32WjuGWv1CbhgjO7+oX/T3vv3Mb+f4sjwyO6xrQeB/
         HtcGdu/X5ymbvMURCshBldUlfq8NMGizmrbNDieUqyPI/5hHFC5/xDgBtAtS/J//MR9E
         iJnjhVtjhYdj7+48rfKLqhf1xoNa1jFwdGCBD9US1CZtp6+Iuh4uCJFDyzEFeuQQn4r0
         asJHsNYLaF013MWBt19AYQm7bQIU/L3I4ysLGT9/c26IozYuZ41TjuqvYsTdNu6iw+wS
         jbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiGro6ozvASLxm710qclktaIhbfsoyOS4Qzb18JkaHI=;
        b=d3SoBBy/0qOVGnAqGgKN3goKMoop5A+RSV+YWjLp7u4hyThatqv1liD35osdPAVZd/
         ioZhyZCGRAwZSZmKy+8k0Iq6Vx/MjOme/jNnxhnmqmWHswFBXRaz3NmujDkOFmXFKRQm
         6Qf54zaojIHTh/YcxsJYZrqRElKP4C7X3QQevOGVEO06ZoS78PzbhE93j4U2Qi+X+xij
         F7ayFpkUkytYdTgKV6ulwh4tT84ttCN+HGcJllXYlRsnzJX53SjbE3givGjFq2CKe9lM
         sW2ocYHyvAAm/lWumzy44TtbTILJ4u3jwvdAFIPbrLvcT11AnbfsI4IOvC/DYy38XFa9
         9N/A==
X-Gm-Message-State: ANoB5pmv0XsokcLw+qk55ZNTMWHi2aTlYDf3EUHqNQs4nD62b/WGuzIZ
	DgUZhL5c3MvylcVthY2JdLU=
X-Google-Smtp-Source: AA0mqf7lyRizo8KsR7noBHMDFnXAq2zDiXHyiUBLhzcX3gG3UHIlwai5NPf2VPyY9Fuy7wP6zehjXQ==
X-Received: by 2002:a05:6402:413:b0:463:a83c:e019 with SMTP id q19-20020a056402041300b00463a83ce019mr19078409edv.253.1668603022157;
        Wed, 16 Nov 2022 04:50:22 -0800 (PST)
Received: from felia.fritz.box (200116b826c55000c59461cca0b9a159.dip.versatel-1u1.de. [2001:16b8:26c5:5000:c594:61cc:a0b9:a159])
        by smtp.gmail.com with ESMTPSA id b12-20020a17090630cc00b00780b1979adesm6833452ejb.218.2022.11.16.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:50:21 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] mtd: parsers: refer to ARCH_BCMBCA instead of ARCH_BCM4908
Date: Wed, 16 Nov 2022 13:49:32 +0100
Message-Id: <20221116124932.4748-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_045025_274742_75E6F9C0 
X-CRM114-Status: GOOD (  12.34  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit dd5c672d7ca9 ("arm64: bcmbca: Merge ARCH_BCM4908 to ARCH_BCMBCA")
removes config ARCH_BCM4908 as config ARCH_BCMBCA has the same intent.

Probably due to concurrent development, commit 002181f5b150 ("mtd: parsers:
add Broadcom's U-Boot parser") introduces 'Broadcom's U-Boot partition
parser' that depends on ARCH_BCM4908, but this use was not visible during
the config refactoring from the commit above. Hence, these two changes
create a reference to a non-existing config symbol.

Adjust the MTD_BRCM_U_BOOT definition to refer to ARCH_BCMBCA instead of
ARCH_BCM4908 to remove the reference to the non-existing config symbol
ARCH_BCM4908.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/mtd/parsers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index c258ba2a3a6f..daeae79e64f9 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -22,7 +22,7 @@ config MTD_BCM63XX_PARTS
 
 config MTD_BRCM_U_BOOT
 	tristate "Broadcom's U-Boot partition parser"
-	depends on ARCH_BCM4908 || COMPILE_TEST
+	depends on ARCH_BCMBCA || COMPILE_TEST
 	help
 	  Broadcom uses a custom way of storing U-Boot environment variables.
 	  They are placed inside U-Boot partition itself at unspecified offset.
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
