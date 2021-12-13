Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B57BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6O0eaw7Mw2NVHLN1Rx1ZTXLGRJOHpaEXSxvlOpFOr44=; b=VeSaOZIcPdhpRW
	3/fXnVCrv+FCbQrWuRDnNRqPD0wVw5v1M9XUeUfZbwZ6ENvzlV7zufCXn5QqE8ZW/jLiZeCZw+QMv
	ezCLo7Gj0GTO8A/E5cXvKjWFsfxZ52I9+mnd3o6Dw9aNZ1VloDic5FkZfrI+ixnhTWMptXA9w9pAq
	YjUo7cmostjbSXXNVzUJb43wRmn4fIJK29ZknsrBitocAi/W8Hw39l+pTti6P4SCeXLNqFq/SUDh6
	GjjSC2RzPx+TmhDlWKK59XRYD2zYBaT3bS0afJdZIb9OqiRRFJNKzydq8RhcIeWasHbnjr8j5PYQf
	eGo5Pl0AWfQ0emRijdUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwits-0098Je-5U; Mon, 13 Dec 2021 10:49:44 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwitp-0098J4-Ur
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 10:49:43 +0000
Received: by mail-qt1-x82b.google.com with SMTP id n15so14784214qta.0
 for <linux-mtd@lists.infradead.org>; Mon, 13 Dec 2021 02:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7vlfNfrOceOEoYXiDCyE8CsjbUpv2PQ5GDOLk4jPLtE=;
 b=WHwgI4i/lIvtO/xog+9VopKiTNorTcd27b97xeXShSYZLzm188UY22HdGYZnVsUY/m
 FfjIfhYfzesQ48+7a3qql/vBdi80iZy71cV55ilrkMiDvalGKSP5ZiwX35UCO+eohK/9
 Um11+rY+gJTSb2da5Bmjdw7PmNhFrOAJGJpvKg2iu6eezERgpciSnDwpIIm9GnZe6ETY
 dMq1oauC2wHsX6tUtt1Df0Ak9ykP6dnJu9QJNwDyjBVcoNjcWGU8RQMkElHYAjUf/qMb
 VN4krq7nTGG3EqaR4VquEPq35YFtGRAN5fQkxWPGFG/NDae7CliNiSNwo3CMaoa/PTgn
 QUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7vlfNfrOceOEoYXiDCyE8CsjbUpv2PQ5GDOLk4jPLtE=;
 b=IsmLr76WBnrKkWQo3jgtAy7ZD346Iq4E9MXLTpj25rpWQrk12mThc8T+f2KjP7NvnD
 DE+PCdnBCVCvM0wexf6tNEpDdIzpJnLZIxNNDF77wLyOo1kALwkDuRnAC61SWeciaNUs
 ILaePACjCcm3tHcFJvI6ZflW+Hmr6h/7/iWA7tOS1VXSd2FuqCE9spf4604KSn1jL1/d
 XHtfIVFzpnHqWaR2/anyFR9mDnuBE6kubVK8yE91zs6zTosqmqDEh3AIWBImHzuVRfXA
 zcBrVHLbs5JxB7crFFojilE9WoCsTSh/Y0Ex1VHtgLDpEO4K148R6bPDLkw6SbM06qs7
 sZyw==
X-Gm-Message-State: AOAM531SYnhs9bUpAY8k4dpLv4SU4ZZYuUrmwZwUQ08RXXNkV5h8DgvX
 jy+47OoLMMKni9BoxicUk4I=
X-Google-Smtp-Source: ABdhPJzPAG4ov64AeneoCqMD8XRa2RVV0yc9vdWyYc/bORq1dEYKgI2qZ2TqWzWZ1Y1o8vjMzrQ7dw==
X-Received: by 2002:ac8:5f93:: with SMTP id j19mr43808197qta.596.1639392579818; 
 Mon, 13 Dec 2021 02:49:39 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id i6sm9089759qti.40.2021.12.13.02.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 02:49:39 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: miquel.raynal@bootlin.com
Cc: cgel.zte@gmail.com, chi.minghao@zte.com.cn, han.xu@nxp.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 richard@nod.at, vigneshr@ti.com, zealci@zte.com.cn
Subject: [PATCH nand-next v2] mtd: rawnand: gpmi: remove unneeded variable
Date: Mon, 13 Dec 2021 10:49:30 +0000
Message-Id: <20211213104930.436602-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213101519.25f4e2e1@xps13>
References: <20211213101519.25f4e2e1@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_024942_036530_2FF3CEBA 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Return status directly from function called.
change since v1: mtd/nand:remove unneeded variable
             v2: mtd: rawnand: gpmi: remove unneeded variable

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 10cc71829dcb..ab9d1099bafa 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1425,7 +1425,6 @@ static int gpmi_ecc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	int ret;
 
 	dev_dbg(this->dev, "ecc write page.\n");
 
@@ -1445,9 +1444,7 @@ static int gpmi_ecc_write_page(struct nand_chip *chip, const uint8_t *buf,
 				    this->auxiliary_virt);
 	}
 
-	ret = nand_prog_page_op(chip, page, 0, buf, nfc_geo->page_size);
-
-	return ret;
+	return nand_prog_page_op(chip, page, 0, buf, nfc_geo->page_size);
 }
 
 /*
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
