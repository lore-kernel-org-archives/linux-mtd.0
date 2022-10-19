Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CB7C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlgrgfEs2IK+nqxXuSwcb/7+9sdk0tzTYmuxTlRr0p0=; b=nbIpTVe6arR+h88E6elE429161
	6KICPFp3nHNQk/aKluIvsuTryyItSy7pJo2AcDG31vn4hClGKBSvyeJschCyySXnfGDBSS1X54/t0
	MrU09//KBsGg69L9XDIXfHahV/z5lmrERzJ9cZ9GfjJ2LJe2FPb4hK5so8jbvvKToaow/npkr3y5y
	z9YONFFI7uvVi9y+Ui5CEOhQE79nwPZRe3t033tcxRl7fiCdY3a+3H6hI9RQwOaMANGJ0KTkVLYdD
	K7vlCGInnWt2+TGksuL7FFxv14crVlJgy4K/Q5296R3r1YFXnAYwNfb2qHYIdkCIpqQKkBpBsjKrf
	z5R6graA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4KS-00GUzw-0v; Wed, 19 Oct 2022 08:21:32 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4KP-00GUwm-86
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 08:21:30 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9E30D1285;
	Wed, 19 Oct 2022 10:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1666167683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TWQqtenUAFw0Ko7PUUjRTcIEu6B3uHvIJTcTD50lWXU=;
	b=dRjE/FPoLeRA44NjJS6xgDRvbA3rf67PjwK2YTv1USHxbA+fSZRez4cOMWgbkMXuM6JUw2
	a2TfjKaM1IhNr9LxYgzNZgvtQxPj0WF3PNIOjWs9swyP9RIdaJ6OuFVdwj2vh42qqYoPhO
	XK+RKHC9/70pthTxMYwK2OFbD/VpScKOjr1btD2OlHiFCPaHX/94LnlthiZrrH9QJl7y+F
	yLsGyIQN6/fabs9KyrP8We9nCaWSVyRPOUUAH0DELt8SPCKoVgCN8+V+c/yR/iCqq0qXkg
	P70WotRBU847x2fhzk6BSaNkH7ML4ZOBO7AYOxfWfJNIcwydlMf5p6ERidgisg==
MIME-Version: 1.0
Date: Wed, 19 Oct 2022 10:21:23 +0200
From: Michael Walle <michael@walle.cc>
To: Eliav Farber <farbere@amazon.com>
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 talel@amazon.com, jonnyc@amazon.com, hhhawa@amazon.com, hanochu@amazon.com,
 itamark@amazon.com, shellykz@amazon.com, amitlavi@amazon.com, dkl@amazon.com
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: micron-st: Enable locking for
 n25q256ax1/mt25qu256a
In-Reply-To: <20221019071631.15191-1-farbere@amazon.com>
References: <20221019071631.15191-1-farbere@amazon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <73bfa5ae90e2269387540019806c2839@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_012129_515155_7057B46E 
X-CRM114-Status: GOOD (  15.42  )
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

Am 2022-10-19 09:16, schrieb Eliav Farber:
> n25q256ax1 [1] and mt25qu256a [2] (both have same jedec_id - 0x20bb19)
> use the 4 bit Block Protection scheme and support Top/Bottom protection
> via the BP and TB bits of the Status Register.
> BP3 is located in bit 6 of the Status Register.
> Tested on both n25q256ax1 and mt25qu256a.
> 
> [1] 
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_256mb_3v.pdf
> [2] 
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-a/mt25q_qljs_u_256_aba_0.pdf

If you respin, you can use a "Link:" tag for the URL above.

> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> xxd -p
> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 53464450060101ff00060110300000ff84000102800000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520fbffffffff0f29eb276b
> 273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
> 03d4ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
> ffffffffffffffffffe7ffff21dcffff
> 
> md5sum
> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 5ea738216f68c9f98987bb3725699a32
> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 
> cat
> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
> 20bb19104400
> 
> cat
> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/partname
> mt25qu256a
> 
> cat
> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
> st

That's the mt25qu256a SFDP. What about the n25q256ax1?

Thanks!
-michael

> 
> v2 --> v1:
> - Enable locking also for mt25qu256a.
> - Dump the SFDP tables.
> 
>  drivers/mtd/spi-nor/micron-st.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index 3c9681a3f7a3..f4d0153a5b1b 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -201,11 +201,15 @@ static const struct flash_info st_nor_parts[] = {
>  		MFR_FLAGS(USE_FSR)
>  	},
>  	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> +		      SPI_NOR_BP3_SR_BIT6)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		MFR_FLAGS(USE_FSR)
>  	},
>  	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> +		      SPI_NOR_BP3_SR_BIT6)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
>  		MFR_FLAGS(USE_FSR)
>  	},

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
