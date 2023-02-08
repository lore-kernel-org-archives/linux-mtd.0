Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E324BC636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjKqgddO0JoHXBb3jnLIQE5LgL2aOl/2I/wOqsw0TzE=; b=snphU5AyDEmM32NJqOrvuJOUya
	AAn1A491/jX6QoMoaaV9Usjfk68j0x8rvm08PskhXF2N6wj0eGFcvMdgOmo9hSxbxqYkQ29qJbzqH
	B3GkdgKL8Q3VlmT7UwGLD2ab2ccloeZ56PzRp5YCbcmBQYGCLH/fbHx2i0PwUQn57lb8oU/wHMR+N
	BBEM3LoHQty7NH1eM9AlDGZvZJcvz81EQnjUNbJbt4/9PE0UbPVRf9JtsyjQsERG1vFQN+m7NyCeP
	YHEfG12CF7FMj9v8rt7pE0Kjb7HKIC404OGjPxw/9nkAWk8aJj2536pgRR+vCHNZu33y6yzBjjRCQ
	JeTvemhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmNR-00G5Kl-TL; Wed, 08 Feb 2023 15:28:53 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmNO-00G5Jy-Qw
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 15:28:52 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1AE7D41;
	Wed,  8 Feb 2023 16:28:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675870126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUOsinKT95zdvP+DuwsEu/6FCF+W9T+lwViOXbsC0Cg=;
	b=GAsHcMbSvB/qufQyWOM797Et6E16LUSaXlA3V1MIX9LIu1195TosiheZ64C5ZT5vy8As4X
	TCHzVM5j+VL1ARz+Dv6a3LVGeafaY0vOQQugn8DUJpcIZwItwJ/4Q75gq4lTvCR5yuPOdM
	/dBYks1zeylukqEsOhVf3DBN/QK7whvOiBrNTQamn24RHT4XGWcVPl+W3MAigAxk3iEGk5
	rN2xCsNDAtqC1Df+D4PWgY4oIl68O6Lx3lUA6ZNwh7bKfWVmY65TI2qfMUAfUqZRfMhZ00
	Oh55QgGkUxZKrPb+1X+xUWkIMg9sHWuxe+e750q/KMgBV9CGsEdNuKBzrlcI+A==
MIME-Version: 1.0
Date: Wed, 08 Feb 2023 16:28:45 +0100
From: Michael Walle <michael@walle.cc>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
In-Reply-To: <20230208145301.2169646-1-gregkh@linuxfoundation.org>
References: <20230208145301.2169646-1-gregkh@linuxfoundation.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <68d10a9b27a0a3894a290b28c1a22085@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_072851_058077_918A216A 
X-CRM114-Status: UNSURE (   6.73  )
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

> +static void __exit spi_nor_module_exit(void)
> +{
> +	spi_nor_debugfs_shutdown();
> +	spi_mem_driver_unregister(&spi_nor_driver);

Hm, does the order matter here? I didn't test it, but this will
lead to:

rootdir = debugfs_create_dir("spi-nor", NULL);
nor->debugfs_root = debugfs_create_dir("spi0", rootdir);
debugfs_remove(rootdir);
debugfs_remove(nor->debugfs_root);

If that's ok, then this looks good.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
