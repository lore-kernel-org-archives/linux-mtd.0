Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A79C433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D8CC205F4
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t7gvXRkS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cto/WCmq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D8CC205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DvuC+3/BH2uVJjYCJmi05CW0AwQ1GfssFblFWcbOJe0=; b=t7gvXRkSvaPZUinlybONPX4BtU
	YbKgUKjPXkCaK6eSUAb8FoVokbjhFTTtKrG2l7hAgd/RgJuihCvwL4ZZybSODb1ZhX7yqOzqla2N9
	I0/4/2e6wvCedb1qNHGJ7G61oul9xiiOPM83GM3XBkPVzPj6jSRQm1pJftHulfQ6edK831aw7pWpr
	0m13+SJCmizYpRlcRmbZysjAU3O79XhHh829oO5GfRj+QHjbBMjrjzpNtVtj3dUFTZukLH9BTDPIc
	6t7h4orUncrmhIM82L3DHhPCW2ua+2RaNtRdLAnwlQOvMRLcFYfkACAwMPp7W1mV2SrPPrWSJY+JE
	dgrYv5lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huiHk-0004T8-Ez; Mon, 05 Aug 2019 19:04:44 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huiGu-0003SP-Od
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 19:03:54 +0000
Received: by mail-pg1-x541.google.com with SMTP id d1so7388278pgp.4
 for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2019 12:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kxEDWsBSeXa+mjMQrAdBHhxQSX/1/F6kSASRD4hvtcU=;
 b=cto/WCmqDLLY8LmyJJ5GLe8YIs8vUbemKlXb+YkLZmGvknFFKilWbvbGvpT0+dfTb8
 YbBGZYYulgh/4jGXQ9mtSzEKHiiG05rEyMIun/5F1nxmWa5Kxmi7Fr+/i2LUl2Lpi1Cb
 I1rHRUYTOEJvVikBaJJ9i0X6tzmrTU41xJRA57C1WLySyfajOOeEmt0aIp9B5t+RUiaQ
 lwtSn6yEuWpD2QEs5Q9CHmbowGXXvii01MvLXQOvatOzQhvPLQqg9Yo14wjkU/gsO9Xe
 AMcq4bY2n5+qMfrfuZYGs8Y7Szyfs7bticL7AS4rj/fFLvcG3fxUiKKHq8QFgBLbuLRX
 WR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kxEDWsBSeXa+mjMQrAdBHhxQSX/1/F6kSASRD4hvtcU=;
 b=T6FKgjH+KS4c9IKFRNJ4Vru3Xwt1Zx5jC5VmlnK6I5/c4QOjg97XGECMn3vz49wS0a
 +vNw2aZ3mEpHtcYaDFQ82FcDcVVheMb+fAJGSXo7QY0xFCmbqezt2yBbeHdNyGpcLVVO
 hjvcPG76zr5ktn2KyugwYFFhL8qnUaWaYE9Yd+0h614OoWNEBcOtFVze40Fp5N9sQDUW
 2iGiH946rDrVhEtuPNb+wRKhUX7TapgRzyqEFyG2fwNTF2xt8dJSpxQEoo5a6CDLcG2c
 FkOcFrhLXtr9AU0IU8TbQJiw4WbjBeZgh0fASGNaPnH/B2Sl4EzKfMDsLmL6HyE9UV0g
 3kPg==
X-Gm-Message-State: APjAAAXKwXy+Cx9SCOIWO1sNFLwsteCSlH6ydHrepv96Dq3h34BnqJz7
 dxB/womJSvgyU2K7keTsFLVmJ8Qw
X-Google-Smtp-Source: APXvYqyk8Gelts59U1tVtnwYClmQle4feCwJkuX3e+rqT/ovYBxsnWS22y6ohGf2/MX5Pp9j02y+wg==
X-Received: by 2002:a17:90a:3463:: with SMTP id
 o90mr20113716pjb.15.1565031832182; 
 Mon, 05 Aug 2019 12:03:52 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id q198sm88045579pfq.155.2019.08.05.12.03.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 12:03:51 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v8 5/9] mtd: cfi_cmdset_0002: Remove op_done goto statement
 from do_write_oneword()
Date: Tue,  6 Aug 2019 04:03:22 +0900
Message-Id: <20190805190326.28772-6-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190805190326.28772-1-ikegami.t@gmail.com>
References: <20190805190326.28772-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_120352_867092_C38E88AC 
X-CRM114-Status: GOOD (  14.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is just to refactor the function by removing the goto statement.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v7:
- None.

Changes since v6:
- Removed the tag of Koen Vandeputte as same with the v7 1/9 patch.

Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Rebased on the patch v4 01/11.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Just rebased.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 67640eded881..dea63842dec9 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1766,7 +1766,8 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
 		pr_debug("MTD %s(): NOP\n", __func__);
-		goto op_done;
+		do_write_oneword_done(map, chip, adr, mode);
+		return ret;
 	}
 
 	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
@@ -1787,7 +1788,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 		}
 	}
 	xip_enable(map, chip, adr);
- op_done:
+
 	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
