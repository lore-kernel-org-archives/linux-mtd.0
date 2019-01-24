Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1ABC282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:50:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6F8218A3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:50:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nsbugy4+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xPl9Bb/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD6F8218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5Rt1Qq65KmeRlO3vFkVPX/fxI7pTNcx9xPlkl+Rzok=; b=nsbugy4+8oOrwl
	CDP3+rKICyE7hd30FNybqjQiUURANhHeicwkyNcztquAd3WM2+u0/wc1PtKJq7/vIx+nnNLOdJZje
	82qLLo5iDAK6oxtyCHT1TfUMkxxOiQUttfiUIaq8eXR3d96Z6TvFF0GjQtgGzfX8ngF/GnuMkGX02
	7FB1/9GPqmil2vH4VYn5EbLTb+TXUJh3uSoRvdsYj0+SRbGeiVP+EtV9HuZp6YAO5yX4HOMbR36VT
	1hrGYl+Jj/JSXREOQ58vU9LG4EoZgDGo1riJKRApJBExDmwHHHM3QdAaRIPWZw6l1eQc0fuGK/j9C
	FSq0nrg3z2eaCTSMdsoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmai2-0006Z8-PR; Thu, 24 Jan 2019 08:50:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmai0-0006TD-IF
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 08:50:01 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D772121872;
 Thu, 24 Jan 2019 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548319799;
 bh=z5tEgcYT7DaEMMThRV7wOlePXipOanF8btd79Jq0JWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xPl9Bb/TXbn9r1rdbfpmTBMlWPfEY6t4ZzS8yHQy9/yzWfYQdJ1kErA2wi2Dek7dK
 6lmNjYwv1bWDmv7R4LDLZqpWDj6sT6HHMSO5vmseG1yBGp2YUL/UPuHcivyaLLwHNE
 ima9Qwefj19mub+fJddjEp/RCa1UnxwsiSpNSbkc=
Date: Thu, 24 Jan 2019 09:49:44 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Stefan Roese <sr@denx.de>
Subject: Re: [PATCH v3 6/7] mtd: spinand: Use the spi-mem dirmap API
Message-ID: <20190124094944.726dd4e0@bbrezillon>
In-Reply-To: <20181106160536.13415-7-boris.brezillon@bootlin.com>
References: <20181106160536.13415-1-boris.brezillon@bootlin.com>
 <20181106160536.13415-7-boris.brezillon@bootlin.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_005000_619160_20CCDAC6 
X-CRM114-Status: GOOD (  14.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>, linux-spi@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Piotr Bugalski <bugalski.piotr@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Tue,  6 Nov 2018 17:05:35 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Make use of the spi-mem direct mapping API to let advanced controllers
> optimize read/write operations when they support direct mapping.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Can we drop/revert this patch until we find out what's going on with
Stefan's setup. 

> +const struct spi_mem_op *
> +spinand_find_supported_op(struct spinand_device *spinand,
> +			  const struct spi_mem_op *ops,
> +			  unsigned int nops)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nops; i++) {
> +		if (spi_mem_supports_op(spinand->spimem, &ops[i]))
> +			return &ops[i];
> +	}
> +
> +	return NULL;
> +}
> +

Looks like this function is never used. Probably a leftover from
early versions of this patch :-/.

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
