Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1D5C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 08:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC28361077
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC28361077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:Cc:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mxgbcBuKmJfFJfzxQpUT/LmI2KYP36GlDOMpd0R8ds=; b=G2JfQn2AKwmBMW
	emMGGs5o3TkmDho+lzFqFWpjzV3ToHDczh4NxfeOslwFuLFA59MYI2eo0nGjUfAHB7AkOk1g6QiP4
	yIOuiDmdWwgw+v1HMBR2TQ0R7A+6lRhg4fXLXoZOq4LsiJgPpnk4XHwLYsQlJWjmRQ8ip9xKg0fQI
	lWYEPGtXzsSqE0LJLk5qVmkxwkDdqCtJnt7Gw50xMhqKumaiZrqau3kWXXG4Mvb1YKB6WQU8+1ELa
	aOaO1E/oOMgVHGDrgHklJzszEAH2Y00JLDWZjhOTwN1KZjdfEZ4ROwTmYu29g48orax8gfnPjTCuQ
	1MzFCK6Gp6bsOFGBF7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZY9-00FYPR-IC; Wed, 13 Oct 2021 08:23:46 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maYJf-00FGMw-6S
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 07:04:44 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 19D74Egk001058;
 Wed, 13 Oct 2021 15:04:14 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 4A9624BE66CA0D66112B;
 Wed, 13 Oct 2021 15:04:15 +0800 (CST)
In-Reply-To: <OF11A0CCB6.4C81ABAD-ON4825876D.00256D6A-4825876D.00256F7A@LocalDomain>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
 <20211008162228.1753083-9-miquel.raynal@bootlin.com>
 <OF11A0CCB6.4C81ABAD-ON4825876D.00256D6A-4825876D.00256F7A@LocalDomain>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "Rob Herring" <robh+dt@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Xiangsheng Hou" <Xiangsheng.Hou@mediatek.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jaimeliao@mxic.com.tw, juliensu@mxic.com.tw,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, stable@vger.kernel.org,
 "Mason Yang" <masonccyang@mxic.com.tw>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tudor Ambarus" <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, linux-spi@vger.kernel.org
Subject: =?Big5?B?UmU6IKZeq0g6IFtSRkMgUEFUQ0ggMDgvMTBdIHNwaTogbXhpYzogRml4IHRoZQ==?=
 =?Big5?B?IHRyYW5zbWl0IHBhdGg=?=
MIME-Version: 1.0
X-KeepSent: 7B755571:931AC374-4825876D:0025ED60;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF7B755571.931AC374-ON4825876D.0025ED60-4825876D.0026D775@mxic.com.tw>
From: zhengxunli@mxic.com.tw
Date: Wed, 13 Oct 2021 15:04:15 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/10/13 PM 03:04:15,
 Serialize complete at 2021/10/13 PM 03:04:15
X-MAIL: TWHMLLG3.macronix.com 19D74Egk001058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_000443_591647_E19A7A99 
X-CRM114-Status: GOOD (  14.64  )
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


> By working with external hardware ECC engines, we figured out that
> Under certain circumstances, it is needed for the SPI controller to
> check INT_TX_EMPTY and INT_RX_NOT_EMPTY in both receive and transmit
> path (not only in the receive path). The delay penalty being
> negligible, move this code in the common path.
> 
> Fixes: b942d80b0a39 ("spi: Add MXIC controller driver")
> Cc: stable@vger.kernel.org
> Suggested-by: Mason Yang <masonccyang@mxic.com.tw>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-mxic.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index 96b418293bf2..4fb19e6f94b0 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -304,25 +304,21 @@ static int mxic_spi_data_xfer(struct mxic_spi 
> *mxic, const void *txbuf,
> 
>        writel(data, mxic->regs + TXD(nbytes % 4));
> 
> +      ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
> +                sts & INT_TX_EMPTY, 0, USEC_PER_SEC);
> +      if (ret)
> +         return ret;
> +
> +      ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
> +                sts & INT_RX_NOT_EMPTY, 0,
> +                USEC_PER_SEC);
> +      if (ret)
> +         return ret;
> +
> +      data = readl(mxic->regs + RXD);
>        if (rxbuf) {
> -         ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
> -                   sts & INT_TX_EMPTY, 0,
> -                   USEC_PER_SEC);
> -         if (ret)
> -            return ret;
> -
> -         ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
> -                   sts & INT_RX_NOT_EMPTY, 0,
> -                   USEC_PER_SEC);
> -         if (ret)
> -            return ret;
> -
> -         data = readl(mxic->regs + RXD);
>           data >>= (8 * (4 - nbytes));
>           memcpy(rxbuf + pos, &data, nbytes);
> -         WARN_ON(readl(mxic->regs + INT_STS) & INT_RX_NOT_EMPTY);
> -      } else {
> -         readl(mxic->regs + RXD);
>        }
>        WARN_ON(readl(mxic->regs + INT_STS) & INT_RX_NOT_EMPTY);
> 
> -- 
> 2.27.0
> 

Reviewed-by: Zhengxun Li <zhengxunli@mxic.com.tw>


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
