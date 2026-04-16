Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7D8F433D2
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 01:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=INnFxs/Ma4pu+AV1yE8J3AgLKZeiJhMNXjW95u031CI=; b=p0G/bjd55cuTGE
	FSLqVY48IthmCn8mm06bo7AUQ8j8ohdt/iSd2yo8eRitNYEev3cY8pA0pxxa/pX7aGsHG1FaFP1jS
	Fvh2tqHE426QTQlP11XFpaqQqlTBrh2xIF8D3I3PNE7VFgIA8Os1u/XncLcNeQt0k0ZdxJQslsx8b
	QMkW2NkHr496kxHEwV7sYhHz6c4+WVP3ID2V4dOu1cXbRqXGe2Bmzb/7CjH8ZPCWYR563KgTz5OXX
	fe1OjHpsP4ajP6n5YxbV46LQ6Z75ji2tSm/GFLHunEjUdSoCswZYXlffPUrxpVo3RNxU1ekSn4KFr
	Jh52nAZq9gjc5KiR64wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDBGa-00000001pxb-0iIo;
	Thu, 16 Apr 2026 01:11:36 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDBGY-00000001px3-2PN8
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 01:11:35 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8d00cf835b7so901127485a.1
        for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2026 18:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776301892; x=1776906692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QfpySMydajhmy8CDZ0KzUQHaW9x3r0jflQmjPEkL1UA=;
        b=R0K+wkp0CFDAoUzecBoj52MjL9wwexyTnLh7qySXChaFJlkaWWIqbWU5NqorhoIS2v
         0HpDGwMO98wk/J6IRUCThpaZm+P9eiwTN8rj6OOsqmczgYE2sm8Z7YlXBtw5tytc+6eI
         y4r8xcC1howCGHBHRdpZhR5iaEqfT2aa3jqYWo6T8PhUDNoMpIuSBwVdhruMGBs5Wy7w
         GlHjLcTUW20AMf0sBEtSTb9WrjqN03Iy/gXlReB9ijl/SpLanxSGmjnl8uooJWDdesVn
         fsLG5DTBQ02lZAQ9a1BzwJ/bawmOpiSfX25I7WKY7+tNC10B54eVTxLPVidCPMll1+Yg
         bpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776301893; x=1776906693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfpySMydajhmy8CDZ0KzUQHaW9x3r0jflQmjPEkL1UA=;
        b=M2ZH8le/97Z0wzEPShoNP+DM7/oOhnCHVxPCfyyCt+/Mh7Fl/p1adHEvqbaJEsiRAP
         Ajg/zV6XLONoQp2l8gSvNU7cpeuCEFI3kRL4dTB/V2jbkSpBMzZv6/eUdZyv1Vfdo+sa
         EbIz1ko7+2p+pWC37M9+esDTL91qXl2NzUO+ws8Zd389BuLvAt2ygAgaVOAXy3m4GRxp
         zafh+JdS+v6RZ+8Hyt75LCGzPzzM4cGb+5XI+ArhZXDxJRImRUHNqaL7Y7QLk9AtTQ11
         YimRSf7XaYHpVHe1zYAdnuHF2OQUWIJmDPlQ9K7hD/xHvsvCAt0T3wiTzffmv8qGKwZU
         MFlg==
X-Forwarded-Encrypted: i=1; AFNElJ8r/a0V1bRlvb2OstfX/wr+Lm7pqLmHNpFpjai0oBB43lyQeebRtubYjw2unvS4jpQv9dxK45zU9Ew=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDI0py0rkQ3J9lf4AUHTMQ/uAtyLQ8Xt206oIO6+R5rl2PC1zx
	QSvrEm2fKSEDh7v6rO/Wbl+NyZcNM6+z+X3t7JCAynyjPyBwxuhq2e2F
X-Gm-Gg: AeBDiesAZQsaqPvS0Bxu/JbnwAh0aqgieK41OiDWmU/2dO62yVxsFWCgd1NJR18eG14
	3+fJO9pXXevQJLPrXvy3OdjfAPyDVVlExvOKtXiRpiiBSoRkpDcHd0fxdhLWv8D2t50zLWhOcXj
	7dydmbnHx8YMrKPcV7hF/UYooSPySiFD86zolCw7TnhWygi6zidLAFvTwuRgdTGn1NEEJCHfa+D
	AkCss3fyYxxvCiEtNIy3wh/hfJhi39JLJgtXo9jZhRP9gS1jNRc3nZXgzvJqyW7bsKCt/lc+Fpg
	xImJeZhVF6/JDM+lGMEed/8ZoAjcBsMnaBi2SBCV6rMmElKOyhYGF5AJCbYB3vndAzDX4R0BpFH
	76eckP5KeOicJAGAX9J31bKtmZAdh3LpeBHuu8Kj0iViozi6ifKYmMXUZja0mM1B72uQqLdbHhb
	Jmtin13JswkuCivSXatsEHygeltXjqdgyJl8zlXOGhg6Vl2cuKwht2M9o4uw==
X-Received: by 2002:a05:620a:d86:b0:8cf:cfdf:7346 with SMTP id af79cd13be357-8ddcecbd993mr3555177485a.30.1776301892568;
        Wed, 15 Apr 2026 18:11:32 -0700 (PDT)
Received: from localhost.localdomain ([165.85.38.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4f29227a5sm244769885a.32.2026.04.15.18.11.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Apr 2026 18:11:32 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] mtd: ubi: fix kref leak on -EBUSY return in ubi_detach_mtd_dev()
Date: Wed, 15 Apr 2026 21:11:28 -0400
Message-ID: <20260416011128.45754-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_181134_642639_7C5E2582 
X-CRM114-Status: GOOD (  11.90  )
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

ubi_detach_mtd_dev() calls ubi_get_device() which increments both
ubi->ref_count and the device kref via get_device(). When the device
is busy and anyway==0, the function returns -EBUSY after releasing
ubi_devices_lock, but never calls put_device() to drop the kref
acquired by ubi_get_device(). This leaks the kref, preventing the
device from ever being freed.

Commit 7e84c961b2eb ("mtd: ubi: introduce pre-removal notification
for UBI volumes") moved put_device() to after ubi->is_dead = true
to pair it with the notify+nullify sequence, but inadvertently left
the early -EBUSY return without a matching put_device().

Add put_device(&ubi->dev) before returning -EBUSY to balance the
get_device() inside ubi_get_device().

Fixes: 7e84c961b2eb ("mtd: ubi: introduce pre-removal notification for UBI volumes")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/mtd/ubi/build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 674ad87809df0..d81f5e0395ac0 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1106,6 +1106,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	if (ubi->ref_count) {
 		if (!anyway) {
 			spin_unlock(&ubi_devices_lock);
+			put_device(&ubi->dev);
 			return -EBUSY;
 		}
 		/* This may only happen if there is a bug */
-- 
2.50.1 (Apple Git-155)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
