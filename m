Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C15C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOVh08mKCY+jPSUV9TwozvB+mhppUY50x0p3HzrmDt8=; b=i74aJ0t+lWMIB5
	f/RzT7C1D/6yknhmFQCyLwo14IDUcjdexaqmdZt/tbFU1xIZAD3fuETKX6up3DOiDQZhz9cSqmHEH
	IGVqeoqrazKKk0ORNJkz8axCQA1N8HvCQqXdnhFm9qqTWYdmCSZabVQWfP9yHI0wc64/VaMk9uLAr
	qf2CX9/qx72iUg0cxwHzhcSYHtD/3cOyUUSYVc/Hkz2yz4WWezI/+oDBF4wqoCTcHzCwOxt9jy6rM
	xcCaIIvQ8N2p4CHuKAn7tuaXbK5/Ssi2pkrAGqLUkOdksTZDJYIrtfMH/vlqwNEA4rjdi6ccabU5f
	PBgNuizTB/0yJqjSHxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okpz1-009EKm-8B; Tue, 18 Oct 2022 17:02:27 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okpyx-009EHS-NR
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 17:02:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id d26so33809687ejc.8
        for <linux-mtd@lists.infradead.org>; Tue, 18 Oct 2022 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EvNFUcsg6CZf4Twcacgk4/TpKqaK+NR+PSADwLx1Qqk=;
        b=NO9Rpc7gw8DAzJvh3gLWr8+d5iG6WcxapUthrhBuntkU2o5NzO/8iuTamVLA9MXUef
         51252nvKL7xcVLOqjbS2w9Bb5VeQL9KTFGmb91bdUa2ErDtAZA9HN2935cd3DrnCuS8n
         8AWDbR2NL5Uz1HOBQnVoP5KJ3aVbsnfFKLVWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvNFUcsg6CZf4Twcacgk4/TpKqaK+NR+PSADwLx1Qqk=;
        b=KG+JnG4KdsyFMQny+J+q6xlv1mBRYtSwymWeWplp0uZunzAOwj8ICKv3y5UNZ+QUoX
         6LkVsMzPkg8LMItEzKGQu3oEpi01EPy+X0sR+DjqIY/CC1p6OY9RWLuEM5U8jZ7khQgc
         4ftpz6rgUqAoKxjaqKDW6+XmLu0tIsrUFdbl5uTNGgixXZQFVyRgxpxcM5x/xFZHQeZu
         AmyToQQadqf48XL6fErtponjJqNTZ7JZYaI/H4vyUlIhBAPnWra0uk9oQ3Zd571YVy7c
         pxCYaW9Ap9nxrf2+t+zbrCOuO5+DVNjsdm10Kv/ITCNcbt61vCq8uuCvenT5I2HmplFY
         AZXw==
X-Gm-Message-State: ACrzQf0Bm2rJEjo2k3ysQtSjJYf8buRMRKLUfFmzNW8k/2PdxHSB9wKL
	pL4l2WCB+b+Li7JqyTo7SYj0nlETlC0OIw==
X-Google-Smtp-Source: AMsMyM4q3YBmgS6KrU83dbcB1kBOFrQFy9UtekLB/JjiyoNbuFAncc1vBQQxAPX+fG/ip0Bf8WJ9eQ==
X-Received: by 2002:a17:907:3ea4:b0:78e:25e2:c33b with SMTP id hs36-20020a1709073ea400b0078e25e2c33bmr3113366ejc.603.1666112538617;
        Tue, 18 Oct 2022 10:02:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-244-101-110.retail.telecomitalia.it. [95.244.101.110])
        by smtp.gmail.com with ESMTPSA id d7-20020aa7d687000000b004580296bb0bsm9172616edr.83.2022.10.18.10.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 10:02:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Amarula patchwork <linux-amarula@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: drop EXPORT_SYMBOL_GPL for nanddev_erase()
Date: Tue, 18 Oct 2022 19:02:05 +0200
Message-Id: <20221018170205.1733958-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_100223_784517_DCA00139 
X-CRM114-Status: GOOD (  10.41  )
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

This function is only used within this module, so it is no longer
necessary to use EXPORT_SYMBOL_GPL().

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/mtd/nand/core.c  | 3 +--
 include/linux/mtd/nand.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index dbd7b06524b3..7737b1a4a177 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -126,7 +126,7 @@ EXPORT_SYMBOL_GPL(nanddev_isreserved);
  *
  * Return: 0 in case of success, a negative error code otherwise.
  */
-int nanddev_erase(struct nand_device *nand, const struct nand_pos *pos)
+static int nanddev_erase(struct nand_device *nand, const struct nand_pos *pos)
 {
 	if (nanddev_isbad(nand, pos) || nanddev_isreserved(nand, pos)) {
 		pr_warn("attempt to erase a bad/reserved block @%llx\n",
@@ -136,7 +136,6 @@ int nanddev_erase(struct nand_device *nand, const struct nand_pos *pos)
 
 	return nand->ops->erase(nand, pos);
 }
-EXPORT_SYMBOL_GPL(nanddev_erase);
 
 /**
  * nanddev_mtd_erase() - Generic mtd->_erase() implementation for NAND devices
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c3693bb87b4c..b2996dc987ff 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -999,7 +999,6 @@ static inline bool nanddev_io_iter_end(struct nand_device *nand,
 
 bool nanddev_isbad(struct nand_device *nand, const struct nand_pos *pos);
 bool nanddev_isreserved(struct nand_device *nand, const struct nand_pos *pos);
-int nanddev_erase(struct nand_device *nand, const struct nand_pos *pos);
 int nanddev_markbad(struct nand_device *nand, const struct nand_pos *pos);
 
 /* ECC related functions */
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
