Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5312C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LG6uIvAw683XmP3fipUdbUScandltCHHgIytrD3WcGI=; b=Dbn+znbeJFXO6C
	cUvCyznHxsKeCkZvnoz+TelR8SBkUWVVkKaOt4aHRNCclA7sQ7H8IQXsfcwVdSg8qUHZcmnIFykxE
	57GcsB91Ea4/jgQk+ct7JTWhi1iDg916sPEdOVuIHXHgWsDMfDlAT4ZIhKqqRfT4EjlH19yKrsgpx
	TsHWOTHPwnjpaTNb1dzDR6lz0tMPqawZ9aFLD4gT6XH//kTngHqbW8AHBf9UbuXCVzMfXs8ETMaI5
	WGibddes8wduRfGzmPHqsrNWodSpE0kwvg2yPDvIn2c0KY65jkoaPkPKGmEi4o/Rkd8L02h+eUFXY
	YFTKS4vGwfz9I+ng+uIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYxS-00000000Iri-3nvb;
	Mon, 26 Feb 2024 11:15:43 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYxQ-00000000IrH-2Suy
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 11:15:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a3e7f7b3d95so326856466b.3
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 03:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708946139; x=1709550939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CN+Z/IJvZr7N1QEKoy4I64vnW2tBRnAYgtzUpleWk4=;
        b=GqcpaWfb8p/NRCZCYwXqcVc2jvOOfv3ECvkNk1Bz7E9QI362EEAg2iEmLR8hRRLYMQ
         jmqLulsp7k08GB5teP21+l70aihwQrDDM3JjpvGbz5ITLcsdSWd742wkh/BSGVodYWDA
         jbS6Tui6kqpNE4DptapEyXlhEP5NflTl927SueQcUu+IGwyWimtIZMH37RekDG8AZIRu
         Hulv+5k8KU+7FTyE8czBHql+OWNQ5Na7SBRevqE9hIhUEbQN/3YgPp/BbEj7BSwduiql
         Z13q49kUqafM/pJsvWtoB/yIt8B6J6tsVYE1ShfuhYXJT29FfnQBIDYu8bvNZZd4I+UT
         xFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708946139; x=1709550939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CN+Z/IJvZr7N1QEKoy4I64vnW2tBRnAYgtzUpleWk4=;
        b=npv5CYVPVUFaRQ8NSZd8NT6N8oKmIrPWKMxPos6EyQJUBvPsVXlS6eQ7uRpBpfGlOO
         P1xseVSil0C0dYwDq8vCTIQLcx+f1NxrP+yq/OLpckbK8smA0Q4ED0UJJ4Ta8F72di0O
         y/d2616rC56c//6Fovlr7s4zejsQatX/ZUfaj5uU5HtGxT5IuDmGYhFmJm5bVLRYkZaX
         uQLqJ1o8tfGeJdWY6elVP6bAsreDwwt6IxBWZ1ONr7xFgU7u4/BDYEaO14z3Jfm/Z//0
         Kr/VlqL73xQaex129BhSSDX8rPyGliSR4nbsx9n/4EeSxhZ3V9+ZNSwO3bfz9L4lyQPk
         c5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUse97E4V7ei6N3/yeSjyiphIypZuXq4dI0DzQrhAgcWogUSvhTTkF+4gdUgfUdLqB+S80yoAk93l3qNThGigKedwpjm8ktaLyZwoJAbQ==
X-Gm-Message-State: AOJu0YzF+iJOKHf2UHSsvh2lh9NvpigBxkXyiyok3lkZoayw8Roe/8DI
	mnSTZg7fhXQa5g3T2dJW4S5hkZzkLYA2ILk23TifTNWbrJ3DK/tM9kDcHFstv+E=
X-Google-Smtp-Source: AGHT+IFVaDM8tLSL7G4VEqiIWoNL3k135mQ4hYwVxFnDIBaLRl+3Q27lpwNPLy8SfaPXbCX9XTor5Q==
X-Received: by 2002:a17:906:6d92:b0:a3f:33b2:5ce2 with SMTP id h18-20020a1709066d9200b00a3f33b25ce2mr4731334ejt.35.1708946138797;
        Mon, 26 Feb 2024 03:15:38 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id o23-20020a17090611d700b00a3e5adf11c7sm2320678eja.157.2024.02.26.03.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 03:15:38 -0800 (PST)
Message-ID: <f82f4073-e8aa-4398-860e-d9fcf295fcfc@linaro.org>
Date: Mon, 26 Feb 2024 13:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] mtd: spi-nor: core: get rid of SNOR_LAST_REGION
 flag
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
 <eded84294bd81e966d6f423e578fc2cfb9a4a5b6.1708404584.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <eded84294bd81e966d6f423e578fc2cfb9a4a5b6.1708404584.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_031540_666817_65A737CF 
X-CRM114-Status: GOOD (  15.43  )
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



On 20.02.2024 10:34, tkuw584924@gmail.com wrote:
> @@ -1682,48 +1636,41 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
>  	struct spi_nor_erase_region *region;
>  	struct spi_nor_erase_command *cmd = NULL;
>  	u64 region_end;
> +	unsigned int i;
>  	int ret = -EINVAL;
>  
> -	region = spi_nor_find_erase_region(map, addr);
> -	if (IS_ERR(region))
> -		return PTR_ERR(region);
> -
> -	region_end = spi_nor_region_end(region);
> +	for (i = 0; i < map->n_regions; i++) {
> +		region = &map->regions[i];
> +		region_end = spi_nor_region_end(region);
>  
> -	while (len) {
> -		erase = spi_nor_find_best_erase_type(map, region, addr, len);
> -		if (!erase)
> -			goto destroy_erase_cmd_list;
> -
> -		if (prev_erase != erase ||
> -		    erase->size != cmd->size ||
> -		    region->flags & SNOR_OVERLAID_REGION) {
> -			cmd = spi_nor_init_erase_cmd(region, erase);
> -			if (IS_ERR(cmd)) {
> -				ret = PTR_ERR(cmd);
> +		while (len && addr >= region->offset && addr < region_end) {
> +			erase = spi_nor_find_best_erase_type(map, region, addr,
> +							     len);
> +			if (!erase)
>  				goto destroy_erase_cmd_list;
> -			}
>  
> -			list_add_tail(&cmd->list, erase_list);
> -		} else {
> -			cmd->count++;
> -		}
> -
> -		addr += cmd->size;
> -		len -= cmd->size;
> +			if (prev_erase != erase || erase->size != cmd->size ||
> +			    region->flags & SNOR_OVERLAID_REGION) {
> +				cmd = spi_nor_init_erase_cmd(region, erase);
> +				if (IS_ERR(cmd)) {
> +					ret = PTR_ERR(cmd);
> +					goto destroy_erase_cmd_list;
> +				}
> +
> +				list_add_tail(&cmd->list, erase_list);
> +			} else {
> +				cmd->count++;
> +			}
>  
> -		if (len && addr >= region_end) {
> -			region = spi_nor_region_next(region);
> -			if (!region)
> -				goto destroy_erase_cmd_list;
> -			region_end = spi_nor_region_end(region);
> +			len -= cmd->size;
> +			addr += cmd->size;
> +			prev_erase = erase;
>  		}
>  
> -		prev_erase = erase;
> +		if (!len)
> +			return 0;

breaking the for loop here is odd and confusing.
I'll update this patch with the following:

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 44427d58c082..eda49c30958d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1688,7 +1688,7 @@ static int spi_nor_init_erase_cmd_list(struct
spi_nor *nor,
        unsigned int i;
        int ret = -EINVAL;

-       for (i = 0; i < map->n_regions; i++) {
+       for (i = 0; i < map->n_regions && len; i++) {
                region = &map->regions[i];
                region_end = region->offset + region->size;

@@ -1715,11 +1715,10 @@ static int spi_nor_init_erase_cmd_list(struct
spi_nor *nor,
                        addr += cmd->size;
                        prev_erase = erase;
                }
-
-               if (!len)
-                       return 0;
        }

+       return 0;
+
 destroy_erase_cmd_list:
        spi_nor_destroy_erase_cmd_list(erase_list);
        return ret;


>  	}
>  
> -	return 0;
> -
>  destroy_erase_cmd_list:
>  	spi_nor_destroy_erase_cmd_list(erase_list);
>  	return ret;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
