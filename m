Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7160FC3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 11:32:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44307217F4
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 11:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lNWlJhsk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44307217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+I0vK8PqWGlSmqyY2QpHmP0cGkvt1eGF/4rkX54+xt8=; b=lNWlJhskb3PGum
	TKCFw9ffEFWELHF6Q/JVZIKeXpC1kriXn1gxqWJqDEVUL7NddJso5rhqE04nnc3yvqQLQQHtudNYB
	yMs21Sqqu/0TV5oBiTUIRZR9FI6grF/F8WPI80EZwEiywQE4utN1utI3ectO9pz4CLwBmj0xopInr
	TsMS6OxqK4rD14FL90/IJgEj760e6VTqfY6fO3vbDdFl1oFk0PH1EWAWkw5mskFb+HHG+C0IeiqBg
	573axY1EiCQBTjoskZXVyM5vwqUtwDohWuALm4sD8E46Tx4UA0hBF7fBtpsqPkzHdhT7RV6a4/IWv
	wBipTvg1gx/vXwJsJz1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1qkZ-0004kC-BR; Sun, 25 Aug 2019 11:31:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1qkS-0004jJ-5b
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 11:31:54 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B55F526BC15;
 Sun, 25 Aug 2019 12:31:46 +0100 (BST)
Date: Sun, 25 Aug 2019 13:31:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 2/5] mtd: spi-nor: Use nor->params
Message-ID: <20190825133143.7ef9600a@collabora.com>
In-Reply-To: <20190823155325.13459-3-tudor.ambarus@microchip.com>
References: <20190823155325.13459-1-tudor.ambarus@microchip.com>
 <20190823155325.13459-3-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_043152_385391_BDF026A0 
X-CRM114-Status: GOOD (  10.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 23 Aug 2019 15:53:37 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The Flash parameters and settings are now stored in 'struct spi_nor'.
> Use this instead of the stack allocated params.
> 
> Few functions stop passing pointer to params, as they can get it from
> 'struct spi_nor'. spi_nor_parse_sfdp() and children will keep passing
> pointer to params because of the roll-back mechanism: in case the
> parsing of SFDP fails, the legacy flash parameter and settings will be
> restored.
> 
> Zeroizing params is no longer needed because all SPI NOR users kzalloc

  ^ Zeroing

With this fixed, you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 'struct spi_nor'.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
