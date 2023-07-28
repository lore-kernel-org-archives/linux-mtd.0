Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715F8C001E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWz+jYxE65JNYvTQxFqa5ZBO9sdovgwNf+5lX99hN24=; b=FiEGcae+6cMaMJ0RSsnXP7/K3E
	SSLxIGNrLbfAVHJBsBF2gQ2TSRHVP6R4Tsek2aC6ya5rqxT1JW/UjIs9h21r+4GzLnhHARH5IjEh+
	nLr2Hz4mxWo/Nd8djtgLrsO8/ha3PQjppmzbjpGp3QOusTwY4bNoex0Fq1gbnIUZKkIXW8CRjcL+8
	zRY7CEIP/2DbIP85B5WYKsdy0/2EU22SowbE/7kaNwQB/VjxhVUAiygu/wiRNMf17dG7Xi8SSXCCP
	HtK1+wX5/TzSdE3ePQJkmS5qRETRGoBAAPXDhgKDqPm4ZhUrznu9whtmOYlDNK+3lxt+Yl9bqwvKw
	6KEBbArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK39-002ffG-3D;
	Fri, 28 Jul 2023 09:46:19 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPK36-002feB-2J
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 09:46:18 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 57B30D21;
	Fri, 28 Jul 2023 11:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690537572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NxWvA+IrxUQvrptpJAQhQiXd2gBR0R09KxXnynvJ20I=;
	b=JMr664kuPxJ3W0iK/AibFyeu3qbWSjQEWlLDXGjk/JX8u8FkCVTdpBMPjeYSC0KnxCIvoQ
	dVhsKn6l8NpprRnk9BiF+O+b8+mKm7X7l8UZ6OenPRTvhHmQG2TZW12mE8/o9twkHPzEzh
	LBpafCA8ZPONWMpdd6vmEjeR6qxI5nG2+AemjqgYwDimlXceiII5Q3sbbCNGwMGpVpFVdj
	DXvIZgtJUUdM9mi3Oa4OqLqaZ/YFsBF5nrhtsaF1WeKCf10RnEMKh4MFKLgPgvgVtWE8gI
	SkV4C4Ld1w5qzkyeN3xtIYOi0/YYIw7sUc4RmkHJNIuvATqzTaPbCE3aPnisBA==
MIME-Version: 1.0
Date: Fri, 28 Jul 2023 11:46:11 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Jaime Liao
 <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Octal DTR support for Macronix
 flash
In-Reply-To: <4ffbc99f5174fe48182211d489efa115@walle.cc>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-2-jaimeliao.tw@gmail.com>
 <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
 <4ffbc99f5174fe48182211d489efa115@walle.cc>
Message-ID: <0ed5a344424fccb6bcbef6496dccbc77@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_024616_908486_F7DC236B 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

>>> +	/* Macronix SPI-NOR flash 8D-8D-8D read ID would get 6 bytes data 
>>> A-A-B-B-C-C */
>>> +	for (i = 0; i < nor->info->id_len; i++)
>>> +		if (buf[i * 2] != nor->info->id[i])
>>> +			return -EINVAL;
> 
> We need some kind of per flash rdid override. I guess rdid won't work
> in octal mode then. Are any other commands also affected?

Jaime was kind enough to send me some datasheets and it looks like
some commands will return the response bytes in STR mode. So,
technically, the correct thing to do here would be to use
8D-8D-8S mode. Other commands will also respond in STR mode, but
I guess we don't notice because most of them are just one byte.
But I think we should get this correct in the core.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
