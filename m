Return-Path: <SRS0=0SW8=SN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0255C10F13
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:01:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D40A2184B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UpeTdZdi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EtKBSmFx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D40A2184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flS2CjH90N0fgGPPfQZ2ks+2jZ96FkB/uwCiYVFrtvI=; b=UpeTdZdiXJtbSy
	a0O9+/WDnwShVOWhLtnHf0PC2duD1A12wdIegPMNIJL8R5mjvCm/Zu/umN3Alkw9CGEcS/F4NxQzH
	bp0bEwqNvLettqomrJmJSoT4tG0jxZ9FZ0NJXafRZ62WbpWCNjSfPk99Q0DkdR/MOC3BHIIvtcvG/
	TVfgNAZ7F+4JKKz3WEyDKZnVvXgiWWeor1VXzFi/Z0hfM6/pCgC08aRhRtnsR33Ya2Vo1oyEhtw76
	NiGgjdYppMDFzoBcbFxjsSnOrDgCnWSbCex4Uuv37teGVMeqcIzTt1jWrQkK5Z/j3gxi4GmRpPuSW
	t9Tgqh6+UerHUqoATALg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEhlT-0004BG-0p; Thu, 11 Apr 2019 22:01:47 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEhl4-0003YI-LN; Thu, 11 Apr 2019 22:01:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id z24so8544701wmi.5;
 Thu, 11 Apr 2019 15:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TOmehU4NtJzE5DRqIgvNN4m9djQewwCjbGHx9sj8Xmc=;
 b=EtKBSmFxn8M86szFDp2PbLec2TxzAMfeQHUxm3wZnVjMXX/xmjfc9AsnTxnSI635sv
 x2KtCKSn4xhsZzr/22KpZhAuF5QvZ0xau0T0gg/3QdHUeGJrDpiVKhh/PBnI/mzkxLrf
 6m3A05Zsdrfz/3OYHOOBzenDN3vUl6GwnF9jD14dHDwFxMK83w/jxNg0qnV96zbzLD0H
 inpXP9+62EqOGeMFmgE5T9pHYv9OVYSr2dNS/HrqRyPyuAPbWmF9AgqKeD7hlxeT4g21
 3xmxuXekqTmlmPzc3DuJsOt+2qdqoxXD/IxkWvtadKJ3e1Ylk/VSXufySfbDTg7kcLo0
 OisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TOmehU4NtJzE5DRqIgvNN4m9djQewwCjbGHx9sj8Xmc=;
 b=nvtHThFV5mRnqQGpVVZh+H5i/X779K7reLvlqPu2Fdjj41qkK9iGtglQOpZ/ifCFMi
 TfOYZKFPMqTGhMdoRoFNfUi0QuRKw7X7jy5BrRPz+RZvtSR66weplAUvM1Lt+sRh9dRN
 6TK1CuD3sNqAhqzZkNrkm6GuXnYmzK0sYvrz9cadnZtp/dyqrjnI0gC6/HSvcRzI0HHW
 FFbzonLr0hy0Mrt8S2zVjS0sEWo8esq5B67mjppZ0hiZXfpga8jByI10IXViRy/pWXKR
 uV3uUd8Bd6a2ZiDZ3B7dJzdPiGXAP5U+b6MSlErMw8U/ozXBDnKbySemf12pSEpTr+3P
 6HAA==
X-Gm-Message-State: APjAAAVtYGMvtP7632pRetcswdK462PjJsZb9bBDR80eqyJZRJOytrxl
 fDo1TJYQIizL1nUpEqR+nx0=
X-Google-Smtp-Source: APXvYqyp2y/bXkFnt+6wuuBKNqjX/TVPl3xAEoP0SGsXv8/vf24Zk69nEmrvknj1iULPO1/MVPxdMw==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr8583638wmb.7.1555020081342;
 Thu, 11 Apr 2019 15:01:21 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0009F15067C8D22C31.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:9f1:5067:c8d2:2c31])
 by smtp.googlemail.com with ESMTPSA id
 s189sm13266186wmf.45.2019.04.11.15.01.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 15:01:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: liang.yang@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-mtd@lists.infradead.org, richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH 1/4] mtd: rawnand: meson: use struct_size macro
Date: Fri, 12 Apr 2019 00:00:53 +0200
Message-Id: <20190411220056.19109-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_150122_704033_E2E1F9C6 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use the recently introduced struct_size macro instead of open-coding
it's logic.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index cb0b03e36a35..c1a6af57dab5 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1242,8 +1242,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev,
-				  sizeof(*meson_chip) + (nsels * sizeof(u8)),
+	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
 				  GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
