Return-Path: <SRS0=9oOa=MG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E47FC07E9A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jul 2021 17:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9FA613BE
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jul 2021 17:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A9FA613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPrsVZ48ZDohEr+GvCcOl0ZTvtJw+9UXXlcrUvLBFa8=; b=ZVMWjmG4yc4HXmmgYzy10JcTQ9
	R3TE46i7BB38zYKkLaqDE293+4pNd9VvlebPhtiA/mxWkGMq6jUHk1FlWQi4oW2lbxkg/UGQKOPnq
	FQuW7vOmHbz3Oy4wWiqhzrLw+PhUuTduEEJPkdzdCiXhN+ytbqHMK8aEBG7RbbS65MaLiDXbZKDeJ
	hBLs/iltkQmFxR+0tzcuKWdi6pIC757NtDbT0VGxnK847eBRiIFxlc40qVH02m59FS7E0s4m3J2jO
	vTh3astRx0Pr5F6n8uJwb8Lykci3tp4h/OyvpfnRdasrHkC5UD88ozbEAkJRKKQA+Ixn6uzSBolGG
	UOtbIwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3iLL-00EFHZ-D2; Wed, 14 Jul 2021 17:06:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3iLG-00EFGQ-U8
 for linux-mtd@lists.infradead.org; Wed, 14 Jul 2021 17:06:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 091C760698;
 Wed, 14 Jul 2021 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626282398;
 bh=jNlgPMgZN4EpeXdbNIPWr2KBnHm3nge8Gn/GKjF3UcM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ILSC5K0tDOrDr4SlSUXGH6bqhvwLgftnZt5TJjGqh2as10U6G16uGvu7X/IsbyXpz
 tlmngxBsxhiLjdEjrgqvGNC8lgMNrIT6J+B3EizyztvYsVj/3s+RiGnL7Zf3GabA5L
 k7uhx6G6WxD5HkgrFX6ZQcZuSkiw3yav0ww78VaondYtDEXQQGN35lI06p+785kN2X
 IYwwdQTF/d5ijNVY5FsUm6WCYtvAavJ0NvsGYErZU2zXEiNq5wT5SgMAnsC/obX+F/
 CJwbDpN2GfkYJOpvS+si33nSTNIYe6+pZ/1fD6nbrgUJ8JTVDN56jDLZluXx7YZ8q4
 rW7/LCxlqcW+A==
Date: Wed, 14 Jul 2021 18:06:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 01/13] spi: spi-mem: Add DTR templates for cmd, address,
 dummy and data phase
Message-ID: <20210714170601.GH4719@sirena.org.uk>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-2-a-nandan@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210713130538.646-2-a-nandan@ti.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_100639_024097_C016462D 
X-CRM114-Status: UNSURE (   7.89  )
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
Content-Type: multipart/mixed; boundary="===============7787169130640069318=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7787169130640069318==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MP5ln1Rcf9Bvi+ZW"
Content-Disposition: inline


--MP5ln1Rcf9Bvi+ZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 13, 2021 at 01:05:26PM +0000, Apurva Nandan wrote:
> Setting dtr field of spi_mem_op is useful when creating templates
> for DTR ops in spinand.h. Also, 2 bytes cmd phases are required when
> operating in Octal DTR SPI mode.

Acked-by: Mark Brown <broonie@kernel.org>

--MP5ln1Rcf9Bvi+ZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDvGXgACgkQJNaLcl1U
h9CuOgf+OZwzBjuqfvGXu9HhhtOFIDOriNVdP8bqqDTVfmTIZw5qLXv2KsASJQbR
67Y0bQeUvlIfaOboTjdE5OWWKavRE+3VASCjAShLl4QrYigm6RKXfK8YEAWIg2Ia
sJhBSQGr+wCNcRyT1OF8p1QNW5rQanlqTS54Vuyy9PISDO2YCmMnngOLe/0LrKaB
AATXpiINw2//4wZQz5PFSZYNRp4BarGHps9ZpcV1SSApVTD9sOpCPd1lkTXRWP/4
72P+tfVCerB3REvELGRMbVs7Gg21xfwWC2S67QzprmQ/1jYSRGd7DV25i74tZIEw
A189cTmusslEmBTPQnZVvNaakXWlzg==
=RuqX
-----END PGP SIGNATURE-----

--MP5ln1Rcf9Bvi+ZW--


--===============7787169130640069318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7787169130640069318==--

