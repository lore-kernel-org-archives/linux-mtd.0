Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4FBC04A68
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jul 2022 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgLQ8S1oy0ObENAd0hVPeahW6tocE8QsZh4M5mp1xHE=; b=bhGRwI9iM4o2jexNhkfDdfhXdP
	6STqu38TI8aU6ePC7+Shi4YmP635+pAhh0BMRFb2pGUBhNOd6IJVCB1K4ksvSFZcZpj5r3Cvq5x1S
	O7QGU1SfEocDSADbYtiCAEZWRvebH+6LenMw6zDDi3GIEEn5JgyjvA4oo4PVpGn/+wB2/9o6sSLrX
	8+InLVDdL4BIWfsUD1IQFSVMktH7lF0pxEfPZGgFI7TL29bZ5Har9vCmWFIZPl3Kk4oS8R7+FwNb3
	0jW7P/ApIOsu8wuMKb/bx87r2TM3eB7NCrGbd3Rt8JOmCw+tCZP3S3X2RVcb64f2TRGMz7DbYdbYz
	JxiuSzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGezg-00Cp52-AD; Wed, 27 Jul 2022 11:14:24 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGezd-00Cp11-5e
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2022 11:14:22 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 2933922239;
	Wed, 27 Jul 2022 13:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658920459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/SOsarIIb+tZXQ6NKyKTm9SpIG8Sc03HkJYs/VPfcwo=;
	b=j/I0R9BJnvBqHBWAPAVLgn/Be7x4HLAmEXot12d9maQ7OvS+Ph9lOpehAz3ftKuNrq0OD9
	vPLiLFGV/v+oZBTlfs673IiOh2nt33+AHaDtn/FMnzBfUgiNErFg+0Ubapm+G/fli0hp2l
	uaTNg3UA5ecZDqPfLFmZSvvXtb8VhFk=
MIME-Version: 1.0
Date: Wed, 27 Jul 2022 13:14:19 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, tkuw584924@gmail.com, Takahiro.Kuwano@infineon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com
Subject: Re: [PATCH v17 6/7] mtd: spi-nor: spansion: Add local function to
 discover page size
In-Reply-To: <20220725092505.446315-7-tudor.ambarus@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-7-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c9fe4790063213b5a24a7a9317390651@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_041421_448254_6BE4B114 
X-CRM114-Status: UNSURE (   6.69  )
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

Am 2022-07-25 11:25, schrieb Tudor Ambarus:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The page size check in s28hs512t fixup can be used for s25hs/hl-t as 
> well.
> Move that to a newly created local function.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
