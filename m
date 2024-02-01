Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D12AC4828D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z06fxjTapcecQq2cDdo76aNMKmG27cfnuZdPMCQtNM4=; b=xTcdxRyRC4QieYIuFkoDnT37TQ
	Fd4jAwRd7sD4tQm1rlw9oSD3/6AMXX84Sy6QSCMS8RkxewsxbSuub2Zjtx7NiboH6+KDWpbjpdb2a
	pEFAXm8V3VUi5JBzyvZMvdhtp5Tmn0gPiT3yY/6n5YFtTRCGN2oXhq99Q5cei//gUkYB6j96yYBzA
	30H7UjGXxc7GVf0Fi4JJdQ5RDVuvNj3HawpwFY7zFsbj3yD2EPWu34AZcd31/9VjdzFdrGmwBU7b5
	NcCUjtMfCKb9QmRv1YZXqq9zZ1FByAv/q3vrs8tLkNUGr/W2g4eRw3e/IrYPgrZIU0s9OJwWsJLpK
	ooqLdLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZMb-00000008WQL-3RJt;
	Thu, 01 Feb 2024 15:52:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZMY-00000008WOs-41Wq
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 15:52:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CD6061F86;
	Thu,  1 Feb 2024 15:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B789DC433F1;
	Thu,  1 Feb 2024 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706802746;
	bh=2/AojWD+CrpOQOqoCp64pVCyI8pGCkagokdqYkpe8Z8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A48nECb+SqzHro49ljFl17DaxY51KAwpNEP/lWFPOGJ2dZInmG5exVS53tJUAKX1o
	 jNfbW1xzr6sDf7T+kBWJMyJ67hw5i2w8Ffn5EKVmU+WkiCygeF3FF8gyTeLmx9VXBB
	 c4Md4QYWyJV81VsrpIQBgTb32e6gDKEdDkt8FpRpImzeWwa/XwN1uhwqM2k3H0soF+
	 7gUFDulbrAa2qMyPmGzhZX5521LNZ+irRre8VM1wJnmlamkYLP0JBCzAE9Sbh841zi
	 RT3MzXjjLoLtwYZat70wSs1FVmz9L92ea6Zt+ziD2F0dgK+ZZ8SfovwIsj3htKN4AS
	 181B2O1X7mjRg==
MIME-Version: 1.0
Date: Thu, 01 Feb 2024 16:52:21 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v8 9/9] mtd: spi-nor: add support for Macronix Octal flash
 MX66 series
In-Reply-To: <20240201094353.33281-10-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
 <20240201094353.33281-10-jaimeliao.tw@gmail.com>
Message-ID: <8b80cf233ea0065adf9841408e59f6a2@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_075227_074656_24D9FB59 
X-CRM114-Status: UNSURE (   8.50  )
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

> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -262,6 +262,13 @@ static const struct flash_info 
> macronix_nor_parts[] = {
>  		.id = SNOR_ID(0xc2, 0x80, 0x3a),
>  	}, {
>  		.id = SNOR_ID(0xc2, 0x85, 0x3a),
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x80, 0x3b),
> +	}, {
> +		.id = SNOR_ID(0xc2, 0x85, 0x3b),

These and all of patch 8/9 is not needed because you add the whole
manufacturer in the next line.

> +	}, {
> +		/* Need the manufacturer fixups. Keep this last */
> +		.id = SNOR_ID(0xc2),
>  	}
>  };

Replace patch 8/9 and 9/9 with just the following:

+	/* Need the manufacturer fixups. Keep this last */
+	{ .id = SNOR_ID(0xc2) }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
