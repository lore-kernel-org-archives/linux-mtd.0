Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027D0C05027
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Mar 2023 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zodOmsBr8oqODJV4iKwSDNCYkJ5oepxcjnmxUz9HNqA=; b=2K5NZViSQkjEX8
	peqXkDiM8jHsXjJHq/Iu6sp1FQ78Iq4PiFFotI9VkoLuQoDG7YIPCXlxbJShKB1kOWlm+tHkWsOXd
	VoF1wHY/npeHCOxgpRquwD8aOTK37LTCfB0ungJeTxhsbCF7MD4XVWICBOqEq6t+T3M/zyfeq9RCG
	bERw0gojFZSFuJbVVJqoJhEO7pl6fJj5ebpfNu6oNjQoZQmR/qZ1VYrR91CfSkwxS/k5YvjiEoz2t
	hOqeUo3PMdGoGP4Z698f9yavQUCdejiURp+YYOVHz/uXMPASQ7iyaS7441+qyzVaPECholF/2DEIn
	2WTIe/c8SfiqjQU1Qnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7xl-00AvTA-0q;
	Tue, 14 Mar 2023 16:57:25 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7xi-00AvSG-0Q
	for linux-mtd@lists.infradead.org;
	Tue, 14 Mar 2023 16:57:23 +0000
Received: by mail-pj1-x102a.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso15791788pjs.3
        for <linux-mtd@lists.infradead.org>; Tue, 14 Mar 2023 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678813040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LB8MWU2Hm0ZiL9jPwlOLKYQoV05YgDk89LehIOOmSjM=;
        b=IIU1BhgNFxlf2ziyTy8PzecK/9HchT9bH4w0LbY5+cOeFVsDTsvUqWFaKPBXBEYHtA
         ZkgO/V0Gr0KeGGFhN7cFjEPBg3dmnAMWC4QUJ7Bv4S/BDoa9dHNnE3YWhEwOqYurtCGr
         pmh4cBzvm4hem9Piz0a5aJMtt+yFE15yT3oOep6UvP1GR7CTk/DD0Nl5ywOnkb1KmJFn
         Nnb2e8Yx+kre2sC4o30GYR1q1YHxb1xnoUdBIp8k13GjcT14TDrwTBTVM7SO3P7zfaDu
         O6jtddKufx8QMRfqiaF2u3sVI4R8YHh+EUQJo2HEUALbFb9hqkFL+6Ig6o5QY33AMex/
         ZDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678813040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LB8MWU2Hm0ZiL9jPwlOLKYQoV05YgDk89LehIOOmSjM=;
        b=Y6H++8TMyZlpdMjUMjnp+u1D2U8T0w5gYjr9dvS5RXUpXKpOXOrj9I712sVXudYLy+
         iNXmT1Y5jFWiU+KiVLUimccWsgntM0n/7xco3SDcYC918BoykS/YJIT9iCHPZDF1c2Cf
         NCJjZmAppWGrCAhWpCM3cYCmXtJpEk8c0EBwJcqmfJeY2ZKpF/3F8uzm2ROMs6c8fdZO
         1RADpGYiCHs0PoC/wU+FolrUn/IP4Ns4a+JkdpuKgGzvK2ZFfY79nqkV84iNCaN5WLWV
         FSx4gQRj8h/jG/9E+iZ2+V4STlZX5ta9kiuf8f5HqXFwI1FtGh+/opBNWemjIRBdHhms
         sWjQ==
X-Gm-Message-State: AO0yUKWe7qP/vJXBwWRwiETmhILUA0f3VzhwM+v35cKqIai1dEorwphW
	V2GJSGlpcNjxHuVHVYvwecU=
X-Google-Smtp-Source: AK7set+jfaxHUgf05hZano5aRwyEzdwpVZsZU4gNfr7/moh7OsLMfGd1Est7CaPK7BPESRxumz0NMQ==
X-Received: by 2002:a05:6a21:78a8:b0:d4:5d11:8ca7 with SMTP id bf40-20020a056a2178a800b000d45d118ca7mr8415447pzc.31.1678813040265;
        Tue, 14 Mar 2023 09:57:20 -0700 (PDT)
Received: from localhost.localdomain ([183.157.110.65])
        by smtp.gmail.com with ESMTPSA id c26-20020aa78e1a000000b005809d382016sm1869658pfr.74.2023.03.14.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 09:57:19 -0700 (PDT)
From: Bang Li <libang.linuxer@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bang Li <libang.linuxer@gmail.com>
Subject: [PATCH] mtdblock: tolerate corrected bit-flips
Date: Wed, 15 Mar 2023 00:56:53 +0800
Message-Id: <20230314165653.252673-1-libang.linuxer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_095722_167630_358FF45E 
X-CRM114-Status: UNSURE (   9.70  )
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

mtd_read() may return -EUCLEAN in case of corrected bit-flips.This
particular condition should not be treated like an error.

Signed-off-by: Bang Li <libang.linuxer@gmail.com>
---
 drivers/mtd/mtdblock_ro.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 7c51952ce55d..66ffc9f1ead2 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -16,8 +16,10 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
 	size_t retlen;
+	int err;
 
-	if (mtd_read(dev->mtd, (block * 512), 512, &retlen, buf))
+	err = mtd_read(dev->mtd, (block * 512), 512, &retlen, buf);
+	if (err && !mtd_is_bitflip(err))
 		return 1;
 	return 0;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
