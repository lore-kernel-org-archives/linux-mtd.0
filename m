Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE3FC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Nov 2022 06:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCAHTU+oDi5T9SL14Fa4vPOVgrYB1yE4RsXTAMiBixU=; b=3UuyQ8IoEEbyTb
	C/aVE1dAyv3KvKic9VbY11+kaaG0AmZS/9v32kYOtysunoJEOQ2e1UW3EXqgErc7jP7vJ/eXec0QY
	CAD/CQz1nlSEyQ7p7Wi5BQXV0RuNR5Q7cE/1/kyOQio94NeuyeEsCA62cHqSPhpSzaKQfA5tzj2pa
	kDJ/5mvKHJxR03Xo6DbkDueD2vqclrcSzZ+wfnPdxeCX4UCLUfdaN/ferNwQ6hyotizalAJoJih/5
	z3a2ZI9rR20JB7rtpzmSWhgO4/i5aBCQsJAHumPLAw4SEr3DAPzsNAMweIP7ZOwG+OMyIABJsxlTv
	89X5YZAK7x192tXzcfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otNRJ-00DZSe-RR; Fri, 11 Nov 2022 06:22:57 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otNRG-00DZQU-IP
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2022 06:22:56 +0000
Received: by mail-pg1-x530.google.com with SMTP id 78so3645066pgb.13
        for <linux-mtd@lists.infradead.org>; Thu, 10 Nov 2022 22:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcfEFKodJTGj4Bli++k9zxJOzTlquSKtEVh+RIQUcj4=;
        b=SQ/b2zol/J8cH13sZZ+6rRQgCPu5o3x0CA4vm/dPuujxVrcxOupWibcqCw3VuuLQkc
         W4HPurF9ug3GD4RD0RY9ny0v2LlQji61BcRfMIOeRL9Zu0HSuXLZPvvpbMlk2raiCq2B
         N9a/RMN/KMaHqXYS8aiUDlv7TT2x5R80qzAUX7m1boPhn1vkVYyZ9eIBnpqEbVpDElNf
         y6RvWPMndwxoNrBv3i6L6UhWspH99SOsNC6D8MUenuxe/E8eYfPZWXqHBRFQbQlBf3r4
         z6Lmgk66pooMXzFrrQ4ITQdc3xFZBJocYSsJLdzmmbVAkc7FJG3K9dRvukZnDPCyDfdV
         Lbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcfEFKodJTGj4Bli++k9zxJOzTlquSKtEVh+RIQUcj4=;
        b=rIcokwDieYSd10eZaxxIx2x2EdKAGx6zWIAd8llP1yhgEVS8CQeFaT0Guu4+Sbm/73
         gygHaaLLPvGNn3gJjyjqXfjkAkf2egW9fDDk9f5HfX8rcBd3abfKTOct7vZcp5U5mc2a
         2iP2eEgB87FoTagR3jlXWDsdKYhD6/91GNxnTyjt4RXT8xlm006uheGTojbA5xZCn1S4
         8BUtRoQdircXnX/epHsw1aT21y0q+GT3zbNoeu4PQnJLLO37zimknxYZMApvDBI5wGHR
         yEtQhbBf5nuCtf8dV3U1QHjOXkgXcBfEkIGsMUMZJg98/uJqvrLpqmEUO9/bTipIk93y
         xi3w==
X-Gm-Message-State: ANoB5pkIGDbruoJkZO9BumC98oCVrHOrwk32jkiLLFbPIW7inIBHa6R5
	MZlmk7Zlk2k6zXgZY56LJQM=
X-Google-Smtp-Source: AA0mqf5Yq9MLny3i+lV4Qt8ueRRDFgvrWjCGcZaug4a3aiDwoC4QqI3EJ1j/Qkin0h2eK0SM7mXorA==
X-Received: by 2002:a63:e404:0:b0:460:5107:739e with SMTP id a4-20020a63e404000000b004605107739emr389805pgi.501.1668147771326;
        Thu, 10 Nov 2022 22:22:51 -0800 (PST)
Received: from [10.10.4.41] (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id a27-20020aa7971b000000b00561d79f1064sm735091pfg.57.2022.11.10.22.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 22:22:50 -0800 (PST)
Message-ID: <768d18df-c4fb-0b58-91d2-918719b07079@gmail.com>
Date: Fri, 11 Nov 2022 14:20:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RESEND PATCH v4 1/1] mtd: spi-nor: winbond: Add support for
 w25q01jvq
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai@quantatw.com>
References: <20221111060530.2201084-1-potin.lai.pt@gmail.com>
Content-Language: en-US
From: Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: <20221111060530.2201084-1-potin.lai.pt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_222254_681541_15BC0EE1 
X-CRM114-Status: GOOD (  15.60  )
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

Dear maintainers,

This commit has been tested and running on OpenBMC for few months.
Please kindly help review and merge it, thank you.

Potin


On 11/11/22 14:05, Potin Lai wrote:
> From: Potin Lai <potin.lai@quantatw.com>
>
> Add support for winbond w25q01jvq chip
>
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> ---
> LINK: [v3] https://lore.kernel.org/all/20220222085148.21594-1-potin.lai@quantatw.com/
> LINK: [v2] https://lore.kernel.org/all/20220222064227.16724-1-potin.lai@quantatw.com/
> LINK: [v1] https://lore.kernel.org/all/20211224104522.24615-1-potin.lai@quantatw.com/
>
> Changes v3 --> v4:
> - fix correct chip name "w25q01jvq"
>
> root@bletchley:~# cat /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
> ef4021
> root@bletchley:~# cat /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
> winbond
> root@bletchley:~# cat /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/partname
> w25q01jvq
> root@bletchley:~# md5sum /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> a7b9dbf76e99a33db99e557b6676588a /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> root@bletchley:~# hexdump -C /sys/devices/platform/ahb/1e620000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 00000000  53 46 44 50 06 01 01 ff  00 06 01 10 80 00 00 ff  |SFDP............|
> 00000010  84 00 01 02 d0 00 00 ff  03 00 01 02 f0 00 00 ff  |................|
> 00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> *
> 00000080  e5 20 fb ff ff ff ff 3f  44 eb 08 6b 08 3b 42 bb  |. .....?D..k.;B.|
> 00000090  fe ff ff ff ff ff 00 00  ff ff 40 eb 0c 20 0f 52  |..........@.. .R|
> 000000a0  10 d8 00 00 36 02 a6 00  82 ea 14 e2 e9 63 76 33  |....6........cv3|
> 000000b0  7a 75 7a 75 f7 a2 d5 5c  19 f7 4d ff e9 70 f9 a5  |zuzu...\..M..p..|
> 000000c0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 000000d0  ff 0a f0 ff 21 ff dc ff                           |....!...|
> 000000d8
>
> Changes v2 --> v3:
> - move spi-nor flash information to comment area
>
> Changes v1 --> v2:
> - rework patch to work with new flags
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index ffaa24055259..e60ad92c0ace 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -139,6 +139,8 @@ static const struct flash_info winbond_nor_parts[] = {
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> +	{ "w25q01jvq", INFO(0xef4021, 0, 64 * 1024, 2048)
> +		PARSE_SFDP },
>  };
>  
>  /**

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
