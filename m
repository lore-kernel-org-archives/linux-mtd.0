Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF129C001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lecGRLwIJT/9kCJk0lfHZZnz/ApJjLH1QYLquq9qziQ=; b=EJb/s+Q6haTvan7YlPzG3sTubZ
	uqomM4S8eZK9lh/11nIjqfCvhU3ZgMDE1fmxAYFuQfrIq/u7cwcUWLoREolzZOd/oGOtcuHTVU+fz
	Yrfp/EVJ1GwgJhHV7gX2TuzYszuykhAEXeVzlXp222cOBTupxPqBZElPjKTNazkUfqJOOnbTqOscP
	tlPjp+7eIDzOBWuLjwFwwBw2ltHCBbkOp9n7rderCP6Fb2d+6wqUZWWR5XtyT2i43MhsIqEgZZmmH
	DLQA1yZ4j3nZg3Qb1hfPPPQ+8bbX0HN1UgXsddu3Wi8fu+PlIq/hUB0xkSlQpkDjtH4CIVkc4453v
	LoNJoniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT1Ev-00HXmU-19;
	Mon, 07 Aug 2023 14:29:45 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT1Es-00HXlq-1U
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 14:29:43 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C8463143;
	Mon,  7 Aug 2023 16:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1691418578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kA1+D+3H2O2aFjUoPnK6l19oOD5Ur6ZKtE5pF9DiyrQ=;
	b=eFKKXTRsQ5FzZVZiwYtWnHL1WE7Ng8mksBUOxEJ+NI6H5/HnaS71fiiBHRaqPTxxIprLo2
	vhwSo7HNcOTU4R5kATq1CjUhT/C8K8YuwlnYXKIAJBML1pSpWTJEPmtOuKjK+A1ip0Wy2L
	xY2+35BIlsHms+x3aoTO44vFmYOjxEIofSex3MKkEc1oa4amTm7M8sRcuWR9js2XjfFgVM
	16O+P9DYA9NxgKKJ/SLDZqi37SUiMzcAyuNFIMJJcedDiC302h+l2zRXMeSJgSu2lVxJO3
	+bbOm4uHndzgjaOs3peK04cWW8eWPXHKgeOJrgaprM3y7kPZc3GfNCm9UeqMZQ==
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 16:29:38 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Walle <mwalle@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 06/41] mtd: spi-nor: default page_size to 256 bytes
In-Reply-To: <20230807154754.70e994fa@xps-13>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
 <20230807-mtd-flash-info-db-rework-v1-6-3d3d5bef4ba4@kernel.org>
 <20230807154754.70e994fa@xps-13>
Message-ID: <cebd793208c9956e0c7be1b528e16627@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_072942_652031_352E5297 
X-CRM114-Status: UNSURE (   7.01  )
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

Hi Miquel,

>> +	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
> 
> Would you mind clarifying this? It does not look right, while
> perhaps it is. But TBH, I have no idea what params->page_size will be
> after this assignment.

It's info->page_size, it's a shortcut [1].

I'm not the first one using it (in fact I was explicitly asked to use 
it,
e.g. in gpio subsys):

$ grep -r "?:" **/*.c |wc -l
1268

-michael

[1] https://en.wikipedia.org/wiki/Elvis_operator

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
