Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2352C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dEhc9zZxPOciy8b9dWVEQfopZDjwlR0dMZbnusE+MA=; b=EIKVKp2WvAl46B
	N7L5YAoWdwJ0831Zs++/RW7zvEhPXoUcxWP8DF9x8ee/NltchR5YsKevqly+mIYhgFCYZ1B8qJh4L
	O7qEhJ55YNUMCqDE96kLemdVGYDKU6LXTKTCT7IAUqDIFRI5XAsaVPa1EjjTm4O8lfgiMs4oH1pZn
	8+X7CF4CkGYyfESLzydkiWXTawzbWzx2CeqpsI/phhUMJ8FEAtC7yU/nQhqOsGhqjREiEC9sRn1gb
	Z6ujym5JFFVxMQQLiaplWHMX8GreRa6+THD+4GAKCRYZL84yDHuKQnfrFg+tATkaLf2+dAg3p5AVs
	YLf2/PfnYG5yoUFPWVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5FE-00000004Cf5-0ODW;
	Thu, 22 Feb 2024 09:19:56 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5FB-00000004Ccw-1KFy
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 09:19:54 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a3122b70439so943597866b.3
        for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2024 01:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708593591; x=1709198391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmCv2CfcyvQ6sw1yTT6r/W//XC5XTP1YOZCBBSo1OxU=;
        b=jY5O0bHkoZ7ZS3UPqTm2p2yVjXrTkd0IbsUTs/soxbC3MkkG+jO/bDtuYRNnWz/wXO
         C7riAIzlkiqIQOzQP31RyyS8+CdRQIKTLEjWaiQv/0lBY5zPW+0QBClr8t19OPxUbMw5
         E7A0cqus9c6eeNo5O8cbJPx/DGDSbS9FmIwUj+d7a8awjsl9vkKDqY0tBM2BPfZ3K4GU
         /a+jCRFYl6Y9WZzUhWEhO16+2NdgrRbn4ehnmwkwoZu4R/ZE6bYI33dYnJl0Dzl0iET8
         0BihpHHXroRyIAdi1r/uqhWBDxxhlPSGxfUlsoWyzHeb/6aowaassh+0M/ZpfJh19pwW
         JjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708593591; x=1709198391;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmCv2CfcyvQ6sw1yTT6r/W//XC5XTP1YOZCBBSo1OxU=;
        b=KvRjmkM7+5paQHOAZariNt5CKF35uW8Q0ox7ECAw+U3h0XW440WStBG8gEfNFiDCWb
         DeutIgDAusjheEkvoRsEqCvPlzReKttoOzwvXkemECEbCyexf2GHMVi6HmxDkVpLsYJQ
         9mayhfphLlnrdJqvV06ASxC1W3tdJuAepXb6YQaSFVUAGBXn1b2a5eSIvxw4XI7Vr0Gf
         WrbyyO7R9sUJZ43Xk4dqsN0B+l7jwzj87yJpcWv1ggPKQmFsyXLamYLEsW4EL9Pf/i8B
         brdYhc5nrfpy+5SFBWxwTuBkaO0L3fkfW2h/wvAjpGnnqvCe5iZkmCLV5hMsPgBOWdKW
         uJiA==
X-Forwarded-Encrypted: i=1; AJvYcCV2W0cW1deVmjEpX6NbedgP0OwhybyvOG/iclkckef+sZL+dDQpw9o4A/o3VEmNb+RRau+HgVv+7Ir6T7OSvfPNvMnCtFrFv87XDSFP7A==
X-Gm-Message-State: AOJu0YwbpGyNyVllQ74+22ZUaooG+YNvg50EMpOk+mm0g8sjzyLrpPwb
	YrrjeRHEOwqpk7OtqHjhyEdDOryiCSNyBKiZPaYwMZgCRKzbKs998h81InJ0tBs=
X-Google-Smtp-Source: AGHT+IElQJs14kGBEH2/dau4pudlpNgnogD+EQS8guSJOGGw5Csg+0mpBBjRV5MfGLpTwt/CHIV6QQ==
X-Received: by 2002:a17:906:2b88:b0:a3e:34b2:a2fc with SMTP id m8-20020a1709062b8800b00a3e34b2a2fcmr8564380ejg.1.1708593590715;
        Thu, 22 Feb 2024 01:19:50 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id q10-20020a17090609aa00b00a3f6466ba85sm852819eje.35.2024.02.22.01.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 01:19:50 -0800 (PST)
Message-ID: <f7c45e7b-993c-444b-8710-042da7512bbf@linaro.org>
Date: Thu, 22 Feb 2024 09:19:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for BoHong bh25q128as
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: David Bauer <mail@david-bauer.net>
References: <20240220200325.19089-1-ansuelsmth@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240220200325.19089-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_011953_396865_90AEC2AA 
X-CRM114-Status: GOOD (  12.83  )
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



On 2/20/24 20:03, Christian Marangi wrote:
> From: David Bauer <mail@david-bauer.net>
> 
> Add MTD support for the BoHong bh25q128as SPI NOR chip.
> The chip has 16MB of total capacity, divided into a total of 256
> sectors, each 64KB sized. The chip also supports 4KB sectors.
> Additionally, it supports dual and quad read modes.
> 
> Datasheet is public and can be found at the referenced link.
> 
> Functionality was verified on an Tenbay WR1800K / MTK MT7621 board.
> 
> Link: https://www.e-interlink.com.tw/userUpload/files/BH25Q128AS_v1_0.pdf
> Signed-off-by: David Bauer <mail@david-bauer.net>
> [ reworked to new flash_info format ]
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Read/write/erase test are done by flashing and installing an OpenWrt
> image on the spi and by using overlayfs on it confirming correct
> read/write.
> 
> root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
> bh25q128as
> root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id 
> 684018
> root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
> bohong
> 
> root@OpenWrt:/# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450000101ff00000109300000ff68000103600000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> 083b42bbeeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
> ffffffffffff003600279ef97764fcebffff
> 

Hey, Christian,

Seems that the flash defines the SFDP tables, thus it's likely you won't
need a flash entry at all, and instead rely on the generic SFDP driver
to parse the flash settings from SFDP and initialize the flash based on
that.

Have you tried testing the flash without adding a dedicated entry for
it? Just specifying the jedec,spi-nor compatible in dt will do the
trick. As you do now, but without this patch :).

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
