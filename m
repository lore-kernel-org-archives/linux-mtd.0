Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C12ECAAD3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 07:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HG2meus1gFhGrdROTteFch3MoLwZdOStdQbCt/kjE+Q=; b=EInrpa3y9IoNgP
	Jc4yQ/7aR6XLkLN4gAMd/5qO34SJbbSkhpDbGvXX3Z04m+ymuYk6c4KF/zxm1S7RIZBya57rc5hLU
	LvqItswPhZwbSEA4FkR78wgGXXVSCy1SwHteymN/nnFoV+hiprFiPpJa/TTvlTRvdY9X1zmM6LptH
	/mRZ3LAtj3wX+wgCunfjYU4Us6soWnIYxSdr5P0EFEwJSpFj2AsA5zYWsK80fdCvip3tTc7i7dJ63
	XWd9m85gLN7Fas6qvFRrAoiKvXfMvFZ3l8bS0V5gb2GJwNNkNTc26mUmC1h1zDBejxKjB/KYTtarx
	STTXVCHHzCs0azzok2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTetn-00AOBR-QS; Thu, 01 Sep 2022 07:46:03 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTetl-00AOAy-IL
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 07:46:02 +0000
Received: by mail-pf1-x429.google.com with SMTP id 72so16738985pfx.9
        for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2022 00:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=f+g0o24Bq1QlHnqPog3te537VQPNq8LRPIdLIL8D32c=;
        b=nY561n9IGkHiCzHKGAUM2mXfNlQWuYMO05ssj+N+DSCenlXulDVP+VsorkhF5Hz6h8
         qnAtVUyiN7nd121VLlD7CUfYtwZYVihi3SNPuujGwvT/hXw3bBo4Jvha01CTg4JGWjsk
         WY1V549X2mEdEkUf8Mlr0Jgrr7u88D9LgUrE7vw/vICs4XuGghubmDjDxHw61zRl/kZ4
         O8OAPDFPyjIMHlpt42z6WTya3gD8ykvCW/sJOUabJF5Sp7Q8knz7FKJ6deiqCi/I0DJe
         hpoNVYlwQpAL9D+fARw/OzP2kp4WcPLzrtFsJQ931n/qJW3mTfFP5YbvT8BcT2dj2I7+
         lUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=f+g0o24Bq1QlHnqPog3te537VQPNq8LRPIdLIL8D32c=;
        b=dSBUBj8HW3x4rS/3aO/RX4nBIeAFUgb9OpO9fH/bqoHIc7TuLQb/IZML27RbW4XJmD
         Ks3H4tJ0XqwEwW72dib2kGuJcatzHTYkEeeMW5U5WgpuheS58ivOgq84xD7eCF99csEg
         omDO53hGu6XT7HANGxG330hCeWNZV6tR3fq0OtKBLkESleDaOjFC7E/56X3AyWchbPEV
         oqGtcQEGHL0zNWiZO5CAwej5Er/x0Bd76rA8eojOUUjsl9Bc+IvBJ7cMG0cRcnI6+Ru6
         5wp6i/SLevPtylD5R9ULo7mrNCrXOqI3EommvX/IIA5A+6GUhP6Pc1AWhzG20iB6bZgp
         bQAg==
X-Gm-Message-State: ACgBeo0PnmpjTMgDECEI6VgBiGPrK7rzTok7TmOL2fLbOpZ2cKRiJY23
	R05c4wIChgLHFHS07aTsPFo=
X-Google-Smtp-Source: AA6agR7NpALDnpCh8C2wzv0TW03iLpnJ89JOsqm+XbmyxgKvt/RHfDnexfF0ne36o5Pxxy1cWD7Aqg==
X-Received: by 2002:a05:6a00:21c2:b0:52b:ff44:666a with SMTP id t2-20020a056a0021c200b0052bff44666amr30324333pfj.83.1662018359753;
        Thu, 01 Sep 2022 00:45:59 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id z15-20020aa7990f000000b00536b2483aedsm12653099pff.199.2022.09.01.00.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:45:59 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	yangyingliang@huawei.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] mtd: rawnand: Remove the unneeded result variable
Date: Thu,  1 Sep 2022 07:45:54 +0000
Message-Id: <20220901074555.313266-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_004601_647205_D821C4AC 
X-CRM114-Status: GOOD (  11.99  )
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

Return the value cadence_nand_set_access_width16() directly instead of
storing it in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 0d72672f8b64..9dac3ca69d57 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1979,7 +1979,6 @@ static int cadence_nand_force_byte_access(struct nand_chip *chip,
 					  bool force_8bit)
 {
 	struct cdns_nand_ctrl *cdns_ctrl = to_cdns_nand_ctrl(chip->controller);
-	int status;
 
 	/*
 	 * Callers of this function do not verify if the NAND is using a 16-bit
@@ -1990,9 +1989,7 @@ static int cadence_nand_force_byte_access(struct nand_chip *chip,
 	if (!(chip->options & NAND_BUSWIDTH_16))
 		return 0;
 
-	status = cadence_nand_set_access_width16(cdns_ctrl, !force_8bit);
-
-	return status;
+	return cadence_nand_set_access_width16(cdns_ctrl, !force_8bit);
 }
 
 static int cadence_nand_cmd_opcode(struct nand_chip *chip,
-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
