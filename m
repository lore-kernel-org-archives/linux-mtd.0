Return-Path: <SRS0=evNl=NZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26818C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A1660FDC
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30A1660FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSSvXcTlr+yY3MSzUNL/H9Le3/kMUZrTtf2J6OPTj4I=; b=2MO0dBr9hxtwtou4QYC74z1A7S
	mhROPW73AikzyagGXsDj1arP7y/rS9eL0Ef4hgA3/slWzOYuQxlxme1t1QaEqvCPJDC+esrw9LAHH
	rgtq9MTTDEcfLSsS4eKcacLQSfLEpVZ/lINZ9fW/xaCPwq4oRJnoHKCh/AI6/65h9Vqu/l4nkoDO5
	HtIjsdyUe4dBgZ5iyA+djw1LahBXpY7i1LFfb+lgqY0eae7T7DzyJSXuy1PrQResyzfkiVaM7Hfth
	wPtVncgcF5LooafLaqMOwzYNSorrgHKKneiCDFSGxajeqRhUPyHqcqr3eYFcCGlxuh7JbudpDf5Y1
	DSLTdYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM7fd-00BpF3-2q; Fri, 03 Sep 2021 11:47:45 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM7fT-00BpCl-1V
 for linux-mtd@lists.infradead.org; Fri, 03 Sep 2021 11:47:36 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A045022205;
 Fri,  3 Sep 2021 13:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1630669650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TIPw+8GjiPG4C5PCTRG+FeBYw9sL+9OSm0iYayZZSNw=;
 b=WGXdV57HuKudCZWXWNPsTWvTIlZ2D+1pSI12Tv7me1slnKFxJmnrGoiTU2LixULUSIASpG
 kMuhQbrtdgiH1d2fvX5w1aKduhguRAoDjMzQSRr5UeZ0t6Mzj1axe+PrpFUNA0Q9NDatL9
 9Aq4THFiUR0Bw+qg2udRqrWnDIcNGMg=
MIME-Version: 1.0
Date: Fri, 03 Sep 2021 13:47:29 +0200
From: Michael Walle <michael@walle.cc>
To: Andrea Zanotti <andreazanottifo@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: micron-st: added support for np8p128ax60
In-Reply-To: <CAGiusB29O+sNn9j2U9-VG0QV=9npUuWV=d5_sLyqD54SRgq9qA@mail.gmail.com>
References: <20210831081329.27420-1-andrea.zanotti@tyvak.eu>
 <3462300528bbe71207ef2164411e34d2@walle.cc>
 <CAGiusB1JvHkX7GSvD2JsqKWwC5xBePX_ruWk9nU9gugoroLnKA@mail.gmail.com>
 <CAGiusB0B5dN_K+bW1xudmT6UNmVOL=voBOuSVJeiYo3v6ywO8w@mail.gmail.com>
 <4bf9396505975e3fee2cc6396a6eeff7@walle.cc>
 <CAGiusB29O+sNn9j2U9-VG0QV=9npUuWV=d5_sLyqD54SRgq9qA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0719218e274bdffdf76b8689072530d3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_044735_302939_2CC5E2DD 
X-CRM114-Status: GOOD (  21.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Andrea,

Am 2021-09-01 13:20, schrieb Andrea Zanotti:
> I performed the test with drivers/misc/eeprom/at25.c.
> 
> I configured the DTS as such:
> spi_pcm@0 {
> compatible = "atmel,at25";
> reg = <0>;
> spi-max-frequency = <50000000>;
> size = <16777216>;
> pagesize = <64>;
> address-width = <24>;
> label = "micron_pcm";
> };
> and activated the driver itself in the kernel configuration.
> 
> I think the system is recognizing it:
> # ls -l /sys/bus/spi/devices/spi0.0/eeprom
> -rw-------    1 root     root      16777216 Jan  1 00:01
> /sys/bus/spi/devices/spi0.0/eeprom
> 
> However, if I am not wrong (again, please correct me if I am wrong)
> this driver does not
> work with the MTD layer (I am booting with the following cmdline 
> bootargs:
> mtdparts=micron_pcm:128k(bootstrap),128k(fdt),10M(kernel/rootfs),-(spare)
> and I expected to have the same partitions as before, but of course
> they are missing.)

You are correct, there is no mtd layer for an eeprom device. If you
need the partitioning, the at25 won't work.

> I am checking the Company ID on the document "JEP106BC", revisioned on
> June 2020,
> downloaded from here 
> https://www.jedec.org/system/files/docs/JEP106BC.pdf.

Btw theres one from Feb 2021, but it doesn't really matter.

> STMicroelectronics should be 20
> Micron should be 2C

which matches the micron_parts[] and st_parts[].

> Intel is advertised as 89, in Table 1 "Manufacturer's Identification 
> Code".
> 
> How do you suggest to proceed?

I'm not sure, it this flash was originally made by intel or if its a
mistake. If its made by intel it probably should go into intel.c

Tudor is working on a larger patchset which addresses flash id
collisions [1]. If it is a mistake, then it should probably go into
the new collisions table which is introduced in this patchset.

Btw. AFAIK new flash additions are delayed until that patchset
is merged.

[1] 
https://lore.kernel.org/linux-mtd/20210727045222.905056-1-tudor.ambarus@microchip.com/

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
