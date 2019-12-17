Return-Path: <SRS0=6Vgz=2H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7326CC43603
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2019 21:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41BAD206EC
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2019 21:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uD0l2BgE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="21Tu+Apo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41BAD206EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ESJxrzS8Sc59yEST661MAGHXMvPMOpX+EYzuCZo68w0=; b=uD0l2BgEuIpOJ0
	lFxZM/1kQ9xhgkDpmSY1q+uZddpEM3PFi4p2bKTkKo+ncXlBEfDNgBBHco+c7gbwemhKW1meXHha5
	2jByu3oh71YOyVdEmRmdDx3+sR9w3eK1qvU+8StYo6Q/NSDRZaEPoFosjZW7XDqS+oh051urwnfL6
	myEcKfMXYLcr8J84oAvDho+RlT2Uz062N7pJtcT1B2KvffaYLGFa8dJ6DbPYlkqVol1LNdUvRaG3e
	RW8E8VVz0Ob75gHM+pYqo01Zj+Sp+FXej0PxLpPLp6Z15ejhANxf9TpCrk48id1vXqY1GpyTHLU0f
	xfwC+tIkvX9L0kwby49w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihJzY-0000Ww-9F; Tue, 17 Dec 2019 21:02:52 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihJzU-0000WL-92
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2019 21:02:50 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1F0E0806AC;
 Wed, 18 Dec 2019 10:02:40 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1576616560;
 bh=SusQQxADCsTEaVGCSglO1q7NW432RlUPE3y3af7AknE=;
 h=From:To:Cc:Subject:Date;
 b=21Tu+ApoBemJ3ugxAvSnD+E8g2DKSXMbgDsYAx1TMURDi8CsV41l/Vd/RipM30UK9
 rpaXG/ptkfybW9abznrf72aoaDaxWOpppPNkvr1ITOft4Tgp4LfsJ/Ws+0oIasTmYu
 //8DI1+VnivYEqAy8+/Eiuwhf02z+MtYn/g+bqv9oixUK+2KKm2kWhk+REocxRXsv9
 vVwKyUPlL7jyvV+Q1C/ZFFFqBuKefW6+eIgztkeXu4j8pyhetbkIerMujFYmgkAaO4
 DfWXPrffrYIGaviFc72n8lwkcKXtswKMTneCslHYZOY6BLAkuSMe7GwCHb6ov9PxGt
 2UgojfoXgBZ7Q==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5df9426f0000>; Wed, 18 Dec 2019 10:02:39 +1300
Received: from oscarr-dl.ws.atlnz.lc (oscarr-dl.ws.atlnz.lc [10.33.24.28])
 by smtp (Postfix) with ESMTP id A89C813EEA8;
 Wed, 18 Dec 2019 10:02:39 +1300 (NZDT)
Received: by oscarr-dl.ws.atlnz.lc (Postfix, from userid 1607)
 id D5B083C01D1; Wed, 18 Dec 2019 10:02:39 +1300 (NZDT)
From: Oscar Ravadilla <oscar.ravadilla@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	f.fainelli@gmail.com,
	kdasu.kdev@gmail.com
Subject: [PATCH v2] mtd: rawnand: brcmnand: Add bad block marker option.
Date: Wed, 18 Dec 2019 10:02:30 +1300
Message-Id: <20191217210230.24745-1-oscar.ravadilla@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_130248_890410_EA9EC0D1 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Oscar Ravadilla <oscar.ravadilla@alliedtelesis.co.nz>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes: 04649ec1335f ("mtd: rawnand: Always store info about bad
block markers in chip struct")

The commit above changed where the information of the bad block
markers are stored. It is now stored in nand_chip.options and
nand_chip.badblockpos. However brcmnand driver wasn't updated
so it now fails to handle bad blocks.

So update brcmnand driver to add bad block markers to nand_chip.options.

Signed-off-by: Oscar Ravadilla <oscar.ravadilla@alliedtelesis.co.nz>
---
Notes:
    Changelog
    v1->v2:
    - Update commit message to add the "Fixes: ... " tag.
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1a66b1cd51c0..68d37d1636ae 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2360,6 +2360,8 @@ static int brcmnand_attach_chip(struct nand_chip *chip)
 	 * needed.
 	 */
 	chip->options |= NAND_USE_BOUNCE_BUFFER;
+	chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE |
+			NAND_BBM_LASTPAGE;
 
 	if (chip->bbt_options & NAND_BBT_USE_FLASH)
 		chip->bbt_options |= NAND_BBT_NO_OOB;
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
