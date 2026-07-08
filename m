Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98314C43458
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2026 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WPEyPcI+/nN9fFIh1AE/8GdFeWd72gY/iqD8+gTnFUU=; b=ZLBqnyWfpJEo2B
	ZfmaHDbKcbIzYU9idMjHTkFsPesRwvO2bX5q8l/ieZ33fnVV+dUtl8E2IadQQP/+AROYNNlonq14q
	RcoPR85MULnr9eg38S8m17q3EmAcjZXFFZf3YW9LxxUhNyIYAkLMcXFzmbJP1vm1u00FAkIO0wZEU
	I4w0qZ6i2xnVlZ9q5NhYIVtzLlgG4/CWmYGC7lnzJQJgJeu7fFGnxAPwqYzuNWcrzqTLhP+qrbiah
	3QPnDSK5xhuu5Mse+PjSFRlf8+bJEjUDzpGCpsKaEXq+woc8pG2lmgMNvtMzdIH3mfuS9myygM3Wc
	Ywi9RHW/ZJEqXoXSqWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTLh-0000000HMJQ-3NqP;
	Wed, 08 Jul 2026 14:34:05 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTLd-0000000HMJ5-3IVf
	for linux-mtd@lists.infradead.org;
	Wed, 08 Jul 2026 14:34:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84832ec2615so843396b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2026 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783521241; x=1784126041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZoQxphKgZy9acTkfjSIslanryVBCy+SJQZkIKGsyR7c=;
        b=GDq+f2kRRuYn+8mwhsOUCIs4gE7AS+PhzJtoSTY1X7u5xF/KLKYqDRp7f5B1TH9x3P
         TbLP8O7nQjP6SVsHJhQpMTq0HMqLbpCAKPGhbOMgvLkz9XWFHNBIapqWNPnGJ8ZCbzVe
         B/dxdyUVxjzxtVT6/6HnfFcIf+3M6tg07py/nX2tyEKxRYYcGM4iDAKJiXKc8nZ5guku
         xTdRpbco2FMNbXGuSt6YGrHyz64sCZQ4gLKWxc9zxgs5VIq/ahOmrGWLacPLtlJ30Q60
         h9ljvo4bS6/7DzS8+kc+UZD5mqw+dgN9WGtDfp61x4m8W4Hm75U4eHdouamQQLKcOWoG
         iJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521241; x=1784126041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoQxphKgZy9acTkfjSIslanryVBCy+SJQZkIKGsyR7c=;
        b=jZd5En6OrtRQNZ3ZJar1UIj54qokc7nTuLNbQ4PlS7LFb2ksD2yX4DJRd8Fi5G57hk
         hsAA9y/t2helhOZ2BAfYYBG2l9FmIBOignEo8gsV8yGS/J9A/ECvAIWO3+WEKYnuYf9a
         DwrfFdyZUQIQB2zSlmpjq/T3rmk9M3HvsAOncPpSMayGk4XzM9TXPwD9z+e5hsoAoUvK
         zhM9M3mZnizxMeD37Bl4xmdwJ8IcVdSzYAbXllcsoBMANEODZPZdvMOp5o45curLnsuT
         0+auRTSWTZ6WrkBMtVw7ooodHL9CrwmxZgFGEjhwKuPrJ3F9z/SzDHtav3hOqjC5lKN4
         j2kA==
X-Forwarded-Encrypted: i=1; AHgh+Roio3gq/Rqx1N4CuB87goxsjtFMW3gpVuNSIDkdQOkEuBUce9kMFiGB0NvTl+GFfflEVnGCtdpddiY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNPTiR3IPddiIkaQhaqBGhrR0ai2IyppFXuQb8EflnKOr4nkrH
	Lrk6/sYPmzfvq9Sm2QPcgknvDDqlqVpL0VoCe3Yubvk7ResDLHn1wr2/BRrpfbT2f5o=
X-Gm-Gg: AfdE7ckDfXNB6b817A/8hSXi9PvHLINSh2sTXcKZTahXeYJENZRiDy4KXLjYZAXYKfu
	Yk8g/NBeW5FOl4nJheBmtRrjH9rMroA/DcVM5kEQSDCPyGlQqxUB7+rP7F1S7yhNaIzRF266ug3
	vnCz8j0ziGHPm0gwpLRTqYLsd4ixn1CQP9mNuHGcClfnaipLVuxCECFDVnIkDDME8pZ6tXFJo6d
	stdEEqEc5l6hZoUbKTuApzeX2gvg50j+NqwYFVIveVGo5nquTm+MrgHsSHLTiW7iysG11NDYSZ0
	u12IYeq4I/RFlGRDQv0KPrwBVo8Tuwscl8HI05m9bKFwqbtycu7MS7ieNcikBMNg5uXCl2QpFGa
	zmJrP+OfGa58M+yBawXHkccTFFbL2x2qZL9xKdLahZsc/SFdZtwCJKIjTqDa89PRnhrNWwj5j+L
	ze0j90Qi+7pomTpNAXWV0Y6i9cDEQbFRTj
X-Received: by 2002:a05:6a00:440d:b0:845:e9e5:cdec with SMTP id d2e1a72fcca58-8484302bad3mr2991228b3a.62.1783521240860;
        Wed, 08 Jul 2026 07:34:00 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1b95:b995:f60c:5c67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bcf03bsm7122862b3a.26.2026.07.08.07.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:34:00 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: mrugiero@gmail.com,
	computersforpeace@gmail.com,
	bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] mtd: mtdswap: Avoid freeing registered blktrans device twice
Date: Wed,  8 Jul 2026 22:33:55 +0800
Message-ID: <20260708143355.3166755-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_073402_135720_F6D832D8 
X-CRM114-Status: GOOD (  11.13  )
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

In mtdswap_add_mtd(), debugfs setup failure after successful blktrans
registration can free mbd_dev twice.

add_mtd_blktrans_dev() initializes the blktrans device reference and
publishes the disk. Once that succeeds, del_mtd_blktrans_dev() tears the
disk down and drops the blktrans reference; when that reference reaches
zero, blktrans_dev_release() frees the mtd_blktrans_dev.

The debugfs failure path called del_mtd_blktrans_dev(mbd_dev), then fell
through the common cleanup label and called kfree(mbd_dev) again. Clear
the local pointer after deregistration so the common cleanup can still
release the mtdswap state without freeing the blktrans object twice.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/mtd/mtdswap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 866933fc84265..533b8948918cb 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1450,6 +1450,7 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 debugfs_failed:
 	del_mtd_blktrans_dev(mbd_dev);
+	mbd_dev = NULL;
 
 cleanup:
 	mtdswap_cleanup(d);
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
