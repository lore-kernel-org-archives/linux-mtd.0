Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A125C4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9BlzJSkh7owfEJRL1StAtVLtiaX8eB3CgsLVME+r+A=; b=R+IYWLMEr/sQk60QRzpmZAxGtb
	Pbnkojskj45CUALhvlih/Z1/4Nr87e/qfiU1jFanEajzsnakEGLDUnZIw1Oa9zHK+uyp5msQQEenr
	NUbNL94Yd0XLHfhdwGMy6hQs1V0SOqTpXFGeY/Qtul23yEyCoqf5O51cyB9cOhRtWy99Ive2oXXxD
	Vo9gbWOumw6flVf5hI9bmERxzWGMS8C4IpsdHhteHzOpzMsd8pgvIQf1DheazoZdj4pOthmmIu8ER
	7Mttu7OkilSqfZewKxbNfKPJXpyigusuPtbDzlWbzywP1ksiki/2yu2thLMis8tj5rBH0xXPNPTou
	gozmyyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7v8I-004q3H-0g;
	Tue, 28 Nov 2023 10:15:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7u7c-004gME-2D
	for linux-mtd@bombadil.infradead.org;
	Tue, 28 Nov 2023 09:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ntqosi7UP2Do89QUaBtdH8dZHNZj7id7/4zX8GPlxF8=; b=edXbW4QlV/yTrlLHfoBIokwNbO
	0SfR9rq9suBSZIro5O2Dg3sp1YQzThI89TiQA2oimrVjDkAtnBud5AnTrDDPs0O+oeTQVR3de32X8
	df3qwSnJrKKOX+FUBS2HmlRW3bEM6DmgZS28+WhkZHXss6dQYkD+r18FeB+NY5VWIyOXhQIsrXpZD
	LPK5F4cZCCjvmJMyTcmmDezhGFBuhVwhwHyH6nWcbRmFrns8QuXwRSahZJIYD8xuUhsNsJzP6HXw7
	CmPpM3aaUBBurdLS4Y9U20JQGzFSNZToTwMxCw9qzEHiV1ClKt42flSWJYvoLJs1XjAVinJtGD6q+
	b+dNBnlg==;
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7u7X-00GYzA-11
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 09:11:11 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AD0F96E;
	Tue, 28 Nov 2023 10:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701162654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ntqosi7UP2Do89QUaBtdH8dZHNZj7id7/4zX8GPlxF8=;
	b=zOcQi7qNp1g5i9Qydg1AuVFUJop7+nVIWhEfUCPeV3UeX/eYsQnjWILQVfO4bixDYqSwlt
	QEW4MONYK0AidoQy/cgHai6l5xrd1J8Ah8lcoEE+a2/tg7kVT0NGsOBzTfg8J/pfyTVTlD
	7jUKDNKRvTtk2IhRIkrhHLnm4kWaYnDfYckvr6gitOyHkasvUGL+mXi1A/EEQRfmzeVMcq
	8M0SNXQren7mQrlWTafTUJBQuds7vxfXVDSfGCL17e+lCFSZisusSWz0Lh9qnGt2qeBnay
	FBHA2zgvDxUROf/Y61tV8CXKhkv47bcNPELJ1icUXlmpRgWbHltFYq2n82qXkA==
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 10:10:54 +0100
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, jaimeliao.tw@gmail.com,
 jaimeliao@mxic.com.tw, pratyush@kernel.org, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: stop printing superfluous debug info
In-Reply-To: <20231128100313.3c990f69@xps-13>
References: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
 <42c96d63d1ea4f7e8f16a3c8eb0a4cf1@walle.cc> <20231128100313.3c990f69@xps-13>
Message-ID: <18ba4126dbd9e49846344b517ad2fbdd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_091107_521327_86E4175A 
X-CRM114-Status: GOOD (  24.26  )
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

Hi,

>> > The mtd data can be obtain with the mtd ioctls and the SPI NOR
>> > flash name can be determined interrogating the sysfs entries.
>> > Stop polluting the kernel log.
>> >
>> > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> >
>> > ---
>> >  drivers/mtd/spi-nor/core.c | 19 -------------------
>> >  1 file changed, 19 deletions(-)
>> >
>> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> > index 25a64c65717d..6de76fd009d1 100644
>> > --- a/drivers/mtd/spi-nor/core.c
>> > +++ b/drivers/mtd/spi-nor/core.c
>> > @@ -3517,25 +3517,6 @@ int spi_nor_scan(struct spi_nor *nor, const char > *name,
>> >  	/* No mtd_info fields should be used up to this point. */
>> >  	spi_nor_set_mtd_info(nor);
>> >
>> > -	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>> > -			(long long)mtd->size >> 10);
>> 
>> I'd lower this to dev_dbg() and print the jedec id. It might come in
>> handy for a quick glance during bootup if debug is enabled.
> 
> Ack. Although, your boot time will almost be unaffected if you don't
> print the info messages to the console. What takes the most time is not
> writing to the kernel buffer, it's to display the lines on a serial
> console, and dev_info() are by default discarded, you need to select a
> lower log level manually, and if you do that it means you're not
> looking for quick boot times but rather more for additional 
> information.

Also with recent (or planned, dunno the current state) printk won't wait
anymore for the slowest console. I really don't have a strong opinion,
either dev_info(jedec_id) or dev_dbg(jedec_id). Whatever Tudor prefers.

>> > -	dev_dbg(dev,
>> > -		"mtd .name = %s, .size = 0x%llx (%lldMiB), "
>> > -		".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
>> > -		mtd->name, (long long)mtd->size, (long long)(mtd->size >> 20),
>> > -		mtd->erasesize, mtd->erasesize / 1024, mtd->numeraseregions);
>> > -
>> > -	if (mtd->numeraseregions)
>> > -		for (i = 0; i < mtd->numeraseregions; i++)
>> > -			dev_dbg(dev,
>> > -				"mtd.eraseregions[%d] = { .offset = 0x%llx, "
>> > -				".erasesize = 0x%.8x (%uKiB), "
>> > -				".numblocks = %d }\n",
>> > -				i, (long long)mtd->eraseregions[i].offset,
>> > -				mtd->eraseregions[i].erasesize,
>> > -				mtd->eraseregions[i].erasesize / 1024,
>> > -				mtd->eraseregions[i].numblocks);
>> >  	return 0;
>> 
>> Part of this is already available through the spi-nor debugfs, 
>> although not
>> the actual mtd properties. These I think, should go into the mtdcore
>> itself if really needed. Either through dev_dbg() or debugfs.
> 
> Maybe we don't need this at all, as long as one message remains about
> the JEDEC ID, but keep in mind that spi-nors are commonly storing the
> rootfs and if your spi-nor does not boot you don't have a userspace yet
> and all the debugfs entries are purely useless.

Good point.

Just curious, do you know any boards which has the rootfs writable on
the spi-nor flash?

-michael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
