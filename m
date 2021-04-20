Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B9AC433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 08:46:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785196101D
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 08:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 785196101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jpdrLRcAxxoXu6A92feYeSPzrw3v4IEAY9239p35cYg=; b=MaM87rGanub9/PMIw15oNEVH2
	ckMWPCOTlSSx5Hwubiy7B97iXiFCFu3o8F+1Xlwy9LUJOlnl9NBfTl4IQ18FbbZK4gDZpmVxIU1JZ
	WeBr336CsE0iXk9fVAYjSwan8/6JvsONErFbHQV3nvSFCROZZ8GnSouMFZ28YzSYDpXFxxHV8Jidq
	uVUkvdq79H3KC2BaVLP8weNEcCHRglQxK37i8xEt83FnwZCMxidkKl3B0pDopHeo0AyLN5RXsG4tO
	7qrAXgvzxY6qJfU61pvTPlrbq/tawoih1u0tG3FTzA/qZFzf4fsQWi7ctUcZyh/FbrERDber4/3f1
	6TrqNyWSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYm0I-00BcfP-67; Tue, 20 Apr 2021 08:45:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYm0E-00BceZ-6S
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 08:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=LtsNqLB84zmPNRMPS8b/A2tWnCC5xXDi+/H28iNIt2I=; b=xifzcQO8QFC2bnQ5y6SioaVkeC
 yqcyOaZyvkuwylJ666mwLIw4bxPNTR0e47/hFuTf3lE0BogP687917KtsexVFDmP+LCh4ja5TCEjf
 /43VfsOl0GcE3hP7kC+Jg/ddZ3GFofVaVpB4snW+NI0HbAY3Hgf6Yk+xmz/S2wD1LSO8v18IuGdqp
 GL9D7TJnQ0Z5TCHXknCVmOhza+CDj7CWi6dq5alYU+3OJ9FoEit0K2BVQ4QwA3p/k9oldB5LBRZcq
 dIvFY0kUzBTM0QTyf9O4/dD559SRVJrLRbkOgOc3AtF67+Ayxw15BmuisCiwWmcwfkOo4F5HHHxnD
 CGKISrYA==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYm08-00Bw78-K1
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 08:45:00 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E201922239;
 Tue, 20 Apr 2021 10:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618908287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtsNqLB84zmPNRMPS8b/A2tWnCC5xXDi+/H28iNIt2I=;
 b=PZbOyliTxaOK4pOrXS4q5h/7WqLgSrRGha/avZ081H7QznXdQoJNz+kBwd8oaqKvu6WRqp
 7m0/ige0VPSCRcIWNUrNtshhuuSPt4ugZY540uwMumnEC8g1g6ZMLSGH1Zy+aJWImAAHqW
 JDi+70HOrBy2ieyTQ+o5VbY3zqCNvCw=
MIME-Version: 1.0
Date: Tue, 20 Apr 2021 10:44:46 +0200
From: Michael Walle <michael@walle.cc>
To: David Bauer <mail@david-bauer.net>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: use 4 bit locking for MX25L12805D
In-Reply-To: <20210416162859.94305-1-mail@david-bauer.net>
References: <20210416162859.94305-1-mail@david-bauer.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1c9e57343a502c9dcc68977da783dd74@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_014456_976608_24613236 
X-CRM114-Status: GOOD (  17.07  )
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

Hi David,

Am 2021-04-16 18:28, schrieb David Bauer:
> Macronix MX25L12805D supports locking with 4 block
> protection bits in its status register. Add the corresponding
> flag in order to clear these bits when unloking the flash.
> 
> Otherwise, the flash might not be writable depending on the state
> left by the bootloader.
> 
> Tested-on: Ubiquiti UniFi AC Lite (ath79)
> 
> Fixes commit 62593cf40b23 ("mtd: spi-nor: refactor block protection 
> functions")

Strictly speaking, this is not a fix, because there was never
locking support for macronix flashes.

This should also be in the subject, it should rather be "enable locking
support" or something similar.

Btw. these bits are non-volatile, so if your bootloader will set
them again, depending on the flash and your reboot cycles, they might
wear out.

> Signed-off-by: David Bauer <mail@david-bauer.net>

With that:
Reviewed-by: Michael Walle <michael@walle.cc>

-michael

> ---
>  drivers/mtd/spi-nor/macronix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index 2d39dd32a64e..ed8b56a0102f 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
>  	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>  	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> -	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
> +	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K |
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>  	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>  			      SECT_4K | SPI_NOR_DUAL_READ |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
