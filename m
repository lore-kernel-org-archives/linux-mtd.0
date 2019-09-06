Return-Path: <SRS0=stAP=XB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69316C43331
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2019 12:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CCB120854
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2019 12:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eyvDf6Wi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CCB120854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=krieglstein.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y89A284404+9yi1sCXeO9ykg3QSqxyNePrjhjGz3T9w=; b=eyvDf6Wi34WmS0
	Rb7FfrdC4S8ZrIdJFnbPckbW0SN476h+YGS3X+CIpYGiHZOxRchSz7nG7xT9PmiCLqC9w8SVTjt1o
	7hlzJwX3zjOw1T6THfeJnAyR2lDVKDqsAZ6hOLKWFwSPcWSpxWg9J4lxvIFL4CZLmGpyxKQtG290S
	ASGOxwalbkF92J92yS9uus1xD2VLbtygbPrreznCS2B4A6KrB3Ouejcyn7iD2QtqqMsbWcnCffaUP
	S3Uh40vkD1zWUel7tP849OcPqBS8FMEm/H5J2ntT6D2Sv2/BRyf+pMPDR7Vhg+e+7wZbF4mQk58Gt
	cwtJYyU779E1uC9DpD2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6DW9-0004Cq-MZ; Fri, 06 Sep 2019 12:39:09 +0000
Received: from krieglstein.org ([188.68.35.71])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i6DW6-0004CD-7o
 for linux-mtd@lists.infradead.org; Fri, 06 Sep 2019 12:39:07 +0000
Received: from dabox.localnet (gateway.hbm.com [213.157.30.2])
 by krieglstein.org (Postfix) with ESMTPSA id DE7744010B;
 Fri,  6 Sep 2019 14:38:23 +0200 (CEST)
From: Tim Sander <tim@krieglstein.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: mtd raw nand denali.c broken for Intel/Altera Cyclone V
Date: Fri, 06 Sep 2019 14:38:23 +0200
Message-ID: <5143724.5TqzkYX0oI@dabox>
Organization: Sander and Lightning
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_053906_432537_0E1B7AA0 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi

I have noticed that there multiple breakages piling up for the denali nand
driver on the Intel/Altera Cyclone V. Unfortunately i had no time to track the
mainline kernel closely. So the breakage seems to pile up. I am a little
disapointed that Intel is not on the lookout that the kernel works on the
chips they are selling. I was really happy about the state of the platform
before concerning mainline support.

The failure starts with kernel 4.19 or stable kernel release 4.18.19. The
commit is ba4a1b62a2d742df9e9c607ac53b3bf33496508f. The problem here is that
our platform works with a zero in the SPARE_AREA_SKIP_BYTES register. But in
this case the patch assumes the default value 8 which is straight out  wrong
on this variant. Without this patch reverted all blocks of the nand flash are
beeing marked bad :-(.

When reverting the patch ba4a1b62a2d742df9e9c607ac53b3bf33496508f  i can boot
4.19.10 again.

With 5.0 the it goes further down the drain and i didn't manage to boot it
even with the above patch reverted.

I also tried 5.3-rc7 with the above patch reverted and the variable t_x dirty hacked to the
value 0x1388 as i got the impression that the timing calculation is off too. I still get an
interrupt error and boot failure:
[    0.817588] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    0.823946] nand: Micron MT29F2G08ABAEAWP
[    0.827965] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    1.887052] denali-nand-dt ff900000.nand: timeout while waiting for irq 0x1000
[    2.911056] denali-nand-dt ff900000.nand: timeout while waiting for irq 0x1000

I have seen this https://lore.kernel.org/patchwork/patch/983055/ thread and
this might fix at least the 4.19 boot problem.

I would be really happy for hints how to get the Intel Cyclone V working again.

Best regards
Tim




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
