Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE2FC282DD
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 19:06:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B3AE2051A
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 19:06:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdURvOWA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="tJzgrlOE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B3AE2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/vPASdxD+eW7b0fEs8JjqK6x4fLjjVu4dFnCcrf2/g=; b=qdURvOWAFQb/Wb
	vuMOMBfjiGAYrzc3AfjyDTrYIE920JVB/sIEonhNLu251qX5A5USppl3H3HxxvGDdoVLlVQigzuDB
	1YWRvCClY2OP3Wrl/UWDWtfh8K8PXir745xt1XiP1D9INzQPSle2u3teB2Tx8FDWwbnomNtWMD3Mb
	JohF98ZvR0d75UJ13+8tBC5wmhl4kd8H3f8SWFWb2k7liH78uVzDnQ5gbj8mxLWCWCOonw5Ju+NpC
	RDza+7MhrwqtkUId9p4gY+xV8KYhNCmU1QVPJO6wsQRe3LxbQRPQSU6BVqGEmbLzquF9KcUxFT1mU
	kexYmTHCw27uoSMtLXGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipzby-0007hJ-32; Fri, 10 Jan 2020 19:06:22 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipzbt-0007g5-QT
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 19:06:20 +0000
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 00AJ5v3u015494
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2020 04:05:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 00AJ5v3u015494
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1578683158;
 bh=8NtpfIX/PcWnAxwvFtqqnnW2AvNcQkGiwZlxmXOTlpw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tJzgrlOEdQm5k/LWHCdLyeBjVZQJreQGUPYzeBoixD9g6kfkLv28xDSs3eOmSjf4+
 6HrnispRQLALZRZNoBFMTFbJjQzjBWjL7hXY/Kbyc3zeIUCYPW04YAEcPJN3c0nOO7
 Q82z3TkoQsORiu6t4sA1t0OeRLIE6iNidpea711SVvj9hZLVa4ACS8/Uc4CYUWPaL7
 UlDFTiBS8ghaDNmYcECkQ7IC5+Z6L4SfNWgVwT9eWTDgfhsGMJekT9e/r0pKX3ISeQ
 VfS31rujKLDznpFGCYIc2aM8s8NO9jdLPcUh5jwI0Hc7Mjqc8xPUU+ZiZabjM1ThA0
 7bBdxy66hW3tQ==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id p6so1898022vsj.11
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 11:05:58 -0800 (PST)
X-Gm-Message-State: APjAAAW1GSHGRTnvNWB6jWLqNOaQhbmnqELlfgjpm8nPnL7VBuHA/0Tf
 eSb03tC/ZgpNSrAXJ5StmsLGMdjhJE6yb/N2WVw=
X-Google-Smtp-Source: APXvYqzptZS2PQDC/5TdBee35LOqdXSOPz6nCKyGAVj9C1cZQt4B1OAp6Jj3GTtegq7n6pGmndJjSRqfxenL+7ZJKoc=
X-Received: by 2002:a05:6102:3102:: with SMTP id
 e2mr60506vsh.179.1578683157058; 
 Fri, 10 Jan 2020 11:05:57 -0800 (PST)
MIME-Version: 1.0
References: <5143724.5TqzkYX0oI@dabox> <23083624.r2bJSIadJk@dabox>
 <CAK7LNASG+b03NDhrenB9yfvgYDVpYSnb2vSCu_-DB8dh70boMg@mail.gmail.com>
 <2827587.laNcgWlGab@dabox>
In-Reply-To: <2827587.laNcgWlGab@dabox>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2020 04:05:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com>
Message-ID: <CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com>
Subject: Re: mtd raw nand denali.c broken for Intel/Altera Cyclone V
To: Tim Sander <tim@krieglstein.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_110618_093523_66D0D7A9 
X-CRM114-Status: GOOD (  24.71  )
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
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Jan 11, 2020 at 1:47 AM Tim Sander <tim@krieglstein.org> wrote:
>
> Hi Masahiro Yamada
>
> Sorry for the large delay. I have seen the patches at
> https://lists.infradead.org/pipermail/linux-mtd/2019-December/092852.html
> Seem to resolve the question about the spare_area_skip_bytes register.
>
> I have now set the register to 2 which seems to be the right choice on an Intel
> SocFPGA. But still i am out of luck trying to boot 5.4.5-rt3 or 5.5-rc5. I get the
> following messages during bootup booting:
> [    1.825590] denali-nand-dt ff900000.nand: timeout while waiting for irq 0x1000
> [    1.832936] denali-nand-dt: probe of ff900000.nand failed with error -5
>
> But the commit c19e31d0a32dd 2017-06-13 22:45:38 predates the 4.19 kernel
> release (Mon Oct 22 07:37:37 2018). So it seems there is not an obvious commit
> which is causing the problem. Looking at the changes it might be that the timing
> calculations in the driver changed which might also lead to a similar error.
>
> I am booting via NFS the bootloader is placed in NOR flash.  The corresponding
> nand dts entry is updated to the new format and looks like this:
>                 nand@ff900000 {
>                         #address-cells = <0x1>;
>                         #size-cells = <0x0>;
>                         compatible = "altr,socfpga-denali-nand";
>                         reg = <0xff900000 0x100000 0xffb80000 0x10000>;
>                         reg-names = "nand_data", "denali_reg";
>                         interrupts = <0x0 0x90 0x4>;
>                         clocks = <0x2d 0x1e 0x2e>;
>                         clock-names = "nand", "nand_x", "ecc";
>                         resets = <0x6 0x24>;
>                         status = "okay";
>                         nand@0 {
>                                 reg = <0x0>;
>                                 #address-cells = <0x1>;
>                                 #size-cells = <0x1>;
>                                 partition@0 {
>                                         label = "work";
>                                         reg = <0x0 0x10000000>;
>                                 };
>                         };
>                 };
>
> The last kernel i am able to boot is 4.19.10. I have tried booting:
> 5.1.21, 5.2.9, 5.3-rc8, 5.4.5-rt3 and 5.5-rc5. They all failed. Unfortunately the
> range is quite large for bisecting the problem. It also occurred to me that
> all the platforms with Intel Cyclone V in mainline are development boards
> which boot from SD-card not exhibiting this problem on their default boot path.


What will happen if you apply all of these:

http://patchwork.ozlabs.org/project/linux-mtd/list/?series=149821

on top of the mainline kernel,
and then, hack denali->clk_rate and denali->clk_x_rate as follows?


-       denali->clk_rate = clk_get_rate(dt->clk);
-       denali->clk_x_rate = clk_get_rate(dt->clk_x);
+       denali->clk_rate = 50000000;
+       denali->clk_x_rate = 200000000;





If it still fails, what about this?

       denali->clk_rate = 0;
       denali->clk_x_rate = 0;



> PS: Here is some snippet from an older mail i didn't sent to the list yet which
> might be superseded by now:
> To get into this matter i started reading the "Intel Cyclone V HPS TRM"
> Section 13-20 Preserving Bad Block Markers:
> "You can configure the NAND flash controller to skip over a specified number of
> bytes when it writes the last sector in a page to the spare area. This option
> write the desired offset to the spare_area_skip_bytes register in the config
> group. For example, if the device page size is 2 KB, and the device
> area, set the spare_area_skip_bytes register to 2. When the flash controller
> writes the last sector of the page that overlaps with the spare area, it
> spare_area_skip_bytes must be an even number. For example, if the bad block
> marker is a single byte, set spare_area_skip_bytes to 2."

I did not know this documentation.

It says "For example" (twice),
it sounds uncertain to me, though.

Anyway, an intel engineer checked the boot ROM code.
SPARE_AREA_SKIP_BYTES=2 is correct, he said.


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
