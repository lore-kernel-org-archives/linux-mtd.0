Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A13C624D3
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBtDV9PtektB/XDRc+EG1JyNq42gquv+TXGVMMmtI80=; b=40ktD3ZesyTMrX
	uWKEkdczPqcVP/eFgfARdo9vOghqy8ZI47jZV9t6+37MUOFZ28hM9t95BdQBKb+mZS0vyNTl9Hfz/
	Nw1mtfd41N8UgAtOlxED3zb+gvlzJFtXBaQ0FFAeoFb8YDPOv1/h2suYo7xBkirgOHgNrjV/blhHc
	qcK9LFfZBzDBK8A6hFW9a2TF6cXofHEQ6hz7/ubmE0YFvXJZjMeO+Yj9k8ccju95+O4HCfLD+dvXV
	mJB7vHylJnOVVy37Rc6V6COW05ZNovtsTUMW+tAls7MomtqG4+W+gXKkYF7kJfZR6zB2w4yxgdfCd
	tVthEPMSa4Z8Gmdky3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YPZ-00000002zws-0yqp;
	Fri, 04 Sep 2026 18:13:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YPW-00000002zux-3FTy
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:13:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5570B1A199C;
	Fri,  4 Sep 2026 18:13:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 219106057F;
	Fri,  4 Sep 2026 18:13:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7672B11C78767;
	Fri,  4 Sep 2026 20:13:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TYvl3/rhFkeeIA5nCbOHxwMVTbW8grC81clzEw+bIAE=;
	b=cf42qijblLDMXYj9+s1Aujxzt6M86dKKVf0cBmoaE2F7OstFL5nOfKCl8OLY0Wy8DaIlpt
	AdvnkbQgb/d/LBQFg3sf8oB6rTBYH/R2q8eJK23NEHCBahxcycNFLlyNDwrnbiOh7xrMOS
	Y5WCrA5o65SYfToK/8NkZtGC1IhD64yXz+feKPEi1HMlQcL8/XZYL1F40jsm6hUwpc6XMp
	j9kktlFCRFbKiZbFTkcu9r7Mq0cqtVbRoQZC5LcV1fM/jl8gbSajVjhLGDaaKdTLLdqkB2
	HGnKdfy6+enRnMZzGE5pDzMmtw79RVTDEIRABIGOeraN0+9LPK2zT3hDnRl3zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:12:38 +0200
Subject: [PATCH v5 01/25] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-1-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_111310_965200_E501149A 
X-CRM114-Status: GOOD (  12.80  )
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

The _BUGGY suffix is not super accurate. There is a behavior that indeed
seems strange, but it is somewhat documented. The fact is, with this QER
field the status register is considered 16-bit wide and if one writes
the first 8 bits (SR1) without the next 8 bits (SR2) then the content of
SR2 will be assumed to be 0x00 and will be cleared.

Rename it BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR to align with the other
namings (_NO_RD) and clarify the meaning of this field.

No functional change.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 drivers/mtd/spi-nor/sfdp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 24e4d07b18c9..ab57fa60f718 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -598,7 +598,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		params->quad_enable = NULL;
 		break;
 
-	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
+	case BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR:
 		/*
 		 * Writing only one byte to the Status Register has the
 		 * side-effect of clearing Status Register 2.
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index f74a0eb339ea..d976c6c9a4ad 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -84,7 +84,7 @@ struct sfdp_bfpt {
  */
 #define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
 #define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
-#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR	(0x1UL << 20)
 #define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
 #define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
