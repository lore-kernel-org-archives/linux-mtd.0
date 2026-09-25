Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DD6C9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 19:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pO79m6IlfcdScnQGMfDvVZhpSKZioGsyucBcPysdhk=; b=joUsI6BcL5/WjU
	gbE+WwhQObnpudEvgNEJ1nQ9O4Rw02HP8E+WaDio16IBVyaJL9pswn+RBeMKHe4X0+RlCkIFGCMai
	3ncDMYB1ZpPj6VgkJpJSoQZs3wsyjWBladtDs0co12OKjpK/HW3kyZi+jyjB/KSqtHIdoyMpY2dYh
	usbS/bkyqAOKMVmtu4pcaXC+JGWm493NJEhZTDTYChnDVVZyv3wczsWIAn0A5o9eFuNUWQ/gCJY/a
	Uzwe3BFwjLToT+uLqR/IpcuCcuMHkqreBGKUNK6xlWgEnWfNeobrByKC8t0mZhxEtsapAVVtFxd2J
	qG4ikAjbNSkp8Y0G9bZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFx-0000000EDkL-0JsY;
	Fri, 25 Sep 2026 19:06:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFu-0000000EDhC-3FyE
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Sep 2026 19:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z5Srgm6JvxgKCcCMFCgkofRyicWdcx23+kTiGji8Q80=; b=Yp/gwc0iWhq0gok3kT1hgt9Slv
	LmwqO6i6SCxjuIhx2jMehohQXjOF0J0+hvCanE1C9QB0Ta+skMaC0IM9HGNDH0hEM12Hqzv2DQa/i
	r/vtPwoMckrrpywfkjbuUjA03/mLaJn/bcFwcSo+Qe/3a25A/WEESc59dAGq8DYGv0b2H0Mrd5h7D
	8sgnEnLC/6SsBRE3hzsx6B4Uu6gbfY1VGZvcJSC7df0NNFkxfFyYAxMg0cYYaDi1U0ps2Am4ZqJ/O
	xayj1kasw2+Xtd14iK+AMUeb1bf2d239QLzssbNtg0onUNgdzp96eONIXhBn6UDF9Hgfpj+OvYq0N
	NWU2aEQQ==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xABFi-0000000HGdi-0lEO
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:44 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so968027f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 12:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363193; x=1790967993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5Srgm6JvxgKCcCMFCgkofRyicWdcx23+kTiGji8Q80=;
        b=PQiiK6nnF5FK1h75PP0qszkprDqtBJE6/fnsKybFvMbYpF7y4Mj7AAraY/OlJqx0aP
         PE/0JPi5ECNIkMobFt2v50O6seKgLi+w5LlHLP+4juent/odrbXrs5syDi+vPBtEz+wb
         4z0C63lMc/zV1Xf64AJnr+ESyRuGF0VITps9gF1ZfY2OVwivzvVomNTCDDQcNtan+sQm
         bqa+LMFCOTO/DsbTJjvhEDiP85igPo5vWGzYhK4U7z8Bw0SNcVHzuF+sEBnmt6NY8f4b
         sAYJIbRjoHRLxg1P0Ql1WaoMcGLCkdhCKUbnMjDNyOB/25FZl/2OKbqg9q4kSmEcpI3E
         0iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363193; x=1790967993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5Srgm6JvxgKCcCMFCgkofRyicWdcx23+kTiGji8Q80=;
        b=oorZeH+tT2Baz7Y7vzSMISUpj0XD2mCHUPWtTNgsfxjNalT0zi63lf3n3m/Zvpej2V
         0gIh0SwcusDEu473AUCaB+OBkhhkUhnLP/5bTFz0Wsg4mfXomRzOMG5Fw+VoWd8tuuGd
         XfpTBvnQ0XFgtvDxghzf9W1Yd6/w/Orl75NOYAuYuz1Ef0As09FMIi+rsayMgojBiRpG
         oLV8kiTGlsj8owtjTu+Nu+0msIUWR8DrkVaBghSkl0bNZn9gboNdg8A8EGFNZicAiM6P
         DpLkB5wyOnDiSWSoRs2gtwXJg+EY6L53gHPnrw48fzhPGqodpS8HiE+wuDXqRJinBFk8
         Q8MA==
X-Forwarded-Encrypted: i=1; AKwUvBwDUz7ZTqB7plKRy4qH9iJdCKjz4/CCVH+kmUJBvW6aWIxy3ZZDoQaBxbqIeAGFIsMhI/rBeVoYXTI=@lists.infradead.org
X-Gm-Message-State: AFuF++kgmd86OfFPGfwPuNg8Pse0ycmbdHt7mJfbsIYsNKcoDbAYrgub
	DGkmVUh1PojhMgDfgb59XsRAzBkxWTPqGsVNg8LY4smBOuEd/sKfQX/EhOQ31w==
X-Gm-Gg: AYBFou0fKoox+DAmJsB0BIyMcQXJZhJEpWWs/YKLpV2UVswhDXP4A6xJIeP0EwGlREU
	5qAv6vOT9fePaQKng6PxJKMsD6DXQsRx70anKam+sZhVmrfcJoxfLU6eLKco812tSuyg1aOY3hc
	BLTzQfU0OrRUDrtKtYzfNhBRbJGIQtWh95lD44bxA/UlILM6FRribka8fUepJzdQywCi0x6XP4d
	Ur0I3an75mTtgFmw7opFRtX+bXcEpnDhk2JujWqUCh5C4CrcqZnDz4rGyzBRJozHV+Cb9JXHYb2
	5i5Vhygja0rSngWV1KxAJbO6XNVuIaNOB2x747p64DuG+J0ou1ZDRKhOm+qnDIJ7J0eKwylQLvN
	qRHLhOX3MXyT0/8zqkcjps6hWp46KUfz+CU22xLKZWtzIpoHSuCgjEsAsa9nEJx+qeN7SXYQBic
	Fd5cN3BSRMxfYGpIMtfDO63bSlbnPkEj2H5tkmdSY4zQ2oDaOrTq9+jhpcXZ0Ltgcv70YfpCSof
	SQtE+BF7qZfx74WZb7sgphi55c=
X-Received: by 2002:a5d:5e03:0:b0:487:370:c511 with SMTP id ffacd0b85a97d-488717147e2mr11934205f8f.8.1790363193010;
        Fri, 25 Sep 2026 12:06:33 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:32 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:15 +0200
Subject: [PATCH v2 6/8] mtd: rawnand: qcom: make nandc_set_read_loc_last()
 more generic
MIME-Version: 1.0
Message-Id: <20260925-qcom_nandc-share-more-code-v2-6-a1b088052d6a@gmail.com>
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
X-CRM114-CacheID: sfid-20260925_200643_049994_E1B7EE19 
X-CRM114-Status: GOOD (  15.42  )
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

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qcom_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
---
 drivers/mtd/nand/raw/qcom_nandc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 96a1a5a03de8..cc1e64ac4245 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -181,8 +181,8 @@ static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
 }
 
 /**
- * nandc_set_read_loc_last - to set read location last register
- * @chip:		NAND Private Flash Chip Data
+ * qcom_nandc_set_read_loc_last - to set read location last register
+ * @nandc:		NAND controller's private data
  * @reg_base:		location register base
  * @cw_offset:		code word offset
  * @read_size:		code word read length
@@ -190,11 +190,10 @@ static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
  *
  * This function will set location last register value
  */
-static void nandc_set_read_loc_last(struct nand_chip *chip,
-				    int reg_base, u32 cw_offset,
-				    u32 read_size, u32 is_last_read_loc)
+static void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
+					 int reg_base, u32 cw_offset,
+					 u32 read_size, u32 is_last_read_loc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
 	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
 		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
@@ -226,8 +225,9 @@ static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 	reg_base += reg * 4;
 
 	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
-		return nandc_set_read_loc_last(chip, reg_base, cw_offset,
-				read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_last(nandc, reg_base, cw_offset,
+						    read_size,
+						    is_last_read_loc);
 	else
 		return qcom_nandc_set_read_loc_first(nandc, reg_base, cw_offset,
 						     read_size,
@@ -1916,7 +1916,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	len = nand_subop_get_data_len(subop, op_id);
 
 	if (nandc->props->qpic_version2)
-		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
+		qcom_nandc_set_read_loc_last(nandc, reg_base, 0, len, 1);
 	else
 		qcom_nandc_set_read_loc_first(nandc, reg_base, 0, len, 1);
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
