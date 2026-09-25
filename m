Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322E0C98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 19:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTiEM3b7Qmkjn4m2zrgSOoc8SHzbuxxlxeF7ZTkx2Ps=; b=nRztRv5csi3aNx
	zyl9i1VHsBgKUW4gjYD58xeX6lwqgJqGVZvDNTl9rNFhn15vcrVYYOxcHRZ2vgjPLZwsEsHKTJn5P
	tKfS16w72HBBC58FCHTQ94O3p/pCmN7b+FoOLIClr1OTXeFcfxVqYk+1W1HRzeoicFh33UEfmoFsD
	0AThTG/rntoEmfvJXDp6Tm3TvaRNQ4b0gjxYdwQoCJe3FkkNFsccpf3d5VYa1OhVWeIwmIkBvhqj9
	/eseSsDrfpao2f/FxjV5EX52agwFtGsmhk94k3oqgWJjyjnPXCqkdeZgXHrnlc411ukR8GeeZihSH
	r/R84fZPdpgvbrs9lqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFx-0000000EDkb-0snH;
	Fri, 25 Sep 2026 19:06:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFu-0000000EDh6-2zJD
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Sep 2026 19:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RylOsdWttuJv0zUKYqfOnUuW8XaXL0HCgCqarZWQL6Y=; b=f9Xilt1Ei8X/D9VR9EWU61T211
	chezoXQCkNJj8zxEzca02eqJBMOtBbYOm3bbEJjjatidr3+8IcztSBs9k9MIks52Sie/QfaL0UBC0
	sCKF2xgNg2GvjqGbHI2gU2THMRbxfUKR0huuLnBKvCH8ki6HcP/KohFXnSj67NCv9ipOOx6ZTqbwR
	EdQbVpff83UvKbLUvtWlpwertjFy24buHXbTAEhZj7i3VnLO6PQPK9B5xjsxPjN5+ZWCz5qcoZB4D
	4GABCcXfD+yCPS6k7McWE3gA7vV82TRcTCg4TEbOYPwtk+zOEkrWzALwOx6e17UShe49b2axAq6EO
	0PTa+isw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xABFh-0000000HGdc-1oAM
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:44 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso400585e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 12:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363192; x=1790967992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RylOsdWttuJv0zUKYqfOnUuW8XaXL0HCgCqarZWQL6Y=;
        b=OAckg7OJ79zv4HxJ0JdgKQzDVSMs4WkuSfp9sLwW9jvWRuiaFsIfXsUi5JytQnoQ+p
         8QminQ7G7/hn4OyLBd4s9uT1M6kUw/XtWyx361dG1J5LF0XHv++H40rNLriK4wNZUGzR
         F9Xay0kk4X7/3hbIL06y/aRZemJcZncR7HPpvsuiZTYG6JacaJLXbcvYWqNNHnFj/6c+
         GQ3eoAyKluq0AWdIKDs+aZSCyuckT1D6B55w2gyJfdwiY6T9gAPmEJDW70rOxorOa9Sz
         j/smK37lJ39epQCT+t3bJxjpgDZ7saidi4JCLwmMOhUEH9+j4Bz7RR4Nt93EsBwIM+4a
         0DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363192; x=1790967992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RylOsdWttuJv0zUKYqfOnUuW8XaXL0HCgCqarZWQL6Y=;
        b=Bvgf9yU3UzWwNpwRB/eCJcgZXx8O42SLPqBSxTwRFu4PGE4TR9t5f/qaDW9agi9ylD
         XgfREjcoOyV2WGYnDQjSPesacd3votYp8BZ5SkJzn/lyuv2qcMRb8HOoiZBsnJX+eXLU
         OOxcUffjZMT2mB97Lq+2hNSxJyiJCgFhmgP+KJlGwS/Vw77Zxo++yZoQOcZ2Vuo5Hhhv
         btZwu18ICy+tnO6zYjHWVTwgIWIO/iOJIzQGNF97DgBxhMyIMUNmWSCJpqcIb8VmSsAg
         BrmE/iVETz30iOGELLudExPHJWmvtK4FUxgouV7NDcOlAY8h0KzZYbOh3GOrTI4ssUn4
         sQZg==
X-Forwarded-Encrypted: i=1; AKwUvBynbbI1SV2kOzyRHP9lM8VUs+R4PXwZJq++LGvgv7gBxOrP/t9L8c1+OpgdNLn89UA1/lWR5VT3TEc=@lists.infradead.org
X-Gm-Message-State: AFuF++nwzA99doZgoWjcliaovLXl6bvh1h6W7QdFjwTQXS+rN1KyWRSX
	UxKzLaudthHNH82NPc11IFIu+1V9Y2+mE8eJWmpsFqL8ffOIOWyHGKCQdifteg==
X-Gm-Gg: AYBFou21v0s1wbPyYDslssIkcPTDV1oNSCkR744Tn5nqzoOIhqatA553hMEWWAA+qBK
	HF4KgKKPRrwRvPV15VdV4LoxnMxSQFjNq2mrnipX81gvxMqPhpcPd5bXWI0kkqTRqiRqWUMiUE8
	d10d/FHCHEmpG/A1tJr2KXCvJH7mrjIAUw18gCGNsTguHn50IxJEXnjm/5rGmyWSpbncuT5Vvmq
	ufLwoxGlt/I9RGA7pifvlzKJdIT1fZsxb+CIqNpOacTw/bKdGwI/x8LhEohHTwYSTI+3jJu9+LY
	QkGRXCXr3iNEK718DSm5rwDrBfkYdTQcyQReu0oJtB058UqG5mxi58o+d7/3O/9KJL2nNq5EBNX
	1PRcFKlFw3/b8S0xoZngaktc0cR4uGEA5ZvFVa3VJM7hL/XrCUEiZit/PewQcIrFaOFexzvNUwO
	0UAM7LrhFiguWOTMGABDUfZJAR2IkB3bXl3z8jpSEZ3/SmfsCVSkAf5XaiFWQoLFgT835dxS5ke
	+HFNhyxSy9v3MiCgHGhlT1wop+NF3zRccpe5Q==
X-Received: by 2002:a05:600c:4f12:b0:49f:e194:a062 with SMTP id 5b1f17b1804b1-49fe66fc6b7mr139981575e9.32.1790363191708;
        Fri, 25 Sep 2026 12:06:31 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:31 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:14 +0200
Subject: [PATCH v2 5/8] mtd: rawnand: qcom: make nandc_set_read_loc_first()
 more generic
MIME-Version: 1.0
Message-Id: <20260925-qcom_nandc-share-more-code-v2-5-a1b088052d6a@gmail.com>
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
X-CRM114-CacheID: sfid-20260925_200642_560938_BE84BDBF 
X-CRM114-Status: GOOD (  15.39  )
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
index 99fbf5458083..96a1a5a03de8 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -150,8 +150,8 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
 }
 
 /**
- * nandc_set_read_loc_first() - to set read location first register
- * @chip:		NAND Private Flash Chip Data
+ * qcom_nandc_set_read_loc_first() - to set read location first register
+ * @nandc:		NAND controller's private data
  * @reg_base:		location register base
  * @cw_offset:		code word offset
  * @read_size:		code word read length
@@ -159,11 +159,10 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
  *
  * This function will set location register value
  */
-static void nandc_set_read_loc_first(struct nand_chip *chip,
-				     int reg_base, u32 cw_offset,
-				     u32 read_size, u32 is_last_read_loc)
+static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
+					  int reg_base, u32 cw_offset,
+					  u32 read_size, u32 is_last_read_loc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
 	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
 		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
@@ -230,8 +229,9 @@ static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 		return nandc_set_read_loc_last(chip, reg_base, cw_offset,
 				read_size, is_last_read_loc);
 	else
-		return nandc_set_read_loc_first(chip, reg_base, cw_offset,
-				read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_first(nandc, reg_base, cw_offset,
+						     read_size,
+						     is_last_read_loc);
 }
 
 /* helper to configure address register values */
@@ -1918,7 +1918,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	if (nandc->props->qpic_version2)
 		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
 	else
-		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
+		qcom_nandc_set_read_loc_first(nandc, reg_base, 0, len, 1);
 
 	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
