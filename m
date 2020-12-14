Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F13C4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 15:00:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE7542253A
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 15:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE7542253A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QKGSmcGnI/BRMILc4oPCMf94EL/wM/OM4FdRSy24mEE=; b=x8wjSRhM3QLF2S5YVJ0bnWhjj
	5Lzrc8LYm9rFlGuYsPH6+Cq0GMVT2qKBAkBxNCVASdL/YMrVPQeBZc4nieT5ViRlPPeTLgpUOqhzZ
	cyhVBx+sufbXQ9UslMV1RhNheM4Ecjp1X+iQSv9flhCW1bqpXxL1oBJIuM/CKFz9hSsYL77JkysmZ
	nf0m2JkPIjyOhLVVf0l2PNvcyzGShNADK+LPN6/rRd32nWvb9OKvz07VyBUkNi+Yo7OtFflNfMdOw
	NvTAcf/7881qz7Za0HuzqCvGGO9G5O/SIaaswcQehhSsF5lCFZoVzzzx6ReNyT1PQetq0S0jN0RmK
	JtE+TZaOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kopJY-0006G5-B0; Mon, 14 Dec 2020 14:59:04 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kopJV-0006FB-Vu
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 14:59:02 +0000
Received: by mail-il1-x131.google.com with SMTP id q1so16059409ilt.6
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2020 06:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LoLnOwl23r41Jp737thOm5HH6XU+Qkk59uOP7BgMjI=;
 b=EPaLbGfQQRkhTNxENpHU11mP81rVU2+dHsU4frtIrXVowgH4pZ/PLKXy8yAh6nEeUK
 /bcn8lu3yesO5F7jUc3OUt5u8Fiz5X+1566YWN8N4Kct4HX/HUBxQxSyVp4jDU16lKHf
 D1kFTuSHJI3vhegoC8Tqcs+xdxdfrRk2GZw71o9C9lUB6vofKEBDq17kaE4TmfZ2i12O
 ckmGtbOyEzpnJANu4L43qJqyRzzMI9dZn+BrlF1KiOIjxKjTtQfpSWCkF2hEpypZivem
 COns7bMckyxwRk1YUA5DUv2qJl7qsAZf0UeV8aXUZbZRl1K+ApDpaq6ZQbB//4bHHa/N
 Y8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LoLnOwl23r41Jp737thOm5HH6XU+Qkk59uOP7BgMjI=;
 b=rI8jp2ytjq1xR1egkFD3wsKTebKa4kHdTDBEaCrrCN0PqPI5ZUX3ljQ+9hVWAU+HeE
 labxrhpobtGTauz3TsN2syQw2syr4RZN4QxPWdzSV8IWX9ZEzJTE0LeNIhqoyobTdLLe
 4z3HWnupepFZbqIr9ksQLyocL+gxkKuHaoBfrEhUZyB9J/EMXld5VrnrBMVjwMMU+DYq
 Hyf1WkvDrSWDb7Q2EoQjOHYsB/NxJG3bh2sD02lliAVOqrUzYGFKOoh2VD6kkxTlUi7h
 cTNnii5jjNWTngC0aWlclJec7xJvGVL2sdX6NVRYktflvIL4GK8OG7vjAW+NV/iSRcdm
 gtJw==
X-Gm-Message-State: AOAM533hC4DDfucK+MayGI2l3DvnB+unAOIxWoAoQsyU51RoOXfkBD+c
 CTO+0esKBfJbURW9U9XeGiNAGSGyJr482TkWMA6gPCyq4ZIXbg==
X-Google-Smtp-Source: ABdhPJwT1//3G219fknh8lpe9PsB1HZJD8KydZDLIraMplwqFRsoWWdidmrj68Bb23Jcf+5mnsXJQIZwE9kuznH6xt8=
X-Received: by 2002:a92:cec3:: with SMTP id z3mr35382785ilq.256.1607957940003; 
 Mon, 14 Dec 2020 06:59:00 -0800 (PST)
MIME-Version: 1.0
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
In-Reply-To: <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
From: David Schaefer <david.tillmann.schaefer@gmail.com>
Date: Mon, 14 Dec 2020 15:58:49 +0100
Message-ID: <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_095902_046011_6D71CD93 
X-CRM114-Status: GOOD (  21.92  )
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

Hi Richard,

Am Mo., 14. Dez. 2020 um 14:36 Uhr schrieb Richard Weinberger
<richard.weinberger@gmail.com>:
>
> David,
>
> On Mon, Dec 14, 2020 at 9:08 AM David Schaefer
> <david.tillmann.schaefer@gmail.com> wrote:
> >
> > Hi,
> >
> > I am trying to upgrade to a more recent kernel. I face the issue that
> > I am missing the /dev/mtdblock1-6 devices. I have tracked down that
> > issue shows up the first time with 4.16.1 and does not exist with
> > 4.15.18.
> >
> > Also I have this initalization during 4.15.18:
> >
> > > f10d0000.nand: This platform can't do DMA on this device
> > > nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
> > > nand: Hynix H27U2G8F2CTR-BC
> > > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > > pxa3xx-nand f10d0000.nand: ECC strength 16, ECC step size 2048
> > > Bad block table found at page 131008, version 0x01
> > > Bad block table found at page 130944, version 0x01
> > > nand_read_bbt: bad block at 0x00000e7c0000
> > > 7 ofpart partitions found on MTD device pxa3xx_nand-0
> > > Creating 7 MTD partitions on "pxa3xpxa3xx-nand x_nand-0":
> > > 0x000000000000-0x000000500000 : "u-Boot"
> > > 0x000000500000-0x000000a00000 : "uImage"
> > > 0x000000a00000-0x000000f00000 : "ramdisk"
> > > 0x000000f00000-0x00000d800000 : "image.cfs"
> > > 0x00000dd00000-0x00000ec00000 : "rescue firmware"
> > > 0x00000ec00000-0x000010000000 : "config"
> > > 0x00000d800000-0x00000dd00000 : "reserve"
> >
> > and this with 4.16.1:
> >
> > > nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
> > > nand: Hynix H27U2G8F2CTR-BC
> > > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > > marvell-nfc f10d0000.nand: Timeout on CMDD (NDSR: 0x00000080)
> > > marvell-nfc f10d0000.nand: Timeout on CMDD (NDSR: 0x00000280)
> > > Bad block table not found for chip 0
> > > Bad block table not found for chip 0
> > > Scanning device for bad blocks
> > > Bad eraseblock 1854 at 0x00000e7c0000
> >
> > I have tried 4.19.161 and 5.4.83 as well but my /dev/mtdblock1-6
> > devices keep being missing.
> >
> > What do I have to do to turn them back on? Do I have to modify my dts
> > file for the new driver marvell_nand?
> > https://fox-exe.ru/WDMyCloud/WDMyCloud-Mirror/Developing/kernel-4.15.0-rc6/armada-370-wdmc-mirror-gen1.dts
>
> Enabling CONFIG_MTD_NAND_MARVELL should give you the new marvell driver.
> IIRC no changes to the dts are needed. Though, there have been some
> fixes such as:
> f6997bec6af4 ("mtd: rawnand: marvell: fix the chip-select DT parsing logic")
>
> Do you see this failure with both the old and the new marvell drivers?
>
> Maybe Miquel has an idea too.

I have checked the kernel configuration. For 4.15.18 I have these settings:
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_PXA3xx=y

and for 4.16.1

CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_MARVELL=y

I actually copied the working configuration from 4.15.18 to 4.16.1,
did make oldconfig, and compiled it the same way as 4.15.18. Like I
said above, 4.15 works, 4.16 does not.
I hope this answers your question whether I see the issue with the new
and the old marvell drivers because I am not 100% sure what you refer
to here (I guess you mean PXA3XX vs NAND).

Kind regards
David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
