Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C25FEF99FF
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Feb 2026 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJsZ6sBnbRo8XzjRszdDWPKEfr6d9Ddn+Olt3KsnRp0=; b=y62EByKN2HPg6z
	rwWoufL9doKvspsQrwW54FhfSfNJfxFcgw2D7euS3nqFltDwpjCcOhcKj77Utd7e49BU+I02jKAkB
	tU3FdcAPDmHx5f6lneT20WHMEnmRgXdX6YRF/vSn0YY+Bit/5lvGIiSoA0BhOF6B1jJYsPELbJfJ6
	hVkZ/xEsm2//aX+YhnA5b9eeWz5fcYDJIzbOpnEOg/jWUfDQi0g0QaAj+MOakWyQLIyuCzGs4SMGC
	rhpNEnOMsZKs6Ss6hTOYQmP0ITpL5klKy5lg2SrESLIvX+U8+bKL2/NQMGpEnpZjw64EqC9fHqgu5
	+tQcJpELOVyaST6WjipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrBtW-00000004QXK-0PXQ;
	Sat, 14 Feb 2026 09:24:54 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrBtU-00000004QWt-1D54
	for linux-mtd@lists.infradead.org;
	Sat, 14 Feb 2026 09:24:53 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AE98727F;
	Sat, 14 Feb 2026 10:24:48 +0100 (CET)
Mime-Version: 1.0
Date: Sat, 14 Feb 2026 10:24:48 +0100
Message-Id: <DGEKRBYDFDF4.2T2WNPBGEYTMU@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, <pratyush@kernel.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: add Takahiro Kuwano as SPI NOR
 reviewer
Cc: <takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org> <20260213-remove-tambarus-from-spi-nor-v1-2-6caefb1a63ae@linaro.org>
In-Reply-To: <20260213-remove-tambarus-from-spi-nor-v1-2-6caefb1a63ae@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_012452_470871_BCAE0BA8 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri Feb 13, 2026 at 6:02 PM CET, Tudor Ambarus wrote:
> Takahiro has been an active contributor to the SPI NOR subsystem,
> providing valuable patches and reviews. Add him as a designated
> reviewer to help facilitate patch processing and maintenance.
>
> Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

I guess, you've asked him beforehand? In any case, Takahiro needs to
ack this as well.

Acked-by: Michael Walle <mwalle@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c6ee223f6c2db2ed5595e19f5fabc098ff767b3a..872fb6e7e9e4fb5af1e02a0003e5c43535eac6d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24199,6 +24199,7 @@ F:	drivers/pinctrl/spear/
>  SPI NOR SUBSYSTEM
>  M:	Pratyush Yadav <pratyush@kernel.org>
>  M:	Michael Walle <mwalle@kernel.org>
> +R:	Takahiro Kuwano <takahiro.kuwano@infineon.com>
>  L:	linux-mtd@lists.infradead.org
>  S:	Maintained
>  W:	http://www.linux-mtd.infradead.org/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
