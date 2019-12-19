Return-Path: <SRS0=zmh0=2J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAFCC43603
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 03:20:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1249521D7D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 03:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yvlvm9Mc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia8kEdT3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1249521D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5UknBb11DlhiFeCdDOJhrvv8S3k+ZX+HdlZXK/+kstw=; b=Yvl
	vm9Mc2BsMQ3SmAI4sNZ02/EIV/zVz5l4zedbx7l1dkFjcbOom+MXCi7Bl8r83a+ZdcJ+Eu4HYV2tK
	nSlRR4xRpRAXUOaV7CwXtphUJazvxQKe3Wv1Q2BuHnV19tqj6kbyAZ23PtmhNKO61qYjgDmaFhb6a
	bApLIqMnR+GOad5K0j8XjBK8pGJnOuX28M/7OtwyVE1z+wh9XA+AA46Q9ZV6u2+BWhZfZXffdLm4s
	LIFo3dACjag1EXe0KZiKPcx009krpnJvowPRBMyaTAL5ntwvgDfR6MLOqlXcs/LT2fUZYXGPPbc59
	Wz4edJi5a0eYXd2cQr/yuE7Pat6OP0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihmMg-0000TW-FH; Thu, 19 Dec 2019 03:20:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihmMd-0000Sq-T3
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2019 03:20:37 +0000
Received: by mail-pf1-x441.google.com with SMTP id y14so2348238pfm.13
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2019 19:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=myMe1QwkZnF5nX58KJ75LAcGLicOPPY3P73wZ7ihcKg=;
 b=ia8kEdT3w0AGu1TZUC9FRWhFeospX94hSxPi51J1YQoavCj9UmQpWXusCabigHGUs7
 EYP6G8K6XhsexI3r7GaURDw9S6Dy3hmV3waThbzkXxN8Nnk9MDG0MzHz22cFguX3lMZD
 sQ9pMH7hRWKtOJf6+d6816XdBDpluUNwLGLDYaibxHZ8b2iCrcuRtWork+kpe+sUucLu
 HMCfkQGwd0hVOlfnuVK65CVQ7c2eOKP5FCdy/QMhURFGUVVUThfLOEN500bGYIA4IpIQ
 fLak64i81D38a6frFcDdYj3mASruGQiOYLAcXPYM6pgGoJmmKjGu/awEinsBDCQWhIOy
 AmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=myMe1QwkZnF5nX58KJ75LAcGLicOPPY3P73wZ7ihcKg=;
 b=DRp/uXBnFfI0bSQQt4nIA69vWob8L+E42zhihETNpnsZ33dD5ePchEqOvTu15MM/7o
 J2nt5IZSvpUwB+Oynfh7kHX9OAktJ0s6dXSIuyNHicKcA986h5scHrUDoPsylteT4kEu
 aWT4p33ggBKWtFBceLPsWdvbIFqYd8ufQ+TfHj73BJVxeSg7RWL49zfEpPoOPINPDU49
 sdhjXWrNZI9FP0NbM2C/kjwmis1LAXGocXBYg4VdxlXePszbK8i1bqNzxPDQBtFsaLqI
 n8/xIQBLSXNT6ywAIoePQrQGI7izLNtKPQgArHIQ7m2gcGCOy2W+UKIi5jOGjmR6va5r
 1ULQ==
X-Gm-Message-State: APjAAAU3SFx9SnDMgmlbEbwbVYtUxcI1WfwnkrW/PQ+fOrSkUP9fwOAz
 dKYti1F4OQEz7zO9+fu/0/0=
X-Google-Smtp-Source: APXvYqxLCUfDqY2jqojMritJO5se/AtwS0zRhyNk8y17DL2VoewC8sku+NYR6qj3xiSrF9C8oUG5Cg==
X-Received: by 2002:a63:d958:: with SMTP id e24mr6579422pgj.31.1576725633389; 
 Wed, 18 Dec 2019 19:20:33 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
 by smtp.gmail.com with ESMTPSA id c3sm2350517pfi.155.2019.12.18.19.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 19:20:32 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux@dominikbrodowski.net
Subject: [PATCH v2] mtd: maps: pcmciamtd: fix possible sleep-in-atomic-context
 bugs in pcmciamtd_set_vpp()
Date: Thu, 19 Dec 2019 11:20:23 +0800
Message-Id: <20191219032023.7177-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_192035_963442_04936446 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The driver may sleep while holding a spinlock.
The function call path (from bottom to top) in Linux 4.19 is:

drivers/pcmcia/pcmcia_resource.c, 312:
	mutex_lock in pcmcia_fixup_vpp
drivers/mtd/maps/pcmciamtd.c, 309:
	pcmcia_fixup_vpp in pcmciamtd_set_vpp
drivers/mtd/maps/pcmciamtd.c, 306:
	_raw_spin_lock_irqsave in pcmciamtd_set_vpp

drivers/pcmcia/pcmcia_resource.c, 312:
	mutex_lock in pcmcia_fixup_vpp
drivers/mtd/maps/pcmciamtd.c, 312:
	pcmcia_fixup_vpp in pcmciamtd_set_vpp
drivers/mtd/maps/pcmciamtd.c, 306:
	_raw_spin_lock_irqsave in pcmciamtd_set_vp

mutex_lock() may sleep at runtime.

To fix these bugs, the spinlock is replaced with a mutex.

These bugs are found by a static analysis tool STCheck written by
myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
v2:
* Change the spinlock to a mutex.
  Thank Dominik for good advice.

---

 drivers/mtd/maps/pcmciamtd.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 70bb403f69f7..2ac79e1cedd9 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -294,16 +294,15 @@ static void pcmcia_copy_to(struct map_info *map, unsigned long to, const void *f
 }
 
 
-static DEFINE_SPINLOCK(pcmcia_vpp_lock);
+static DEFINE_MUTEX(pcmcia_vpp_lock);
 static int pcmcia_vpp_refcnt;
 static void pcmciamtd_set_vpp(struct map_info *map, int on)
 {
 	struct pcmciamtd_dev *dev = (struct pcmciamtd_dev *)map->map_priv_1;
 	struct pcmcia_device *link = dev->p_dev;
-	unsigned long flags;
 
 	pr_debug("dev = %p on = %d vpp = %d\n\n", dev, on, dev->vpp);
-	spin_lock_irqsave(&pcmcia_vpp_lock, flags);
+	mutex_lock(&pcmcia_vpp_lock);
 	if (on) {
 		if (++pcmcia_vpp_refcnt == 1)   /* first nested 'on' */
 			pcmcia_fixup_vpp(link, dev->vpp);
@@ -311,7 +310,7 @@ static void pcmciamtd_set_vpp(struct map_info *map, int on)
 		if (--pcmcia_vpp_refcnt == 0)   /* last nested 'off' */
 			pcmcia_fixup_vpp(link, 0);
 	}
-	spin_unlock_irqrestore(&pcmcia_vpp_lock, flags);
+	mutex_unlock(&pcmcia_vpp_lock);
 }
 
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
