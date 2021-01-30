Return-Path: <SRS0=vbdM=HB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAE9C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Jan 2021 09:42:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04D164DDC
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Jan 2021 09:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E04D164DDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1R2u8ykKRBjZyzOZP7izcxwCihYnRTqo2oaSr1e90v0=; b=a8xYw9IzPSvcYvYIh8yip+gzg
	WfxUQOKxh6peUYu4blVX0Kr58VhGMJvSNZBUEt0lw8XAPf4bbuebgMnqxP3M4/JpT9Tq7QVCyjLOF
	T3HHlXqmevPxkAtnrbj6m4dS2jBo0G2PITedYhqRcw+4Zt30NgImkbLFgpwhTPZ4dUY7VkP4VCy0+
	RPgYMcy5+Tm2gKR7WUo1asfA+1XEDH+3G/anV1EYDUu/scsAr61yojL2zPHgPiXvwXrVklZlbHxXk
	MSOugjT0LL37Mhgm5zWyrXkbge/eSYct6kJz5oZq0BesIqlgHem4eo+xTiROuY/GCMlRp2g4XnYPO
	8EJMuMLbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5mlG-0001pj-Ab; Sat, 30 Jan 2021 09:41:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5mlD-0001ou-Iq
 for linux-mtd@lists.infradead.org; Sat, 30 Jan 2021 09:41:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id z16so6276720wml.2
 for <linux-mtd@lists.infradead.org>; Sat, 30 Jan 2021 01:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1qltjX5Oc8u8qTitFtzWl9jI5gow6OhhkR9a3RIGi7A=;
 b=AqvFB9r4jimt+G0SmdtRloLRi7PgefBXtx8cTKlfu/jrmHhweZtNQWF5oRvui7OXes
 7wTmFSVmW7k7//khgcib/NRGHjI7xGWYq0F3DKs6g30+l3b6NOdUaNHe/FPP085prqxC
 DKkgLW/PBPPQTb5zPG4QcWKXSK8Lkuc80ltfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1qltjX5Oc8u8qTitFtzWl9jI5gow6OhhkR9a3RIGi7A=;
 b=DEIaRAR3RyyaHo2ATlksLyR6Qo5Z72jacmjY4thh5mq4gBW0lqMCMZo1BIt0mx1LTl
 wAR/wElkYKxS0HVSDXO87qU8MjtDxV4r+a6b0p9RUGC5tB1kbmddMOV8IZ46wF86pHBC
 Oei3CqXN77AvabVqIRyRyM+KX8hM0Fgfrar+eR+v+VpqE6HzswVXUJHHXu7uR2x8EgAY
 1kIPDDv/UCWUcVwtvzoiMm8ETDXRLrIF3pcv7VYnsYpJ198b9Ra0kF9tVtl7VweVQD6Y
 67wsNKb3eQ3CBDU+5Kn47ExI5uPEm4MNwxqbgbnnnvvejosyTMm17A8cmLrrX+xVlAlx
 uYFw==
X-Gm-Message-State: AOAM532Mky4QW9JfDp8UUDZVPFuVHvUQ0BdKf8fhfrtzKhG6Sumnv8cV
 Q7kLz3b1eqee1btTm7lgWvqoC2QFSzSgZ9ugqb7UGET0/MZYkA==
X-Google-Smtp-Source: ABdhPJyykNWGNV3BDg9cR78l5X7PwOHe3CeeiD4vSqOkrEofxF+sVarchmy8x4ylqeY0bHOWq72dlkwTkbDlO4pYU8Y=
X-Received: by 2002:a05:600c:4148:: with SMTP id
 h8mr7188274wmm.137.1611999701081; 
 Sat, 30 Jan 2021 01:41:41 -0800 (PST)
MIME-Version: 1.0
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
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
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
 <2e9e1f1c-ee57-425d-1791-70c66de52637@kernel.org>
In-Reply-To: <2e9e1f1c-ee57-425d-1791-70c66de52637@kernel.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 30 Jan 2021 10:41:29 +0100
Message-ID: <CAOf5uwm93+ARf=_BckjMar1tpeBs6YHeUwORj5cyhFfvu5fNWQ@mail.gmail.com>
Subject: Re: GPMI iMX6ull timeout on DMA
To: Greg Ungerer <gerg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_044143_764130_BCDB3EBA 
X-CRM114-Status: GOOD (  27.49  )
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

Hi Miquel

commit f8e6ad14388067f91b26d044185d95623fbc9535
Author: Michael Trimarchi <michael@amarulasolutions.com>
Date:   Fri Jan 29 08:46:53 2021 +0100

    mtd: nand: Calculate the clock before enable it

    Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
    Change-Id: I79b0da39de0a9b32ea0b002fa200d7f44d4f8ce7

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 322a008290e5..0bca52b3bc8f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -377,6 +377,7 @@ static void gpmi_nfc_compute_timings(struct
gpmi_nand_data *this,
                                     const struct nand_sdr_timings *sdr)
 {
        struct gpmi_nfc_hardware_timing *hw = &this->hw;
+       struct resources *r = &this->resources;
        unsigned int dll_threshold_ps = this->devdata->max_chain_delay;
        unsigned int period_ps, reference_period_ps;
        unsigned int data_setup_cycles, data_hold_cycles, addr_setup_cycles;
@@ -440,6 +441,8 @@ static void gpmi_nfc_compute_timings(struct
gpmi_nand_data *this,
                hw->ctrl1n |= BF_GPMI_CTRL1_RDN_DELAY(sample_delay_factor) |
                              BM_GPMI_CTRL1_DLL_ENABLE |
                              (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD : 0);
+
+       clk_set_rate(r->clock[0], hw->clk_rate);
 }

 void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
@@ -449,8 +452,6 @@ void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
        void __iomem *gpmi_regs = r->gpmi_regs;
        unsigned int dll_wait_time_us;

-       clk_set_rate(r->clock[0], hw->clk_rate);
-
        writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
        writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);

Right now I have this change applied and seems fine. That is the only
difference I get. Clock is apply a bit earlier that when is enabled
it.

Michael

On Fri, Jan 29, 2021 at 1:43 PM Greg Ungerer <gerg@kernel.org> wrote:
>
> Hi Michael,
>
> On 28/1/21 7:45 pm, Michael Nazzareno Trimarchi wrote:
> > Hi Greg
> >
> > On Tue, Aug 13, 2019 at 2:50 AM Greg Ungerer <gerg@kernel.org> wrote:
> >>
> >> Hi Boris,
> >>
> >> On 12/8/19 5:31 pm, Boris Brezillon wrote:
> >>> On Mon, 12 Aug 2019 12:50:36 +1000
> >> [snip]
> >>> Hm, CTRL1 is identical. Can you dump all regs at the beginning and at
> >>> the end of those funcs?
> >>
> >> Here is a more complete dump of registers. Trace points are at
> >> entry and exit of the respective functions in the different
> >> kernel versions. Register dumping code is identical for both.
> >>
> >>
> >> Linux version 4.16.0 (gerg@goober) (gcc version 4.8.3 (GCC)) #10 Tue Aug 13 10:24:28 AEST 2019
> >> ...
> >
> > I ran an overnight reboot process on linux-4.19.y tag: v4.19.169 and
> > I'm not able to reproduce up to now.
> >
> > Do you have an update from your side?
>
> I haven't seen the problem for a while now.
> I pretty much only run modern kernels, I am currently using 5.10.
> So I am guessing it was resolved somewhere at some point, but I
> don't know exactly what change resolved it.
>
> Regards
> Greg
>
>
>
> >> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1073): gpmi_begin(): ENTRY
> >>     HW_GPMI_CTRL0=0x00000000
> >>     HW_GPMI_CTRL1=0x01c4000c
> >>     HW_GPMI_COMPARE=0x00000000
> >>     HW_GPMI_ECCCTRL=0x00000400
> >>     HW_GPMI_ECCCOUNT=0x00000000
> >>     HW_GPMI_PAYLOAD=0x00000000
> >>     HW_GPMI_AUXILIARY=0x00000000
> >>     HW_GPMI_TIMING0=0x00010203
> >>     HW_GPMI_TIMING1=0x00000000
> >>     HW_GPMI_TIMING2=0x23023336
> >>     HW_GPMI_DATA=0x00000000
> >>     HW_GPMI_STAT=0xff000005
> >>     HW_GPMI_DEBUG=0x00000000
> >>     r->clock[0]=22000000
> >> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> >> nand: Micron MT29F2G08ABAEAWP
> >> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> >> gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
> >> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1073): gpmi_begin(): ENTRY
> >>     HW_GPMI_CTRL0=0x01800001
> >>     HW_GPMI_CTRL1=0x0104000c
> >>     HW_GPMI_COMPARE=0x00000000
> >>     HW_GPMI_ECCCTRL=0x00000000
> >>     HW_GPMI_ECCCOUNT=0x00000000
> >>     HW_GPMI_PAYLOAD=0x00000000
> >>     HW_GPMI_AUXILIARY=0x00000000
> >>     HW_GPMI_TIMING0=0x00010203
> >>     HW_GPMI_TIMING1=0x05000000
> >>     HW_GPMI_TIMING2=0x23023336
> >>     HW_GPMI_DATA=0x00000000
> >>     HW_GPMI_STAT=0xff000005
> >>     HW_GPMI_DEBUG=0x00000101
> >>     r->clock[0]=99000000
> >> drivers/mtd/nand/gpmi-nand/gpmi-lib.c(1136): gpmi_begin(): EXIT
> >>     HW_GPMI_CTRL0=0x01800001
> >>     HW_GPMI_CTRL1=0x01c6800c
> >>     HW_GPMI_COMPARE=0x00000000
> >>     HW_GPMI_ECCCTRL=0x00000000
> >>     HW_GPMI_ECCCOUNT=0x00000000
> >>     HW_GPMI_PAYLOAD=0x00000000
> >>     HW_GPMI_AUXILIARY=0x00000000
> >>     HW_GPMI_TIMING0=0x00010101
> >>     HW_GPMI_TIMING1=0x90000000
> >>     HW_GPMI_TIMING2=0x23023336
> >>     HW_GPMI_DATA=0x00000000
> >>     HW_GPMI_STAT=0xff000005
> >>     HW_GPMI_DEBUG=0x00000101
> >>     r->clock[0]=99000000
> >> Scanning device for bad blocks
> >> 5 ofpart partitions found on MTD device gpmi-nand
> >> Creating 5 MTD partitions on "gpmi-nand":
> >> 0x000000000000-0x000000500000 : "u-boot"
> >> 0x000000500000-0x000000600000 : "u-boot-env"
> >> 0x000000600000-0x000000800000 : "log"
> >> 0x000000800000-0x000010000000 : "flash"
> >> 0x000000000000-0x000010000000 : "all"
> >> gpmi-nand 1806000.gpmi-nand: driver registered.
> >> ...
> >>
> >> Note that the first ENTRY dump has no matching EXIT dump. From the
> >> code I assume it is returning from gpmi_begin() at the
> >> "if (!hw.sample_delay_factor)" check.
> >>
> >>
> >> And for the 5.1.14 kernel:
> >>
> >> Linux version 5.1.14 (gerg@goober) (gcc version 4.8.3 (GCC)) #27 Tue Aug 13 10:20:32 AEST 2019
> >> ...
> >> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(512): gpmi_nfc_apply_timings(): ENTRY
> >>     HW_GPMI_CTRL0=0x00000000
> >>     HW_GPMI_CTRL1=0x01c4000c
> >>     HW_GPMI_COMPARE=0x00000000
> >>     HW_GPMI_ECCCTRL=0x00000400
> >>     HW_GPMI_ECCCOUNT=0x00000000
> >>     HW_GPMI_PAYLOAD=0x00000000
> >>     HW_GPMI_AUXILIARY=0x00000000
> >>     HW_GPMI_TIMING0=0x00010203
> >>     HW_GPMI_TIMING1=0x00000000
> >>     HW_GPMI_TIMING2=0x23023336
> >>     HW_GPMI_DATA=0x00000000
> >>     HW_GPMI_STAT=0xff000005
> >>     HW_GPMI_DEBUG=0x00000000
> >>     r->clock[0]=22000000
> >> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(536): gpmi_nfc_apply_timings(): EXIT
> >>     HW_GPMI_CTRL0=0x00000000
> >>     HW_GPMI_CTRL1=0x0104000c
> >>     HW_GPMI_COMPARE=0x00000000
> >>     HW_GPMI_ECCCTRL=0x00000400
> >>     HW_GPMI_ECCCOUNT=0x00000000
> >>     HW_GPMI_PAYLOAD=0x00000000
> >>     HW_GPMI_AUXILIARY=0x00000000
> >>     HW_GPMI_TIMING0=0x00020101
> >>     HW_GPMI_TIMING1=0x60000000
> >>     HW_GPMI_TIMING2=0x23023336
> >>     HW_GPMI_DATA=0x00000000
> >>     HW_GPMI_STAT=0xff000005
> >>     HW_GPMI_DEBUG=0x00000000
> >>     r->clock[0]=22000000
> >> random: fast init done
> >> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> >> nand: Micron MT29F2G08ABAEAWP
> >> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> >> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(512): gpmi_nfc_apply_timings(): ENTRY
> >>     HW_GPMI_CTRL0=0x01800001
> >>     HW_GPMI_CTRL1=0x0104000c
> >>     HW_GPMI_COMPARE=0x00000000
> >>     HW_GPMI_ECCCTRL=0x00000000
> >>     HW_GPMI_ECCCOUNT=0x00000000
> >>     HW_GPMI_PAYLOAD=0x00000000
> >>     HW_GPMI_AUXILIARY=0x00000000
> >>     HW_GPMI_TIMING0=0x00020101
> >>     HW_GPMI_TIMING1=0x60000000
> >>     HW_GPMI_TIMING2=0x23023336
> >>     HW_GPMI_DATA=0x0000003f
> >>     HW_GPMI_STAT=0xff000005
> >>     HW_GPMI_DEBUG=0x00000101
> >>     r->clock[0]=22000000
> >> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(536): gpmi_nfc_apply_timings(): EXIT
> >>     HW_GPMI_CTRL0=0x01800001
> >>     HW_GPMI_CTRL1=0x0104000c
> >>     HW_GPMI_COMPARE=0x00000000
> >>     HW_GPMI_ECCCTRL=0x00000000
> >>     HW_GPMI_ECCCOUNT=0x00000000
> >>     HW_GPMI_PAYLOAD=0x00000000
> >>     HW_GPMI_AUXILIARY=0x00000000
> >>     HW_GPMI_TIMING0=0x00020101
> >>     HW_GPMI_TIMING1=0xb0000000
> >>     HW_GPMI_TIMING2=0x23023336
> >>     HW_GPMI_DATA=0x0000003f
> >>     HW_GPMI_STAT=0xff000005
> >>     HW_GPMI_DEBUG=0x00000101
> >>     r->clock[0]=22000000
> >> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(512): gpmi_nfc_apply_timings(): ENTRY
> >>     HW_GPMI_CTRL0=0x01800001
> >>     HW_GPMI_CTRL1=0x0104000c
> >>     HW_GPMI_COMPARE=0x00000000
> >>     HW_GPMI_ECCCTRL=0x00000000
> >>     HW_GPMI_ECCCOUNT=0x00000000
> >>     HW_GPMI_PAYLOAD=0x00000000
> >>     HW_GPMI_AUXILIARY=0x00000000
> >>     HW_GPMI_TIMING0=0x00020101
> >>     HW_GPMI_TIMING1=0xb0000000
> >>     HW_GPMI_TIMING2=0x23023336
> >>     HW_GPMI_DATA=0x000000e0
> >>     HW_GPMI_STAT=0xff000005
> >>     HW_GPMI_DEBUG=0x00000000
> >>     r->clock[0]=22000000
> >> drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c(536): gpmi_nfc_apply_timings(): EXIT
> >>     HW_GPMI_CTRL0=0x01800001
> >>     HW_GPMI_CTRL1=0x01c6800c
> >>     HW_GPMI_COMPARE=0x00000000
> >>     HW_GPMI_ECCCTRL=0x00000000
> >>     HW_GPMI_ECCCOUNT=0x00000000
> >>     HW_GPMI_PAYLOAD=0x00000000
> >>     HW_GPMI_AUXILIARY=0x00000000
> >>     HW_GPMI_TIMING0=0x00010101
> >>     HW_GPMI_TIMING1=0xe0000000
> >>     HW_GPMI_TIMING2=0x23023336
> >>     HW_GPMI_DATA=0x000000e0
> >>     HW_GPMI_STAT=0xff000005
> >>     HW_GPMI_DEBUG=0x00000000
> >>     r->clock[0]=99000000
> >> Scanning device for bad blocks
> >> 5 fixed-partitions partitions found on MTD device gpmi-nand
> >> Creating 5 MTD partitions on "gpmi-nand":
> >> 0x000000000000-0x000000500000 : "u-boot"
> >> 0x000000500000-0x000000600000 : "u-boot-env"
> >> 0x000000600000-0x000000800000 : "log"
> >> 0x000000800000-0x000010000000 : "flash"
> >> 0x000000000000-0x000010000000 : "all"
> >> gpmi-nand 1806000.gpmi-nand: driver registered.
> >> ...
> >>
> >>
> >> Regards
> >> Greg
> >>
> >>
> >
> >



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
