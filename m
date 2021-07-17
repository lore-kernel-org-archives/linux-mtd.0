Return-Path: <SRS0=WLwv=MJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80669C636C9
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Jul 2021 10:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4376F611AD
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Jul 2021 10:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4376F611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0hP3k4jJvcABHDLOqBQeGGNr/qPmPa4o+UAatn/Lrm8=; b=wXhEF1Vg3NZHzH
	kfAjcDVCyBV2dNYdphAgf5sjMLYMrboVE2rkMWuPDl7MoFeOs5fwCTPpGv1c86j1saPI2Egf8MhkR
	2dJX7PzFqPlOlAnMOu3rZY3A1cg/Q8p0VEy547Rtf1xqIm7brKXJARNxthur3H2heXhsCdarVSRUY
	IIK5idgcAhIIHa7hcT4dU35f6Y5wTlvAjNhBEj3Li+VcE3DB66jtjFaOUpIF/2bLblpr1pYO8+gnI
	2pequL3PjAFW3DzAxf5kaCOLSvZMAcljs6b/Xqr1mdttsg5KHKZMZ5Jujxjl6BN0FTGJu2Y/8sBrD
	v/N9RJjuD8W4cDHX1y8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4hGH-006S4H-33; Sat, 17 Jul 2021 10:09:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4hGE-006S3y-Go
 for linux-mtd@lists.infradead.org; Sat, 17 Jul 2021 10:09:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id h1so6602148plf.6
 for <linux-mtd@lists.infradead.org>; Sat, 17 Jul 2021 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=83GbSGpZBfJHGXq15Yg2ngQ7/7/5XwVRHY0b6SDhljI=;
 b=uyXB+/16nvqrz8OL63K/aowqr/Mq1BwOMmDr72vNEAEScOUTTnm6SSGvF+7rT2Dgcc
 KAaxegtG0c2E5MqZqFgrQi7mXbG5gTKdIXV1ewE+kqwHm3m/31T6RjUeyzLSEfrgQGe5
 oU2E1Ke4aSeZ7P9uNVPxWhRRkcmgVn5AOjrOhRcbVyzcHmjyuipoRoWPK2E2yeYBVvJ/
 etVdo8RG4HSWZRau145JybWep6I7xLI1pw+NdAK3m+Wtt6J7Rp4CkKv9NC05XatnC9Xx
 h9x+XMC3KoTFBdcQQJmkO8uX/FzxE6AUsCeCST/DmMtSIFch2SlP5QpbALz0/ExX+yo7
 feOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=83GbSGpZBfJHGXq15Yg2ngQ7/7/5XwVRHY0b6SDhljI=;
 b=rDuYYMb2YqlsH/4TDi/pajeuqY9NnaRgB4fsmbzN1ubjtP/6uBbeJyQRYFmZWc/JRE
 CIxqXjFvI8Ik8VB2NyBHedb+qoElKI4WITrZzgn3EC80kVhXoJD7PwvJTbqQdm8uWfk6
 1gg/RC0xzS5XEZJRxPX/2dhHNDAjW0LmU23DJL9YpR0i3mGBEZUxojORgiBHEREDE3BS
 0fMiHF3xNMDSQHSnLQZ1dr1Gj6BIK3T74n3PJFw2rmov2IV4cBfMexjV7GnOIqWUIywy
 f5LZOANYnCnXUwOtbymL+ZRz/S/3cWSWAGdA8eZ9RynxvYFA04DWD3aFlNgS+RuzTluE
 xxtg==
X-Gm-Message-State: AOAM533nqxCd3vrPRhdjD91qN6a/U/jCdgbMwoykjhwr9MHEOHIMij8W
 xJ3m+5nJcnscLL1n3lw/xkc=
X-Google-Smtp-Source: ABdhPJzLcYMp6ta5QAnBuXu8Uqc4NgXwYejLU9B7Rfgy3g02aqr/l8DR6Z3DASRCSSw/6zqZKTBXUQ==
X-Received: by 2002:a17:902:9a8c:b029:113:d891:2eaf with SMTP id
 w12-20020a1709029a8cb0290113d8912eafmr11286452plp.61.1626516568517; 
 Sat, 17 Jul 2021 03:09:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id p24sm13487926pfh.17.2021.07.17.03.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:09:27 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Hillf Danton <hdanton@sina.com>
Subject: [PATCH] mtd: fix lock hierarchy in deregister_mtd_blktrans
Date: Sat, 17 Jul 2021 18:07:19 +0800
Message-Id: <20210717100719.728829-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_030930_598958_B4D9493D 
X-CRM114-Status: GOOD (  10.42  )
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

There is a lock hierarchy of major_names_lock --> mtd_table_mutex. One
existing chain is as follows:

1. major_names_lock --> loop_ctl_mutex (when blk_request_module calls
loop_probe)

2. loop_ctl_mutex --> bdev->bd_mutex (when loop_control_ioctl calls
loop_remove, which then calls del_gendisk)

3. bdev->bd_mutex --> mtd_table_mutex (when blkdev_get_by_dev calls
__blkdev_get, which then calls blktrans_open)

Since unregister_blkdev grabs the major_names_lock, we need to call it
outside the critical section for mtd_table_mutex, otherwise we invert
the lock hierarchy.

Reported-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 7d26cfe24d05..87e26788ef60 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -563,8 +563,8 @@ int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	list_for_each_entry_safe(dev, next, &tr->devs, list)
 		tr->remove_dev(dev);
 
-	unregister_blkdev(tr->major, tr->name);
 	mutex_unlock(&mtd_table_mutex);
+	unregister_blkdev(tr->major, tr->name);
 
 	BUG_ON(!list_empty(&tr->devs));
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
