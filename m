Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CA1C4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 13:38:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ECDB206C1
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 13:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ECDB206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gf9vtt6fuCZxlrFgPOa+T7SV7BI1/1CMRp8YTpWXnJE=; b=iR/PthV9G9Qip12hj2veKYRUT
	kSOe/k1KXaLa98EaP00isogt3Aq5nG4WDjWhmPQhsBRQByHBjsCQuWBNAlGST4PFwgqNJqTtBl5Ce
	s6ccKm/i/pjbyeNCdrOqOK6yXyMdpFeRlqotU5SAJb4qXT6QESK/yONDIE3DgN1fafvHSxUgAwd84
	bZBvmOXPdP1nyR0L5PgvGt5PXsa8/5W+rZgcGoqyV1Ckg7F5dXXukd8AkhFvlrF8WGNU6lqtzJQqy
	8PVLBkD7s2kFoPrRilqD3Zpub5904L0FWecd5GFQHNXOJeWiioI0BLAtLGNxPIoTq+9Sk/qu1Fnfg
	IYSAfeW8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koo2A-000517-Gi; Mon, 14 Dec 2020 13:37:02 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koo27-00050U-VB
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 13:37:01 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id q7so7752142qvt.12
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2020 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EQHQUbop6hUntBCTsgCuVWok8w7hxzR8x8qRFsxplBU=;
 b=KYCTYtQIU+haRyVIS1FL5jT1zMVWE151Pf6SHk29IieINaamNhXNcHVzCv9jQZ86OD
 S/otcdKsGPL/Ioz6km0QoBiXTeqIupk6kfolSB8093MpumadpmmC3YbgD7rzwkJc310B
 F9IU6QxYHsQFu602zNEEcN1/2/DuLTtelLTE9WoeOSkyG02EG7MTz2Xx7b/3bRZZvVDI
 o3rmyIefxLGYEpnN4qyLLmD9cBi+WXwgK/r14qlKZDbfVWu5SsMrW/4Io1JZhZ5FBgxq
 FkMJSR9HlzflHI/Y7j8khHADz/J0CcH7BE0CjffX7nWKkJLBZifDtb1bMkl2Lvs0Ms1F
 4AyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EQHQUbop6hUntBCTsgCuVWok8w7hxzR8x8qRFsxplBU=;
 b=FxNI+j6I4rjAU0AYDqk4CtaKB/Nvwg3q2iHdoEHg+mRItCnWLhs9aANSPR8d8X3NtM
 arr6SRBywN2L6NoGNflPno6yCvw9diCut0pTX1/fD2dAOGYNiptxqIL9fc/asnbl10uD
 n9CWwkAqsdvKA+s91JUt21q/nVGA41hRLylivY98ZJIeLNB8UneGvXGIVExfhbTJd5XY
 nhxuea4wfws3iZM+Ko8g/PcMkvndgZsRhXsY+llNb/a6qvkMLGkWdOKIIQexvqmAEzL2
 PyvVc9mi/wuwpfaSkS6g21kQJxCp9BStLNImYH/SyNpRVyuRXFWlwgDz5kySLkUX6aiw
 jHTQ==
X-Gm-Message-State: AOAM531eu3aXp4syUhC9YJKETuBrNMV5Br8RKEmwzJgjmA5ZNcK1TpO6
 6SjdVJJMbbk0t9Gztcar4SL0XNMV9Lf2n9t4vWc=
X-Google-Smtp-Source: ABdhPJyvG3EL+Uc5flpAn2nKVjeUSXU7kQM3yg37veaRHmZ4PR/Tv91rMsemPUqN6TkvZ8FfzBTggOWQgMLWINliOR4=
X-Received: by 2002:a0c:9ba6:: with SMTP id o38mr31562985qve.56.1607953017242; 
 Mon, 14 Dec 2020 05:36:57 -0800 (PST)
MIME-Version: 1.0
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
In-Reply-To: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 14 Dec 2020 14:36:45 +0100
Message-ID: <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: David Schaefer <david.tillmann.schaefer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_083700_093762_99315B6D 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

David,

On Mon, Dec 14, 2020 at 9:08 AM David Schaefer
<david.tillmann.schaefer@gmail.com> wrote:
>
> Hi,
>
> I am trying to upgrade to a more recent kernel. I face the issue that
> I am missing the /dev/mtdblock1-6 devices. I have tracked down that
> issue shows up the first time with 4.16.1 and does not exist with
> 4.15.18.
>
> Also I have this initalization during 4.15.18:
>
> > f10d0000.nand: This platform can't do DMA on this device
> > nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
> > nand: Hynix H27U2G8F2CTR-BC
> > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > pxa3xx-nand f10d0000.nand: ECC strength 16, ECC step size 2048
> > Bad block table found at page 131008, version 0x01
> > Bad block table found at page 130944, version 0x01
> > nand_read_bbt: bad block at 0x00000e7c0000
> > 7 ofpart partitions found on MTD device pxa3xx_nand-0
> > Creating 7 MTD partitions on "pxa3xpxa3xx-nand x_nand-0":
> > 0x000000000000-0x000000500000 : "u-Boot"
> > 0x000000500000-0x000000a00000 : "uImage"
> > 0x000000a00000-0x000000f00000 : "ramdisk"
> > 0x000000f00000-0x00000d800000 : "image.cfs"
> > 0x00000dd00000-0x00000ec00000 : "rescue firmware"
> > 0x00000ec00000-0x000010000000 : "config"
> > 0x00000d800000-0x00000dd00000 : "reserve"
>
> and this with 4.16.1:
>
> > nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
> > nand: Hynix H27U2G8F2CTR-BC
> > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > marvell-nfc f10d0000.nand: Timeout on CMDD (NDSR: 0x00000080)
> > marvell-nfc f10d0000.nand: Timeout on CMDD (NDSR: 0x00000280)
> > Bad block table not found for chip 0
> > Bad block table not found for chip 0
> > Scanning device for bad blocks
> > Bad eraseblock 1854 at 0x00000e7c0000
>
> I have tried 4.19.161 and 5.4.83 as well but my /dev/mtdblock1-6
> devices keep being missing.
>
> What do I have to do to turn them back on? Do I have to modify my dts
> file for the new driver marvell_nand?
> https://fox-exe.ru/WDMyCloud/WDMyCloud-Mirror/Developing/kernel-4.15.0-rc6/armada-370-wdmc-mirror-gen1.dts

Enabling CONFIG_MTD_NAND_MARVELL should give you the new marvell driver.
IIRC no changes to the dts are needed. Though, there have been some
fixes such as:
f6997bec6af4 ("mtd: rawnand: marvell: fix the chip-select DT parsing logic")

Do you see this failure with both the old and the new marvell drivers?

Maybe Miquel has an idea too.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
