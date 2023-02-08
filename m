Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8014C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 13:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LW8nedxUXyxAEJMm/RHKvc+CiP58tFDoPxH4VzsZWH8=; b=4AKQHEmpVVU5gdqcN77V2JFneI
	ubCqzCM6SaVaOB8v5X/JWROZz8PP+Q4PbioZ6/CL6CxlRwHR6lwoZBNzWkBYwfjp2pPGpXlH9rKKD
	AH5rr5qa6R+X+cYRo6obT6VxZP9/9Vl1nmAVRpCHwhMPkfcAZua/7OtxDtCis/fMZNXxcPktvSYzd
	oWBKkGwoEXbhEikkJrHLWMFeGN4dMOTqf5mA+ot4zcp33Fw2yaHdt+a5msxSbVirg1cdEDOc8Wbfe
	4G9NGe5A+IYpB481/2pY9Nt/8+vE+famcfeYMeTY2ci8XDqMxFtwZRx7JIbcskv23EPe68ayCiI3+
	wu+2f+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkck-00FmBY-5g; Wed, 08 Feb 2023 13:36:34 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkch-00Fm5v-74
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 13:36:32 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1C55F41;
	Wed,  8 Feb 2023 14:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675863383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJ6nbZ7ZjxSMQlV2nrrI20Zzn6ZzSpDBwtS6grJkjEA=;
	b=U2jM433oONjJ6hcCWtUJG9pQ0/DRAAkH5rJTdUF4yC23saM0CWe40dt+kqvSb9Y75XaSU9
	3Mf9s9HKanvONOGqHDmN7oHCAmEn2EGq/z8+JDqK/RsythsR9pwwwANn7pujqq9fVnm5PT
	cGYV7Uo6KslEaRJTubl4+ho9GXutTME+LA/a2VjypmIdZ0/d91X7G8//n8YWOJ38R1Fqrn
	376Vg/XhxKlR0O04z3w18qymiCXftnzTI2pZ6NvfobMdWfEgfuQKbmoYXqrAM9qdt33yDo
	rfhpvC1ywoIjwvPjsDnOrm3+H6BaI/LiNdPzQLPWP7HOGOFW9BhdNMTIRc0YtA==
MIME-Version: 1.0
Date: Wed, 08 Feb 2023 14:36:23 +0100
From: Michael Walle <michael@walle.cc>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, stable
 <stable@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
In-Reply-To: <20230208125758.1515806-1-gregkh@linuxfoundation.org>
References: <20230208125758.1515806-1-gregkh@linuxfoundation.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <69fbf8b55dcb9c5c0a1a5d59b2248670@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_053631_442273_DC79AF83 
X-CRM114-Status: GOOD (  13.82  )
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

Am 2023-02-08 13:57, schrieb Greg Kroah-Hartman:
> When calling debugfs_lookup() the result must have dput() called on it,
> otherwise the memory will leak over time.
> 
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: fix up to work when module is removed and added, making the fix
>     much simpler.
> 
>  drivers/mtd/spi-nor/debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/debugfs.c 
> b/drivers/mtd/spi-nor/debugfs.c
> index ff895f6758ea..af41fbc09a97 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -242,6 +242,7 @@ void spi_nor_debugfs_register(struct spi_nor *nor)
> 
>  	d = debugfs_create_dir(dev_name(nor->dev), rootdir);
>  	nor->debugfs_root = d;
> +	dput(rootdir);

rootdir might either be the return value of debugfs_lookup() or
debugfs_create_dir(). dput() is probably wrong for the latter,
right? Also there is an early return, where the dput() is missing,
too.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
