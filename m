Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4E9C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/zZKZeoYzS8hCi9puuaOb1qjM2UGCb60LTp7axVW2k=; b=eZR8meSK4KFR7x8AcLti9QpHhv
	mX83o6BMNV7o+UDfnjbh8XKBMZyTyZfvB2VkEfhPWYdy710ImOGI8QHmP3nJgEr/AOJVPX/j39shz
	x2qQOvoHRArE3r2HOsv/UdlEjyC7aUQBDzDeuTElno3IXf+mkddAj8i/VkP+FYFXMN/dxOT+JFAXx
	ZMFGtktE8n/I5/GhykabaMPcYHOaeJvhzKeE2ez/+4gfkPIWPY8Ico7oLZWPY1xx7FA+kJM8aWlyZ
	h3ikJl+s6ZUbf+p8pEnwB3IehTx+B9Zxjfr8zXEf2DmNmhjxMDT7jmhjufHEioTDivCy3oxyrCPtO
	wgSA42Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPn6r-00GDtb-6k; Wed, 08 Feb 2023 16:15:49 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPn6o-00GDsf-3C
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 16:15:47 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E419E321;
	Wed,  8 Feb 2023 17:15:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675872942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ntR/wlgNqt21ow8SuRQPW4QRtnHFkvNsYSwvNNaYGD0=;
	b=leHGVM16DNZv1jd5/Oa2Y1ftugL4roDER1DMeYJJkhTMa5DoB3iyalM9PAvgA9dN4Sdcfg
	VEJT3ZkbmGBqNHrLXqrOuMMiJTj4Gkv6YG8W8rw0ki0g/y75CeW+GNU2Vg1BMJjruXCI2J
	wINTP7tMtn5HfHGe5gFFgKqlbMqt5cdnwFNSuCWC1znnNGzgSeBXkTpJEPZPyMhZAp+2jc
	UShsntwaqpZ31MVmuXAElI85C8I5pkLYv0fqAEENzufmdtI+G/1EWMg7l5X1Qtq1dEgj6a
	R1nBZXKxlbTWqnWCjumYAP3TJZvy2X2JTEonsR2MVKJhNyKGZ+ojWsreNaO7lw==
MIME-Version: 1.0
Date: Wed, 08 Feb 2023 17:15:41 +0100
From: Michael Walle <michael@walle.cc>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
In-Reply-To: <20230208160230.2179905-1-gregkh@linuxfoundation.org>
References: <20230208160230.2179905-1-gregkh@linuxfoundation.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f60870dee13900252e0b13fb2f5f05b5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_081546_318264_613E9169 
X-CRM114-Status: GOOD (  12.20  )
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

Am 2023-02-08 17:02, schrieb Greg Kroah-Hartman:
> When calling debugfs_lookup() the result must have dput() called on it,
> otherwise the memory will leak over time.  To solve this, remove the
> lookup and create the directory on the first device found, and then
> remove it when the module is unloaded.
> 
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Michael Walle <michael@walle.cc>

one nit below I didn't notice earlier, no need to send a new
patch version just for that.

..

> +void spi_nor_debugfs_shutdown(void)
> +{
> +	if (rootdir)
> +		debugfs_remove(rootdir);

debugfs_remove() already has a check for NULL.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
