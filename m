Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E254C98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqvZPTzL3q3yQgVWHe0QeA+/dwhtKOu8LAkoqgp+fXg=; b=nPfXHOPnw0pEHn
	1WtzpIKKtxorcmFzrZGYPfGXSQ6IzYjJ1c/CUB0UNjMX/xnNPY4L1VOjP1G9gpsJtw0Z5viPQCodl
	egkXa5qu4zO/mFQ2nO/bFMkGsv0dUXoMU9oanK0EKcKr6IHWztPQicq07zde97KBe0jhvjMP/IXkb
	LqInXvtb+hR/9g3bSwwLGcnlQ8pZHuvAJU2hXyMuRk0qWXwozQN5QP48z+WWRUD+HotCFLSEH5lfa
	ziHWLTkKhQxQ11AU5ICtSwUBKX072ZMax+qowi3XlYESng6Cr7BgfwwCZBmtY6mdrN3QP16F/xyRg
	V/6MlCmdha5ujcMoEosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFh-0000000EDWv-3t5y;
	Fri, 25 Sep 2026 19:06:33 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFc-0000000EDVf-0FRg
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:30 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48877902c99so1045206f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363186; x=1790967986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ySQVKffvoWSE9C5/lbi1TrMmX8nXIRP+Q8bXCPE17I=;
        b=TvFsaGFoutE+wLWNrCJbU/2au7y0CmfBZdFis3uWPswkhEZZIBBmKKXKpHDNg6trr/
         0sZvcj6VEu9iTX1nsXbV7EtqDZ3LlF/CCX+6LeEpEbVYIe268nTspp1xD6918TenvLFo
         npCJq8La5VHZ5p1YF34kkylDN/TXs+Up0VSWxvzLMYyCCGEg5bL0gL/2FBXKGk0RIqxF
         bZyauYxWmh+68BRNBN/ni7mSUiQyqwzC7dA35xmYzagYvXZ+Os2SGTKETDhLBd9HGW1t
         AI/k8s1bIRVdhmG+TknJbsXQiRbWkDefXRKyHfTwH5ScwXVJ0WHnvaeNXkv3ERPGcFsh
         W3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363186; x=1790967986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ySQVKffvoWSE9C5/lbi1TrMmX8nXIRP+Q8bXCPE17I=;
        b=je7SY/PFF2dUHgy+OMC5LAtb5wJeCHLO9IX1QXYsmKBJKeeVENwlxoEAeSCh/7WyLb
         u1v7KPUtaTj5vRegXREJjPQThrmLSkyVHpNpnKJOxpdnsUzEZgFA/TqULhNBtsfnh4iH
         UV32BFh1BbRZ2WjhSSTfbGRGCv00CQZ0Jw3+hkvu+UDfFoOvAIQKkn/EaJESzJN/ZujS
         vGUBssI/C+OX8qfsSN9YlNO24C3N192S3MZQY92kbzQJ6wCC5I4RixAwL34xEFh2gfXN
         b+Cs0A5Mjq4sSljYcd05wLJw8IdFwW7APBaTeV9TmkMpG7wIg47fAO1C6nwpteBYv8Vn
         An1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxoK1O/c/NQTEBEOV+HpSqWOsmG8DHamTt6iDWUcQji4CFzet1fzKJsfo1iy808wpkwS9G1aXP8Ubk=@lists.infradead.org
X-Gm-Message-State: AFuF++lpBX5WnV5uN37FU2NDGT0Q6775xeL0ZRbgIw7BHFoGf7ODnCCU
	V30hwOY8lssGNCSduhY6ZR4dhr8UHqHxNapGYfH1WBcWwBCBGTtYWUJY
X-Gm-Gg: AYBFou2Cd9yYEOWmd8zC3DBg26hbfsrifbzRq4eN3iIcMFVOUj+ij4JS0N40LRjWPXW
	jhY9grRbGVVLZFSduRts5s0EpywtIYXHvM5OuVKBL3hnuY7gOhuBqAx7B4/QUtOW+uqfKxGlgTk
	dfq3Tzv5l5Fsojq7tYpD0gQpfCbKoEvbiXtu2riMrSI+lzUl7sFiQQWsf8JbJYNDwWAsmTKbhoh
	dcqj3/nVh6yM4lVrQaVFn+HUuufMjMogcGfTVXK/F6uJhSSKpaa22xVatXOGdH4eNIQRp2nPLOp
	gtzczcpaQq6CXoH56WqJb6SbgmI9SlUcIn0DHXBSbhOEPouch1FTOWm+qlNWd4rco+/RV0BEvcZ
	/O4l/jibEeEShpd2Wh3mr3WWV9Rh+ZJ9+IuUlN7Edq0Ozuk4Mm8oFib2hiLn7qM5vQWNKa+coCk
	x2+5XP+yavS0RsRC+TJoxHM828tm1FX3Jl213JJ1HTieO0ZtgLceV99hD9O4XZkMsAXYTrrZ/h7
	+9GRTeAV0Pfx5PJhwp4T06n/xc=
X-Received: by 2002:a05:6000:2304:b0:487:27f9:83d with SMTP id ffacd0b85a97d-4887171b80bmr11515371f8f.50.1790363186404;
        Fri, 25 Sep 2026 12:06:26 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:10 +0200
Subject: [PATCH v2 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
MIME-Version: 1.0
Message-Id: <20260925-qcom_nandc-share-more-code-v2-1-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_120629_112310_E7FA431A 
X-CRM114-Status: GOOD (  16.75  )
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

The function gets a 'qcom_nand_host' pointer as a parameter but it is
only used to extract the nand controller's private structure from that.
In order to make the function more generic, change the declaration to
get a 'qcom_nandc_controller' pointer directly, and update the callers
accordingly.

While at it, also change the function name to use a 'qcom_nandc' prefix.

No functional changes. This is in preparation of moving the function
into the 'qpic_common' code to allow reusing it from the 'spi-qpic-snand'
driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
---
 drivers/mtd/nand/raw/qcom_nandc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d7642db2e2df..12bfb14cd9a3 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -449,10 +449,9 @@ struct read_stats {
 };
 
 /* reads back FLASH_STATUS register set by the controller */
-static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
+static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
+					 int cw_cnt)
 {
-	struct nand_chip *chip = &host->chip;
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int i;
 
 	qcom_nandc_dev_to_mem(nandc, true);
@@ -538,7 +537,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		return ret;
 	}
 
-	return check_flash_errors(host, 1);
+	return qcom_nandc_check_flash_errors(nandc, 1);
 }
 
 /*
@@ -1181,7 +1180,7 @@ static int qcom_nandc_block_bad(struct nand_chip *chip, loff_t ofs)
 	if (ret)
 		goto err;
 
-	if (check_flash_errors(host, 1)) {
+	if (qcom_nandc_check_flash_errors(nandc, 1)) {
 		dev_warn(nandc->dev, "error when trying to read BBM\n");
 		goto err;
 	}

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
