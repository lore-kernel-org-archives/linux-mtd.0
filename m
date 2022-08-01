Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54384C00140
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Aug 2022 02:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aGB9vj7RjxwFePXLJla/FuymQFbHaw1gAqlyCmUCNgo=; b=a9Qi6JjQpHrADI
	csrP3A0rDA+H49MKfGJo3yxU5QDKtNh+9IWvwaJr9y3yNpcUwZnc7BxuLoTsD+Kv7rj+/9O+9CHf3
	Xsf5jNEKVcwPn48TIfFKXS787gUjfDgw+TFC9pVQXhsIFJzG8AiDM2qQG42cjg0yXAeNiQOzz3tE/
	Bl9OnomIcybSCyiZvCfOcD3Z0JaPAR17JQuhJEkTxs1CAlu6dWEiqPLs8ds+ze9/sAjdWIkFz4ouJ
	WC2SNGmyQ7KSggkFTWq8akuJqUsZhz9yOdhV3jvDzySLFY5AfRPa+X7Q6w08aWAy7Wd2swXxu9GMK
	ohtARRZjbmdx1tV+PJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oILJW-000p3D-AP; Mon, 01 Aug 2022 02:37:50 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oILJR-000p0N-Ao
	for linux-mtd@lists.infradead.org; Mon, 01 Aug 2022 02:37:46 +0000
Received: by mail-pg1-x52b.google.com with SMTP id f65so8515132pgc.12
        for <linux-mtd@lists.infradead.org>; Sun, 31 Jul 2022 19:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=lXB0daiEp1IPszXD6lgU6e6WPPivz7kdrh5SiPt8e4w=;
        b=YPhNY15H5CaQQ/HwGPI1gF8eVX5EYfKwSwYqO74WPIVnF47YgVCKq3Ix7MQ0Y+s510
         +hn2Qv7HdutmdW2LNgHBDHzUqefm5CE2zE2AQuyDosrtf+RIYaGCqieFiubPyDTg9wZr
         nhYyZLZjFNhvpR+yCnjE3FixYjDog+mKJDa2p36UpYYOZUkJzFpIK8v6Sf4vmjI+loYf
         VuZZOLHqeZLeYy7GDLPNy9X5hS7dJVIqkbQJEUVe6DkiWfAuf9BZ50sbmVpQcFYYsqe5
         96dEdPbG4t5XbtCTsh7BXi3842ZZj8rlSZ+oiKDR0lvzTQZ0nuGQBJgc83EykzeRFymy
         Uibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=lXB0daiEp1IPszXD6lgU6e6WPPivz7kdrh5SiPt8e4w=;
        b=lNzlrdtiX+bkDmGvQ1mN13CmfvLoZceL1JiNSPvAkOpc3ImdWNQWK57iMzu209J2kD
         RGgcR9ifuXDgT9zExu/jx/qZPMg+8REEQtyewj6nMhH4+zMGkCQ0CbAmqoF1ustO+0iq
         LgJfYV9eDCIAGKROBxaqXQboJ4oox6GFmacga1oIJwUttGrBnUVTyeaNZxRT7yZBn01H
         ncEX1EXCn+0JxVbFcS8ytPGBtA2JOzFSlv2onODZ9MpFiTGXODzwzdjp5019w222HPd0
         JZzpax9KFpd7LtUWC6iuQtz4wdHH6y7flDVayD8ahePg6OFSbSoDz+cCFcMyeRFgqzfG
         f87w==
X-Gm-Message-State: AJIora/JmbjR3hBnii34KaQSUo1RyUnAA64egIXamNE1sPujlkcZL7sv
	S+3i2Q0enFfGJa+4c1FW1NI=
X-Google-Smtp-Source: AGRyM1vkrnlUyBdeQSpJcGixcW0bP+dpn4G3gZyhx+d3gdoXpoeA9fV+ccVQOE/3hje7tjQGSCWiRQ==
X-Received: by 2002:a05:6a00:240e:b0:52c:81cf:8df8 with SMTP id z14-20020a056a00240e00b0052c81cf8df8mr14283962pfh.60.1659321463167;
        Sun, 31 Jul 2022 19:37:43 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id k32-20020a17090a3ea300b001f317767790sm8594894pjc.23.2022.07.31.19.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 19:37:42 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] mtd: rawnand: gpmi: using the pm_runtime_resume_and_get  to  simplify the code
Date: Mon,  1 Aug 2022 02:37:38 +0000
Message-Id: <20220801023738.1595203-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_193745_459023_916121FF 
X-CRM114-Status: GOOD (  12.01  )
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
and pm_runtime_put_noidle.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 93da23682d86..0e7da90d6559 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2504,9 +2504,8 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	for (i = 0; i < GPMI_MAX_TRANSFERS; i++)
 		this->transfers[i].direction = DMA_NONE;
 
-	ret = pm_runtime_get_sync(this->dev);
+	ret = pm_runtime_resume_and_get(this->dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(this->dev);
 		return ret;
 	}
 
-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
