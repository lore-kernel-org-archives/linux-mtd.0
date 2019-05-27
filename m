Return-Path: <SRS0=9XVy=T3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850F5C04AB3
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 12:39:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D182075E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 12:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V7VRT36Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLQDLiMq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D182075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=v6zL8+iRwnJrwVeV5bY9ZYK21x3LTHkwktdr5hpWnt8=; b=V7V
	RT36Q3r+SGFpguSgSaMu7N9h3MbQGJWB36aU/dYdjQ/D17LQk/UYvhdo7Lgh1vQ96bq240Yz3uZpX
	1hwf+332W4WAwXMtnW81TIDBY8L+O8IvdX/z04wCXXtWKP87E8eN2Lp+X1st0fK4QibVZ21pg8l5s
	x6yzmrMeDRM92DbZsLGaohiOaM2j4Im3IoFILNh+M7qagVePnfBwxV60k0n17dvXQtGfi/z4yHgtt
	R6vOg4fWRYwnO8i0JkZEwZ/blpsqOoQH2Tafvg5jH/UdOFDikOWYRN6dgpBmQlZ7C/xGw8XVxH3h6
	O4rgTk8Hd48rVxsOKSuxuKQlfrAJ/6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEuS-0007EL-Ev; Mon, 27 May 2019 12:39:24 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEuP-0007Dw-Qq
 for linux-mtd@lists.infradead.org; Mon, 27 May 2019 12:39:23 +0000
Received: by mail-pg1-x541.google.com with SMTP id h2so6004196pgg.1
 for <linux-mtd@lists.infradead.org>; Mon, 27 May 2019 05:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=I2x1nMpbWtGUoX8qQNpGkZM5zNWW5FxIMZjq6CiV9J4=;
 b=WLQDLiMqYc4wAcrPNLABAX/cxJD52IHUFRYVJi+CG16FhfkAA+VFvMkSyTBG6lMQy4
 Kw9sLHps7B0HVbGxdJC3JEBMoYqb9zFa+WEBGLFidKiiaS/xDzR/8iOd8uak7lwGpyrs
 1+PbynatWpzqiXPpFQvPgi8a9AMVR3z1YNh9ql3ixgNhRmurZUJQ31mzOXn+vGJl27CK
 VOQLeVi3gzZU64nDhqQj5KuNgDaZpR2+i+ymV0FNcgHmk94FrX9EXRGdp4WXZkBU4Rq1
 2KMUaOLly7NAQM+mjFNSrZ5ZLbEPUGMXlQ0mG5fK1NbJMTyT0Wn8IMy/a6ZNduqKqfec
 v/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=I2x1nMpbWtGUoX8qQNpGkZM5zNWW5FxIMZjq6CiV9J4=;
 b=ryY8xK0CmMlTwjNWPTytUstcp6ucQ0pS/3BzEGMiCurSBI/gdCj3B9R/+VXwEm6yZc
 06scsKNIa1ZAPYG6xiDLiiHFa27NBnifKsWd/Sia6rwRW2FfEC071vxni/NYtPBHlojt
 4/as2Sfk5Z5mZqhV9BX12P4CUZQtrB9wZz5b7xKuNl6bFlzh11G4I34DjnoEwS8vtmmk
 +DbEkCCM79tolJTPKuNu4R/nO+rmQH7fPR+VXccx9LluefQrYnCi/qPrZOBvp2MNqyje
 Mu6tn/lOTDs5Eq5TY2tFAemKTK/yZqpKqarT4Xm7scVXQxpoL/g7Ijg2mssW+MtgqIK2
 jVzQ==
X-Gm-Message-State: APjAAAW5IjBG9IEfPOkUTvT6Kk6K3eZ1zg6vGPKKMaI/l9r6LmRq9Akn
 qo8OL8VBadHwJjtbgZi7aoY=
X-Google-Smtp-Source: APXvYqxOo/BUzEoH5j4zas1J2WtUb1Nyo/to08FQXZtZS3Rl1Ofd1Yy2ZwzoHu+1n+2ku4m/dMgRIg==
X-Received: by 2002:a63:4f23:: with SMTP id d35mr32716873pgb.212.1558960761187; 
 Mon, 27 May 2019 05:39:21 -0700 (PDT)
Received: from localhost ([43.224.245.181])
 by smtp.gmail.com with ESMTPSA id z9sm12664048pfj.58.2019.05.27.05.39.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 05:39:20 -0700 (PDT)
From: Weitao Hou <houweitaoo@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH v2] mtd: remove unused value for mtdoops
Date: Mon, 27 May 2019 20:39:09 +0800
Message-Id: <20190527123909.20427-1-houweitaoo@gmail.com>
X-Mailer: git-send-email 2.18.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_053921_896293_5A98E284 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Weitao Hou <houweitaoo@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MTD oops 'hdr' header is never used, drop its initialization

Signed-off-by: Weitao Hou <houweitaoo@gmail.com>
---
Changes in v2:
 -fix comment for patch
---
 drivers/mtd/mtdoops.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index e078fc41aa61..6ae4b70ebdbb 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -191,14 +191,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	size_t retlen;
-	u32 *hdr;
 	int ret;
 
-	/* Add mtdoops header to the buffer */
-	hdr = cxt->oops_buf;
-	hdr[0] = cxt->nextcount;
-	hdr[1] = MTDOOPS_KERNMSG_MAGIC;
-
 	if (panic) {
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
 				      record_size, &retlen, cxt->oops_buf);
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
