Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D309EC4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 08:04:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9F2225AC
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 08:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9F2225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CLWgtlC/tHxZxrQkbRsqildLsEKBxw7+1zRkX4mJ8P4=; b=fzgxF5yp82qzldb2L/ynANeYP/
	E1nxZ+NMvrGL18b6WMfamP5lRqbl6wEoIjD0QK8bTQ+4A/tHyNv+Wt0DbnDTinZjIXE2+lIUV21Wz
	Orp1HGyh512otUdtMtEZ3TSZIGmj3c6oCh6OWX91P4LWAIXakODCliVO4XGmR+PM+SPUbUSEWGn6S
	xuN9hVzbxvc9dHJNCkLE4Dfjo6wx6RHUoMBYxyxTU04XhDjmCZWaUgJ1wO7kgPRQ0UGzsrYaDYXW1
	DKj9gzPKWVGbaaghdfxjxszDMYMIJTYPU4pI+VY47kOeWr9FuYJz8wH4pFgnM+0Z3hWZJE/A+tZ2h
	yN1e+GoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koipM-0004Ib-Bd; Mon, 14 Dec 2020 08:03:28 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koipJ-0004IB-Hd
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 08:03:26 +0000
Received: by mail-il1-x12c.google.com with SMTP id r17so14969964ilo.11
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2020 00:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VXLywW6BUpmMKVVX0mp2Y/FdhX/gGmyrpnvQlg6/Lts=;
 b=AFALOWKs51V+9fHxhqMpgxzSKjWjSzP1G6pnsQtfoFsnW6n0upujhK8mvBbT4vHL8F
 v51Gx7OcpsSIHESepP7RTrh41OgSdA46gAq4RKJsZRgiQqV/UbqnL4AwVJCRAKZdfvJR
 QulcgPpym/+PiwasJskE5B+VT4oLg9E3ScvI8F0jnAVoPMpU4Ha0CQBPdA3nnfD7NCCw
 kINfINcODJgQ1Rv15Gs7sLomFZuSiKncxGAyPutWNBTS4wMrnvgwZm4LGVSyt3eNcNPT
 LYRgoRJ/Qg3ulWwXFp2xOXOzsfFvvi88S1pAfDWbZ4R7q9hlAI+X7WIJGtA1W9Zxzm43
 YgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VXLywW6BUpmMKVVX0mp2Y/FdhX/gGmyrpnvQlg6/Lts=;
 b=YXv7jTxcoh9iis6DucWCQ/DXBRKuf5N5y4AtkJYz5u2+YJs4It4/0+lLrsfMqB7dLp
 eTv4xhRX9V0nKdf1s6I0nWno2+LweG663+LvnvuNqaaGku/cVE4am+2pe2MTCqfXmNiy
 jjEqmBeJR4wb1ad3OqbCIbC5YAp3X+KHbjGk0c83JsAsB4jyp6S7QV4t7LZrLKjB7GV2
 dsO6T+W9PHkWjkcO/UaPJUSnpcEUuYUSG+Gf85F1594sAxGC2VeCV/5OVwNrAPw9VSmg
 1H2upjaZY08Wj8IWPigGrBOdyGlaXiX7eeKR9Dp2cMG336CxhZtsBdVlO8hi/jbTq+1X
 /aZQ==
X-Gm-Message-State: AOAM531C7tg8vzYmCG5woyxz7nY4dASMcfJhhrnGHELx/p5aYB9Xme5Q
 VZ8xuhdM1+kBS6kj+TolIAqmBdR/lBem/nGw2rmI+/ysEEg=
X-Google-Smtp-Source: ABdhPJwrRak9oL+vLEOkK5B5WR+JOpTZ+U2mIwaT4Ymy+Fy8UhwYqXSPlkTwJ2zUQaJQpH9zrpgogOaJ3gTQxuKCtwE=
X-Received: by 2002:a92:cec3:: with SMTP id z3mr33509592ilq.256.1607933002269; 
 Mon, 14 Dec 2020 00:03:22 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:f20c:0:0:0:0:0 with HTTP; Mon, 14 Dec 2020 00:03:21
 -0800 (PST)
From: David Schaefer <david.tillmann.schaefer@gmail.com>
Date: Mon, 14 Dec 2020 09:03:21 +0100
Message-ID: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
Subject: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_030325_605971_6AF96731 
X-CRM114-Status: GOOD (  11.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I am trying to upgrade to a more recent kernel. I face the issue that
I am missing the /dev/mtdblock1-6 devices. I have tracked down that
issue shows up the first time with 4.16.1 and does not exist with
4.15.18.

Also I have this initalization during 4.15.18:

> f10d0000.nand: This platform can't do DMA on this device
> nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
> nand: Hynix H27U2G8F2CTR-BC
> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> pxa3xx-nand f10d0000.nand: ECC strength 16, ECC step size 2048
> Bad block table found at page 131008, version 0x01
> Bad block table found at page 130944, version 0x01
> nand_read_bbt: bad block at 0x00000e7c0000
> 7 ofpart partitions found on MTD device pxa3xx_nand-0
> Creating 7 MTD partitions on "pxa3xpxa3xx-nand x_nand-0":
> 0x000000000000-0x000000500000 : "u-Boot"
> 0x000000500000-0x000000a00000 : "uImage"
> 0x000000a00000-0x000000f00000 : "ramdisk"
> 0x000000f00000-0x00000d800000 : "image.cfs"
> 0x00000dd00000-0x00000ec00000 : "rescue firmware"
> 0x00000ec00000-0x000010000000 : "config"
> 0x00000d800000-0x00000dd00000 : "reserve"

and this with 4.16.1:

> nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
> nand: Hynix H27U2G8F2CTR-BC
> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> marvell-nfc f10d0000.nand: Timeout on CMDD (NDSR: 0x00000080)
> marvell-nfc f10d0000.nand: Timeout on CMDD (NDSR: 0x00000280)
> Bad block table not found for chip 0
> Bad block table not found for chip 0
> Scanning device for bad blocks
> Bad eraseblock 1854 at 0x00000e7c0000

I have tried 4.19.161 and 5.4.83 as well but my /dev/mtdblock1-6
devices keep being missing.

What do I have to do to turn them back on? Do I have to modify my dts
file for the new driver marvell_nand?
https://fox-exe.ru/WDMyCloud/WDMyCloud-Mirror/Developing/kernel-4.15.0-rc6/armada-370-wdmc-mirror-gen1.dts

I've read whatever I found and do not know how to continue here.

Kind regards
David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
