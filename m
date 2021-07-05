Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510B7C07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 10:46:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C67461447
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 10:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C67461447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zOawSj1oZWP9iI0sNuVzyNr7Y6vRK/Blp7tksBNBjA=; b=0M2mi9CDIh8a/P
	3uLtdOzhAACNJ7GCDQ6NMdrEiIf1J090WrMMy+6AAC3Dvn7HJjxldi4EYUeCYvwuOZBHvmB9NkHmo
	zoCDazJ2S5IURsHdK+USjqm7w6EPt4fNGSShgUdgnQieaDFbPc0coEy9l2/YJ9/J+XmKfT9/67BMZ
	CozRb9qeXS1/rqX6AZ0i4uBjnef4B/OQsWl/+vuC3zvybcgwin8/00nzjVlP0M6k5fEpbUKrV1W4b
	w0NEFlFfIGKnV2nj60yh93sCtZVuwL5o64GIOui0PaJ96IA43sDByNoyaFrr2UqhICfEresA7tU5H
	RYHXg3rL+uEDqCPEnUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0M6I-008clW-EZ; Mon, 05 Jul 2021 10:45:18 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0M6F-008ckD-7d
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 10:45:16 +0000
Received: by mail-io1-xd33.google.com with SMTP id k11so20453330ioa.5
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jul 2021 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w8Xblt9NaBjcmBmd6B/TFND1ewdPeKz3XkbxnzhanDM=;
 b=biMuT8lqLypg67qyWslPIDZpIqsbJRvxMw7diAqXPG/DcFd/EKZZ18dlopkO+M7knh
 ntAgOisP4mZ937fwLtmLAXilX+yED++dR2o4v+vWs/TM1TtiNoy4XQqaen7WnJ0CQ5NH
 sMpSzAHLvavRNZBMdW4DUYwTeEWhW6Ah7Bu1F77kBUx6niG0XYw0WmJpEP4weAl2s0Jm
 FgUarxJ3zd7XJcdWOp7RCkzWMq4iA8kCUPUj/8fSWHscCBRn2YVW8ze6lcpfr7fkZP8/
 bppnW9z3ZM2xX290krVnjJj7BRkL6NDW7HR9Xq1qskLHlQ743KoNL9NQoE7HQL6VZaYt
 bOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8Xblt9NaBjcmBmd6B/TFND1ewdPeKz3XkbxnzhanDM=;
 b=PAai0ELIIPfmtQ/1BwquDT17FWANkIuDai8dumY3Me5TFzt3BHq8WW+RmsV0bahR8P
 XaI+r19Hsvd10ihGcVRp2bAMQqSqRSN7RzsvGueBpHuCW2vFf3HbGMXb3q9LJPU5Ttnx
 cSGufcJiepmq4zuALialLPZbAWm8I8EDudOVY5KaXOImJ35yL/WmJ6sl3TXG2XUGYAI5
 FIrVCpoyKoR9brCgnshrCDNqRgwNhGgLZuML5SbK2H5sG6JtHaTt2VeBae03AjANL81K
 RDLWzvKnwAxu03lTgWRoVu5n9cbavQR3P6l8mp5BaBrb2KCpjJIOTK6Q26MGil2jiNNN
 SryA==
X-Gm-Message-State: AOAM530P8DbOc4R/DW3zGCkzvFjmMNYWbJTBG45aO6fZwxJ7LA0UoiMN
 BHBYja6AzPMpIIctM3mY3OQHmlVAoz8N35pE2iw=
X-Google-Smtp-Source: ABdhPJzAYBI/BH1xJ+kMG5+JtiPu0RIt3LTUgynO8SeX9ZcqRk163vdOw76mON799y3Y8g3fm7hkTIAoeykCrKiZ0m8=
X-Received: by 2002:a05:6638:ac3:: with SMTP id
 m3mr11706353jab.97.1625481914376; 
 Mon, 05 Jul 2021 03:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-5-tudor.ambarus@microchip.com>
 <25fd3d28-6320-98fe-b0e4-8caa16c3d357@microchip.com>
In-Reply-To: <25fd3d28-6320-98fe-b0e4-8caa16c3d357@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 5 Jul 2021 12:45:03 +0200
Message-ID: <CAEyMn7ZjBPOcfJ7i3b01Oi-VxrVrK=m0UwfOYeD6sU9t0gAM2A@mail.gmail.com>
Subject: Re: [PATCH 4/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
To: Tudor.Ambarus@microchip.com
Cc: Michael Walle <michael@walle.cc>, vigneshr@ti.com, p.yadav@ti.com,
 figgyc@figgyc.uk, 
 mail@david-bauer.net, linux@rasmusvillemoes.dk, esben@geanix.com, 
 knaerzche@gmail.com, code@reto-schneider.ch, zhengxunli@mxic.com.tw, 
 jaimeliao@mxic.com.tw, macromorgan@hotmail.com, sr@denx.de, 
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_034515_348642_D492B37E 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Tudor,

Am Mo., 5. Juli 2021 um 09:51 Uhr schrieb <Tudor.Ambarus@microchip.com>:
>
> On 7/2/21 5:41 PM, Tudor Ambarus wrote:
> > +     { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
> > +                           SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
>
> I should have removed SECT_4K, since 4k erase should be set when parsing SFDP.
> If SFDP is wrong, we can amend it in the post_bfpt hook.

But what about the 4K support for the "old" mx25l12805d that does not
support reading SFDP? As far as I understand, the post_bfpt hook is
only called when the SFDP was successfully read and this would mean
the "old" one would never get this setting.

> Heiko, can you test 4k erase with SECT_4K removed? Also, would you please dump the
> SFDP tables using Michael's sysfs patches? They were applied. Every new flash addition
> should have the SFDP tables dumped in the patch's comment section, under the --- line.
> I don't have the flash, so I'll need your help.

Nevertheless I removed the SECT_4K entry from the info table. After
that the correct value still was set due to the parsing of the SFDP
data.
# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
.0/mtd/mtd0/erasesize
4096

And here is the requested dump:

# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
.0/spi-nor/sfdp | xxd -p
53464450000101ff00000109300000ffc2000104600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
ffffffffffff003600279df9c06485cbffffffffffff

Thanks
-- 
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
