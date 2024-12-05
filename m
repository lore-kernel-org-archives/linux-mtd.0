Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21FBE7716C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRWonDpO8krgIEy72IfALDzBkvQZHiE//Z9Sh7JXj4Y=; b=0wXPBgslGk+jym
	qb2dhwv8UBF6lhs74QkLgB4NNjq9xgnwjtWczPs5nmDdZCV951G6wHwWbSP3yCtO8t6JodgV9zxSZ
	9qQAlQSl0bsNG3XBfsUvzo/dhjaiBMCsfaLb8LvKPW1Gf8jD+YRitWKQDrqcoaaifgM7CfOETG5mu
	l/G+tyBwZDv6D8IHCNiqMbrZOchknLgwLcyCjFaeyBcpQi3wC68IaW+UzZE70QNScOK53xn6OyGaL
	zU7Y98j4Yf4OXoCDWRAJCZAHeRccgEIKpsRCOIkKotrH0SSmvf1YCaANgRiPGIYjJ4h0S91OC7Ymy
	rEWMn+i4zvy8KDGKmn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ81j-0000000FLBY-2hmK;
	Thu, 05 Dec 2024 09:20:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ80V-0000000FKus-3Ct3
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 09:18:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 695F15C722F;
	Thu,  5 Dec 2024 09:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC22C4CEE2;
	Thu,  5 Dec 2024 09:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733390327;
	bh=+s1lMDPZAoy49Qw505h2P4rtnHu1KlnTJKbTfD230s0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOYsJf7sbJzZViMw2eQkRhK4wi3nJSfb8Hv5IzUFa/TsVdbniHqjbYelJxDyhJde0
	 WJ75Y2QJuMXtzOtWJjN97+An86zydcKz8eaDElF4qGc5A2zZB/QTvf9ddtzI9SmwNK
	 +ucNrnjwoWyVp6GQWjJz6LPx8ExIO+JOE8p0nk2SvI93qhe36PP21EiTGK43FXj/kz
	 wNR9xBZpnCqztN71gKQacBI9FEIp4+XPnWviOb+2bWiLBNyod9Vuo8oNCLuqC2gkeN
	 MfvrkZ/B1c/C0JdaTHL44HVWw4fx++yHO1eI60PKhc91zHBw8TzMyWTovGgdtDofD2
	 zltrdMLCgZsBQ==
Date: Thu, 5 Dec 2024 10:18:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: niravkumar.l.rabara@intel.com
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
Message-ID: <hvgf5nmnlsngrkdrwp4jrxdsn4tk5n3dh5twbxbacn2g7cyttz@sdhzeiz3646x>
References: <20241205053350.434370-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241205053350.434370-1-niravkumar.l.rabara@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_011847_845433_B4739F73 
X-CRM114-Status: GOOD (  13.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Dec 05, 2024 at 01:33:50PM +0800, niravkumar.l.rabara@intel.com wrote:
> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> Convert cadence-nand-controller.txt to yaml format.
> Update cadence-nand-controller.txt to cdns,hp-nfc.yaml in MAINTAINER file.
> 
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> ---
> 
> Changes in v4:
> - Fixed the identation for examples as per review comment in v3.
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
