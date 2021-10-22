Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD9CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:02:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EFC961052
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EFC961052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJaWTGjRs96flmJaItbCjSiQB/ISVjZ0kGXKOtTXZw8=; b=CLzm2jQzZaCW5if2LPf/Ht2V5J
	jHAYxMvoKtX64QbGxIwQHV+jOF52KdNR2pwJ5FqM0YJMaYOm18gMDN1FpUJZpodG3Pw5BfPF/uWwS
	67wY43KqW70oqmc3k0QTKdLWlj8G5FvTjZIoCSkL8um8YiVM4wlhaTX6X/uMIKN1UughfSYwal/qL
	lQ0ZeNQzq0upjwtutQTleU9b0fHTrNQ/hBL36M91eJiVT+fhHrSeK17cWnrpXCERe5+G73bKIRWeJ
	LZfggHRPvINyfez9t7y0QzIlAZL9b8DRryeOUSS8wZyGfd01IrF1IQ53YF3BMBoTRGgsxPnJ18yah
	0B7qH8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtFV-00AkJe-SW; Fri, 22 Oct 2021 12:02:14 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtEx-00AkB0-Sj; Fri, 22 Oct 2021 12:01:41 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BE094221E1;
 Fri, 22 Oct 2021 14:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634904096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhiVqGqa0ytdgEyzH7Oi0o/maMbcrwGvXZyeC1cWWUQ=;
 b=th7DLnnLKhiaf/s28emEx+ra3sqw9K/sQidtVaAWFRh6FZH+S1lTNAP4TLVOiBi0+VParZ
 8p4rRix9oN+2lCujubqQaiLdgOuLel4r6qRrzT3joSt981WnZ/pX1w8orrsln5F165tuyv
 PQOJU4RTNHC5nPqjG7OR/EIpSu85xsk=
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 14:01:35 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 23/35] mtd: spi-nor: Get rid of nor->page_size
In-Reply-To: <20210727045222.905056-24-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-24-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <585e8c1efafd4220f3b3e09c2396417a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_050140_116804_CE99F052 
X-CRM114-Status: UNSURE (   6.71  )
X-CRM114-Notice: Please train this message.
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-07-27 06:52, schrieb Tudor Ambarus:
> nor->page_size duplicated what nor->params->page_size indicates
> for no good reason. page_size is a flash parameter of fixed value
> and it is better suited to be found in nor->params->page_size.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

..

>  		/* Flash in Power of 2 mode */
> -		nor->page_size = (nor->page_size == 264) ? 256 : 512;
> -		nor->mtd.writebufsize = nor->page_size;
> -		nor->mtd.size = 8 * nor->page_size * nor->info->n_sectors;
> -		nor->mtd.erasesize = 8 * nor->page_size;
> +		page_size = (nor->params->page_size == 264) ? 256 : 512;

weird stuff.

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
