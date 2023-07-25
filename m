Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EFEC001E0
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbl9OZyJh23zqP+W2ZqbK09O5hDxJcxwCFroaK45HLk=; b=tXTGgWa4YAzDJq
	yfmhJSf9de8COiBFDyuXK8Zw/evLRbo3CthLuitqgDhZHf1X10QpoSIz8dB72dsYH/s4fkDQU1mLW
	0mUheHHi9zyMuO6da86lKDrf0CzEDWh0R44fJpeyIzfnFsc4wTJb9MOJ2eW3WmoYeGjyVWjxOlAnr
	tZllO/GkXHPf7iMQZnU/G6ixCR2MdbqZkCAd1DiSVUCxP8BcifKLsTnsPaS3gtCpsrbv8rGG3Ivf4
	sopAHlOa8hwtXfuf0877iJWmlPeUwDzlxIlUjzHFbdO5KjQShtk8gCT7Ex7xUnWV/t7Q5Rd4mfazr
	TXHetZJlhLkLTVmUGybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEEz-006tTh-2Q;
	Tue, 25 Jul 2023 09:22:01 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEEw-006tSq-1O
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 09:22:00 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-557790487feso3753544a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690276914; x=1690881714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NDdqggYqOg5jiiFwOG9e8I3AYYCUQ/HADaVlRVHBEps=;
        b=afe7d0omSde6LcICRaVk9l8YhTZuoDC33Z+8mjpgrbG7sQ+FuRhdZGXsx/8FoxVrkZ
         d82Lifv6TfTx/cGFrjZzJ7g/fuocj/HqRrXeb6daskusLgkgSJOS8rpaOFRjju43M4Yx
         h+31cAB6YyXgMYcoO3k2tgUkFm8XepeN1RuTnHVd0FOreQGp9OVWy7CDzx+Db+W/c7K7
         erYLAFLtGCfdTTqM0UeZG7XgVPvHa0g1Y5OLU00YvJNtz+NvTRZzMFQvjmYiCrXtWzNl
         QhNViwwwlXHNV5hTxRmDyaiTefinllvw+pLCVaEOvUywRATJj0SwLR1InGK5n7AwtAdM
         OSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690276914; x=1690881714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDdqggYqOg5jiiFwOG9e8I3AYYCUQ/HADaVlRVHBEps=;
        b=dGxOVNorIPiuxLjW3SZkC7p8YZFaJeKrctmMbDbSdrz6BGywoe/06duf950eby6DdZ
         +wTGPprUhZ1vcKbMrQ3s6QrdmcbfkFVwOseU6Ze46pGsn+BepBEnIZRJ31VQCnr4f8i8
         qwGMqqJKg9aIURWLOUU6l8UWq6/NZA+gRtOYXQgwocJG/CLh2zw6fqiDxMgD5031biGa
         m2y5aoarcM0SHyI0WbeLH3xiPHYqPmlEp0VjeF3Jj2Ny3GRV3WOvhYl3M5T9Doe1bBQ0
         NBmu18Ryn3E2YKcIgASEg91pzcUftaytogE9R/ckTNkNXtYNB8QmBmSb/5CqWj4sYov/
         CjBA==
X-Gm-Message-State: ABy/qLZ4qFSac1yoL5vOhEsIFbU4fwW9rJ0Sgy3IpFF2ntBEoTAxihNO
	WCyVZLGMQdu05XIgVAKYRa0FWgXEdo4WCIn1qt41wneJ
X-Google-Smtp-Source: APBJJlErP5jhTpQ7DhlzhpKyxr948dl6iTYQvBJfoWyfFOz8z/ETK3merD9Ji9d441F9yB4l+T/YCXDf5JId0e4n9c4=
X-Received: by 2002:a17:90a:9c09:b0:263:f583:a6a1 with SMTP id
 h9-20020a17090a9c0900b00263f583a6a1mr12103883pjp.34.1690276914175; Tue, 25
 Jul 2023 02:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <20230725022302.210275-3-jaimeliao.tw@gmail.com> <eb15e38a6bd4929c0afb41cf1c652d98@walle.cc>
In-Reply-To: <eb15e38a6bd4929c0afb41cf1c652d98@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 25 Jul 2023 17:21:14 +0800
Message-ID: <CAAQoYRkCPsfxEzRGJ+fdtztCGtC7PwAVEekTAdb2KYGhF39bHA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: add support for Macronix Octal flash
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_022158_476753_9C17306E 
X-CRM114-Status: GOOD (  35.28  )
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

Hi Michael

>
> Hi,
>
> > From: JaimeLiao <jaimeliao.tw@gmail.com>
> >
> > Adding Macronix Octal flash for Octal DTR support.
> >
> > The octaflash series can be divided into the following types:
> >
> > MX25 series : Serial NOR Flash.
> > MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
> > LM/UM series : Up to 250MHz clock frequency with both DTR/STR
> > operation.
> > LW/UW series : Support simultaneous Read-while-Write operation in
> > multiple
> >                bank architecture. Read-while-write feature which means
> > read
> >                data one bank while another bank is programing or
> > erasing.
> >
> > MX25LM : 3.0V Octal I/O
> >
> > -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7841/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf
>
> Link: tag at the end please. But dead. Redirected to "moved to a new
> home", maybe you
> should improve on stable links :) Esp. because you have the version in
> it.
Sorry, I will update links next version of patch.

>
> > MX25UM : 1.8V Octal I/O
> >
> > -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7525/MX25UM51245G%20Extreme%20Speed,%201.8V,%20512Mb,%20v1.0.pdf
>
> dead. I've used
>
> https://www.mxic.com.tw/Lists/Datasheet/Attachments/8967/MX25UM51245G,%201.8V,%20512Mb,%20v1.5.pdf
>
> There "For SFDP register values detail, please contact local Macronix
> sales
> channel for Application Note.". Could you please send me (privately if
> you
> like) the AppNote for the SFDP table?
Ok, I will contact with Macronix sales for this information and send to you
privately if it is available.



>
> > MX66LM : 3.0V Octal I/O with stacked die
> >
> > -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7929/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf
>
> dead
>
> >
> > MX66UM : 1.8V Octal I/O with stacked die
> >
> > -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7721/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf
>
> dead
>
> >
> > MX25LW : 3.0V Octal I/O with Read-while-Write
> > MX25UW : 1.8V Octal I/O with Read-while-Write
> > MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
> > MX66UW : 1.8V Octal I/O with Read-while-Write and stack die
>
> So the stack die information come from SFDP? Can RWW also be read from
> the SFDP tables? Do you have vendor SFDP tables where this information
> can come from?
For this introduction, it just introduce Macronix EPN naming rules.
As I know, rww didn't include JESD216D.

>
> >
> > MX25UM51245G : 512Mb flash, with Word mode data output format when
> > Octal DTR read
> > MX25UM51345G : 512Mb flash, with Byte mode data output format when
> > Octal DTR read
> >
> > Macronix Octal flash with two types, "byte mode" and "word mode".
> > Because of word mode flash with byte swap issue when Octal DTR read,
> > adding byte mode flash in this patchset only.
> >
> > About LW/UW series, please contact us freely if you have any
> > questions. For adding Octal NOR Flash IDs, we have validated
> > each Flash on plateform zynq-picozed.
>
> Again "us" as in macronix? but then, there is no trace that this commit
> is comming from macronix.
It is relate to Macronix mail issue, so we prefer send patches on gmail.
A question, how could I mention the commit is comming from Macronix if
I still send patch from gmail?

>
> > As below are the SFDP table dump.
>
> Thanks!
>
> > zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> > c2943c
> > zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> > macronix
> > zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> > mx66uw2g345gx0
> > zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx66uw2g345gx0
> > zynq> hexdump mx66uw2g345gx0
> > 0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
> > 0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
> > 0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
> > 0000030 0000 0000 0000 0000 ffff ffff ffff ffff
> > 0000040 20e5 ff8a ffff 7fff ff00 ff00 ff00 ff00
> > 0000050 ffee ffff ffff ff00 ffff ff00 200c d810
> > 0000060 ff00 ff00 7987 0001 1284 e200 04cc 4667
> > 0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
> > 0000080 0000 0000 0000 237c 0048 0000 0000 8888
> > 0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
> > 00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
> > 00000b0 7172 b803 7172 b803 0000 0000 a390 8218
> > 00000c0 c000 9669 0000 0000 0000 0000 7172 9800
> > 00000d0 7172 b800 7172 9900 0000 0000 7172 9800
> > 00000e0 7172 f800 7172 9900 7172 f900 0000 0000
> > 00000f0 0000 0000 1501 d001 7172 d806 0000 5086
> > 0000100 0000 0106 0000 0000 0002 0301 0200 0000
> > 0000110 0000 0106 0000 0000 0000 0672 0200 0000
> > 0000120 ee00 69c0 7272 7171 d800 f6f7 0a00 0000
> > 0000130 4514 8098 0643 001f dc21 ffff ffff ffff
> > 0000140 ffff ffff ffff ffff ffff ffff ffff ffff
>
> md5sum is missing and please use either xxd or if not
> available, "hexdump -C".
Ok, I will update content of SFDP dump with md5sum and
using xxd command.

>
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -179,6 +179,33 @@ static const struct flash_info
> > macronix_nor_parts[] = {
> >       { "mx66u2g45g",  INFO(0xc2253c, 0, 64 * 1024, 4096)
> >               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> >               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> > +     { "mx66uw2g345g", INFO(0xc2843c, 0, 64 * 1024, 4096)
>
> Please use INFO(0xc2843c, 0, 0, 0)
Sorry I didn't get it.

>
> > +             FLAGS(SPI_NOR_RWW)
>
> Maybe one of your proprietary tables indicate RWW capabilites?
As I know, RWW could be got on datasheet only for now.
So that follow the existing rule using FLAGS for it.

>
> > +             NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ
> > | SPI_NOR_OCTAL_DTR_PP)
>
> No NO_SFDP_FLAGS() for new parts.
>
> > +             FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>
> You should have a correct "4-Byte Address Instruction Table", therefore
> you don't need the FIXUPS_FLAGS.
4 bytes opcode flag could be get by parsing bfpt.
But I think it would be great if ID table include it as well.
Because of some flashes in market may not define SFDP table.

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
