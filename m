Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43005CD8CBD
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yv8M7c0fus6N/pjri3nZnAWouWz85QLKgJGwFHdfUc=; b=0ZqkkGmBpDTBev
	rbREqArjIRwHJ2C7Hrj3vFvcD7Kww3gFGcfZxvaCkL99UcljfJeePAmpSScy6Y6quIZjmilLjVYsb
	rXYBUfdhwz/zNNY5+9IO54KK8n3IbXDmBUZGad5Qud55SK0gfkjpAHCXwegGkJ37mRmk/95A5WD0p
	v8aRhmLDkuu8od77t5iRCKHjInCROru7eeoxKLCoNtQIG0yRREMATiulksWBsY7MsU6QVEa5Wc73s
	7QhjkkU0XM9TVmTI37f7IzY3Jz+IFo9oEmpF0sRU9GVfqWsBWq1I+UkuahgBsSp+zZ26IgAbKkEzY
	rh5VvZ+qjNmjpZHI4HAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs5i-0000000560f-3Ry6;
	Tue, 09 Jun 2026 08:45:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs5g-000000055z0-1Lq5
	for linux-mtd@bombadil.infradead.org;
	Tue, 09 Jun 2026 08:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c61z23tDhGwGTfT6EkieyR0JW4w6MV+Sv05qJWF5n1s=; b=bcuJn4hCNqQKYPaNx7RvxiEbLp
	boizgXW8VLooXmBJFD8fT7Z3rx1biFj0myhtCWSkwoY70xDRWv7x2sSdTv0Zm3pVEiak1EGPJG9mA
	Ek+x2DZKwRkbqaGMG2LFe1al4S+nLXsXB0/O11CcaCH2Ao5khGs+dBEpYSebsMfNU1WwEgEkpiGBd
	lxIBZNS3qsZY8cGpkzaEIrhlt5ylkGg20AMih/fzuzYA0S+Q5vkRkPZSnbg9vXRgkDk9GPDZwE5z8
	2V7vYmJcbDi5i5GaUkxocuYRXAQem2K8/eecUs2TJ83MKwz6DW+PTxegkT2Jdu5w7KNJryHne7DuS
	mKGqJLIw==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWs5b-00000002C5K-1K1o
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 08:45:41 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c859a374903so1796337a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 01:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780994736; x=1781599536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c61z23tDhGwGTfT6EkieyR0JW4w6MV+Sv05qJWF5n1s=;
        b=aIXuaSdgYH0/0HTZUsMP46mmteyxA/1gjpVD0tXVbtMsgipJIFpO62dHsVYdKKHeSB
         XfHgFV1FbhEZ74JTrj3hFsSB/BItozk/3e23h0tJKgR7pfcqBlPL30Z14L+QILLj0zos
         eNbS02qDJ+Rp1ZVkmVFhnnnUu8k0t+IpR4+twrI2kgw419o7rcBFlvbF719B7B3oIoZK
         VnZLXyX9avAxHcZiea1wUWGKJuDJO3Lxoss7D3ay1i4cqxTazVSV5XnOqsWAJ93VDZ+X
         yMFujjme/eAbPWV6JnPGFVCXF8JOTgVdn2FYDC7QXjhGVBrHrZejR3+gpSul9hSIaZYg
         mFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994736; x=1781599536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c61z23tDhGwGTfT6EkieyR0JW4w6MV+Sv05qJWF5n1s=;
        b=MjmFAMTRmlw4QWTXfRxm9fjyS1P5nR3WxAamYB7s8Jldq5Oo7CUCu53Be4JccD8Fst
         kwICSR7RxKct/sMZ88r3nrwNPcdSt61S7T6/rHidnVs8kD4EHt/8cCcWcXYN+Kjz4rvj
         Sj2FM75sGTCBxq8yS6s4V7kwGuqM+mRTjqGP7RKy6yAVcGJzy3+o849c41uI9WTYnyws
         YurWOx46i1nmggq5dhLZJkovvHhBkPXhKAXvN7bwkZoTtCFdCi1BE9FvRXxzgXgQ+9q0
         63zNmLHGPO16jXC/PhO8G/bJaVYmAJCyCL/QJzgRy09Dp1Q0J2/GAdll2L3O1Xyapitp
         tnAA==
X-Gm-Message-State: AOJu0YwAK4J0Iq66OaLhMFyLENn8zC26bSqvWwSfbOTFRb/CsW8xgMW6
	Oo8ePtNwpsmbfXhB9WwGuwiQ90EXUY3VEHUDYUSfE7bFbciNEbpAVWBs
X-Gm-Gg: Acq92OFOEcNUeAiB8oTYoTYCmXX4OlsJTsm0BCrv3bospFBxn0i8yRRTGXkXKXEAfrQ
	c6M5ExV0W/6APmcwVYcCNhWXwEf1UCskZufVt6Z8jqG5dDoXTHwRomYIXVP6Gy0Bebm2qVYpVz9
	YOwcDL4WvDPGnanVw5YocAuj5YV2EQWBYB+a+AUy8ryU9M9m4bqW90sJ4CAg204ZJy8nLUUwB1L
	tSBQMDh8qVK3ifQOXPCjcU/QBEuTfhaScMSAyiGAr2ICwck/Xpa+YyoxhW1ucjrBVR/Ik15DBuc
	1VGqYtkdvgazD8hzRs372jsacblog/O2xnzrCbqwV7M0YIV6srKKyUmqFcThaKMhFnWagLiEqxP
	P4XJZ8aCMqZRbjmyUVRmWqq8y4qG1mmitvnzFAGkyt33Tq/tqzuFK3wTkXV25xF12hJBast09ue
	VKmwPlTvqzhNLwN7F1N2AMRzjzb0lCIUr4tEABXN8O+FvdB+RzAevb2A==
X-Received: by 2002:a05:6a21:1b8a:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3b53beb5c12mr2707477637.37.1780994736430;
        Tue, 09 Jun 2026 01:45:36 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:37c9:44fa:729b:6aaa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm17608599a12.0.2026.06.09.01.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:45:36 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] mtd: slram: remove failed entries from the device list
Date: Tue,  9 Jun 2026 16:45:27 +0800
Message-ID: <20260609084528.5-2-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260609084528.5-1-ruoyuw560@gmail.com>
References: <20260609084528.5-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_094539_535855_7A91C811 
X-CRM114-Status: GOOD (  14.22  )
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

register_device() links a new slram_mtdlist entry before allocating all
of the state needed by the entry. If a later allocation, memremap(), or
mtd_device_register() fails, the partially initialized entry remains on
the global list. A later cleanup can then dereference or free invalid
state from that failed entry.

Unwind the partially initialized entry and clear the list tail on each
failure path after the entry has been linked.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/mtd/devices/slram.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 69cb63d99f573..48c2bc6b65eec 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -129,6 +129,7 @@ static int slram_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int register_device(char *name, unsigned long start, unsigned long length)
 {
 	slram_mtd_list_t **curmtd;
+	int ret = -ENOMEM;
 
 	curmtd = &slram_mtdlist;
 	while (*curmtd) {
@@ -155,14 +156,15 @@ static int register_device(char *name, unsigned long start, unsigned long length
 
 	if (!(*curmtd)->mtdinfo) {
 		E("slram: Cannot allocate new MTD device.\n");
-		return(-ENOMEM);
+		goto err_free_list;
 	}
 
 	if (!(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start =
 		memremap(start, length,
 			 MEMREMAP_WB | MEMREMAP_WT | MEMREMAP_WC))) {
 		E("slram: memremap failed\n");
-		return -EIO;
+		ret = -EIO;
+		goto err_free_priv;
 	}
 	((slram_priv_t *)(*curmtd)->mtdinfo->priv)->end =
 		((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start + length;
@@ -183,10 +185,8 @@ static int register_device(char *name, unsigned long start, unsigned long length
 
 	if (mtd_device_register((*curmtd)->mtdinfo, NULL, 0))	{
 		E("slram: Failed to register new device\n");
-		memunmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
-		kfree((*curmtd)->mtdinfo->priv);
-		kfree((*curmtd)->mtdinfo);
-		return(-EAGAIN);
+		ret = -EAGAIN;
+		goto err_unmap;
 	}
 	T("slram: Registered device %s from %luKiB to %luKiB\n", name,
 			(start / 1024), ((start + length) / 1024));
@@ -194,6 +194,16 @@ static int register_device(char *name, unsigned long start, unsigned long length
 			((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start,
 			((slram_priv_t *)(*curmtd)->mtdinfo->priv)->end);
 	return(0);
+
+err_unmap:
+	memunmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
+err_free_priv:
+	kfree((*curmtd)->mtdinfo->priv);
+err_free_list:
+	kfree((*curmtd)->mtdinfo);
+	kfree(*curmtd);
+	*curmtd = NULL;
+	return ret;
 }
 
 static void unregister_devices(void)
-- 
2.51.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
