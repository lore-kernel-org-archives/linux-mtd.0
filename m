Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5B4C6FD1C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Mar 2023 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3lDCpseVd+NNjhITG/UZ5APHwdbVQLjU2Sfy6G5ykLI=; b=eunNQHPoozs0Ue
	HbTK47L2c/ZsGkPQ1/eEWRW0ut4iGkZNN+ym4x2mlJLangQzsRXaNhDwFMUNVGywtYfCh8YZ26J9H
	2EvNF9ZLWSD1nV/6sbkTd9XGE5Wu/6VD58ulBZQTQ0v6cSZkS96JJYbEI7OTzmy5wuSia7cjBloOq
	J09V5ehlXmbcgOfp90XXSyDzudMoAZkcY+WYlq4M8QE2qR97TJ5DfWtZSSwHBTT76ti72Tzquvqq8
	8w/10NEdSPf5n1JOMkwpRbOaLNhrZmjdwx/jVSq2xMfO4AgqqfjbY83XSJ8v/zrxhZUTOnn+d68Ih
	EkIrMygUEGgSzXtRQFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLY2-00275c-0p;
	Thu, 23 Mar 2023 14:04:10 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLXv-00274V-1i
	for linux-mtd@lists.infradead.org;
	Thu, 23 Mar 2023 14:04:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id le6so22366544plb.12
        for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2023 07:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679580241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/FSVIgFkJKT5jPFJCXaDrLahDNeQHDN2HW+X//0cEg=;
        b=J7irfwBK/AlyWjxu7eOdGZc3k24K4lB+89Vl/zz4hK5xhMiv41olFotAiTc+3WCGgy
         4cMirpt3fatv777O2iGcdLsHqFxgzg0Of+Dx+r9KaQi3ZcX3E9Lncwgmy7noLBDjikH4
         qeFPxJMXmBJ7rl7xsVcBu3NrRU89/WTJx5Y/FmB5rkNHCTn354ln3Hu1p+V0UCD4z7q+
         lZ7EoPbT6M4jOPrAj1w3LZOiSIxcjONMuB+R15oUGS+9n2BS5pt2GsGMTGnVqeshSECB
         PvejD3n6QPnwaE1fyXtLr7FvpOotEGMK3LXpiL4twfF5nd37v0qBb4ILaEy1GnA4JSbY
         Bjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679580241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/FSVIgFkJKT5jPFJCXaDrLahDNeQHDN2HW+X//0cEg=;
        b=upCqE3dzW5aqsEO4Gv3zIqq+3MJ05xPz7UsQcY4yLvMREzpmmEjqbFL/KJIdWg/swp
         3j06l931toAnL8WSHXi4r87Dvu1HYp99YGutsdw3SBsvpzGp7wzJpJt06vHZYjs8TrcA
         i3yzUm1TZudU8x34BChgoqYLP7Fu5qF3kBKY7mqJPVudSH4kDL2D4qYoZ12lAv4BYu39
         QNhMZgFbd9I1mnRhCo2Wc3EQX4qDMOJF/D7lH73gtsr9DcTmeXg0NcXMQxE+U4UKSwI9
         EAS9EVgcD8aIvLgXLovhCFHa/2hjAY0tOQtsWOjm+xiq80s8BWtAOtC7X6z9z1EV75Jm
         YW8w==
X-Gm-Message-State: AO0yUKUX0myQzqyJx+6GwX7lT5/SnHdDwAdEGm3SYP5qE2axgy4in0pp
	irY9Ho/OWV6w+R/6jm7LPuisOVhtL/fOi2+Y
X-Google-Smtp-Source: AK7set+No4CboYrqtpIMXSn3p5AoVWa7v7kwsrrDO8wk4wxo/FiN6fQ5stgd6ORe1owxLtO0hvB1mA==
X-Received: by 2002:a17:902:ebcf:b0:1a1:dc27:202b with SMTP id p15-20020a170902ebcf00b001a1dc27202bmr6165242plg.20.1679580241020;
        Thu, 23 Mar 2023 07:04:01 -0700 (PDT)
Received: from localhost.localdomain ([115.204.224.149])
        by smtp.gmail.com with ESMTPSA id x12-20020a1709029a4c00b001a1a9a639c2sm11967376plv.134.2023.03.23.07.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:04:00 -0700 (PDT)
From: Bang Li <libang.linuxer@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bang Li <libang.linuxer@gmail.com>
Subject: [PATCH] mtdblock: tolerate corrected bit-flips
Date: Thu, 23 Mar 2023 22:03:50 +0800
Message-Id: <20230323140350.69908-1-libang.linuxer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_070403_586787_F4466386 
X-CRM114-Status: GOOD (  11.83  )
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

mtd_read() may return -EUCLEAN in case of corrected bit-flips.This
particular condition should not be treated like an error.

Signed-off-by: Bang Li <libang.linuxer@gmail.com>
---
 drivers/mtd/mtdblock.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 1e94e7d10b8b..a0a1194dc1d9 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -153,7 +153,7 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 				mtdblk->cache_state = STATE_EMPTY;
 				ret = mtd_read(mtd, sect_start, sect_size,
 					       &retlen, mtdblk->cache_data);
-				if (ret)
+				if (ret && !mtd_is_bitflip(ret))
 					return ret;
 				if (retlen != sect_size)
 					return -EIO;
@@ -188,8 +188,12 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 	pr_debug("mtdblock: read on \"%s\" at 0x%lx, size 0x%x\n",
 			mtd->name, pos, len);
 
-	if (!sect_size)
-		return mtd_read(mtd, pos, len, &retlen, buf);
+	if (!sect_size) {
+		ret = mtd_read(mtd, pos, len, &retlen, buf);
+		if (ret && !mtd_is_bitflip(ret))
+			return ret;
+		return 0;
+	}
 
 	while (len > 0) {
 		unsigned long sect_start = (pos/sect_size)*sect_size;
@@ -209,7 +213,7 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 			memcpy (buf, mtdblk->cache_data + offset, size);
 		} else {
 			ret = mtd_read(mtd, pos, size, &retlen, buf);
-			if (ret)
+			if (ret && !mtd_is_bitflip(ret))
 				return ret;
 			if (retlen != size)
 				return -EIO;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
