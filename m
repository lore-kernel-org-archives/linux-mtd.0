Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F38C88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0z+qrv/xiqvcsg7tInht316ykclWO0AkN57FdQBQ4uo=; b=1g50BxcYVlHPRG
	/AroEsCJo04PV6Ucn47ImZ8fkjDcdNPfWTNKWkP7CoVbJVv1hRijH6H1bf+PgMKNUx6bwI3KGimnC
	/mDcz2XN/TKIv41XklPdnjnK+rF71Z9H1H9v7z4Lqc6ViaX6BRXsppLWbK4JYlpLXhlMl7cb6r+TZ
	VRD4MXuGdW4B2oMcg3HAvzIrH8id4rDtPx9ulcwtNYAL01/hwndCGwaUrkAdNEHcnL+3Cu8g5bajL
	WOu3kBXyEZhRnW/m3MUMC+M7EOnUVqd5xturqObfYRp8eeBgalt+A4qIgfaKqSh3RIJO/ddWD98zp
	m4rd2NJUOITRrGT1tabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WEc-00000007SIe-3BW8;
	Tue, 15 Sep 2026 16:42:18 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WEZ-00000007SH6-2ZyG
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 16:42:16 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d249c6so3333253b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490535; x=1790095335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/Pvtp06R2zm1FquGnmOniD1kp0250IPS76W8PSHqFY=;
        b=rMvYQxaZ6RPzUZjR2EwH3hmPyCPSwf94SWz7sIaoHnGjUYo6CAIyChh/ZILwJxqjkl
         wFYjF6Oc2N4vXUXeydmzyBES0FjwhDBm0N16mgOW0ehyGjQADnbuBkRMBtIviR0Lpyy/
         DkEduu6p3w7f61x7vQGSd4dkTUaIbedsMY0xIvpdDTOuCVAqP2zHWhIbWpnctzTc0LSv
         PLL5H3/05eQxQb7lBDu2TUcfC1B357CWyoHc5wSLRkLHiLxu5lrTawcLosqyoJcd7VGr
         O1EkWvb8Q2RNIOp2fzLKkq1y9YC7MB31273yEqHaEtEiXnLblRzFCPupYJ50pKeNizvO
         Jf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490535; x=1790095335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/Pvtp06R2zm1FquGnmOniD1kp0250IPS76W8PSHqFY=;
        b=q4QHO2QDbYjtVk860rOtY7RB/TNV8A0nJjiX2bi1f08L7mabfIYMkTCXXhOPNe+BK/
         1cL0zvrGJUOGZnNo9PtpAPoJrjosmnGROo0HbtM7rZ3mQZuhzHAcFpJbv6l6ED/d+HD+
         UgjQnB+Evk3sij7ssfocCG/+rtrkspkb8/KaL3Cu/TbWgJ+AS1E/7LdxwknHbCrnBu7q
         kvCDNDuF4uKQpCFs+PgwnE4gkwt9VOvcpiaKe1KAQ+nMA8J6I/2Kwg0zWBDg8pblf0iZ
         5XBtns2oO3cFm5dR9DAs8DT5+ViG9wd7kg/5QxMMDiOBlBTz9k4ulA7FLC067UFbr3oY
         kZqA==
X-Forwarded-Encrypted: i=1; AKwUvBwWkNzATqySIzvy/G5tpFFMyG4Lp2r08NuFzJGsQV8WUt1u9eY8/8vJ5IW1W+3Ed1+imOnbSwkNGUs=@lists.infradead.org
X-Gm-Message-State: AFuF++lo8dtAugTsIORGDzukRnuZxzndPc4l2E2bbryhkQrDueftlFpE
	y71CHDCcH514v968ciGLy6Hgmo5t/i9K6wEceTJXdvMLDcN2M8MMYyFI
X-Gm-Gg: AYBFou0rGUNbSxe8UrEFKozTcS3Hrey9CqwcAPNKLVM2gVxYQqzZCN4tkHt0D0G+2oR
	fyRS5aDPgJZJg1d5H5CXenUa4M3AwpXiksPUvewu+bKI5OHe/ESCyCoVF68E3HWdk+NFt/h/Me3
	a2ABKHuZZJgomMCSIOJpSbSq/MFttQ6LOAb5JcOdTtSBfN8RwyXkzRy7DluqCBAKrrXxd5ErkcA
	rBffnP//cCworzieG/SzN+3fGF3ylcPpKLfPj7qnMPaZYjMryKZgTG3/+fPfUghcBNkWIBMRjor
	5wWhNvur51eKlMaCAweTyJHty4jgc9RWIONqyUxeV0J2jWrYX25Ov2exGFtqWbu4aS9OeyvAPJr
	QIj5GQ+KWEZ9533/KmZ7bNjnrUl6/OE0pXtyuu0hOmhPIoumqwWDBuhoGAPNW45VbqJLBkHUpru
	0B+hMlHU8r6EG+m3Q02/GVaZzokAMCi9BFVu/vuA78iM64FI0cdpiK/g==
X-Received: by 2002:a05:6a00:438f:b0:857:726d:2e99 with SMTP id d2e1a72fcca58-86f85beb5acmr15304470b3a.22.1789490534563;
        Tue, 15 Sep 2026 09:42:14 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab8ae01sm214501a12.18.2026.09.15.09.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:42:14 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rosen Penev <rosenp@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sean MacLennan <smaclennan@pikatech.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: ndfc: fix I/O mapping leak on remove
Date: Wed, 16 Sep 2026 00:42:04 +0800
Message-ID: <20260915164204.2492099-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094215_661723_01BA083D 
X-CRM114-Status: GOOD (  12.65  )
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

ndfc_probe() maps the controller registers with of_iomap(), but the
remove path does not call the matching iounmap() before the driver is
removed.

If ndfc_chip_init() fails, the probe error path correctly unmaps
ndfc->ndfcbase. However, after a successful probe, the mapping remains
active for the lifetime of the device and ndfc_remove() never releases
it, leaking the I/O mapping on driver unbind.

Call iounmap() in ndfc_remove() after the NAND device cleanup to release
the controller register mapping.

This issue was found by manual code inspection.

Fixes: a808ad3b0d28 ("[MTD] [NAND] ndfc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index a48274297d3b..0091b335b651 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -252,6 +252,7 @@ static void ndfc_remove(struct platform_device *ofdev)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	kfree(mtd->name);
+	iounmap(ndfc->ndfcbase);
 }
 
 static const struct of_device_id ndfc_match[] = {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
