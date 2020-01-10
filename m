Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4347C282DD
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 16:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7755E20721
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 16:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iuVKO8x7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7755E20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=krieglstein.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTn76knO/fBowhKrh+Q4kS7Ef7N+Qp2nR5+I07+fXPc=; b=iuVKO8x7qQuhuE
	4cXpb/ttUogBe8F8Hdv9LRgPOJmpLQcVmGcCdSnEDWpTlfH3c3S/FMCbPhChOn4zCC9LBCX6qObq+
	FlVz8eT5shJPb6lpalM6CK09HcM9iyc1YYzV2oHZTIi7LvBJiE6Jvg4aMd0b2eOHS7LsNTRLHtktE
	BxvBerS6lUSLnGs16VIBg46Nc6/Qy+lJFIpc/ODGEoKXjJQVcztvUVvCMZFl+Cx5qL/nJxeRWIZKn
	i2sMC6kDcUgcLDRufYa4RJuZCM9KTC0JbC0zke27txKcpkEczYcVIkzkN3XGinGm7QmR8eb0temrx
	bCXhFB0BcOEaUhASE5rQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipxRM-00013V-US; Fri, 10 Jan 2020 16:47:16 +0000
Received: from krieglstein.org ([188.68.35.71])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipxRI-000138-E4
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 16:47:14 +0000
Received: from dabox.localnet (gateway.hbm.com [213.157.30.2])
 by krieglstein.org (Postfix) with ESMTPSA id E68BD4009B;
 Fri, 10 Jan 2020 17:46:37 +0100 (CET)
From: Tim Sander <tim@krieglstein.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: mtd raw nand denali.c broken for Intel/Altera Cyclone V
Date: Fri, 10 Jan 2020 17:46:37 +0100
Message-ID: <2827587.laNcgWlGab@dabox>
Organization: Sander and Lightning
In-Reply-To: <CAK7LNASG+b03NDhrenB9yfvgYDVpYSnb2vSCu_-DB8dh70boMg@mail.gmail.com>
References: <5143724.5TqzkYX0oI@dabox> <23083624.r2bJSIadJk@dabox>
 <CAK7LNASG+b03NDhrenB9yfvgYDVpYSnb2vSCu_-DB8dh70boMg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_084712_616074_D88DEBC2 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Masahiro Yamada

Sorry for the large delay. I have seen the patches at 
https://lists.infradead.org/pipermail/linux-mtd/2019-December/092852.html
Seem to resolve the question about the spare_area_skip_bytes register.

I have now set the register to 2 which seems to be the right choice on an Intel  
SocFPGA. But still i am out of luck trying to boot 5.4.5-rt3 or 5.5-rc5. I get the 
following messages during bootup booting:
[    1.825590] denali-nand-dt ff900000.nand: timeout while waiting for irq 0x1000
[    1.832936] denali-nand-dt: probe of ff900000.nand failed with error -5

But the commit c19e31d0a32dd 2017-06-13 22:45:38 predates the 4.19 kernel
release (Mon Oct 22 07:37:37 2018). So it seems there is not an obvious commit
which is causing the problem. Looking at the changes it might be that the timing
calculations in the driver changed which might also lead to a similar error.

I am booting via NFS the bootloader is placed in NOR flash.  The corresponding 
nand dts entry is updated to the new format and looks like this:
                nand@ff900000 {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        compatible = "altr,socfpga-denali-nand";
                        reg = <0xff900000 0x100000 0xffb80000 0x10000>;
                        reg-names = "nand_data", "denali_reg";
                        interrupts = <0x0 0x90 0x4>;
                        clocks = <0x2d 0x1e 0x2e>;
                        clock-names = "nand", "nand_x", "ecc";
                        resets = <0x6 0x24>;
                        status = "okay";
                        nand@0 {
                                reg = <0x0>;
                                #address-cells = <0x1>;
                                #size-cells = <0x1>;
                                partition@0 {
                                        label = "work";
                                        reg = <0x0 0x10000000>;
                                };
                        };
                };

The last kernel i am able to boot is 4.19.10. I have tried booting:
5.1.21, 5.2.9, 5.3-rc8, 5.4.5-rt3 and 5.5-rc5. They all failed. Unfortunately the 
range is quite large for bisecting the problem. It also occurred to me that
all the platforms with Intel Cyclone V in mainline are development boards
which boot from SD-card not exhibiting this problem on their default boot path.

Best regards
Tim

PS: Here is some snippet from an older mail i didn't sent to the list yet which
might be superseded by now:
To get into this matter i started reading the "Intel Cyclone V HPS TRM" 
Section 13-20 Preserving Bad Block Markers:
"You can configure the NAND flash controller to skip over a specified number of 
bytes when it writes the last sector in a page to the spare area. This option 
write the desired offset to the spare_area_skip_bytes register in the config 
group. For example, if the device page size is 2 KB, and the device 
area, set the spare_area_skip_bytes register to 2. When the flash controller 
writes the last sector of the page that overlaps with the spare area, it 
spare_area_skip_bytes must be an even number. For example, if the bad block 
marker is a single byte, set spare_area_skip_bytes to 2."






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
