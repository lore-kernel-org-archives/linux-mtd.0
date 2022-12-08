Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8C4C63709
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2u6OWTToEECJ9WgVd3yklbvz4xAxR1Chg5K5IMPvRQ=; b=fZmsgNU9i2Tmhz
	3aLdEobZmnZKo4JWDIkTH903j5nlkJ1QzSRakNb6cHqOzOvaW94nwu+XkvWfys0TjOuOSfNpCCz82
	BuTsc2WVkOcdPU3Y2jYoBEQlfIdnj/TrIH+CZJ5NIVnLkmttoyBfEQM2sVQOUJ6Y/U+/FNQLOCb9K
	x4mPTrmMOlvz363LQMCNS9mJ/HSA+GCH3sPlqLbPnJwAuJazEQDG1/Fpj/a2Fpe7KNM5oEF1Rbpgc
	DMRzkDgeCwvbuGMqFfmVyENmjFvx8RaR8oi+IQ9cJ31FeDosXUjb8ENGaZrjuyv9ZJs5E2i0w1Kvi
	Jn8PSDHF7oauJMLgpWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DSD-00B8qj-MX; Thu, 08 Dec 2022 09:44:33 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DJa-00AycA-K5
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 09:35:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id y16so930682wrm.2
        for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2022 01:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VcDjP4FVC9oxtl5dNCAnWDInbz6D/WdmLgGALTRZO4M=;
        b=OQTyc9xMZCgDtpklnewxXMp55PbhJQW42/akJs9eGJd6V3Mf5kkALOjyjPtFDkV1U3
         L59eFRz/wTQ36gBNE9H5LE2lScazDEU4v/DmVricQeDPJ4CBzSvkXldPnvHsJvuKDPn8
         akHVKWETJ7tesdqfnntQrh0pgbhFOMiZ0+ZpkdMSW60oUcUJk5YZwkLcmI+Yr/7ENY0M
         OL3nseAY5sN1AaI7GW02Qhu/aR1tKlYA5s4e0xTCHOXS6BsKDxvPSOWsGzA98Ch0zmcR
         h8I/w15ubPzbRxnj+Kj4X5kPvaDjOb6dIQoY05ShXlYLEtb1ibpAlGfI86UTanu4LlcM
         la9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcDjP4FVC9oxtl5dNCAnWDInbz6D/WdmLgGALTRZO4M=;
        b=ybSX7iM5NlpRoRGQXCmm8WZQo4GOdR+pAWrQoSbU5JGlpK5PFi8w2Os2eqUkuLAta5
         LfJ6hAvRYB2Y++c4+yoSECljcvCc7oPZaGnBKtN+dwefAguaxaYSs91kZNPKFQ+uKOM5
         7PPw1w/Re/HlIYAlBmdZ4W4Big4BBxMkPGb3o7YEnwRRw3UiHKix0WISVWKanwYjVIK5
         I4yBTzgdYtzfAQU0myybG++MKGAoef8VyW7j/UJORmGwuWKcVLK2Wsb3xp8NqXLig4jP
         eauX+qwJLXno9nNcAbwl89djrlluHnJqSvnh6KcAyI3hmVD2m4X+CayIDJmjKeLhEgy+
         HYyA==
X-Gm-Message-State: ANoB5pk/vXTSDgjRepk/HA9EgHWLflKM2O17OmAnsXNRb2hHA9gtonJ2
	fabxOfGAtuZyHjyxT4T4IBw=
X-Google-Smtp-Source: AA0mqf5HrhMPc+1JiQL9L/d6WrhZEqOFAF3D0pmesmqX9xPKUoCjNVcfAnnGnZXEBEil3kqvC6cCsA==
X-Received: by 2002:a05:6000:989:b0:236:91d0:1f with SMTP id by9-20020a056000098900b0023691d0001fmr49789578wrb.33.1670492132323;
        Thu, 08 Dec 2022 01:35:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c3b8600b003d1da8c7854sm4754942wms.45.2022.12.08.01.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 01:35:31 -0800 (PST)
Date: Thu, 8 Dec 2022 12:35:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuan Can <yuancan@huawei.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	rafal@milecki.pl, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: parsers: Fix potential memory leak in
 mtd_parser_tplink_safeloader_parse()
Message-ID: <Y5Gv3Gz52ILDMpWg@kadam>
References: <20221208083859.122622-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208083859.122622-1-yuancan@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_013538_736177_B56295E9 
X-CRM114-Status: GOOD (  15.20  )
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

On Thu, Dec 08, 2022 at 08:38:59AM +0000, Yuan Can wrote:
> The parts needs to be freed with all its elements, otherwise it will be
> leaked.
> 
> Fixes: 00a3588084be ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/mtd/parsers/tplink_safeloader.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
> index f601e7bd8627..860339461905 100644
> --- a/drivers/mtd/parsers/tplink_safeloader.c
> +++ b/drivers/mtd/parsers/tplink_safeloader.c
> @@ -118,6 +118,7 @@ static int mtd_parser_tplink_safeloader_parse(struct mtd_info *mtd,
>  err_free:
>  	for (idx -= 1; idx >= 0; idx--)
>  		kfree(parts[idx].name);
> +	kfree(parts);
>  err_out:

This still leaves a leak if mtd_parser_tplink_safeloader_read_table()
fails.  Create a new label and update the goto.

err_free:
 	for (idx -= 1; idx >= 0; idx--)
 		kfree(parts[idx].name);
err_free_parts:
	kfree(parts);
err_out:
	return err;

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
