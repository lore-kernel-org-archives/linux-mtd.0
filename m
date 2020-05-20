Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C61C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 10:23:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E12E207C4
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 10:23:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgiYtZ+W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E12E207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrckXl1TJEPEcYzFHeoD4dGjzPze19MF1jbPrhBY4zY=; b=rgiYtZ+WF04/3K
	SvYX3R5yGCfct0C5o60GP0HMX/5jyEZ3dxrbVjC0U9mDAQCigXtvmsPdZvpo36ojLPbyqon3vP6s2
	Qzh5dLYw4I+oVHa4EZMDxftnoDeYHezUzBnBtkvEnbDyPJCwwtbH1oNz8axF7RkhFmxCh1yIt9GJa
	2IOFncyWQRr9d1YKf1yuH3IiQoUnZLgaNkOMVbZolDItAC6CmRrf8ZrSTsamtn/IPrnAhNiTox8dk
	gjv3n57VBT9YFQApJYY+RnCgWb/XPYNXtNP4W62bE51aqbOmqzUQPHtZdnpncFgRf4LCq6cxANLHV
	dZhc8gnZ2PlwBt7WOumQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbLt3-0006Vp-JH; Wed, 20 May 2020 10:23:45 +0000
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbLrU-0004za-KQ
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 10:22:10 +0000
Received: from belgarion ([86.210.245.36]) by mwinf5d33 with ME
 id gyN52200D0nqnCN03yN647; Wed, 20 May 2020 12:22:06 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 20 May 2020 12:22:06 +0200
X-ME-IP: 86.210.245.36
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] ARM: pxa: remove Compulab pxa2xx boards
References: <20200513170132.1446-1-robert.jarzmik@free.fr>
 <CAK8P3a3E=Fq6ZXLkeQgufeJCP0gZiN1uXA2J=HzpH3D49GOMXQ@mail.gmail.com>
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 20 May 2020 12:21:52 +0200
In-Reply-To: <CAK8P3a3E=Fq6ZXLkeQgufeJCP0gZiN1uXA2J=HzpH3D49GOMXQ@mail.gmail.com>
 (Arnd Bergmann's message of "Wed, 13 May 2020 22:39:59 +0200")
Message-ID: <87h7waoqin.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_032208_997726_32650B57 
X-CRM114-Status: GOOD (  20.62  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, igor <igor@compulab.co.il>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Mike Rapoport <mike@compulab.co.il>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Arnd Bergmann <arnd@arndb.de> writes:

> On Wed, May 13, 2020 at 7:01 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>>  CONFIG_MACH_EXEDA=y
>
> CONFIG_MACH_EXEDA should be removed here as well, it refers
> to part of em-x270.c
>
> Similarly, the whole em_x270_defconfig can be removed.
Certainly.

> Now arch/arm/mach-pxa/include/mach/io.h is unused and
> can be removed.
Yes.

> With MACH_ARMCORE gone, the MTD_NAND_CM_X270 and
> PCI_HOST_ITE8152 become impossible to select, and
> a part of PCMCIA_PXA2XX (pxa2xx_cm_x2xx_cs.c) becomes
> unused.
>
> FB_MBX can still be selected, but there are no boards defining
> the platform data any more, so I'd like to remove that as well.
That should be dealt with another time, sorry.

> MACH_EXEDA here is also obsolete, and I'd probably want to
> update the SND_PXA2XX_SOC_EM_X270 dependencies in the
> same patch.
Yes.

>
>> -static struct spi_board_info spi_board_info[] __initdata = {
>> -       [0] = {
>> -               .modalias       = "rtc-max6902",
>> -               .max_speed_hz   = 1000000,
>> -               .bus_num        = 1,
>> -               .chip_select    = 0,
>
> Another last reference, so we can remove that the corresponding driver.
Another patch serie for this as well.

> Same here, there is still one more user left (MACH_ZIPIT2), though
> at some point that might get removed if we decide to drop the handhelds
> with 32MB RAM or less.  That is probably something to be left for
> another time, but I see that pxa_defconfig produces a 9.5MB kernel
> image, so this is getting rather tight, and 32MB wasn't much when this
> got added in 2010.
Yeah, but no PXA user would ever use the pxa_defconfig kernel :)
A typical kernel for a PXA board is right now around 4MB, which is very tight
for 32MB platforms, and just enough for 64MB ones.

Cheers.

-- 
Robert

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
