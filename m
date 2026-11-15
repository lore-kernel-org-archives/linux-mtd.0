Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2DF606A32D
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Nov 2026 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pH36jWzK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blDNmVKo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zKKpwBxyK5vOoLryo6RfLAkclDoGoIhhjHzJ+HqAZRQ=; b=pH36jWzKLdFL6bpqUaojWBJN+N
	of3FhjbBYqEK0CAYDf8dfgjJ4iMpe3kMWnmkfRJrJL9ocNezMppoO7a3v2LPFkagD5DRDhnOznPeD
	Jy2Ri3cvYNmHM1kHX+/nEx/nwc/3K/TGG9VRVyY0WzBCA3R/v66z11v+0WXi/aArC8wL6TidEkQK5
	Fl9xk59DTxsxJN94meVPUJxxvAICQBu5e/HwDyuoy6G1FgFQ6bTiRdwr1JyVrKBMlGfYV3CGQL1Cj
	gPUxVNmizj45IZKB8Rs/WO5crepGh6siBpngCNrmoLGiwrns9rMjV/hXV1C+7qr4S1fEwcYiMv+o5
	j+8QO+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfUj-00000000MaB-2gPY;
	Sun, 15 Nov 2026 19:02:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfUi-00000000MZz-0lkn
	for linux-mtd@lists.infradead.org;
	Sun, 15 Nov 2026 19:02:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49DC3614B7;
	Sun, 15 Nov 2026 19:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47521F000C5;
	Sun, 15 Nov 2026 19:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794769347;
	bh=71suhnOQ187ewHE/PuoqWfe+otthECsrCZEY2F7KU/s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=blDNmVKoT+2L6E3h1NQY0dK0VShq2C3snAqOuMXWvOPSKTqiYf2DCSQcltZ8XTSOg
	 J+yvoRW4WweMJZyqVfcdSU481T8OISjMYTpxy3oO1DKhlUOL6o3P8o11/uHtN4+Ibj
	 9Q3FWbldUzWWQCaui3pQy9F/xSVhgef8g9BhTUnbVb4XOarT722a00w+R8lnQ/1jJ+
	 Zr1qtR6edrofnHAvO2UdT2t/6X370u/WxpjJFnA2j2THam0ygzbfedALxuEgEiN2sy
	 tw+FnV6GiTUHPC0HQFHgspqBSexJ66751ep20GyduEO7fCWARASc0tZTRWBFnbYnlS
	 MKaU9DV3P+f3w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 440533438C02;
	Sun, 15 Nov 2026 19:02:22 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 08/19] spi: cadence-quadspi: add PHY tuning support
From: Mark Brown <broonie@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, 
 takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, 
 u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-9-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-9-s-k6@ti.com>
Date: Sun, 15 Nov 2026 19:02:20 +0000
Message-Id: <179476934046.140154.1891166104571142429.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hQT5utl8foco5MPE7XQ4r4AsB6YHll0nIcrWwSLcj/A=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+Me5LlHOY03L3y7n/kzT2q71MnDqn+dbf5kMRpmxZX
 Vvdv8x801HKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJiGxmZHhnckp9cxazigWX
 6nv1t3NkmRjfxf878bpq5smWhvi5LicZ/mk5lCb8PdjNtDH+bDdvC3vR0f/fks4H7HgrOKlLvfL
 dXk4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The Cadence QSPI controller supports a delay-line PHY for high-speed
> operation. Without calibration the PHY is unused and read capture relies
> on a fixed delay, limiting throughput at frequencies above the base
> operating speed.

> +static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
> +					   struct spi_mem_op *read_op,
> +					   struct spi_mem_op *write_op)
> +{

> +	f_pdata->phy_read_op.max_freq = mem->spi->post_config_max_speed_hz;

Do we need to validate with the reference clock here?  AIUI in PHY mode
we bypass the divider we set in cqspi_configure() so we might be
overclocking things.  There's also an awful lot of Sashiko reports on
this, some of which looked plausible.

> @@ -1587,9 +3308,15 @@ static int cqspi_of_get_flash_pdata(struct platform_device *pdev,
>  		return -ENXIO;
>  	}
>  
> -	if (of_property_read_u32(np, "spi-max-frequency", &f_pdata->clk_rate)) {
> -		dev_err(&pdev->dev, "couldn't determine spi-max-frequency\n");
> -		return -ENXIO;

This is a bit surprising?

-- 
Mark Brown <broonie@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
