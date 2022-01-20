Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E51C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQdiSJ8ekM484LjL8aYElsDNSqrkFljshc+paGZGNSo=; b=SNhAkg26FVWoe/DTfU9X/Qwa3c
	+R47fBdRfNPvnVjT9PQB6hcln10I66gNLeELj7yQZTV+tgtOFGCLeCEcKNE0kzNVz/DJ6d5EYXhxg
	B1JDvEC/1cCT0V6INp8K+IZoVKc+N2hX67Bhw9o0M5jeNXC9peoNshmrmbRF486SfEViaeseB9gVR
	1yo0Ke1yZH/ooRSmS/4knR8RfFeOuRvJOa2+DkaDOJ1CyqKCSR3skHjrjT2uhUkzFpqM0N+m3G6oG
	1eIzw10R09CRm/PNyc9fP3r8EE0l+372n9RNVx0uOnl3QK66hlN401fwqo5S6TzphiCb8/P6R5E1/
	PHQqmcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUjG-00Akz1-VA; Thu, 20 Jan 2022 10:31:43 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUjE-00Akxg-0K
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 10:31:41 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0AF9F22247;
 Thu, 20 Jan 2022 11:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1642674697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEg3Wy9lMSlCUog5GgyYmwZTgnrkPWGBbrgutH/M48Y=;
 b=P5HQHjUt8Ice1UEEBvkEu+0e/ELZClOXUkO+hOCCY4uJj38IuLZwrZmF5oZwrJiXFrfOqL
 OcQEDW0yjL0SewNy4Uk663a8yGu9cAenf/i+CRIhblC77X3/nrsqVrIWWd/9dz1KcbxBW9
 loWl25DIj9jvjKmc/DJO8cCxc4Lq8eM=
MIME-Version: 1.0
Date: Thu, 20 Jan 2022 11:31:36 +0100
From: Michael Walle <michael@walle.cc>
To: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: dianders@chromium.org, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stummala@codeaurora.org, vbadigan@codeaurora.org, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, sartgarg@codeaurora.org
Subject: Re: [PATCH V4] mtd: spi-nor: winbond: Add support for winbond chip
In-Reply-To: <1642672491-30067-1-git-send-email-quic_c_sbhanu@quicinc.com>
References: <1642672491-30067-1-git-send-email-quic_c_sbhanu@quicinc.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <db1d17bbdcf7af2b8b58f6e7fa82062c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_023140_246387_5FDEFA66 
X-CRM114-Status: GOOD (  17.59  )
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

Am 2022-01-20 10:54, schrieb Shaik Sajida Bhanu:
> Add support for winbond W25Q512NW-IM chip.
> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> 
> Changes since V1:
> 	- Added space before name of the flash part as suggested by Doug.
> 
> Changes since V2:
> 	- Updated chip name as w25q512nwm as suggested by Doug.
> 
> Changes since V3:
> 	- Updated flash_info flags passing according to below patch

Thanks!

Please note, that you also have to supply a SFDP dump, see [1].

> https://lore.kernel.org/all/20211207140254.87681-7-tudor.ambarus@microchip.com/
> 	 As suggested by Tudor Ambarus.
> ---
>  drivers/mtd/spi-nor/winbond.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c
> index 675f32c..c4be225 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -124,6 +124,10 @@ static const struct flash_info winbond_parts[] = {
>  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_DUAL_READ) },
> +	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ) },

Could you try adding OTP_INFO(256, 3, 0x1000, 0x1000), this
should enable OTP support. Could you please test this using the
flash_otp_{dump,info,erase,write} tools and add that line?

I've checked ID duplications, because there is the w25qNNjw
series. There doesn't seem to exist a w25q512jw, so we are
safe for now. There is only a w25q512jv and it has the id
0xef4020.

fun fact.. the w25q512nwm describes the OTP lock bit for
the first OTP region (the one which is not documented and
I've found out that its used for storing the SFDP) as
SFDP lock bit. See ch "7.1.1 Security Register Lock Bits
(LB3, LB2, LB1, SFDP Lock bit)". So we finally have
evidence :)

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
