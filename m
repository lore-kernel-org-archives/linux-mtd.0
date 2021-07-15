Return-Path: <SRS0=WX7q=MH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D794FC07E96
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 06:35:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FCF6109E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 06:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FCF6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KFbwCAHlABjne2ptUKLb6LdHUQM9y3YX5ACypiWoC3s=; b=f+jU2ZV0a386oAmfAKYmKbZIQ0
	wzb0b3okAgi9hm8czOkc7VLDTZ81mSSjUo84NAguoglZAWHTrBuwV5U3X0gBKP+ltNdHIqcQLzLPG
	4hKECnmwdwW42+vw9hBdYcom/lqcTs9rbaiVhhQmErvT2xA6qM4uvjtgdXrxkr24+5JXhYw6RVqXN
	dVkbCklBBKMyJ8v1R6bnQw4kA1Nxa8VFNIuxnj33bNg0eYaqR/q0+Pj0S1DTTkSCvGJTpeM/htywh
	oiEO6JkGLmOwih9qTg83nMlO99tToJfOMXspHv/50C6+SoBkLmQVAKINegK65kAXOqLEFja+jTNVl
	mKTU0ZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ux8-00HHZm-AT; Thu, 15 Jul 2021 06:34:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ux5-00HHYd-AQ
 for linux-mtd@lists.infradead.org; Thu, 15 Jul 2021 06:34:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id x16so2676195plg.3
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jul 2021 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EQmCrD2Q/4zmT3wcOX60drrgz4zn48vt0RwaHb2ihdQ=;
 b=TH+BQV2hrsW+ETA9mR3CCOgis0DblJbYZXhrHVi7/aaRYLqSBWIBvM47ft9lCE1EGM
 nbfGzsa8UGKYQeEytdKDnuKgfYfuyypmpfGE3Snoj/Vn0B2844shKhFsH5DoFIeyZxCS
 w0LFXLNTCN9++sv2MaTWC5A2bvPWK+AqBdna7IfVYNbuvc3xiAJwsSb9zDGrR9cNlSPt
 d4X0zy8A7UUcItTvHNdhz70vnNzrrgzaJ9nsm4zwzrt+RIf0JP4ow/JhYSZigBkPX11Q
 4Pgus8ZZdUxvs73SqJdy9GCFtbb37oya96UXLTWb5rMxNI0/Ij61EsI94F0PSKhdscdh
 o/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EQmCrD2Q/4zmT3wcOX60drrgz4zn48vt0RwaHb2ihdQ=;
 b=oxD/X5LE9RHegJP8Z3icQ+wMWkliMNchPKqIxkZ91tDM1443Oe6YZSPhDZn5NnW9a1
 W7F1E9XjlNAM9RxKUy+M8xjSH9Ul7duFk4KFy5qFLsL8NineZGFO/kguPiPBAZjcbiGY
 gAgnsD21CkEFI88QuDbIquHhky6wfVBViiAEJ34wzPK/0Kl61W1Lxfczw5i+1SfgKh8m
 UXoxbwfwCUV/Z9Ev8RJAhtZMP62GA1PlIQN58OZ96MVBnwImHwvRl19FKGbYCZdZ2hYY
 u2W7fmcOyoRMOx7W84mzb+w67nh8MbmQRmGPE/GGiYDy+PeN72kcWI1mrVBAyH/FtcMT
 gFIg==
X-Gm-Message-State: AOAM5331m4nivpH0tLpRrxdi4xBMp6T7Pfzqyxu7JjegOEVi5DFoSGF9
 uoPtjx4FuFwmPKEjpZ2V8+k=
X-Google-Smtp-Source: ABdhPJyU3/rQxOpxHEj92R2sFzviFmNBB5NUJwmc9jQYMYsCPnFEvCozwe3LZmoMaBOGqrbpInzUqQ==
X-Received: by 2002:a17:902:ac8f:b029:129:c3f9:c002 with SMTP id
 h15-20020a170902ac8fb0290129c3f9c002mr2068427plr.13.1626330869796; 
 Wed, 14 Jul 2021 23:34:29 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id 2sm5865659pgz.26.2021.07.14.23.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 23:34:29 -0700 (PDT)
Subject: Re: [PATCH v6 0/3] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
From: Takahiro Kuwano <tkuw584924@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
Message-ID: <3a760ae3-a7af-bbc5-5272-ef6d6e29c1f7@gmail.com>
Date: Thu, 15 Jul 2021 15:34:18 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_233431_438788_8847EA4E 
X-CRM114-Status: GOOD (  17.77  )
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

I found some critical changes are missing from this series.
I will submit new version.

On 6/16/2021 5:44 PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
> 
> The summary datasheets can be found in the following links.
> https://www.cypress.com/file/424146/download (256Mb/512Mb/1Gb, single die)
> 
> The full version can be found in the following links (registration
> required).
> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Changes in v6:
>   - Remove 2Gb dual die package parts and related changes to split mulit
>     die package support into another series of patches  
> 
> Changes in v5:
>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
> 
> Changes in v4:
>   - Reword 'legacy' to 'default'
>   - Rename spi_nor_read() to spi_nor_default_ready()
>   - Fix dummy cycle calculation in spansion_read_any_reg()
>   - Modify comment for spansion_write_any_reg()
>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
> 
> Changes in v3:
>   - Split into multiple patches
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT 
>   - Add support for multi-die package parts support
>   - Cleanup Read/Write Any Register implementation
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize 
> 
> Changes in v2:
>   - Remove SPI_NOR_SKIP_SFDP flag and clean up related fixups
>   - Check CFR3V[4] to determine page_size instead of force 512B
>   - Depend on the patchset below to support non-uniform sector layout
>     https://lore.kernel.org/linux-mtd/cover.1601612872.git.Takahiro.Kuwano@infineon.com/
> 
> Takahiro Kuwano (3):
>   mtd: spi-nor: spansion: Add support for Read/Write Any Register
>   mtd: spi-nor: spansion: Add support for volatile QE bit
>   mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups
> 
>  drivers/mtd/spi-nor/spansion.c | 278 +++++++++++++++++++++++++++++++++
>  1 file changed, 278 insertions(+)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
