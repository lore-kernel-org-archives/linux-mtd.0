Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F09C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:39:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA7E207D3
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RxxKdD1/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA7E207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gY0alvjFAUVyYQ6Q0qCD7je0OgtCLZ2BMgBQNBY6bIQ=; b=RxxKdD1/cxhYuq
	xL3pl0smh6P5nsCpl25+DtNuebuEoxcIYida67Au8vflv4TmiQQHisE7oDLuPu0D6Aol8jzWPuKqJ
	W6xWRBF6zaXck+kvDIe4Jtp4wBYIdFPQNT4PxoarTzArKJTMazLpnnCRb3LWpwvMxxKAWc9ZUziEL
	mQTxet45ry+E/GSSpBEkEW2MxLKFjtCAWYHZpL/eO1hPGYGY4xcKln6fCJriYvjlPgPkMX4XoXzSz
	y5v0pDzJIbVTdlotO3SVkM40pgZO99YOZHeX+AQxhBx8FHuSUNlQeoaxOiMFRgMSwakjL1LJY8KcU
	M8N0mZ7KAoFVrDK2+8Bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJgM-0007uc-Kf; Thu, 28 May 2020 14:38:54 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJgJ-0007u7-5S
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 14:38:52 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id E422580307C0;
 Thu, 28 May 2020 14:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MN5UivzRgvTa; Thu, 28 May 2020 17:38:48 +0300 (MSK)
Date: Thu, 28 May 2020 17:38:47 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH RESEND v2] mtd: physmap: Add Baikal-T1 physically mapped
 ROMs support
Message-ID: <20200528143847.vd7b434xtgiaobv4@mobilestation>
References: <20200526225849.20985-1-Sergey.Semin@baikalelectronics.ru>
 <5f5fc883-1cf0-f0b8-11bb-a60b45d135cd@ti.com>
 <20200528104245.jurucbblufluyjut@mobilestation>
 <0a9160b6-f915-2a2b-582f-3e6d657ca7df@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a9160b6-f915-2a2b-582f-3e6d657ca7df@ti.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_073851_388641_E47A646A 
X-CRM114-Status: GOOD (  12.96  )
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
 Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
 Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
 Arnd Bergmann <arnd@arndb.de>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 28, 2020 at 04:35:41PM +0530, Vignesh Raghavendra wrote:
> 
> 
> On 28/05/20 4:12 pm, Serge Semin wrote:
> [...]
> >>> +
> >>> +static map_word __xipram bt1_rom_dummy_read(struct map_info *map,
> >>> +					  unsigned long ofs)
> >>> +{
> >>> +	map_word ret;
> >>> +
> >>> +	ret.x[0] = 0xFF;
> >>> +
> >>> +	return ret;
> >>> +}
> >> Why define dummy_io for "baikal,bt1-boot-rom"? I don't see any use of
> >> adding a driver that always reads 0xFFs
> > This is supposed to be temporary solution for the baikal,bt1-boot-rom ROM.
> > The Boot ROM mirror might reflect either an embedded firmware or the SPI flash
> > directly mapped into the memory. In former case there is no problem, we can
> > freely read from the Boot ROM region. But in the later case the mirrored region
> > (memory mapped SPI flash) is not always accessible. If normal Boot SPI
> > controller is enabled, then the SPI flash mapping isn't accessible (any attempt
> > will cause a bus-error). In order to fix this we'd need a mutual exclusive lock,
> > which would disable the SPI controller while the mirrored memory mapped SPI flash
> > region needs to be accessed. Such mechanism isn't currently implemented, but it
> > will in be in the framework of my patch created for the SPI subsystem.
> > 
> > My idea was to just provide a dummy callback for now and replace it with normal
> > IO-methods with mutual exclusive lock-unlocks when the corresponding SPI driver
> > is accepted.
> > 
> 
> Yes I understand, but I don't see any advantage for end user by
> providing dummy calls... So please don't add the callbacks until they
> implement proper functionality

Agreed. I'll remove the Baikal-T1 Boot ROM support in the next version.

-Sergey

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
