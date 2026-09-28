Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFBACA5FA3
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=27R1BYUvtIJjxXJh0Woq8BhcQKLbig7foTtm7nsTnyo=; b=S4XabWbZQ1n71B
	veMTu0kc4ke0EdjuAxlSuVzGHDUbfuka4nXaZ/UdCWmPpytaqBaKsbreUxdOQxCDIYPtEvY3hAZw0
	qxaGwyIkuvOsPoxZ6aR2qzEAyyjxc60GvIb8bCRmAEbyvsPfRpG9WCL/OFzpQ4VO42Cq9PIImJheE
	36m+E/RqTBJB2XP1sxacGjiIK8BP8pwFjkEw3GPbnff/O41HOpl0h4wCQ09rHJry4JPIGp2kcYvVn
	M8atw8uFl/Kon1kWMcp4Z4mbEh3Iu+B6fba/hbsCNDBGj640UeengxNehUQvI4XBwXexSCqB5o3v8
	ZKiGnI82ewFNM+dHCp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHdQ-00000001XoU-0HO7;
	Mon, 28 Sep 2026 20:07:36 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHdM-00000001Xnz-2wgK
	for linux-mtd@lists.infradead.org;
	Mon, 28 Sep 2026 20:07:35 +0000
Received: by mail-pj2-x2b.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso108406a91.3
        for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2026 13:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790626052; x=1791230852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2sy1qsX8pcn7E7lL+azvnbLtgf+hoPNwiBwLLJDeGU=;
        b=JR0irMLqWkGteDSJwFTRiW5EKt4FxpAZ8QGjvF7MmaYVzIkS39un5asonzqHrVvp2h
         YQs5c7bTEtbIx72IHFlu3PoVSsN+/3AjDJnzWuU7LHzNxCwEoL/DvGJTtjFZ/lFWKf4s
         jvWwuqul8llOuHcxG1hiqAu3OcxMexfTLXSUKiX2tqU2SNgjIeDXpgyEHobzVf6PTSxA
         Q6/8nVXL5Uj0oK63Q7M23pEzqDHIGByhyJeSPsuKw8U34UjnEEYvHU0nURORCbQZwTrB
         xggM8oRUbBqtp2abhBYuixJ39GoEju59jIsKKQio1S+fNqnIJg637mcS1MKMKQMSh2O2
         cDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626052; x=1791230852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2sy1qsX8pcn7E7lL+azvnbLtgf+hoPNwiBwLLJDeGU=;
        b=z5Y4LaAaSwlE/frEGwZzyI2I151QszPKnVIO60FDGJ/ZJ+SNA0XC4132KmDqczJhy9
         8KHBSfYUOmwuelbkZk/5iX+EktAytV9IjZoy2yXcAwuAkfIOu39iVIQVMN7cv54fevsN
         ILIavps2fyAFq0/8MBjT6ES4Hi9oRkeYRnP4jM47bhnROoQgCS4RRSxHSs8W0bWRL2SU
         otcgMrjTjKz8DsZ2M32C3Imb1AzWl5lA5ZoQrBlgadHKgcnq6BFTPPsBxKx6AyZJIOmM
         qjtg9OsM8liv0QFqivuPt3D3YGU/nqDP3V3mDBlTTB9UjFFZ417T0S6hcmraa3II8uLp
         +IWw==
X-Gm-Message-State: AFq9FYKqY6rT99jlfiGuSyzy5DDzg/TF3FaGu3QTMwpQ3BeYfphTodPU
	R3RAwhaGNUoTcjlNrVKOu+hYnepRxbJAcW2CX6UEZPtdx4BV1Heb1XajkGI0tvai
X-Gm-Gg: AYBFou1KLeb5qJhLkYUHE/TeE51ipYyRzTC0a77ITyqbB2EN1ZpQ1jh9pAo7s7HMWjc
	CGN3UPx/G5AHdLDAZnmxndArBa0YLcl2XT5umC6QuBykuciXZHbENe34XsK6pn4nIs7yAPqP8m2
	R+9gjHW6OGHFaVjkFP1KLXW5S1WnrxUBTTOpReV+nUfF1w+jasLWNyzSp7Z8nX4a9wYfhwQnleb
	D8mI8qPaU7WFbDlrGBzQ4QBXvhZan4vDC2muDHCPJPXN8mG/0PXSTbryFOGt9D9ELHZwzr+ya6s
	75eiim+9w5cU5goLOuFrQxgV8aAI3i5CV+y5eFVEoyFXKf0pLFmnW4SVGku9X5Khh2fnQbq9V5X
	v+ZSk8TIoLkcOD36YbWuKm82RmJ+3EnWuIDbTXyvE7sICMrtr4XhuEM5N2GrwfCpL0gmPmi8RFi
	5O9VDz87Tey2+W/11xoJqn2MnFWwlmsgBdl0LVKHzI8QpXwirFX1gUKv16PEvuljJWfI6OL3vnz
	Hx+1f0/HTzbGUy/tS7nfRgc6QBXe6iH/ycITUvBMHR7uPjc4kkBpo3D7CZ1gBSELvwRqs+xvmh/
	gOO/z1qq5WtJcGxa7yxFQAOfBtxHJHbaakzjmji8ZqodNiNjqKissdRFAkg=
X-Received: by 2002:a17:90b:35c4:b0:3a2:aebf:9211 with SMTP id 98e67ed59e1d1-3a2aebf93a6mr2865730a91.15.1790626051521;
        Mon, 28 Sep 2026 13:07:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498caf134sm433722a91.3.2026.09.28.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:07:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: allocate shared ctrl with devm_kzalloc
Date: Mon, 28 Sep 2026 13:07:29 -0700
Message-ID: <20260928200729.44594-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_130732_761296_AB23C065 
X-CRM114-Status: GOOD (  13.56  )
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

Allocate the shared fsl_ifc_nand_ctrl structure against the controller
device, which outlives all NAND child devices, so it is freed
automatically.  This drops the manual kfree() and the broken chip
counter that was decremented in remove() but never incremented
anywhere, leaking the structure and leaving the freed pointer in
ctrl->nand on re-probe.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index be6bbc1c184d..cc75b6a67e07 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -49,7 +49,6 @@ struct fsl_ifc_nand_ctrl {
 	unsigned int index;	/* Pointer to next byte to 'read'	*/
 	unsigned int oob;	/* Non zero if operating on OOB data	*/
 	unsigned int eccread;	/* Non zero for a full-page ECC read	*/
-	unsigned int counter;	/* counter for the initializations	*/
 	unsigned int max_bitflips;  /* Saved during READ0 cmd		*/
 };
 
@@ -1023,15 +1022,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!fsl_ifc_ctrl_dev->nand) {
-		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
+		ifc_nand_ctrl = devm_kzalloc(fsl_ifc_ctrl_dev->dev, sizeof(*ifc_nand_ctrl),
+					     GFP_KERNEL);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
 			return -ENOMEM;
 		}
 
-		ifc_nand_ctrl->read_bytes = 0;
-		ifc_nand_ctrl->index = 0;
-		ifc_nand_ctrl->addr = NULL;
 		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
@@ -1105,14 +1102,6 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 	nand_cleanup(chip);
 
 	fsl_ifc_chip_remove(priv);
-
-	mutex_lock(&fsl_ifc_nand_mutex);
-	ifc_nand_ctrl->counter--;
-	if (!ifc_nand_ctrl->counter) {
-		fsl_ifc_ctrl_dev->nand = NULL;
-		kfree(ifc_nand_ctrl);
-	}
-	mutex_unlock(&fsl_ifc_nand_mutex);
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
