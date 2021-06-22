Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D57C2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 11:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87931613B2
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 11:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87931613B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boJf8DxEqEEZLvMAT8/s/BMv9aieW+VUI6j7mjuiddI=; b=mRHf7rICBgh8gVwO/+IyRusIuB
	yGcyq/5N4rmRaBkqluWWBriR51cYOyVJ14dUdCPNdyhx6/vUnAFcWaHuKO71ZXUzX9yix2n0H1ga4
	DhpqRh/6Z/qSIF+p0nIsF7OUtH2gk4ezYZDv4i9SCB4D1P1ei2wmI+rapg5B7dTHgLbpMhPOfKuW0
	JmHR9wKdiRg0RGpCJRn44SNO7/WKo7kAlSwFpzAnrkbHlmsLHAqgwszyLntNRAyGE4QZrM/gobMLB
	M08dT7sgSoXr3A6DrCmWl9gy3n1qK8Ic2QHLaH69tARjMO+6DDa+wMHmmABm4lrBcgtwnbO9qgs9q
	gcUxsqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvf1j-0072hr-Kv; Tue, 22 Jun 2021 11:57:11 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvf1g-0072fq-Ap
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 11:57:10 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4E2422224B;
 Tue, 22 Jun 2021 13:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1624363022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cW9h5DpBp2GZE/dsC+UBUW7ysGWDsL3QGU2yDtMlmus=;
 b=SLcnPRPI/Opz8E0XbrxIDkbvtIafbj1EBQPzY8au0k8lMxdichOhxwNUB5PRA8h9DQ70/P
 3iHryxJZioyWa7Fwx3srHBjbFezv0en/11Ee04M8QHJ/624mLet6VnvhygnofN3PRUwZ64
 KpHWCxYf5cKQOndY1yeanQWEzXKyWBE=
MIME-Version: 1.0
Date: Tue, 22 Jun 2021 13:57:00 +0200
From: Michael Walle <michael@walle.cc>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-mtd@lists.infradead.org, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, linux-kernel@vger.kernel.org, Esben Haabendal
 <esben@geanix.com>, Zhengxun Li <zhengxunli@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, masonccyang@mxic.com.tw, ycllin@mxic.com.tw
Subject: Re: [RFC 2/3] mtd: spi-nor: core: compare JEDEC bytes to already
 found flash_info
In-Reply-To: <20210621152320.3811194-3-linux@rasmusvillemoes.dk>
References: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
 <20210621152320.3811194-3-linux@rasmusvillemoes.dk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <223232ecd0865e819477f17cd464ab08@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_045708_794784_48EC98DD 
X-CRM114-Status: GOOD (  21.63  )
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

[+ some people from MXIC as they are ones who posted to the ML
lately. Feel free to forward this mail to the corresponding people.]

Am 2021-06-21 17:23, schrieb Rasmus Villemoes:
> Macronix engineers, in their infinite wisdom, have a habit of reusing
> JEDEC ids for different chips. There's already one
> workaround (MX25L25635F v MX25L25635E), but the same problem exists
> for MX25L3205D v MX25L3233F, the latter of which is not currently
> supported by linux.
> 
> AFAICT, that case cannot really be handled with any of the ->fixup
> machinery: The correct entry for the MX25L3233F would read
> 
>         { "mx25l3233f",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K |
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ ) },
> 
> while the existing one is
> 
> 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
> 
> So in spi_nor_init_params(), we won't even try reading the sfdp
> info (i.e. call spi_nor_sfdp_init_params), and hence
> spi_nor_post_sfdp_fixups() has no way of distinguishing the
> chips.
> 
> Replacing the existing entry with the mx25l3233f one to coerce the
> core into issuing the SPINOR_OP_RDSFDP is also not really an option,
> because the data sheet for the mx25l3205d explicitly says not to issue
> any commands not listed ("It is not recommended to adopt any other
> code not in the command definition table, which will potentially enter
> the hidden mode.", whatever that means).

Maybe we should ask Macronix if it is safe to send the RDSFDP command.
Can anyone from MXIC comment this?
This is also interesting because we are discussing reading the SFDP
without reading the ID first.

Of course this will not save us from two different devices sharing
the same ID and both having no RDSFDP support.

> In order to support such cases, extend the logic in spi_nor_read_id()
> a little so that if we already have a struct flash_info* from the name
> in device tree, check the JEDEC bytes against that, and if it is a
> match, accept that (device tree compatible + matching JEDEC bytes) is
> stronger than merely matching JEDEC bytes.

This won't help much without a proper dt schema. No in-tree devicetree
could use is because the DT validation would complain. So if this will
go in (and the maintainers are rather hesitant to add it, I tried
it myself [1]), you'd also need to add it to jedec,spi-nor.yaml and
get an ack from Rob.

> This also makes initialization slightly faster in the common case
> where the flash_info was found from the name and the JEDEC bytes do
> match - it avoids a second linear search over all known chips.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

-michael

[1] 
https://lore.kernel.org/linux-mtd/20200103223423.14025-1-michael@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
