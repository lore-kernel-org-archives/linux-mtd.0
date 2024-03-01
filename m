Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77006C5475B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2024 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4m5ODGHYxdPiJ9/LgL20hibZMcXDWlG086hYdIlZKE=; b=DV57g5uDvjPEBQ
	eS3DYwVCBS3gvJpD5Xj8UbUWfnc2K9jtHceP2UGyDtYcDAGIAjkLR3z3Uzp+8w7h/LOLsjk6pZWga
	B/HuHm/RCDej+72/LFeVtbTYS8bt2RpL1dfIpBn8hbHjh3K1qriKcssftNIPlw3tfPJpG8D1MsYVQ
	I3KO3+dnh1krH8rFEIBBrIcldzmuie5xMm5w8u6XSSyb9Zup6XU4MThWAzSVdyBm70g9bIPxz8iFK
	o22XemH6nv3IVG5cpZIe59E1+S7ZLD99+yGB5xg/Bwf038TpfofV8YvoP47Mf4XYVZiGK6gKDPJAl
	umGHHtqegVk2JXw1t65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg6GW-00000001FKN-3Q0b;
	Fri, 01 Mar 2024 17:01:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg6GU-00000001FJu-02zO
	for linux-mtd@lists.infradead.org;
	Fri, 01 Mar 2024 17:01:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a3e552eff09so326094766b.3
        for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2024 09:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709312500; x=1709917300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yXl+fhGWmqpXUkYfoGJfgxrC/Y54D2lC6NLr66whDt4=;
        b=Vc5hf7+u6x49YJ8J9+CSvu/Oh4no/NqV1+L/a1LyDqMkZTdDUGn2G0Fg+8YBVJLy74
         jp7i+MWiT25cmWnsOB1rGdOz1fCzfrHZk7RJWUTOO0ZQrik7FbwfWq5ukipbKo1tB30e
         M3oTPZGhaiYobtJrBSwpggAMxHljekoTcyVfDYABFlKXxI0KeWB9B92oof7/vgm1+p6T
         h01JHuLjchugwnVpE+0PWggCw927QeIv58A6sr8vsjw7mE5l6/vRLln1g2Yc2bTYTiv0
         5+De4MOe/ktHESjxk4sVzYFYEyRPH7aUqEulHDVRABhSJP+aAsLGK7YwEB9cVME9AKx7
         R+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312500; x=1709917300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXl+fhGWmqpXUkYfoGJfgxrC/Y54D2lC6NLr66whDt4=;
        b=Fqjxxr8lYjPLF+DBGjJNekqUTq+UwFpgPM++z8ZEkiAqDncxfczjOuE9N6RGyyOtzf
         svQaeTqeHW1Vsn0PtKNnT2pQLenw9dLkCmqoAVA4mUek9a19Wq1p8clyTDXSroY3QfJI
         fhAVgTBZAXmLJw4x2OE0L7QfwiFi9eyuVTMXNuS7c2V8TqTp/V1Uf8hbom58+P8hQNGZ
         gF1yRrsd3u44LjWOv3CKM6tsIi8rbtDAp84thfqqdTz6xNwYHvSqQix9Pl/cFIsjmmQh
         FokgauTuHaHgMZHYA3EICmveOV6NVeHod9yLVrDkC4Yi0VD0BIvWtfmcyrEYjlLqvSaN
         8q7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVr3MBsJkKFjpA78IDW0EGdFX4OD1QNHU75FTblMBRj3AYwVGxMuJzAu39wKnnYn593pnoenrBkciyKhdzjfnsWKDFeQF7jXMV6sAfrAQ==
X-Gm-Message-State: AOJu0Yyc2mH/mnis+jjW+TRz8z/syB20nuySyj9ACOsByNoueeAWC8rw
	EcGzGyJaQpTqbHq77DJ6FMYd+5yOJEnF/EpafrPsUccnmfRLjxUzTtxixp25iU8=
X-Google-Smtp-Source: AGHT+IFGat9UXgkHbrn1IFjTtMxIE8O4RGfV+O/IUsZ8Ep40Xr1elDiVdFGMlUy74J4zM3dAirtmhQ==
X-Received: by 2002:a17:906:f355:b0:a3e:c738:afa2 with SMTP id hg21-20020a170906f35500b00a3ec738afa2mr1843445ejb.76.1709312500414;
        Fri, 01 Mar 2024 09:01:40 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q12-20020a1709066acc00b00a440846650bsm1856780ejs.184.2024.03.01.09.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:01:40 -0800 (PST)
Date: Fri, 1 Mar 2024 20:01:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	kernel@collabora.com, kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: core: correct type of i to be signed
Message-ID: <c7db3fa0-d5a2-43aa-8038-0a722f2b8f26@moroto.mountain>
References: <20240301144517.2811370-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240301144517.2811370-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_090142_082303_E594408A 
X-CRM114-Status: GOOD (  17.38  )
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

On Fri, Mar 01, 2024 at 07:45:16PM +0500, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65b32ea59afc6..46bc45b80883f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3373,7 +3373,7 @@ static u32
>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>  			     const struct spi_nor_erase_type *erase_type)
>  {
> -	u8 i;
> +	s8 i;

I have a patch in my output which also addresses this bug but you beat
me to the punch.  Declaring iterators as "u8 i;" is a canonical bug.

https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
