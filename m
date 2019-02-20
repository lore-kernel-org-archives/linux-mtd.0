Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CCFC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 07:52:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B992C2083B
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 07:52:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c2pkjEsX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B992C2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4Htvgu2p+YlLY8dwsbv2oUFRLOrBU4Y9OwKbLmuNTI=; b=c2pkjEsXfwJEYj
	UerdTpgQ9HzVwB1zIk5Z+NM+xehfLqzMopw78Mku/wUX8vyJiwdK66TfL4/hYSRlxiV6zMZkLt4ph
	nzTsREJIlIrjjjy5rG0OU4U2+nbu3IppxxDtVBKx+wP/OKv+fZcmVV6dz7ORSoiwXZuEZ216v/H1A
	Jz+JYQpb0kxXU6dB5UVwcmBwKBaDXbSlQhtfSn+zjBn9xGrCOrmzQEHuOxnZwOp9qyK2zeR4beS/p
	CeLuIMeEGiqKnN/HXD7yRIDg8oVSI7vwVNHwQLeOBFB5aNEDVTC1qC/SqJM5sCByeZCxGV+6Rm3Sh
	vZoXkolE4VDyQuK3NOqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwMgA-0006cL-NT; Wed, 20 Feb 2019 07:52:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwMg6-0006bY-MW
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 07:52:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7D289260F7F;
 Wed, 20 Feb 2019 07:52:23 +0000 (GMT)
Date: Wed, 20 Feb 2019 08:52:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: mtd: mchp23k256: How to follow a more generic approach?
Message-ID: <20190220085219.573b5051@collabora.com>
In-Reply-To: <d58a384a-7b43-931e-8ed9-0ad4cbf83628@kontron.de>
References: <21e1b97c-0f90-1cf9-cd93-e9785adb1856@wago.com>
 <caa1f926-e50d-a851-8412-6b20c10942ec@kontron.de>
 <782d297a-a030-08c9-702e-c1ba2b3e6626@wago.com>
 <d58a384a-7b43-931e-8ed9-0ad4cbf83628@kontron.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_235226_865318_FFAF75F3 
X-CRM114-Status: GOOD (  17.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "Heinrich.Toews@wago.com" <Heinrich.Toews@wago.com>,
 "Oleg.Karfich@wago.com" <Oleg.Karfich@wago.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 19 Feb 2019 14:47:08 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> >   
> >> The instructions seem to be very similar to EEPROM and SPI NOR devices.
> >> So I'm curious about what others propose how to support these devices.  
> > 
> > I'm planning to write the driver for the ANV32AA1W during the next weeks
> > and it would be really great to have some feedback on the approach here.  
> 
> Maybe you can create a new generic SPI RAM driver (I don't think 
> something like this exists yet), that can be used with things like SRAM, 
> nvSRAM, FRAM, etc.?

Creating a new framework makes sense if you have enough to share
between all those drivers. I might be wrong (didn't look at the code)
but I think SRAM devices are simple enough to not require a new
mid-layer (especially if they use a different cmdset). What we could do
though is group them in drivers/mtd/sram/.

> 
> At the time when a generic driver exists, we could use it to replace the 
> mchp23k256 driver.
> 
> If you write a new driver or convert an existing one to support the 
> nvSRAM chips, please use the SPI MEM interface (drivers/spi/spi-mem.c). 
> This would enable us to share some code and connect those chips to all 
> kinds of controllers that support this interface (which are not only 
> generic SPI controllers, but also some QSPI controllers, that don't 
> support generic SPI transfers).

Yes, please use the spi-mem layer (note that I already started the
conversion of at25 here [1]).

[1]https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1904223.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
