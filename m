Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810CEC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcJ1gWt36gqeSyYF9outfffd4AYfMqfltkD4Q7Ue4jA=; b=LzJofwm2/sBwg8g35MScANTSnZ
	Oxn+F7SzWyB/mlhp2SdbK/Np4RzkIjQwwzAK4Ckn1eQMuyQCcTjTBD09at0rB+fQDm2YuBdxjvSNZ
	wHXHMrLyvVCiOoJljSb31lkCRq6kRYhvfodxZJvSBGpvH8igAvKmX0Myvssjzw/GIpREeuXFb/Km0
	6msJuGuHFKoBTfBtxJEHDyhtLlV3MknbaXkAaaiUBZNLc2BZpmwfoQM0joOTcm5Z17HoHQyuIgoen
	oF5q+EpqT8ppj7VEnNh+mMyjWFNs1WrG3WtTOjljjvgbLhe7H4rHex615cwXCx1Pw6MLh3XVb68f4
	NumqWpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHiNQ-00Gd14-3i; Wed, 09 Feb 2022 08:31:00 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHiNL-00Gcyd-PM
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 08:30:57 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2DAC22222E;
 Wed,  9 Feb 2022 09:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644395449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWdm67gA7+zk9jlgZ1z7LIqczKn6nqGWLdX4mNABBpA=;
 b=sP8DEhoFsO/Gw8L9NMTquKBIGMi4HfGOmKl4/RoNlpvasb36cbmzpgbbcMKSzRGGnXRs7F
 4T2Gv9z5PofDXo/oGkKVpezhvSITuiuw2kwd6bfPmVYOpTGCap8GmsCsZ26EYGVZQiBXap
 UWw/8CnCw8deWcukGJjEclQup+DoJmY=
MIME-Version: 1.0
Date: Wed, 09 Feb 2022 09:30:46 +0100
From: Michael Walle <michael@walle.cc>
To: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: dianders@chromium.org, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 quic_stummala@quicinc.com, quic_vbadigan@quicinc.com,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 quic_sartgarg@quicinc.com
Subject: Re: [PATCH V5] mtd: spi-nor: winbond: Add support for winbond chip
In-Reply-To: <1644350330-8809-1-git-send-email-quic_c_sbhanu@quicinc.com>
References: <1644350330-8809-1-git-send-email-quic_c_sbhanu@quicinc.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <d343f7172f179ac2da96f80f54cc500d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_003056_021559_63E6CACA 
X-CRM114-Status: GOOD (  16.50  )
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

Am 2022-02-08 20:58, schrieb Shaik Sajida Bhanu:
> Add support for winbond W25Q512NW-IM chip.

Also please include that in the subject. Eg.

mtd: spi-nor: winbond: add support for W25Q512NW-IM

> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes since V1:
> 	- Added space before name of the flash part as suggested by Doug.
> 
> Changes since V2:
> 	- Updated chip name as w25q512nwm as suggested by Doug.
> 
> Changes since V3:
> 	- Updated flash_info flags passing according to below patch.
> 
> Changes since V4:
> 	- Added OTP support for SPI card as suggested by Michael Walle.
> 	- Updated SFDP flags passing as suggested by Pratyush Yadav.
> ---
>  drivers/mtd/spi-nor/winbond.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c
> index 675f32c..315b9f6 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -124,6 +124,10 @@ static const struct flash_info winbond_parts[] = {
>  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_DUAL_READ) },
> +	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +		PARSE_SFDP

This usually goes first, eg.

PARSE_SFDP
FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
OTP_INFO(256, 3, 0x1000, 0x1000)

> +		OTP_INFO(256, 3, 0x1000, 0x1000) },
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },

Otherwise the SFDP dump is still missing as requested in my
comment in v4. Please make sure you put it in the comment
section of the patch, that is under the "---" line.

Then I think, this patch is good.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
