Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7A6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 02:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZWF8Ad0pvb80zceUUAnwfyv0Xhw529xiEb4qGikKqI=; b=cpOeRBsjGaOx9V
	b7yYRJNxLuQROgmr35WRNBDvh5LaXMylHSTdcUz9i8Y63wDh5zuSBoL9FyO8RtRr6yXIxkiR8vCzA
	foUkHC63inJLGFOJPlgCjRFWYGVZM7M7jQcocDTteA3z8gGqIVWWfyR8HVzLe+ogl72n8SkzHKH0s
	LKVA7HkTjC+SvicRh1mxlNifUVza39ik4HlSr2ICxCtvvuN67BILD3db7uykLuc0EdLDyghSDLlWK
	WH+GleaaRMW+mgfWJsUG1vrGn8vBEd+fPasi2+UlhTTKQbLPaZp+C1VyXwYnnCOJpp8xUnzewp8q1
	FC554GlAvxD2wYLCFHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nntHk-00C4w6-2p; Mon, 09 May 2022 02:38:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nntHh-00C4v5-44
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 02:38:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id k1so12583479pll.4
 for <linux-mtd@lists.infradead.org>; Sun, 08 May 2022 19:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pdlU0nqTk5+ozwbQ1pjpjX9PggSg/kQiVtRUr9USozo=;
 b=a2Y1WZZ5mAR9JOFUdu7+XmKFndrRZ3+3bwDZEOfvv3ewPBcuLzRXs029y9IX04QTsJ
 oVehkjk/kKYBP4WqY1HTPGJlh45lDLoSpHy6xTGzufffHW+PFR7NJu1QHJNfQKd39jry
 z28fli76103xvUtFOdo/Zn8SpYuaOgzmxvfoqANzGeOPltzljuhwtqCip5ds5gfcewNj
 Wl+h3C53KwWKNQ/uLm3O9fwUV4kZymQhYjEODVzkdHtGe1+x1DJtQy6hbAAeRj/xz7JA
 1AF/FpnIbODG5/Ie6hEvnsD3kaQ39y1W8QBgHVyBY/frBFo84qPuJqpaf5a1oGNK2dKU
 X4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pdlU0nqTk5+ozwbQ1pjpjX9PggSg/kQiVtRUr9USozo=;
 b=qIDZOyZ67lIywu0WYFhqxFrX3canMzAQQQ05FDGzXl5GjV5RzkQS1/8ds+J0QnsA9m
 r/tcysTE5igVTZK8CJhGNOwr0qMZK4FtczvyKONJ1RkZ7i5T073skOJiD1skV2bxQQp0
 LusHQQZZl9YLXcBwq9mAU2b3RJoFMCPhnIryq/zF9gq9fBBAoJ8B2lGoptDYSxl7saCn
 F6Ci2tU5XkYyGbXoG2W0nHn9Df9CUJIGZX9FZwSnQ4ue4dyygaEkX9ZGqv81fGedMV0l
 gw0p3NYQz8sPrYaCI3Gkwew20/gFDVkMoB/LtyX/J44a24bk395wIt6e7tmQXI2QAP6y
 BiEg==
X-Gm-Message-State: AOAM531Q1tDypfbwrMeixkeUGp/yN/N6kpflD0rjawRfn2hvz+q5ldFX
 LGdxmaZyIIGLrTgN5j5JCvM=
X-Google-Smtp-Source: ABdhPJxulTgkB93u5nDFQblbNSF6XE9rPAl66jUEqgarYyan8aTxJH4H/VJLbX/FbGYs9bjCnaFU+Q==
X-Received: by 2002:a17:90b:1895:b0:1dc:76e9:e9a0 with SMTP id
 mn21-20020a17090b189500b001dc76e9e9a0mr15961394pjb.68.1652063883303; 
 Sun, 08 May 2022 19:38:03 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a170902c94600b0015e8d4eb26fsm5762581pla.185.2022.05.08.19.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 19:38:02 -0700 (PDT)
Message-ID: <ee1b0f01-1a27-4806-1350-5a378b31a1bd@gmail.com>
Date: Mon, 9 May 2022 11:37:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v14 0/8] mtd: spi-nor: Add support for Infineon
 s25hl-t/s25hs-t
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc
Cc: miquel.raynal@bootlin.com, richard@nod.at, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
 <4fa61e90-89e1-ae68-abb6-ed50c5c09308@gmail.com>
 <97eb7ddc-aa41-b452-9537-fa6713e474c7@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <97eb7ddc-aa41-b452-9537-fa6713e474c7@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_193805_213381_A8E5F114 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

On 5/4/2022 6:55 PM, Tudor.Ambarus@microchip.com wrote:
> On 5/4/22 10:56, Takahiro Kuwano wrote:
>>> Hi, Takahiro,
>>>
>>> Would you please test this series? It's only compiled tested on my side.
>>>
>>> Cheers,
>>> ta
>>>
>> Hi Tudor,
>>
>> With the fix in patch 8/8, the series works well on my side too.
> 
> Cool, thanks! Let's wait for Michael's and Pratyush's review before submitting
> a new version for that small change. I'll be out of office next week, please
> send a new version once you get their approval.
> 
Hi Michael and Pratyush,

Please review and advise.

Thanks,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
