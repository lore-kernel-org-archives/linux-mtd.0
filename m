Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DFEEB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quEiFRlaeY8l7ErdOd0wZEjQbsoiVo7avuD/ItNUQ+I=; b=Ch8FWtZS3GlSm4L7B/89SdvqD0
	GCClS0CzDn6lKe/tooJPVzIGIBepTjGDrWVJpN/l0mgoPeKrAlA0E5h1u1FPGe53+DPDQNmZJxI6I
	svozUFSVquQVseMV2ldR7CNJwWzHxybXLYAqSznQmCXoTGSqkYlIrd+bOO0y07+uQUVfv/eM963yM
	q+TaVx2DTwVG1UANOyQV6X0cEYab8RHye4CKZD9+UpYnk/7ir02BjyPEE4lTcbOu57IiFy2ja+1J+
	zLPOm9v/Sr2yuuXUSSZcACeVebePPJnZpLR7ititZ9zzy4shglvzM1qOVz6v017rE+SEdwGta9LwM
	BsYdGOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJhEn-001HUg-2I;
	Wed, 12 Jul 2023 21:19:05 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJhEk-001HRs-0i
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 21:19:03 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 73A62962;
	Wed, 12 Jul 2023 23:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689196735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K27cjW3udlX8dQog0vCu0JICf9/56js13q7aTnJTf5o=;
	b=L+Ge4sDadFkZCKxHkuTCNIe7k/UxoK3/Xw2mjlbCvxJ2bKTvXMov1wBjEH6cjfcow9MpGO
	U9+8twM9t3RcvmdICpPukblFCN0aBW7B2RVL6P2ifYVrO04KGaLvBt4R57wErp8QpcO+26
	LfgkuOskltMmyQDg1SVBbTLDrqLAnD7H5jHKQtYW//DGF+vZVCWHeY/AOO7WYf/8MbHa2E
	1Az8DEs1+Qt400OFTvoI+oOE+rDznrzJ7CceShefK0KYJw4c62lwpBQ5jX0t1RKh4cT1iy
	/kilRsImxSNYehxqRpgaziJsPoynOf6Qy71/f6wEDIGeu5L8XqMeunRe5Hi9ug==
MIME-Version: 1.0
Date: Wed, 12 Jul 2023 23:18:55 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for sst26vf032b flash
In-Reply-To: <20230712161503.448024-1-miquel.raynal@bootlin.com>
References: <20230712161503.448024-1-miquel.raynal@bootlin.com>
Message-ID: <d479489736ee193609816dc2003bd0fb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_141902_412635_DD2BE09A 
X-CRM114-Status: UNSURE (   8.56  )
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

Am 2023-07-12 18:15, schrieb Miquel Raynal:
> Describe this new part. The datasheet is public.
> 
> Link: 
> https://ww1.microchip.com/downloads/aemDocuments/documents/MPD/ProductDocuments/DataSheets/SST26VF032B-SST26VF032BA-2.5V-3.0V-32-Mbit-Serial-Quad-IO-%28SQI%29-Flash-Memory-20005218K.pdf
> 
> Here are the sfdp tables plus base testing to show it works.
> 
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> sst26vf032b
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> bf2642
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> sst
> $ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450060102ff00060110300000ff81000106000100ffbf0001180002
> 0001fffffffffffffffffffffffffffffffffd20f1ffffffff0144eb086b
> 083b80bbfeffffffffff00ffffff440b0c200dd80fd810d820914824806f
> 1d81ed0f773830b030b0f7ffffff29c25cfff030c080ffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffff0004fff37f0000f57f0000f9ff
> 3d00f57f0000f37f0000ffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffbf2642ffb95ffdff30f260f332ff0a122346ff0f19320f1919ffffff
> ffffffff00669938ff05013506040232b03072428de89888a585c09faf5a
> ffff06ec060c0003080bffffffffff07ffff0202ff060300fdfd040600fc
> 0300fefe0202070e
> $ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> e7efddddb3d5ee89ca37bf6b6e789645  
> /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 
> $ dd if=/dev/urandom of=./qspi_test bs=1M count=1
> 1+0 records in
> 1+0 records out
> $ mtd_debug write /dev/mtd0 0 1048576 qspi_test
> Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
> $ mtd_debug erase /dev/mtd0 0 1048576
> Erased 1048576 bytes from address 0x00000000 in flash
> $ mtd_debug read /dev/mtd0 0 1048576 qspi_read
> Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
> $ hexdump qspi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0100000
> $ mtd_debug write /dev/mtd0 0 1048576 qspi_test
> Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
> $ mtd_debug read /dev/mtd0 0 1048576 qspi_read
> Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
> $ sha1sum qspi_test qspi_read
> 2f2f191c7a937eca5db21a1c39e79e7327587cc1  qspi_test
> 2f2f191c7a937eca5db21a1c39e79e7327587cc1  qspi_read
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
