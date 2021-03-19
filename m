Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CE7C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 02:53:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A98E64E10
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 02:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A98E64E10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BLlHAYS7ca+1c+vt8X4boTdpJYhGuu+K3Sj1E6GTma4=; b=P7yfmFYTcAp8pbJv3XfZI+ReN
	0N1NmShLQRUx7vWDg+ak3Di/S8VGVgWRRjcTyueF0/o7LvLOHsEEnk7jlp6zbhheH/Vruib4C2asr
	GRHazNq+MgAe5AQ2O9xiOKb9uJ42/d77ivWm0KWdtJ8Lwmj/tTrWn+4AHoEHwtbnKcdGrxAME84Ee
	ZB168X9Afm0do+XjFFkx43tCUKKER5Arx21MheOISkGwx4c9tV4e6QR057sKyp96fId3kzWFEwBYu
	zLnr7QYmIXnGv8HfIoJ4m5+0cMTJjkQk0FDssrKqn9qU5+HZF6sYm/xRef4R4VIlQVx+FHHVj1MtR
	Tnhoo2qKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN5FH-006MfZ-Pm; Fri, 19 Mar 2021 02:52:16 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN5FB-006MfC-Pf
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 02:52:12 +0000
Received: by mail-pg1-x52c.google.com with SMTP id l1so2714832pgb.5
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 19:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ybpoxwkAG5gmhDbfe7ukACF1NK2ajReqbGeyBVnynbY=;
 b=WE1snQG5nvYAcoqDMh1W0Ff9DBTeyK/iDibmBdOqilAM4PRx3aqwKRyQWFvgdtalAl
 MoeusmT+0IefqrL+M8CblBOsSjVW5brz6QbryDCrNBjIXCjJyWT598J0Z3C1nKYFivX+
 CQ1/aJDbYEPfLAzlHo+YGfc50iqbOpmKaNVNk1VDvdiX4VoQEWTSg+NCJhWqDK7PpiZ5
 3AxwFM00577YRITfISjn8eHbSJQeAvxlMWZgq5+zkBwOZE2o/BQqNz1w7JI+DJN6VXPV
 j1t6Ddl1f4gUQrjuwREvMKSNV5MZ379CvM/uyCXHTA9/wAVNZ9mQsE3Hih7EhUkGJ0nb
 1Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ybpoxwkAG5gmhDbfe7ukACF1NK2ajReqbGeyBVnynbY=;
 b=jXecZzaSVX9X7SKtEfLD7+hM5jiX8lIo39zuPd39ez8T8FeBmPeys/7X0CbR1EtbQA
 jpx6T1CKp0ElWJ2qLtXfQR9jR3002ARRq1wRvY0Ru9RgPJgMrRt+qlOHPJtb/4DXdIPy
 p3kkparKt6+Fl8+R5Kqsbb2uVJQvVEOSeZddKzsomgKpKIxxvaBYlFvyHalB0GRa7WHI
 Yo+knKu1IcAumxLCqTAk7BZ/mgxM884MI8waMsNXD7bpw3/VGZYCdTfadgas/olHY748
 K4yjcd5OBBk1wdT4dv5IY3HVUZcHXCEFdLY2enPI1FlxXmhFbUahL19SyLuMYio11BCU
 T20A==
X-Gm-Message-State: AOAM531IuFepunFU7XZkeTo4BZk3SF08C4DXs0M/BTjK1uh7j2V/YOYZ
 LmMorvm31ecTvt//1np0ajI=
X-Google-Smtp-Source: ABdhPJz8b+hgELGGC6q+6l4ZoktXG/f+VOkGH7Gl/Ao/duzLBlvkPwgWlmkjFsVsJTOEX/fppe0ePQ==
X-Received: by 2002:a63:e47:: with SMTP id 7mr9373667pgo.17.1616122328073;
 Thu, 18 Mar 2021 19:52:08 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id w5sm3445796pge.55.2021.03.18.19.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 19:52:07 -0700 (PDT)
Subject: Re: [PATCH v3 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <b971b6a9378260368b287d64092ec75edc9eb9bb.1615523176.git.Takahiro.Kuwano@infineon.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <75040c2a-66d1-4b0a-9743-ade4aa0d51cb@gmail.com>
Date: Fri, 19 Mar 2021 11:51:59 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b971b6a9378260368b287d64092ec75edc9eb9bb.1615523176.git.Takahiro.Kuwano@infineon.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_025210_830821_11932415 
X-CRM114-Status: GOOD (  19.30  )
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

Hi,

On 3/12/2021 6:45 PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. For the multi-die package parts (2Gb),
> only uniform sector sizes is supprted. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v3:
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT 
>   - Add support for multi-die package parts support
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize 
> 
>  drivers/mtd/spi-nor/spansion.c | 119 +++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 5742212fde2e..05a4ea00acfc 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c

[...]  

>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:		pointer to a 'struct spi_nor'
> @@ -475,6 +576,24 @@ static const struct flash_info spansion_parts[] = {
>  	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			     SPI_NOR_4B_OPCODES) },
> +	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 256 * 1024, 1024,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 256 * 1024, 1024,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25hx_t_fixups },

I noticed USE_CLSR is not needed for 2Gb parts since the ->ready() hook
for multi-die package parts knows about that.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
