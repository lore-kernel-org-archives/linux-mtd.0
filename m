Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D28C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 09:05:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 273456103D
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 09:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 273456103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CJiN2TPd+rxJxorjiLL+flrkQF+tAzGxZF1ttV3I83g=; b=A4p6Siq85lNecU
	snHwDwICdI/9I/RMLmKz5QZYgrrfC/9Jp98kveif1h+z0eEU1tyLeHFX3Dx8NHjk45onywDYuC12F
	ITk+xFtIRwYMaoHqFCS0JIapL/yS3McgnJCclJHIal/TkiMR6QlwQ7oCXmHVKNUEgyMnrk+bEpRd8
	H9RvTLS/yhnvxGPThlVCqu24JMR43GxszM4BTs8Ll+xuoWQqVBa7BY9qdP6B8Pumr19nJVJ6j0ebZ
	C1zim1dZQau5bpDvZ1gVB+6oXGfH6UkwBsBhcPWllCjClxbZ2je30TIYErXg2dhMpYlyCJ/a3eam6
	fAbflyPMBoOTwO/TKd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLMAO-004kGa-3c; Wed, 01 Sep 2021 09:04:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLYR-004Ykd-Gu
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 08:25:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DA3261053;
 Wed,  1 Sep 2021 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630484707;
 bh=xvf3KCaSJTg25Ge8Y+WICw/OKBywEM/5ITFND3XJeqk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=FMk9F46QwOEZh/a73jkoeE3878wERKacjDh+IHrw3GVEyoNK7eUGNbMu3R1wEwCcT
 IC0I67eAffUcyUS/12lJacbCMXM86MaKJJ2V01ycB48MeeYokS2/7clIppLltwQSmA
 MTsrMz6N+tbIt7qBGoe9pmaRRJ3ZoZsPdASPr00M=
Subject: Patch "mtd: spinand: Fix incorrect parameters for on-die ECC" has
 been added to the 5.10-stable tree
To: alobakin@pm.me, developer@voiceinterconnect.de, frieder.schrempf@kontron.de,
 frieder@fris.de, gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, nbd@nbd.name, richard@nod.at, ycllin@mxic.com.tw
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 01 Sep 2021 10:24:56 +0200
In-Reply-To: <20210830130211.445728-1-frieder@fris.de>
Message-ID: <16304846968142@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_012507_725649_CE948D71 
X-CRM114-Status: GOOD (  17.15  )
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


This is a note to let you know that I've just added the patch titled

    mtd: spinand: Fix incorrect parameters for on-die ECC

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-spinand-fix-incorrect-parameters-for-on-die-ecc.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From frieder@fris.de  Wed Sep  1 10:16:58 2021
From: Frieder Schrempf <frieder@fris.de>
Date: Mon, 30 Aug 2021 15:02:10 +0200
Subject: mtd: spinand: Fix incorrect parameters for on-die ECC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, stable@vger.kernel.org, voice INTER connect GmbH <developer@voiceinterconnect.de>, Alexander Lobakin <alobakin@pm.me>, Felix Fietkau <nbd@nbd.name>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, YouChing Lin <ycllin@mxic.com.tw>
Message-ID: <20210830130211.445728-1-frieder@fris.de>


From: Frieder Schrempf <frieder.schrempf@kontron.de>

The new generic NAND ECC framework stores the configuration and
requirements in separate places since commit 93ef92f6f422 ("mtd: nand: Use
the new generic ECC object"). In 5.10.x The SPI NAND layer still uses only
the requirements to track the ECC properties. This mismatch leads to
values of zero being used for ECC strength and step_size in the SPI NAND
layer wherever nanddev_get_ecc_conf() is used and therefore breaks the SPI
NAND on-die ECC support in 5.10.x.

By using nanddev_get_ecc_requirements() instead of nanddev_get_ecc_conf()
for SPI NAND, we make sure that the correct parameters for the detected
chip are used. In later versions (5.11.x) this is fixed anyway with the
implementation of the SPI NAND on-die ECC engine.

Cc: stable@vger.kernel.org # 5.10.x
Reported-by: voice INTER connect GmbH <developer@voiceinterconnect.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/mtd/nand/spi/core.c     |    6 +++---
 drivers/mtd/nand/spi/macronix.c |    6 +++---
 drivers/mtd/nand/spi/toshiba.c  |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -419,7 +419,7 @@ static int spinand_check_ecc_status(stru
 		 * fixed, so let's return the maximum possible value so that
 		 * wear-leveling layers move the data immediately.
 		 */
-		return nanddev_get_ecc_conf(nand)->strength;
+		return nanddev_get_ecc_requirements(nand)->strength;
 
 	case STATUS_ECC_UNCOR_ERROR:
 		return -EBADMSG;
@@ -1090,8 +1090,8 @@ static int spinand_init(struct spinand_d
 	mtd->oobavail = ret;
 
 	/* Propagate ECC information to mtd_info */
-	mtd->ecc_strength = nanddev_get_ecc_conf(nand)->strength;
-	mtd->ecc_step_size = nanddev_get_ecc_conf(nand)->step_size;
+	mtd->ecc_strength = nanddev_get_ecc_requirements(nand)->strength;
+	mtd->ecc_step_size = nanddev_get_ecc_requirements(nand)->step_size;
 
 	return 0;
 
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -84,11 +84,11 @@ static int mx35lf1ge4ab_ecc_get_status(s
 		 * data around if it's not necessary.
 		 */
 		if (mx35lf1ge4ab_get_eccsr(spinand, &eccsr))
-			return nanddev_get_ecc_conf(nand)->strength;
+			return nanddev_get_ecc_requirements(nand)->strength;
 
-		if (WARN_ON(eccsr > nanddev_get_ecc_conf(nand)->strength ||
+		if (WARN_ON(eccsr > nanddev_get_ecc_requirements(nand)->strength ||
 			    !eccsr))
-			return nanddev_get_ecc_conf(nand)->strength;
+			return nanddev_get_ecc_requirements(nand)->strength;
 
 		return eccsr;
 
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -90,12 +90,12 @@ static int tx58cxgxsxraix_ecc_get_status
 		 * data around if it's not necessary.
 		 */
 		if (spi_mem_exec_op(spinand->spimem, &op))
-			return nanddev_get_ecc_conf(nand)->strength;
+			return nanddev_get_ecc_requirements(nand)->strength;
 
 		mbf >>= 4;
 
-		if (WARN_ON(mbf > nanddev_get_ecc_conf(nand)->strength || !mbf))
-			return nanddev_get_ecc_conf(nand)->strength;
+		if (WARN_ON(mbf > nanddev_get_ecc_requirements(nand)->strength || !mbf))
+			return nanddev_get_ecc_requirements(nand)->strength;
 
 		return mbf;
 


Patches currently in stable-queue which might be from frieder@fris.de are

queue-5.10/mtd-spinand-fix-incorrect-parameters-for-on-die-ecc.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
