Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC32C5DF6D
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Aug 2026 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m88sjzcYWVaVir9PYhMcBnEKSswPatt5cMpHBoJYjAU=; b=AOd75jBIGlQPFz
	3xE1pQFsi2WF7RAAH+wWXPjJrglQD2wbfNFlVZ1Rua0eIXM/HdIdqXbycB5rutB8LSSdnHnutdFv5
	QjwmxDzx1bbYkigKtD85opXWZJSaTK888CLgSPJGa4w02eOIYZG7Ir2R+9qMxYOc/GBxjCz9hyrvZ
	dpfyzE0WwzRVAm1aQNIINqZDlH9C6jmD4H/Vq9IMZ2B5j7zXeAjOyoNhAo2q9pN1eCGxiqR01KBSv
	i22gWIYL0ddMjwPKiRreLblq2a9R2YfcroHcg+FoUdhkfb4u+Wn5acspvCRoTczW09Ktu2aHVjnqB
	N9aNnzOLYNS71CLPyVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvdks-00000004tZp-0qWu;
	Sun, 16 Aug 2026 16:30:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvdkq-00000004tZG-0p03
	for linux-mtd@lists.infradead.org;
	Sun, 16 Aug 2026 16:30:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47f6609c657so1228365f8f.2
        for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2026 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897833; x=1787502633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dp3y9HY6+OBWpLZwlaCANPDZ2TwUIEWZnAMUMpPK+e8=;
        b=oPqs4mA7pDTankvjED9hvs0TlyBiGybKRUFdJdeFIJDFC1ZqDoFiumvs+a9Z7r74vm
         9xgB8dxR/ty+0/umuU8nD77BqNkPxBi5CGMxikGW8s6gKNLgWg6TQ/ZDRueBB0QdyKUK
         w5WDH6juqBmdU/tfhhuYuS2Ej+NawyKeA8s6Ukzh4Rrdq++cnj6VWfYhE1AR+w1Oc447
         SHnSQogqhEYa1n49EHWskdZ1fmTwpPD0h8bjYDiNfZU6eTpsu3biECCP6P5KHrEXiqTb
         awpFC6LumOemXDP2JLL5JNa0M0RSD1543GWvjgqQZXGfPbagcGzlgos07vS4EwzlQPdY
         fmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897833; x=1787502633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp3y9HY6+OBWpLZwlaCANPDZ2TwUIEWZnAMUMpPK+e8=;
        b=ZLUOHVvwnmIlQOLbACwtcvkb4tCSp/KCzludKx+uO6/RY2SMgHU8yMp4pvKQMfX/ro
         TnbnSIADiYgRoS1A0uEhvfAtpvBEgpmimoFFiOqXHp9vYt6NApbsCJMdzdNB+5d7r7Sm
         a23o1rpRCGPWDBeIStcJ0iqVCMVBn10+g88HNrsyvyBMe/Gh3mGCoGzsRE+aOozfpRPd
         ca/TGy+A/5E0OYD6Z34hxBOD+jpRZvyrIn9tmeBDv5NRJM/tSXPrGfo9mnyhv/xwTTNU
         bpOWTOX4NCMhHLgxka8gjOQcClnWLaDWjE700SDSzpNzu/6QVOkUXVOQqo5iqBLaLx2E
         o78Q==
X-Forwarded-Encrypted: i=1; AHgh+RqIBIvQATk608jyLvx5y/aNzw++EjLeOAIyYmkDGzvVhD2a7b7y4ZaIIZrZxHaS/yUbnndRL0s6/P8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEF92mk5EZpgMmx9BnUVnEm+dJBqd5HWM0GhCsYvuXp2wU7MFq
	68SgkSa08GVGPh5d7S8UMuLfnNuhb3jTf9vxvWJEooKx5PnDqTfHhemW
X-Gm-Gg: AR+sD11qGouX/chddaM6JpoKsh784JFsLROQ5Hu34jeidDvBT9ZDvT9CLhKBe4VfjKw
	8aUjKFGGnP7uy8erNc+YiRCUwtsAC3byJBNSa25blAkAudj6gsKFR8NVG8Hac7+DZHeg1vRPKVp
	a+O74pXMHlsuvjsdNWe89Szjh+OhpI/NIFDHgmVf7YjLAhc68YXIlHka3RX8tLsdyDSNixNE8NK
	0qEY/sfXUIlWhvY7yVQblE3feeyN5m16yMTmf++htIZ5bAXlURSyUTK29J5G1s/J2T6Y8HE8LzK
	HpMDkUnVgsUx/SsB233OHDE+HbfV+mq4Xr7EXfDo/5cV/TSF+4nCMNUEwaVJBK/qtJQSiKpAKuD
	pIO5xFHk+R4pOm/pVYmFV3Y5JYutnTJCULn9yJVr5Qvdz8ylEb5n2my3OQdEQw5b8qAT4XqP7S/
	9bgmhvDqBk4/IfQuH9RfL4xph8qvSj7Z+73XuA07XHAcJ/jRSCTLIS0Bp9DUlK8wVl/ReRcK+aY
	ZJTPOHBx0BqCi64wK986nWyJZmWBRp/+aYfzMnt53guHpxtfVOKdA+sWgJHFb8gaJ532XvwrYwO
	+pkNUmQydIh22RhDY3hAbsjv1phVDj3w70xjc0fbWkbBOezQDACF3NPqcNHFT16Lg1g=
X-Received: by 2002:a05:6000:41eb:b0:47f:91f0:9a8 with SMTP id ffacd0b85a97d-4816079ece5mr35344656f8f.23.1786897832962;
        Sun, 16 Aug 2026 09:30:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc5-9401-09c8-a88d-e919-d148.310.pool.telefonica.de. [2a02:3100:9dc5:9401:9c8:a88d:e919:d148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f219d3dsm25555239f8f.14.2026.08.16.09.30.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 16 Aug 2026 09:30:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: core: avoid double-free of OTP NVMEM device
Date: Sun, 16 Aug 2026 18:30:27 +0200
Message-Id: <20260816163027.10044-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_093036_243326_98B26FD7 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

If factory OTP setup fails after the user OTP NVMEM device has been
registered, mtd_otp_nvmem_add() unregisters the user device but leaves
mtd->otp_user_nvmem set. On an error, the caller unregisters it again.
For -EOPNOTSUPP, registration continues and normal teardown unregisters
it again.

Clear mtd->otp_user_nvmem after unregistering it.

Fixes: e0489f6e221f ("mtd: core: fix error path for nvmem provider")
Fixes: fe0b8213c012 ("mtd: core: Don't fail mtd_otp_nvmem_add() if OTP is unsupported")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/mtd/mtdcore.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 16629382a787b..6158452be24d6 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1083,6 +1083,7 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 
 err:
 	nvmem_unregister(mtd->otp_user_nvmem);
+	mtd->otp_user_nvmem = NULL;
 	/* Don't report error if OTP is not supported. */
 	if (err == -EOPNOTSUPP)
 		return 0;

base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
-- 
2.53.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
