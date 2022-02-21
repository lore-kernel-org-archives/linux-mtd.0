Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0271C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 19:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:Cc
	:From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AE8tPHSvS+xHOz6+58zXYpI8EaXoBmtwVKYdOlw9xeI=; b=EUG6Qk0SgcffXU
	uvpQpM0fFMbew4kvKvg/YxiT0uLSYmPVEb7QIC1pTfezELwgRUKuk3KpJ2Ys2bhVWVgBWkNoU8smi
	xzarVTxTKcNFDBzLDHYKcbvOBGDEcwqONVHfqHvqvk/5q6EX+p0tfmh+bKu+satTmNA8Gk+zNWj5H
	oj+IIeaGtIetrxzRW+av6f3Od3b+ub4blE179P5KyMt40OIrY5BLuhkmGeV2EyYMHmbf+nOYahAGQ
	O23i+RE/0CxyO1z1Ncds1cbhkQclR+oMihhRtFp3C5naKYY2UY613KSZvtLgIxfcEwjKeYhJuZRvM
	R9plNMyITtt75NxxKi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMDvb-007285-AG; Mon, 21 Feb 2022 19:00:55 +0000
Received: from mx1.emlix.com ([136.243.223.33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMDvX-00726y-LI
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 19:00:53 +0000
Received: from mailer.emlix.com (unknown [81.20.119.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 3E0685F8F3;
 Mon, 21 Feb 2022 20:00:47 +0100 (CET)
To: linux-mtd@lists.infradead.org
From: =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Cc: =?UTF-8?Q?Lothar_Wa=c3=9fmann?= <LW@KARO-electronics.de>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@nxp.com>
Subject: Make NAND_BBT_NO_OOB_BBM configurable or let the gpmi driver decide?
Message-ID: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
Date: Mon, 21 Feb 2022 20:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_110051_894468_A4356093 
X-CRM114-Status: GOOD (  12.90  )
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

Hi,

we are using UBI on a NAND flash with BBT and have recently observed
bad blocks where nand_markbad_bbm returns an error. Since that error is
returned by nand_block_markbad_lowlevel even when marking the block in
the BBT succeeds, UBI goes into read-only mode. We would therefore like
to set NAND_BBT_NO_OOB_BBM.

Unfortunately there is no device tree property for this flag. Also we
internally disagree if this should be configurable on our platform at
all. We are using an i.MX6 that needs to relocate the bad block marker
to a different byte within the page because of its ECC layout.

In 2014 Lothar already submitted a patch to add a nand-no-oob-bbm device
tree property that got rejected:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/1402579245-13377-5-git-send-email-LW@KARO-electronics.de/
Brian suggested back then to tie this behavior to the non-standard
fsl,no-blockmark-swap property because the marker becomes completely
useless when it stays at the same position as data bytes in good blocks.

So which solution would have the highest chance of being accepted as a
patch? Introducing a device tree property for NAND_BBT_NO_OOB_BBM, using
fsl,no-blockmark-swap, or setting NAND_BBT_NO_OOB_BBM for all boards
inside the i.MX gpmi driver when there is a BBT? Or maybe renaming
fsl,no-blockmark-swap to nand-no-oob-bbm (with a transition phase)?

Best regards,

  Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
