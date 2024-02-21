Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0862AC48BF6
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=naNK8hEs09rJTFWusFfNA1X3Kw9C4/AXXCnzOpXADV8=; b=jBuIt1q1uXNMOX
	xM0n+ZA1wAuq2aSPxSvCTXug2BAo/R2vImYUS5KzoBykqLZkPFpsu1dUC2sWJJ1bVf1AZJozblSJa
	ni4HR6svCMIq3Ght+g0bJ9VY/KREXsVm+WEL0G3fNPJr4fTjou6AMV23PFzIbIqCdWVTBWykjUjeH
	8SKN8OwiqaW6coBtLr4r03xf/tRqUy5WujsAjOAl0WtEwInm/yyFKJmfIDJQMewAYuTbs1RtWUPc+
	kkzMvWTq9zfJoeoBOYMDMaFO+FfqLnasEePFazpapn8G0DyEowC7F08r/sHgnbNozEIQE/TPewGjS
	mSmeFc3afYKxpOcs5ffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckVH-00000000dmi-3lyP;
	Wed, 21 Feb 2024 11:11:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckVE-00000000dmB-3csB
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 11:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3BF861483;
	Wed, 21 Feb 2024 11:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223A0C433C7;
	Wed, 21 Feb 2024 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708513863;
	bh=eqa3qErM7RQTKv99St58mGiTe7+MrVWsGFQ5TM92PF8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=E9YzbyjQu0l1V1efBshzBAfcN1HIgLFSLoNpAcNi2HPWf2dkLELfG0koCEhn9xlpJ
	 Fq67wnOVbmaK8hs9884KC8ve5thRlPtWyrzeS3MPOBhhLeZYBNVEr76jjnTDiN7Dex
	 N2WxtA3TCMlIHJiPEJnfxv6IttzF9sApdkVAY3FU=
Subject: Patch "Revert "Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting""" has been added to the 5.4-stable tree
To: gregkh@linuxfoundation.org,han.xu@nxp.com,linux-mtd@lists.infradead.org,max.krummenacher@toradex.com,max.oss.09@gmail.com,patches@lists.linux.dev,richard@nod.at,s.hauer@pengutronix.de,tharvey@gateworks.com,tomasz.mon@camlingroup.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 21 Feb 2024 12:10:52 +0100
In-Reply-To: <20240207174911.870822-2-max.oss.09@gmail.com>
Message-ID: <2024022152-scoop-onstage-df6a@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_031105_033364_A7A043FA 
X-CRM114-Status: GOOD (  14.81  )
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

    Revert "Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting""

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-revert-mtd-rawnand-gpmi-fix-setting-busy-timeout-setting.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From max.oss.09@gmail.com  Wed Feb 21 12:00:21 2024
From: max.oss.09@gmail.com
Date: Wed,  7 Feb 2024 18:49:11 +0100
Subject: Revert "Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting""
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, patches@lists.linux.dev, s.hauer@pengutronix.de, han.xu@nxp.com, tomasz.mon@camlingroup.com, richard@nod.at, tharvey@gateworks.com, linux-mtd@lists.infradead.org, Max Krummenacher <max.krummenacher@toradex.com>
Message-ID: <20240207174911.870822-2-max.oss.09@gmail.com>

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit 15a3adfe75937c9e4e0e48f0ed40dd39a0e526e2.

The backport of [1] relies on having [2] also backported. Having only
one of the two results in a bogus hw->timing1 setting.

If only [2] is backportet the 16 bit register value likely underflows
resulting in a busy_wait_timeout of 0.
Or if only [1] is applied the value likely overflows with chances of
having last 16 LSBs all 0 which would then result in a
busy_wait_timeout of 0 too.

Both cases may lead to NAND data corruption, e.g. on a Colibri iMX7
setup this has been seen.

[1] commit 0fddf9ad06fd ("mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times")
[2] commit 06781a5026350 ("mtd: rawnand: gpmi: Fix setting busy timeout setting")

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -684,7 +684,7 @@ static void gpmi_nfc_compute_timings(str
 	hw->timing0 = BF_GPMI_TIMING0_ADDRESS_SETUP(addr_setup_cycles) |
 		      BF_GPMI_TIMING0_DATA_HOLD(data_hold_cycles) |
 		      BF_GPMI_TIMING0_DATA_SETUP(data_setup_cycles);
-	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(busy_timeout_cycles * 4096);
+	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(DIV_ROUND_UP(busy_timeout_cycles, 4096));
 
 	/*
 	 * Derive NFC ideal delay from {3}:


Patches currently in stable-queue which might be from max.oss.09@gmail.com are

queue-5.4/revert-revert-mtd-rawnand-gpmi-fix-setting-busy-timeout-setting.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
