Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FE6C5DF97
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Aug 2026 23:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O02BtBVP7myBxi4xjRiHR24eydSwEED+nOcdB7jF0ZE=; b=x1QuFsahN7qK/R
	wowcqK6DhNCj/Vt+cVfkRm0IUfE8gdoAJVl296l9Hrx9LIUHfCbDw26EESpMWJ1BB7x9z8aQuOFxY
	qkvAS3SZ0Q9+D4B/1EcplrbpHof233q7ZlW0hPnXo2mMf5fc/Qt3FtIs63kORaHjxFnDWNAaYmcwW
	Q/BC/bATc6q7y1D1FRVgSC/pDrrUY7dl79lzZOMZnIMZ7gJgjAAj6yirr7c/mWVpAsELUOFMSlnuQ
	k/pEDoCUMUFIXVLAAqvsFYayVu7oHt+W+nvoWccldaXUYdaHWAYvAD7QdfX8RRBtA3MR6dea70pCA
	eDdZuf47i8BJEefmXQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxukX-0000000Esm9-3VbD;
	Sat, 22 Aug 2026 23:03:41 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxukV-0000000Eslg-1rIo
	for linux-mtd@lists.infradead.org;
	Sat, 22 Aug 2026 23:03:40 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-934944f2d22so122837185a.0
        for <linux-mtd@lists.infradead.org>; Sat, 22 Aug 2026 16:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787439818; x=1788044618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Nj9Z65yeYw0MXmlycu2XdNGnhb+PJ5TviwwCRasi7I=;
        b=qS+hs+1rkPrk9/bUTE3pHKyAPl9tgM4SSauglyzao2h/hqfNiotQWExmCp0zEbWV4f
         ezj7+9GspsvuDe2DWDVrnEsmYyiEP7WYyxK7AhPf+qjPEAetuOgjA4JXOf5rqRY1pijb
         BbUSZHU8rsrUeQVrB3qnYYiqGVBAtdQ19K7lmBoDwcZneQuUFLQIZBDRucycvxYz8bks
         +LFIPajlby5V3yjLKal6158J+GzaOddiN1cSy6AKgS+N+Xj1WonvmJZk9oVQuZndGZ6E
         IGnyu+6BRI6NDMh556Bk+wemlqo52X7/c0Cv3oaOFyn0UeJvpmCECPyHGWicflZ9K/Ih
         N+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787439818; x=1788044618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Nj9Z65yeYw0MXmlycu2XdNGnhb+PJ5TviwwCRasi7I=;
        b=E2VUaVaCpJGGLaLYvSNqz34Lf3fFuE11QzA5TueKWJYVcFiOJ81qdJ/MhxtUMVk/eL
         /oI9d6pNiYVFZjR1i3O0PpwJGF/Ar5II3+3/XMQLst1PyYjxAUyoPP9/jmvoCdUzIRBR
         k3jtz4OVZZRt41aUZm5BXNgaHyoTd0rssv4UVLuhsPRQzrA+DIstQDCYu7guAT7SWxHX
         X+H1O8ubJYKTDw+aFDAFtSgcDBCo2dsFE2Wxru8nfVfwPn22/rGnrRne7WaFKWEYE/2R
         5RqcwMmFkRkN6XhM1/TEzzdCkjfJlNGcDD+wXRMSUGXj/g/mBUJXqO+j6uxEQpNtS1HD
         oWGg==
X-Gm-Message-State: AFuF++kLEL2ePKwCojEixdbThgbmYcVTFVvJNAAlzS+1SQLKgUTbgYL0
	Y5oNk9/y+ao0RaL1mOfW8I7qTZa0fLnFyuBiDvJQMRS7wFS66+3noTOimNHOIQ==
X-Gm-Gg: AR+sD12aHCJAre2YXJaom+RNKdGj0ys8DUusCXc4bTNh1GkV17RHsgAw9k7dHz2AahV
	ao6WbBQTgCkU86K90htIgZr4pL3kX2kKF97q3oaBb3tXQ1nTPU/uohRQYw0xZk9TpGLC4cCFIzi
	oZ1GaxpfPKcCqmacsiwMmuMfBM/qKVJaR77nnqywodCxZ+VEig24JDimtzeTX6mhHxUoMYjIHPi
	f/3E9/5JlHJzd4MyX17ST/bnIMKMlM5aAR5nMaMwENGwmQys2Abgs5VmfydEFvKoFrWmM3yGTIM
	JHbl6edHTBDRtp9yivD/zstptqP1jxyEVq84sRx4jXRifbg0KquQOG9hXDeSN4Cithc8+bcg56N
	/8gVf9HV+xMqoPznCoKPp4g368Oa06YqzMvHYCQ1vhqUGTFc40zL0NeyWWDmsJPnftfivhx82o2
	vqNSpnZi8fBRDE8ih6AchV6W+RTNyZdBJ6PghTSO4CLcKHb/6nOtZ1hakQ+lYIS86q924dfvxSd
	DM/Ml8+LpuPzHvf7+InGWqi3W8Ve2nmzB4LatKhwsPJQq25ply7t6IvxGBiWgbalmekKoB29QMR
	KXJJaiOvfanUNl8KW+Rmj3UsLIFn71pmNy0ceTymquIILq/VHw==
X-Received: by 2002:a05:620a:1367:b0:931:403:2442 with SMTP id af79cd13be357-937395b61c7mr1197595685a.18.1787439818204;
        Sat, 22 Aug 2026 16:03:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749eb31ccsm193232785a.45.2026.08.22.16.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 16:03:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: nand: omap2: Fix kernel-doc parameter warning
Date: Sat, 22 Aug 2026 16:03:34 -0700
Message-ID: <20260822230334.214070-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_160339_482612_63F40017 
X-CRM114-Status: GOOD (  10.75  )
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

kernel-doc interprets inline comments in the omap_compare_ecc()
parameter list as part of the prototype, causing it to miss
ecc_data2 and report its documentation as excess.

Remove the inline comments; the parameter descriptions are already
provided by the kernel-doc tags.

Assisted-by: Codex:GPT-5.6-luna
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 552f36da79fc..4909e62dc11e 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -666,9 +666,7 @@ static void gen_true_ecc(u8 *ecc_buf)
  * If there is no error, %0 is returned. If there is an error but it
  * was corrected, %1 is returned. Otherwise, %-1 is returned.
  */
-static int omap_compare_ecc(u8 *ecc_data1,	/* read from NAND memory */
-			    u8 *ecc_data2,	/* read from register */
-			    u8 *page_data)
+static int omap_compare_ecc(u8 *ecc_data1, u8 *ecc_data2, u8 *page_data)
 {
 	uint	i;
 	u8	tmp0_bit[8], tmp1_bit[8], tmp2_bit[8];
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
