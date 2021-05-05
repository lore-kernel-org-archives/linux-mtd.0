Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86CCC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:41:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90BA6613E3
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90BA6613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VMXZsMJmL78ah7UYGQIWFy7r0OQBfXdfAhfEF9JYGP4=; b=ihJBNKDLqHx2VBMVxT668DOiR
	J9RkqSCSHruKLfSZJRZfLG81DrQPF0A+bMjsYeprWakvj0mXDAKl+CLPIDPqkWDrn3Pzz24DBLBmT
	qC1aVtgLU6ADtL6dTSgBFYLtkSzDJpNDp1U6lFtaJtL0ur+LdA2L0nhZnIkt2R+MmdBBVqe/bW/BP
	hqV24dcDDKoWUSYYYXlfyIaGKBMT1QMSd6miOAt3UH5NsdpaHGgk/V8p+L7IDgs8IIBpnTMc5Ujep
	cy3zfYyB/2U8ttjZShzDehDliAK/Kp7KJ5DJ4hp5gDDDmeiGIwQN8wUx/m7x+2EMnQ0l3lxP04W3k
	IElCqXg4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePFo-002PJP-Dx; Wed, 05 May 2021 21:40:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDY-002OmB-BS
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=lBXO8MEjvdoTVhdpCqaS+rX/IYscoP/F3uNa7GF+vZQ=; b=qv+QnTgAbQE9Gn4QqMRXNqzvza
 pDRtH3GPRC94lgltqriL8npLxXl999KxW8XrAcznQ9Si/uHn+0V8/zK2wcZal35rE4goz7uj2o82p
 +tJrrMxZZNaxzPlhhjMcA54OHLi3ghTMxgSfoOiATUQdc5uzp0+6xmCZP8AWosxx2XezMsOofAqCv
 LG9Swk+9DK9kECCTiTenLkQoGks5KYIEBVbtnzQ3MVYVQ9jnCXuOsSji8UBvrDFpKwoqA4E3ig3yU
 FOPsRHxSiIKkfN8C6dO3NsiHwwqS1FMAaMGscqObAFnYm2OTSGjXdyUEFL5JCMmmbZydCeKx2EyJG
 +g/VUs2Q==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDU-005Ict-Ha
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:03 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D2B081BF20C;
 Wed,  5 May 2021 21:37:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 05/22] mtd: rawnand: Update dead URL
Date: Wed,  5 May 2021 23:37:33 +0200
Message-Id: <20210505213750.257417-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143800_741462_9C991DEC 
X-CRM114-Status: GOOD (  10.46  )
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

The current link to the ONFI specification is broken, the onfi.org
website now points to materials on Micron's website. Update the URL
accordingly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/rawnand.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 39b31f8e03b7..24aee0af5421 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -385,8 +385,8 @@ struct nand_ecc_ctrl {
  * This struct defines the timing requirements of a SDR NAND chip.
  * These information can be found in every NAND datasheets and the timings
  * meaning are described in the ONFI specifications:
- * www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf (chapter 4.15 Timing
- * Parameters)
+ * https://media-www.micron.com/-/media/client/onfi/specs/onfi_3_1_spec.pdf
+ * (chapter 4.15 Timing Parameters)
  *
  * All these timings are expressed in picoseconds.
  *
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
