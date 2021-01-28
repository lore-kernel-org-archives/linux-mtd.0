Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E600C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 09:46:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF6E64DD6
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 09:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF6E64DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UChesYW44E7w0oYrilYCSq3zZfF8ESVTWqZTs3t0z7U=; b=InErfAPnGfHtrZitQBL97Aio8
	dC0qopDCc6g2LivXQTRmbK6KVHnuTUb+Jl/5TR0XWRYwkP29gTrUxRulo7oSF+de9wHCOMFCEt4Zi
	NOoq6gOejg1O3eSoRuKPrbDOkEBHUgcnBvCymfMCx9V8h8/B5uVEU/Ohxoxfz6Trykb/a1Cud5A46
	4yKCEIsk9BZcZF9AJw528ZHIxakXh63Z3vdBDSLKJmDdRvQ2TS6aGx7hA8ef4IqBy9F3S0m0xlqbl
	N4w4Tv5l3B1ETsnXOeVxdyf2hRU8fmOr4pQWVrhG6BKtfyLT4AWbhpE+gKuxPX69axRC+SgDT9ajJ
	EdUf1qSLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l53s6-0005ux-Mg; Thu, 28 Jan 2021 09:45:50 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l53rz-0005uY-7U
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 09:45:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id p15so4683218wrq.8
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2021 01:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AoK1FU9Ch9EGOwdMXAqjj2PTFGA/DIhbY6lUrY7G4xI=;
 b=SfHo5GEZTnPzhxtVI9K4eelLHCJNbxy73ipjNRcn/HmiXPorrsIFgy+mRnR4jD1ufQ
 mk7oxcxxoS5kTAm2yzoGLr54K+mIPGJrU1QnIJITmIS9hCiCoh3oZe3zUywYmsJxtmoe
 W+pXFkC5qVZculWFvHaj/X3xaqFmC0YyNj2IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AoK1FU9Ch9EGOwdMXAqjj2PTFGA/DIhbY6lUrY7G4xI=;
 b=Xkv7itMAoWhSzBMC8CSzfGEnXRX91eB4BklpjdeVUc7Fn9SB2VjwV6uzvaeWmdMuXd
 Iid31mAne6JZCv2wECcSgZX7xjPfT3g+C/HiUwlKbQPXmdVbyK4qoJOnZcfHZ9dZqrBb
 0JGLtBvNh/lTh1gpel9I/MCImaEbnDcfT55rPjfzGNP6Sjm7SwLK+gR6qUKccDhOrSay
 Sb+Od5tGo8DPmjzVNbvceypJNo8JIAvIZuTrNX5Cxtrwxcrkc/8/kSyjZFk/7TkqhwvK
 C2Fd0px1vBYN1mhAHV+/CC2bEP0H0YrRPIP6TdNa4QDwl9wL9QAbWI6TFlIxuTkdRdtD
 AYwQ==
X-Gm-Message-State: AOAM533YZHGaFNrppbmxMVO0KemLnWD7Txz4V3WJfUol8xXw9AVOP4PY
 FEcMpy/RnzUm/J1pJ4wIBJXX3sGjJNfYkq+6ezmcZNT2Ly+jMg==
X-Google-Smtp-Source: ABdhPJwUGBfDCyCediZ+0YQgmlg8JE4v3dnfh9eUmbf+SdJMG40kBZI1nj2Pcnzyy77ZoGItSIDbFYzm12j1IW3jlgE=
X-Received: by 2002:adf:c14d:: with SMTP id w13mr14959529wre.383.1611827141412; 
 Thu, 28 Jan 2021 01:45:41 -0800 (PST)
MIME-Version: 1.0
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190729103655.095297a2@xps13>
 <18734a1d-17d9-d390-58ef-ad8ca1be925f@kernel.org>
 <20190729144730.4a58de32@xps13>
 <17b49e7d-ff63-315f-cf12-3474f7228c6d@kernel.org>
 <781dd4e6-a694-c3e1-ee13-9c5c51598623@kernel.org>
 <53cb8db7-bcf8-ee7c-84ee-59a14a04aad9@kernel.org>
 <20190730103822.7576645d@xps13>
 <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
 <20190731082823.6284f5a9@collabora.com>
 <e47b1de2-501a-9a1f-e980-48d2c396811a@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
In-Reply-To: <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 28 Jan 2021 10:45:29 +0100
Message-ID: <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
Subject: Re: GPMI iMX6ull timeout on DMA
To: Greg Ungerer <gerg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_044543_381157_21E88CFE 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Greg

On Tue, Aug 13, 2019 at 2:50 AM Greg Ungerer <gerg@kernel.org> wrote:
>
> Hi Boris,
>
> On 12/8/19 5:31 pm, Boris Brezillon wrote:
> > On Mon, 12 Aug 2019 12:50:36 +1000
> [snip]
> > Hm, CTRL1 is identical. Can you dump all regs at the beginning and at
> > the end of those funcs?
>
> Here is a more complete dump of registers. Trace points are at
> entry and exit of the respective functions in the different
> kernel versions. Register dumping code is identical for both.
>
>
> Linux version 4.16.0 (gerg@goober) (gcc version 4.8.3 (GCC)) #10 Tue Aug 13 10:24:28 AEST 2019
> ...

I ran an overnight reboot process on linux-4.19.y tag: v4.19.169 and
I'm not able to reproduce up to now.

Do you have an update from your side?

Michael

> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1073): gpmi_begin(): ENTRY
>    HW_GPMI_CTRL0=0x00000000
>    HW_GPMI_CTRL1=0x01c4000c
>    HW_GPMI_COMPARE=0x00000000
>    HW_GPMI_ECCCTRL=0x00000400
>    HW_GPMI_ECCCOUNT=0x00000000
>    HW_GPMI_PAYLOAD=0x00000000
>    HW_GPMI_AUXILIARY=0x00000000
>    HW_GPMI_TIMING0=0x00010203
>    HW_GPMI_TIMING1=0x00000000
>    HW_GPMI_TIMING2=0x23023336
>    HW_GPMI_DATA=0x00000000
>    HW_GPMI_STAT=0xff000005
>    HW_GPMI_DEBUG=0x00000000
>    r->clock[0]=22000000
> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> nand: Micron MT29F2G08ABAEAWP
> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1073): gpmi_begin(): ENTRY
>    HW_GPMI_CTRL0=0x01800001
>    HW_GPMI_CTRL1=0x0104000c
>    HW_GPMI_COMPARE=0x00000000
>    HW_GPMI_ECCCTRL=0x00000000
>    HW_GPMI_ECCCOUNT=0x00000000
>    HW_GPMI_PAYLOAD=0x00000000
>    HW_GPMI_AUXILIARY=0x00000000
>    HW_GPMI_TIMING0=0x00010203
>    HW_GPMI_TIMING1=0x05000000
>    HW_GPMI_TIMING2=0x23023336
>    HW_GPMI_DATA=0x00000000
>    HW_GPMI_STAT=0xff000005
>    HW_GPMI_DEBUG=0x00000101
>    r->clock[0]=99000000
> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1136): gpmi_begin(): EXIT
>    HW_GPMI_CTRL0=0x01800001
>    HW_GPMI_CTRL1=0x01c6800c
>    HW_GPMI_COMPARE=0x00000000
>    HW_GPMI_ECCCTRL=0x00000000
>    HW_GPMI_ECCCOUNT=0x00000000
>    HW_GPMI_PAYLOAD=0x00000000
>    HW_GPMI_AUXILIARY=0x00000000
>    HW_GPMI_TIMING0=0x00010101
>    HW_GPMI_TIMING1=0x90000000
>    HW_GPMI_TIMING2=0x23023336
>    HW_GPMI_DATA=0x00000000
>    HW_GPMI_STAT=0xff000005
>    HW_GPMI_DEBUG=0x00000101
>    r->clock[0]=99000000
> Scanning device for bad blocks
> 5 ofpart partitions found on MTD device gpmi-nand
> Creating 5 MTD partitions on "gpmi-nand":
> 0x000000000000-0x000000500000 : "u-boot"
> 0x000000500000-0x000000600000 : "u-boot-env"
> 0x000000600000-0x000000800000 : "log"
> 0x000000800000-0x000010000000 : "flash"
> 0x000000000000-0x000010000000 : "all"
> gpmi-nand 1806000.gpmi-nand: driver registered.
> ...
>
> Note that the first ENTRY dump has no matching EXIT dump. From the
> code I assume it is returning from gpmi_begin() at the
> "if (!hw.sample_delay_factor)" check.
>
>
> And for the 5.1.14 kernel:
>
> Linux version 5.1.14 (gerg@goober) (gcc version 4.8.3 (GCC)) #27 Tue Aug 13 10:20:32 AEST 2019
> ...
> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(512): gpmi_nfc_apply_timings(): ENTRY
>    HW_GPMI_CTRL0=0x00000000
>    HW_GPMI_CTRL1=0x01c4000c
>    HW_GPMI_COMPARE=0x00000000
>    HW_GPMI_ECCCTRL=0x00000400
>    HW_GPMI_ECCCOUNT=0x00000000
>    HW_GPMI_PAYLOAD=0x00000000
>    HW_GPMI_AUXILIARY=0x00000000
>    HW_GPMI_TIMING0=0x00010203
>    HW_GPMI_TIMING1=0x00000000
>    HW_GPMI_TIMING2=0x23023336
>    HW_GPMI_DATA=0x00000000
>    HW_GPMI_STAT=0xff000005
>    HW_GPMI_DEBUG=0x00000000
>    r->clock[0]=22000000
> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(536): gpmi_nfc_apply_timings(): EXIT
>    HW_GPMI_CTRL0=0x00000000
>    HW_GPMI_CTRL1=0x0104000c
>    HW_GPMI_COMPARE=0x00000000
>    HW_GPMI_ECCCTRL=0x00000400
>    HW_GPMI_ECCCOUNT=0x00000000
>    HW_GPMI_PAYLOAD=0x00000000
>    HW_GPMI_AUXILIARY=0x00000000
>    HW_GPMI_TIMING0=0x00020101
>    HW_GPMI_TIMING1=0x60000000
>    HW_GPMI_TIMING2=0x23023336
>    HW_GPMI_DATA=0x00000000
>    HW_GPMI_STAT=0xff000005
>    HW_GPMI_DEBUG=0x00000000
>    r->clock[0]=22000000
> random: fast init done
> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> nand: Micron MT29F2G08ABAEAWP
> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(512): gpmi_nfc_apply_timings(): ENTRY
>    HW_GPMI_CTRL0=0x01800001
>    HW_GPMI_CTRL1=0x0104000c
>    HW_GPMI_COMPARE=0x00000000
>    HW_GPMI_ECCCTRL=0x00000000
>    HW_GPMI_ECCCOUNT=0x00000000
>    HW_GPMI_PAYLOAD=0x00000000
>    HW_GPMI_AUXILIARY=0x00000000
>    HW_GPMI_TIMING0=0x00020101
>    HW_GPMI_TIMING1=0x60000000
>    HW_GPMI_TIMING2=0x23023336
>    HW_GPMI_DATA=0x0000003f
>    HW_GPMI_STAT=0xff000005
>    HW_GPMI_DEBUG=0x00000101
>    r->clock[0]=22000000
> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(536): gpmi_nfc_apply_timings(): EXIT
>    HW_GPMI_CTRL0=0x01800001
>    HW_GPMI_CTRL1=0x0104000c
>    HW_GPMI_COMPARE=0x00000000
>    HW_GPMI_ECCCTRL=0x00000000
>    HW_GPMI_ECCCOUNT=0x00000000
>    HW_GPMI_PAYLOAD=0x00000000
>    HW_GPMI_AUXILIARY=0x00000000
>    HW_GPMI_TIMING0=0x00020101
>    HW_GPMI_TIMING1=0xb0000000
>    HW_GPMI_TIMING2=0x23023336
>    HW_GPMI_DATA=0x0000003f
>    HW_GPMI_STAT=0xff000005
>    HW_GPMI_DEBUG=0x00000101
>    r->clock[0]=22000000
> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(512): gpmi_nfc_apply_timings(): ENTRY
>    HW_GPMI_CTRL0=0x01800001
>    HW_GPMI_CTRL1=0x0104000c
>    HW_GPMI_COMPARE=0x00000000
>    HW_GPMI_ECCCTRL=0x00000000
>    HW_GPMI_ECCCOUNT=0x00000000
>    HW_GPMI_PAYLOAD=0x00000000
>    HW_GPMI_AUXILIARY=0x00000000
>    HW_GPMI_TIMING0=0x00020101
>    HW_GPMI_TIMING1=0xb0000000
>    HW_GPMI_TIMING2=0x23023336
>    HW_GPMI_DATA=0x000000e0
>    HW_GPMI_STAT=0xff000005
>    HW_GPMI_DEBUG=0x00000000
>    r->clock[0]=22000000
> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(536): gpmi_nfc_apply_timings(): EXIT
>    HW_GPMI_CTRL0=0x01800001
>    HW_GPMI_CTRL1=0x01c6800c
>    HW_GPMI_COMPARE=0x00000000
>    HW_GPMI_ECCCTRL=0x00000000
>    HW_GPMI_ECCCOUNT=0x00000000
>    HW_GPMI_PAYLOAD=0x00000000
>    HW_GPMI_AUXILIARY=0x00000000
>    HW_GPMI_TIMING0=0x00010101
>    HW_GPMI_TIMING1=0xe0000000
>    HW_GPMI_TIMING2=0x23023336
>    HW_GPMI_DATA=0x000000e0
>    HW_GPMI_STAT=0xff000005
>    HW_GPMI_DEBUG=0x00000000
>    r->clock[0]=99000000
> Scanning device for bad blocks
> 5 fixed-partitions partitions found on MTD device gpmi-nand
> Creating 5 MTD partitions on "gpmi-nand":
> 0x000000000000-0x000000500000 : "u-boot"
> 0x000000500000-0x000000600000 : "u-boot-env"
> 0x000000600000-0x000000800000 : "log"
> 0x000000800000-0x000010000000 : "flash"
> 0x000000000000-0x000010000000 : "all"
> gpmi-nand 1806000.gpmi-nand: driver registered.
> ...
>
>
> Regards
> Greg
>
>


-- 
Michael Nazzareno Trimarchi
Amarula Solutions BV
COO Co-Founder
Cruquiuskade 47 Amsterdam 1018 AM NL
T. +31(0)851119172
M. +39(0)3479132170
[`as] https://www.amarulasolutions.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
