Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1016EECAAD8
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Sep 2022 08:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/Ik14yZJ7j2hDTjSYg0k0b3IaGg3WcDnoLQq6LnpeM=; b=GrCFBilt2VkfNVhZ3U+7KzwbrP
	9T1/0rYc994IgUvVGOr5meNZZJeMtsQTygaZf3m2kwYJXQ8kuGX+PyqhG0l7+ZRxJwTDF8Lxb1eoU
	StxVzWDU3DnfiO72+XS6Ua2/5zY3alVrpmRnunXCKZaeZ8ORh+Hb2cn3QNjN8iSgDYiXqQwRR3pd+
	2DdZ2QSGbrpATGenGAodxIKMJleO2Nu0PaFXptdNm0L9pQ46rwGGDb0u7pY6VvkGkTSSadQB+6q7i
	a4u3Jn6U9hnrkwyFOsLSp6jzB9e8h6KAU7AOOPDhxCeOen7ZAo9xc7wC7GbAQCw0INlQGdkEf/c6Z
	rnF/Ml6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obdrl-002tBk-Ec; Fri, 23 Sep 2022 08:16:57 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obdri-002t8y-Nu
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2022 08:16:56 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0C06827;
	Fri, 23 Sep 2022 10:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663921010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5PjZ/6L+S2gx/jYMZ+D8vSWuJamksb8qfX4fHXz4pmE=;
	b=1ofnhHLjO7zAHtivVEcWCc7MLVSy3saUNbBVPBCQx1r7Ivm3jM2AXA7AtAlI3GW3KOa5yG
	Xl2NgDIrNlU8C+UfqHsVo7P4JLsVVTz6s3n+sWzahNHchIyMEcmsZvgY9BODeaWUh6X71E
	CVIf/O71KjfdXXscQ7xDc0mgsakXqr+xZPgK63cOBwHGRvmJ634JcCqeo2tC38Q3R7mdDm
	oPSeRSVWShooaJROeloNOUvj3GB/w5wYkyDjgxE1kuT681cggd+Gen8x+BQlWDrQgoGc4i
	nYzn4IdK0v4RAHhzsiKHEJU/vxIa81cgabyQFPicwdRH6en/mcdqAo/tYKyAZQ==
MIME-Version: 1.0
Date: Fri, 23 Sep 2022 10:16:49 +0200
From: Michael Walle <michael@walle.cc>
To: Zeng Heng <zengheng4@huawei.com>
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 boris.brezillon@collabora.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, liwei391@huawei.com
Subject: Re: [PATCH -next] mtd: spi-nor: fix artificial warning when
 CONFIG_MTD_CFI_Ix disable
In-Reply-To: <20220923015151.3302417-1-zengheng4@huawei.com>
References: <20220923015151.3302417-1-zengheng4@huawei.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9ff321c05419f382206d38df09650937@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_011654_984125_5EC9FDBA 
X-CRM114-Status: GOOD (  10.46  )
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

Am 2022-09-23 03:51, schrieb Zeng Heng:
> When CONFIG_SPI_INTEL is selected without
> CONFIG_MTD_CFI_I[1,2,4,8] enabled, it would raise
> compile warning as below:
> 
> In file included from ./include/linux/mtd/spi-nor.h:10,
>                  from drivers/spi/spi-intel.c:13:
> ./include/linux/mtd/cfi.h:62:2:
> error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can
> work. [-Werror=cpp]
>    62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can 
> work.
>       |  ^~~~~~~
> 
> "mtd/cfi.h" is introduced into "mtd/spi-nor.h" by
> commit db4745edb282 ("mtd: spi-nor: add SPI NOR manufacturer IDs"),
> which was already removed out since from the commit
> d3c4bb31bf62 ("mtd: spi-nor: Drop the MFR definitions").
> 
> After above, mtd/cfi.h is not more needed by mtd/spi-nor.h,
> so detach the dependence.
> 
> Fixes: d3c4bb31bf62 ("mtd: spi-nor: Drop the MFR definitions")
> Fixes: db4745edb282 ("mtd: spi-nor: add SPI NOR manufacturer IDs")

Why are there two fixes tags? If this patch is applied to
trees which only contain the second commit, there will be a
compile error.

So it should only be
Fixes: d3c4bb31bf62 ("mtd: spi-nor: Drop the MFR definitions")

with that fixed:
Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
